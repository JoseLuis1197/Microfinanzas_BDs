USE [BD_MICROFINANZAS]
GO
/****** Object:  Table [dbo].[TD_AsocExpRol]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TD_AsocExpRol](
	[iidexpediente] [int] NOT NULL,
	[iidpersonarol] [int] NOT NULL,
	[iIDTipoRolExp] [smallint] NOT NULL,
	[iTipoCargoEmpleado] [smallint] NULL,
	[iidpersona] [int] NULL,
	[iidusualt] [int] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [int] NULL,
	[dfecusumod] [datetime] NULL,
	[cstatus] [char](1) NULL,
 CONSTRAINT [PK_TD_AsocExpRol] PRIMARY KEY CLUSTERED 
(
	[iidexpediente] ASC,
	[iidpersonarol] ASC,
	[iIDTipoRolExp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TEMP_CARGA_MODELOPRODUCTO]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMP_CARGA_MODELOPRODUCTO](
	[IDPRODUCTOMODELO] [varchar](20) NULL,
	[ID_PRODUCTO] [int] NOT NULL,
	[PRODUCTO] [nvarchar](255) NULL,
	[ID_MODELO] [int] NOT NULL,
	[MODELO] [nvarchar](255) NULL,
	[IBS_GRANDE] [nvarchar](255) NULL,
	[IBS_MED] [nvarchar](255) NULL,
	[IBS_PEQ] [nvarchar](255) NULL,
	[iTIPO_MONEDA] [int] NULL,
	[NOM_TIPO_MONEDA] [nvarchar](255) NULL,
	[ISO_MONEDA] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_CREDITO]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_CREDITO](
	[iIDCredito] [int] NOT NULL,
	[vIDIBSCredito] [nvarchar](255) NULL,
	[vIDIBSCliente] [nvarchar](255) NULL,
	[iIDExpediente] [int] NOT NULL,
	[vAgenciaBF] [nvarchar](255) NULL,
	[vAgenciaSF] [nvarchar](255) NULL,
	[iIDAgenciaSF] [int] NULL,
	[dFecDesembolso] [datetime] NULL,
	[dFecVenc] [datetime] NULL,
	[cIDProductoBF] [nvarchar](255) NULL,
	[iIDProductoSF] [float] NULL,
	[iIDModeloSF] [float] NULL,
	[iTipoMoneda] [int] NULL,
	[iIDCliente] [int] NULL,
	[iTipoIndRetorno] [int] NULL,
	[iTipoDoc] [int] NULL,
	[vNroDoc] [nvarchar](255) NULL,
	[dFecCuoComod] [float] NULL,
	[dFecPrimVctoCuoCom] [float] NULL,
	[iTipoEstCredito] [float] NULL,
	[iCuotasPendientes] [int] NULL,
	[dcMontoOriginal] [float] NULL,
	[dcSaldoPrincipal] [float] NULL,
	[dcSaldoIntComp] [float] NULL,
	[dcSaldoIntMora] [float] NULL,
	[dctasaint] [float] NULL,
	[iplazo] [float] NULL,
	[dfecusualt] [datetime] NULL,
	[dfecUltPago] [datetime] NULL,
	[dfecusumod] [datetime] NULL,
	[itipocred] [int] NULL,
	[cflagpago] [nvarchar](255) NULL,
	[cflagdiasmora] [nvarchar](255) NULL,
	[cflagcomppago] [nvarchar](255) NULL,
	[dfecvenold] [datetime] NULL,
	[iflagRef] [nvarchar](255) NULL,
	[dcUltpagPrin] [nvarchar](255) NULL,
	[dcUltpagInt] [nvarchar](255) NULL,
	[dcUltpagIntMor] [float] NULL,
	[dcMontoCuota] [float] NULL,
	[iiDiasMora] [int] NULL,
	[iCuotasVenc] [int] NULL,
	[dcSaldoPrinVenc] [float] NULL,
	[dcSaldoIntVenc] [float] NULL,
	[dcIntCompCrono] [float] NULL,
	[dcIntMoraPag] [float] NULL,
	[dcSaldoPrinSoles] [float] NULL,
	[iIDEmpAdmin] [float] NULL,
	[iflagReen] [float] NULL,
	[igrupo] [float] NULL,
	[dFecCastig] [datetime] NULL,
	[iflgciepdesemb] [float] NULL,
	[dtciepdesemb] [datetime] NULL,
	[vCtaCont] [nvarchar](255) NULL,
	[dcUltpagSeg] [float] NULL,
	[dcUltpagCom] [float] NULL,
	[dcUltpagIntCom] [float] NULL,
	[vIBSCreditoReen] [nvarchar](255) NULL,
	[cflgComMes] [nvarchar](255) NULL,
	[iflagCedido] [float] NULL,
	[dcMontOrigsol] [float] NULL,
	[dctasaprov] [nvarchar](255) NULL,
	[dcsaldogar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[iIDCredito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_EXPSOL]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_EXPSOL](
	[iidexpediente] [int] NOT NULL,
	[iidcanal] [int] NULL,
	[iidmodelo] [int] NOT NULL,
	[iidproducto] [int] NOT NULL,
	[vnrosolicitud] [datetime] NULL,
	[itiporechazo] [int] NULL,
	[itipomoneda] [int] NULL,
	[dcmontosolicitado] [float] NULL,
	[iplazosolicitado] [int] NULL,
	[dcmontoaprobado] [float] NULL,
	[iplazoaprobado] [int] NULL,
	[dctasaaprobado] [float] NULL,
	[dctasamoratoria] [float] NULL,
	[dccuotaaprobado] [float] NULL,
	[dcmontoaprobadoneto] [float] NULL,
	[itipoetapaexpsol] [int] NULL,
	[dfecetapaexpsol] [datetime] NULL,
	[itipobloqueo] [int] NULL,
	[iidempadmin] [int] NULL,
	[dFecDesembolso] [datetime] NULL,
	[dFecPrimerVenc] [datetime] NULL,
	[iFrecPagoAprob] [int] NULL,
	[iTipoTermPagoAprob] [int] NULL,
	[vIBSIDCredito] [float] NULL,
	[iTipoDesembolso] [int] NULL,
	[tBeneficiarioCheque] [nvarchar](255) NULL,
	[vCuentaAbono] [float] NULL,
	[iDiaDePago] [int] NULL,
	[iTipoIndRetorno] [int] NULL,
	[iTipSitSolicitud] [int] NULL,
	[iIDAgencia] [int] NULL,
	[iIDPagare] [int] NULL,
	[dcMontoComMes] [float] NULL,
	[iidusualt] [int] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [int] NULL,
	[dfecusumod] [datetime] NULL,
	[cstatus] [float] NULL,
	[cflprodnue] [float] NULL,
	[igrupo] [float] NULL,
	[dcSegMult] [float] NULL,
	[dcSegDes] [float] NULL,
	[iplazopago] [int] NULL,
	[iIDAgenciaDesemb] [int] NULL,
	[dctarSegMult] [float] NULL,
	[dcCuotaIniRef] [float] NULL,
	[dcLiqRefinan] [float] NULL,
	[iidConcesionario] [float] NULL,
	[dcSegVehic] [float] NULL,
	[dcTarSegVehic] [float] NULL,
	[igastosprev] [float] NULL,
	[dcGastosPrev] [float] NULL,
	[iTipoSegDes] [float] NULL,
	[dcSegTdoRsg] [float] NULL,
	[dctarSegTdoRsg] [float] NULL,
	[dcMontoVehic] [float] NULL,
	[dcMontoVehicFinan] [float] NULL,
	[dcMontoCuotaInicial] [float] NULL,
	[dcExcedenteFamiliar] [float] NULL,
	[dcCuotaExcedente] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iidexpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_MODELO]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_MODELO](
	[iidmodelo] [int] NOT NULL,
	[tdescmodelo] [nvarchar](255) NULL,
	[iTipoModelo] [int] NULL,
	[itipomoneda] [int] NULL,
	[isecid] [int] NULL,
	[iFrecPago] [int] NULL,
	[iTipoTermPago] [int] NULL,
	[iTipoPersonaSBS] [int] NULL,
	[cFlgCuoComod] [float] NULL,
	[iidusualt] [int] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [int] NULL,
	[dfecusumod] [datetime] NULL,
	[cstatus] [float] NULL,
	[iTipoGrupo1] [int] NULL,
	[iTipoGrupo2] [int] NULL,
	[iTipoGrupo3] [int] NULL,
	[iflgcresuplim] [int] NULL,
	[iTipoGrupo4] [int] NULL,
	[iTipoGrupo5] [int] NULL,
	[itipogrupo6] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iidmodelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tm_persona]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_persona](
	[iIDPersona] [int] NULL,
	[iTipoPersona] [int] NULL,
	[iTipoPersonaSBS] [int] NULL,
	[iTipoEspPersona] [int] NULL,
	[iTipoDoc] [int] NULL,
	[vNroDoc] [nvarchar](255) NULL,
	[vEMail] [nvarchar](255) NULL,
	[iTipoCIIU] [int] NULL,
	[iTipoMagnitudEmp] [int] NULL,
	[iIDUsuAlt] [int] NULL,
	[dFecUsuAlt] [datetime] NULL,
	[iIDUsuMod] [int] NULL,
	[dFecUsuMod] [datetime] NULL,
	[cStatus] [int] NULL,
	[iTipoRegSunat] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_PersonaJuridicaNegocio]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_PersonaJuridicaNegocio](
	[iidpersona] [int] NULL,
	[trazsoc] [nvarchar](255) NULL,
	[itipoactividad] [int] NULL,
	[itipogiro] [int] NULL,
	[dfeciniactiv] [datetime] NULL,
	[itipolocal] [int] NULL,
	[vURL] [nvarchar](255) NULL,
	[tNombComercial] [nvarchar](255) NULL,
	[cColorFondoWeb] [nvarchar](255) NULL,
	[cColorFuenteWeb] [nvarchar](255) NULL,
	[tDescProducto] [nvarchar](255) NULL,
	[vCodONRP] [nvarchar](255) NULL,
	[vSiglas] [nvarchar](255) NULL,
	[iCanNegocios] [int] NULL,
	[iidusualt] [int] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [int] NULL,
	[dfecusumod] [datetime] NULL,
	[cstatus] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_PersonaNatural]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_PersonaNatural](
	[iIDPersona] [int] NULL,
	[vApePat] [nvarchar](255) NULL,
	[vApeMat] [nvarchar](255) NULL,
	[vApeCasada] [nvarchar](255) NULL,
	[vNomb1] [nvarchar](255) NULL,
	[vNomb2] [nvarchar](255) NULL,
	[vNomb3] [nvarchar](255) NULL,
	[vRUC] [nvarchar](255) NULL,
	[iTipoRelacLab] [nvarchar](255) NULL,
	[iTipoIngreso] [int] NULL,
	[dFecIniActiv] [datetime] NULL,
	[dFecNac] [datetime] NULL,
	[iTipoSexo] [int] NULL,
	[vEMail] [nvarchar](255) NULL,
	[vNroCelular] [nvarchar](255) NULL,
	[iTipoEstadoCivil] [int] NULL,
	[iTipoNivEdu] [int] NULL,
	[iNroHijos] [text] NULL,
	[iEdadActual] [int] NULL,
	[iNroDepend] [int] NULL,
	[iTipoOcupacion] [int] NULL,
	[iTipoAFP] [int] NULL,
	[tCargo] [nvarchar](255) NULL,
	[iAntLaboral] [int] NULL,
	[iTipoNacionalidad] [int] NULL,
	[vApeNomCompleto] [nvarchar](255) NULL,
	[iTipoNroRef] [nvarchar](255) NULL,
	[vNroTelRef] [nvarchar](255) NULL,
	[vNombPerNroRef] [nvarchar](255) NULL,
	[cFlgRegApePat] [int] NULL,
	[cFlgRegApeMat] [int] NULL,
	[iTipoIngAdicional] [nvarchar](255) NULL,
	[vNombEmpresa] [nvarchar](255) NULL,
	[iCanNegocios] [int] NULL,
	[iIDUsuAlt] [int] NULL,
	[dFecUsuAlt] [datetime] NULL,
	[iIDUsuMod] [int] NULL,
	[dFecUsuMod] [datetime] NULL,
	[cStatus] [int] NULL,
	[itipoactividad] [int] NULL,
	[itipogiro] [int] NULL,
	[vtipoactividad2] [nvarchar](255) NULL,
	[itipoactividad2] [image] NULL,
	[cflgregempleador] [int] NULL,
	[itipperempleador] [int] NULL,
	[itipodocempleador] [int] NULL,
	[vndocempleador] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_PRODUCTO]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_PRODUCTO](
	[iidproducto] [int] NOT NULL,
	[tdescproducto] [nvarchar](255) NULL,
	[tdesccorta] [nvarchar](255) NULL,
	[itipoproducto] [int] NULL,
	[dfecvigini] [datetime] NULL,
	[dfecvigfin] [datetime] NULL,
	[igrugencuenta] [int] NULL,
	[iTipoMoneda] [int] NULL,
	[iidusualt] [int] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [int] NULL,
	[dfecusumod] [datetime] NULL,
	[cstatus] [int] NULL,
	[IIDGRUPO1] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iidproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TM_UnidadOrganizativa]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_UnidadOrganizativa](
	[iIDPersona] [int] NULL,
	[tNombUniOrg] [nvarchar](255) NULL,
	[iTipoActividad] [int] NULL,
	[iTipoGiro] [int] NULL,
	[dFecIniActiv] [datetime] NULL,
	[iTipoLocal] [int] NULL,
	[vNombAbrev] [nvarchar](255) NULL,
	[iIDUsuAlt] [int] NULL,
	[dFecUsuAlt] [datetime] NULL,
	[iIDUsuMod] [int] NULL,
	[dFecUsuMod] [datetime] NULL,
	[cStatus] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tm_uniorg]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_uniorg](
	[iIDUniOrg] [int] NULL,
	[ccodexterno] [int] NULL,
	[vIBSIDUniOrg] [int] NULL,
	[itipouniorg] [int] NULL,
	[vAgenciaBF] [int] NULL,
	[vAgenciaSF] [int] NULL,
	[cCajeroOperaciones] [nvarchar](255) NULL,
	[cCodSupervisor] [nvarchar](255) NULL,
	[iIDJefeUniOrg] [int] NULL,
	[cServUniOrg] [nvarchar](255) NULL,
	[iidusualt] [int] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [int] NULL,
	[dfecusumod] [datetime] NULL,
	[cstatus] [int] NULL,
	[iidEmpresaOrigen] [int] NULL,
	[iidUniSup] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TP_DESCRIPTIVO]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TP_DESCRIPTIVO](
	[iIDTabla] [int] NOT NULL,
	[iIDArg] [int] NOT NULL,
	[vCodExterno] [nvarchar](255) NULL,
	[vCodExternoBF] [nvarchar](255) NULL,
	[tDescripcion] [nvarchar](255) NULL,
	[tDescCorta] [nvarchar](255) NULL,
	[vMnemoTecnico] [float] NULL,
	[tComentario] [nvarchar](255) NULL,
	[iOrden] [int] NULL,
	[iEstDescriptivo] [nvarchar](255) NULL,
	[dcImporteValor1] [float] NULL,
	[dcImporteValor2] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iIDTabla] ASC,
	[iIDArg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TP_MODELOPRODUCTO]    Script Date: 17/09/2017 15:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TP_MODELOPRODUCTO](
	[iidproducto] [int] NOT NULL,
	[iidmodelo] [int] NOT NULL,
	[iidgrupo] [int] NULL,
	[vIBSIDProducto] [nvarchar](255) NULL,
	[iTipoIndRetorno] [int] NULL,
	[vIBSIDProductoCOM] [nvarchar](255) NULL,
	[iIDagrupadorPM] [int] NULL,
	[iidusualt] [float] NULL,
	[dfecusualt] [datetime] NULL,
	[iidusumod] [float] NULL,
	[dfecusumod] [float] NULL,
	[cstatus] [int] NULL,
	[vIBSIDProductoRef] [nvarchar](255) NULL,
	[vIBSIDProductoCOMRef] [nvarchar](255) NULL,
	[vIBSIDProductoCOR] [nvarchar](255) NULL,
	[vIBSIDProductoGRA] [nvarchar](255) NULL,
	[vIBSIDProductoMED] [nvarchar](255) NULL,
	[vIBSIDProductoPEQ] [nvarchar](255) NULL,
 CONSTRAINT [PK_MODELOPRODUCTO] PRIMARY KEY CLUSTERED 
(
	[iidproducto] ASC,
	[iidmodelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TD_AsocExpRol]  WITH CHECK ADD  CONSTRAINT [FK_TD_AsocExpRol_TM_EXPSOL] FOREIGN KEY([iidexpediente])
REFERENCES [dbo].[TM_EXPSOL] ([iidexpediente])
GO
ALTER TABLE [dbo].[TD_AsocExpRol] CHECK CONSTRAINT [FK_TD_AsocExpRol_TM_EXPSOL]
GO
ALTER TABLE [dbo].[TM_EXPSOL]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_MODELO] FOREIGN KEY([iidproducto], [iidmodelo])
REFERENCES [dbo].[TP_MODELOPRODUCTO] ([iidproducto], [iidmodelo])
GO
ALTER TABLE [dbo].[TM_EXPSOL] CHECK CONSTRAINT [FK_PRODUCTO_MODELO]
GO
ALTER TABLE [dbo].[TP_MODELOPRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_MODELO] FOREIGN KEY([iidmodelo])
REFERENCES [dbo].[TM_MODELO] ([iidmodelo])
GO
ALTER TABLE [dbo].[TP_MODELOPRODUCTO] CHECK CONSTRAINT [FK_MODELO]
GO
ALTER TABLE [dbo].[TP_MODELOPRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO] FOREIGN KEY([iidproducto])
REFERENCES [dbo].[TM_PRODUCTO] ([iidproducto])
GO
ALTER TABLE [dbo].[TP_MODELOPRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO]
GO
