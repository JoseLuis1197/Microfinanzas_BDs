USE [BD_MICROFINANZAS_BI_DM]
GO
/****** Object:  StoredProcedure [dbo].[SP_CONTROL_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_CONTROL_CARGA]
AS
BEGIN
	INSERT INTO controlCarga (iDay,iMonth,iYear,iHour,iMinute,iSecond,dtDatetime)
	VALUES (
			DAY(GETDATE()),
			MONTH(GETDATE()),
			YEAR(GETDATE()),
			DATEPART(HOUR,GETDATE()),
			DATEPART(MINUTE,GETDATE()),
			DATEPART(SECOND,GETDATE()),
			GETDATE()
			)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMAGENCIA_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DIMAGENCIA_CARGA]
AS
BEGIN

	INSERT INTO dimAgencia 
				(
				iIdAgenciaT,
				vNomAgencia,
				fLatitud,
				fLongitud,
				vDireccion,
				vDistrito,
				vProvincia,
				vDepartamento,
				vGrupoZona,
				vTerritorio
				)
	SELECT		DISTINCT A.iIDUniOrg,
				A.tNombUniOrg,
				A.dLatitud,
				A.dLongitud,
				A.vDireccion,
				A.vDistrito,
				A.vProvincia,
				A.vDepartamento,
				A.vGrupoZona,
				A.vTerritorio
	FROM BD_MICROFINANZAS_BI.dbo.tm_Agencia A 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMFECHA_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DIMFECHA_CARGA]
	(@FECHAINI AS DATETIME,@FECHAFIN AS DATETIME)
AS
BEGIN 
	--Borramos antiguos datos
	DELETE FROM dimFecha
		
	DECLARE @StartDate datetime, @EndDate datetime
	--set @StartDate = '20091201'	
	--set @EndDate = '21801231'

	SET @StartDate = @FECHAINI
	SET @EndDate = @FECHAFIN
	
	WHILE @StartDate <= @EndDate 
	BEGIN
	   EXEC SP_INSERTAR_FECHA @StartDate
	   -- Podemos incrementar contador en años, meses o días
	   -- poniendo year, month o day en la función dateadd
	   SET @StartDate = dateadd(day,1,@StartDate)
	   -- Lo más habitual es tener la granularidad día
	END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMPERSONA_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_DIMPERSONA_CARGA]
AS
BEGIN

	--Cargar dimensioanl	
	INSERT INTO dimPersona 
				(
				iIdPersonaT,
				iIdTipoPersona,
				vTipoPersona
				)
	SELECT	DISTINCT P.iIDPersona,
			P.iTipoPersona,
			D.tDescripcion
	FROM	BD_MICROFINANZAS_BI.dbo.tm_persona P
			INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D
			ON P.iTipoPersona = D.iIDArg
	WHERE	D.iIDTabla = 19 AND P.cStatus = 1 AND D.iEstDescriptivo=1

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMPERSONAJURIDICA_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DIMPERSONAJURIDICA_CARGA]
AS
BEGIN

	--Creamos procedimiento de inserción
	INSERT INTO dimPersonaJuridica
				(
				iIdPersona
				,vNombre
				,iTipoActividad
				,vTipoActividad
				,iTipoGiro
				,vTipoGiro
				)
	SELECT	DISTINCT P.iIdPersona
			,T.tNombComercial
			,T.itipoactividad
			,T.vTipoActividad
			,T.itipogiro
			,T.vTipoGiro
	FROM	dimPersona P
			INNER JOIN (
			SELECT	PJ.iidpersona
					,PJ.tNombComercial
					,PJ.itipoactividad
					,D.tDescripcion vTipoActividad
					,PJ.itipogiro
					,D2.tDescripcion vTipoGiro
			FROM	BD_MICROFINANZAS_BI.dbo.TM_PersonaJuridicaNegocio PJ
					INNER JOIN BD_MICROFINANZAS_BI.dbo.tm_persona P
					ON PJ.iidpersona = P.iIDPersona
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D
					ON PJ.itipoactividad = D.iIDArg
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D2
					ON PJ.itipogiro = D2.iIDArg
			WHERE	D.iIDTabla = 20
					AND D2.iIDTabla = 40
					AND D.iEstDescriptivo = 1
					AND D2.iEstDescriptivo = 1
					AND PJ.cstatus = 1
					AND PJ.tNombComercial IS NOT NULL) AS T
			ON P.iIdPersonaT = T.iidpersona

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMPERSONATURAL_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DIMPERSONATURAL_CARGA]
AS
BEGIN

	--Actualizamos todos los nulos a tipo ocupación "otros" = 4
	UPDATE BD_MICROFINANZAS_BI.dbo.TM_PersonaNatural
	SET iTipoOcupacion = 4
	WHERE iTipoOcupacion IS NULL

	--Creamos procedimiento de inserción
	INSERT INTO dimPersonaNatural
				(
				iIdPersona
				,vNombre
				,iTipoIngreso
				,vTipoIngreso
				,iTipoSexo
				,vTipoSexo
				,iEstadoCivil
				,vEstadoCivil
				,iTipoOcupación
				,vTipoOcupacion
				)
	SELECT	DISTINCT P.iIdPersona
			,T.NOMBRESCOMPLETOS
			,T.iTipoIngreso
			,T.vTipoIngreso
			,T.iTipoSexo
			,T.vTipoSexo
			,T.iTipoEstadoCivil
			,T.vTipoEstadoCivil
			,T.iTipoOcupacion
			,T.vTipoOcupacion
	FROM	dimPersona P
			INNER JOIN (
			SELECT	PN.iIDPersona
					,RTRIM(LTRIM(ISNULL(PN.vApePat,'') + ' ' + ISNULL(PN.vApeMat,'') + ', ' + ISNULL(PN.vNomb1,'') + ' ' + ISNULL(PN.vNomb2,'') + ' ' + ISNULL(PN.vNomb3,''))) NOMBRESCOMPLETOS
					,PN.iTipoIngreso
					,D.tDescripcion vTipoIngreso
					,PN.iTipoSexo
					,D1.tDescripcion vTipoSexo
					,PN.iTipoEstadoCivil
					,D2.tDescripcion vTipoEstadoCivil
					,PN.iTipoOcupacion
					,D3.tDescripcion vTipoOcupacion
			FROM	BD_MICROFINANZAS_BI.dbo.tm_persona P
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TM_PersonaNatural PN
					ON P.iIDPersona = PN.iIDPersona
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D
					ON PN.iTipoIngreso = D.iIDArg
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D1
					ON PN.iTipoSexo = D1.iIDArg
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D2
					ON PN.iTipoEstadoCivil = D2.iIDArg
					INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D3
					ON PN.iTipoOcupacion = D3.iIDArg
			WHERE	D.iIDTabla = 16 
					AND D1.iIDTabla = 11
					AND D2.iIDTabla = 12
					AND D3.iIDTabla = 117 
					AND D1.iEstDescriptivo = 1 
					AND D2.iEstDescriptivo = 1 
					AND D3.iEstDescriptivo = 1 	
			) T
	ON P.iIdPersonaT=T.iIDPersona
		
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMPRODUCTOMODELO_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DIMPRODUCTOMODELO_CARGA]
AS
BEGIN

	--Insertar los datos
	INSERT INTO dimProductoModelo
				(iIdProductoModeloT
				,iIdProductoT
				,vProducto
				,iIdModeloT
				,vModelo
				,iIdMoneda
				,vMoneda
				,vMonedaSigla
				)
	SELECT		DISTINCT 
				(CONVERT(VARCHAR,MP.iidproducto)+''+CONVERT(VARCHAR,MP.iidmodelo)) iIdProductoModeloT,
				MP.iidproducto,
				P.tdescproducto, 
				MP.iidmodelo, 
				M.tdescmodelo, 
				M.itipomoneda, 
				D.tDescripcion,
				D.vCodExternoBF
	FROM		BD_MICROFINANZAS_BI.dbo.TP_MODELOPRODUCTO MP 
				INNER JOIN BD_MICROFINANZAS_BI.dbo.TM_PRODUCTO P 
				ON MP.iidproducto = P.iidproducto
				INNER JOIN BD_MICROFINANZAS_BI.dbo.TM_MODELO M
				ON MP.iidmodelo = M.iidmodelo
				INNER JOIN BD_MICROFINANZAS_BI.dbo.TP_DESCRIPTIVO D 
				ON D.iIDArg = M.itipomoneda			
	WHERE		MP.cstatus = 1 AND D.iIDTabla = 42

	

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DIMTIEMPO_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DIMTIEMPO_CARGA]
   @CurrentDate DATETIME
AS
INSERT INTO dimFecha([iIdFecha], [dFecha],
       [iNumeroDiaDeSemana], [vNombreDiaDeSemana], [iNumeroDiaDelMes],
       [iNumeroDiaDelAño], [iNumeroSemanaDelAño],[iNumeroMesDelAño],[vNombreMes],
       [iCalendarioTrimestreDelAño], [iCalendarioAño],
       [iCalendarioSemestreDelAño])
   values(
		(DATEPART(YEAR,@CurrentDate)*10000)+(DATEPART(MONTH,@CurrentDate)*100)+(DATEPART(DAY,@CurrentDate))
		,@CurrentDate
		,DATEPART(DW,@CurrentDate)
		,CASE DATEPART(DW,@CurrentDate)
				WHEN 1 THEN 'LUNES'
				WHEN 2 THEN 'MARTES'
				WHEN 3 THEN 'MIERCOLES'
				WHEN 4 THEN 'JUEVES'
				WHEN 5 THEN 'VIERNES'
				WHEN 6 THEN 'SABADO'
				WHEN 7 THEN 'DOMINGO'
		END
		,DATEPART(DAY,@CurrentDate)
		,DATEPART(DAYOFYEAR,@CurrentDate)
		,DATEPART(WK,@CurrentDate)
		,DATEPART(MONTH,@CurrentDate)
		,CASE MONTH(@CurrentDate)
				WHEN 1 THEN 'ENERO'
				WHEN 2 THEN 'FEBRERO'
				WHEN 3 THEN 'MARZO'
				WHEN 4 THEN 'ABRIL'
				WHEN 5 THEN 'MAYO'
				WHEN 6 THEN 'JUNIO'
				WHEN 7 THEN 'JULIO'
				WHEN 8 THEN 'AGOSTO'
				WHEN 9 THEN 'SETIEMBRE'
				WHEN 10 THEN 'OCTUBRE'
				WHEN 11 THEN 'NOVIEMBRE'
				WHEN 12 THEN 'DICIEMBRE'
		END
		,DATEPART(QUARTER,@CurrentDate)
		,DATEPART(YEAR,@CurrentDate)
		,CASE WHEN DATEPART(quarter , @CurrentDate) < 3 THEN 1
           ELSE 2
        END    
   )

GO
/****** Object:  StoredProcedure [dbo].[SP_FACTDESEMBOLSO_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_FACTDESEMBOLSO_CARGA]
AS
BEGIN


	--Se crea una tabla temporal
	SELECT		iIDAgenciaSF
				,iIDProductoSF
				,iIDModeloSF
				,dFecDesembolso
				,iIDCliente
				,iiDiasMora [cantidadDiasMora]
				,AVG([dcSaldoIntMora])  [montoPromedioMora]	
				,COUNT(*) [numeroCreditosDesembolsados]
				,SUM([dcMontoOriginal]) [montoTotalDesembolsado]
				,AVG([dcMontoOriginal]) [montoPromedio]							
	INTO		#TEMP
	FROM		BD_MICROFINANZAS_BI.dbo.TM_CREDITO
	GROUP BY	iIDAgenciaSF,iIDProductoSF,iIDModeloSF,dFecDesembolso,iIDCliente,iiDiasMora
	ORDER BY	1

	--Hacemos los cruces necesarios
	INSERT INTO factDesembolsoMora (			
			[iIdAgencia]
			,[iIdFecha]
			,[iIdProductoModelo]
			,[iIdPersona]	
			,[iCantidadDiasMora]
			,[dcMontoPromedioMora]
			,[iCantidadCreditosDesembolsados]
			,[dcMontoTotalDesembolsado]
			,[dcMontoPromedio]
			)			
	SELECT	DISTINCT A.iIdAgencia
			,F.iIdFecha
			,PM.iIdProductoModelo
			,P.iIdPersona		
			,T.[cantidadDiasMora]
			,T.[montoPromedioMora]
			,T.[numeroCreditosDesembolsados]
			,T.[montoTotalDesembolsado]
			,T.[montoPromedio]
	FROM	#TEMP T
			INNER JOIN dimAgencia A
			ON T.iIDAgenciaSF = A.iIdAgenciaT
			INNER JOIN dimFecha F
			ON T.dFecDesembolso = F.dFecha
			INNER JOIN dimProductoModelo PM
			ON CONVERT(VARCHAR,T.iIDProductoSF) + '' + CONVERT(VARCHAR,iIDModeloSF) = PM.iIdProductoModeloT
			INNER JOIN dimPersona P
			ON T.iIDCliente = P.iIdPersonaT
	
	--Eliminamos la tabla temporal		
	DROP TABLE #TEMP
		
END

GO
/****** Object:  StoredProcedure [dbo].[SP_FACTSOLICITUDCREDITO_CARGA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_FACTSOLICITUDCREDITO_CARGA]
AS
BEGIN
	
	--Creamos tabla temporal
	SELECT		CONVERT(DATE,E.dfecusualt) dfecusualt
				,CONVERT(INT,E.iidmodelo) iidmodelo
				,CONVERT(INT,E.iidproducto) iidproducto 
				,CONVERT(INT,E.iIDAgencia) iIDAgencia
				,CONVERT(INT, A.iidpersona) iidpersona
				,COUNT(*) cantidadCreditosSolicitados
				,SUM(E.dcmontosolicitado) montoTotalSolicitado
				,SUM(E.dcmontoaprobado) montoTotalAprobado	
	INTO		TEMP1		
	FROM		BD_MICROFINANZAS_BI.dbo.TM_EXPSOL E
				INNER JOIN BD_MICROFINANZAS_BI.dbo.TD_AsocExpRolTemp A
				ON E.iidexpediente = A.iidexpediente
	WHERE		A.iIDTipoRolExp = 1
	GROUP BY	E.dfecusualt,E.iidmodelo,E.iidproducto,E.iIDAgencia,iidpersona

	--Hacemos los cruces necesarios
	INSERT INTO factSolicitudCredito (
				iIdAgencia
				,iIdProductoModelo
				,iIdFecha
				,iIdPersona
				,iCantidadCreditosSolicitados
				,dcMontoTotalSolicitado
				,dcMontoPromedioSolicitado				
				)
	SELECT	DISTINCT  A.iIdAgencia
			,PM.iIdProductoModelo
			,F.iIdFecha
			,P.iIdPersona		
			,T.cantidadCreditosSolicitados
			,T.montoTotalSolicitado
			,T.montoTotalAprobado
	FROM	TEMP1 T
			INNER JOIN dimAgencia A
			ON T.iIDAgencia = A.iIdAgenciaT
			INNER JOIN dimFecha F
			ON T.dfecusualt = F.dFecha
			INNER JOIN dimProductoModelo PM
			ON CONVERT(VARCHAR,T.iidproducto) + '' + CONVERT(VARCHAR,iidmodelo) = PM.iIdProductoModeloT
			INNER JOIN dimPersona P
			ON T.iidpersona = P.iIdPersonaT


	--Eliminamos tabla temporal
	DROP TABLE TEMP1

END

GO
/****** Object:  StoredProcedure [dbo].[SP_INICIO]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INICIO]
AS
BEGIN
	DELETE FROM factDesembolsoMora
	DELETE FROM factSolicitudCredito
	DELETE FROM controlCarga
	DELETE FROM dimPersonaNatural
	DELETE FROM dimPersonaJuridica
	DELETE FROM dimPersona
	DELETE FROM dimFecha
	DELETE FROM dimAgencia
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_FECHA]    Script Date: 18/09/2017 0:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_INSERTAR_FECHA]
   @CurrentDate DATETIME
AS
INSERT INTO dimFecha([iIdFecha], [dFecha],
       [iNumeroDiaDeSemana], [vNombreDiaDeSemana], [iNumeroDiaDelMes],
       [iNumeroDiaDelAño], [iNumeroSemanaDelAño],[iNumeroMesDelAño],[vNombreMes],
       [iCalendarioTrimestreDelAño], [iCalendarioAño],
       [iCalendarioSemestreDelAño])
   values(
		(DATEPART(YEAR,@CurrentDate)*10000)+(DATEPART(MONTH,@CurrentDate)*100)+(DATEPART(DAY,@CurrentDate))
		,@CurrentDate
		,DATEPART(DW,@CurrentDate)
		,CASE DATEPART(DW,@CurrentDate)
				WHEN 1 THEN 'LUNES'
				WHEN 2 THEN 'MARTES'
				WHEN 3 THEN 'MIERCOLES'
				WHEN 4 THEN 'JUEVES'
				WHEN 5 THEN 'VIERNES'
				WHEN 6 THEN 'SABADO'
				WHEN 7 THEN 'DOMINGO'
		END
		,DATEPART(DAY,@CurrentDate)
		,DATEPART(DAYOFYEAR,@CurrentDate)
		,DATEPART(WK,@CurrentDate)
		,DATEPART(MONTH,@CurrentDate)
		,CASE MONTH(@CurrentDate)
				WHEN 1 THEN 'ENERO'
				WHEN 2 THEN 'FEBRERO'
				WHEN 3 THEN 'MARZO'
				WHEN 4 THEN 'ABRIL'
				WHEN 5 THEN 'MAYO'
				WHEN 6 THEN 'JUNIO'
				WHEN 7 THEN 'JULIO'
				WHEN 8 THEN 'AGOSTO'
				WHEN 9 THEN 'SETIEMBRE'
				WHEN 10 THEN 'OCTUBRE'
				WHEN 11 THEN 'NOVIEMBRE'
				WHEN 12 THEN 'DICIEMBRE'
		END
		,DATEPART(QUARTER,@CurrentDate)
		,DATEPART(YEAR,@CurrentDate)
		,CASE WHEN DATEPART(quarter , @CurrentDate) < 3 THEN 1
           ELSE 2
        END    
   )

GO
