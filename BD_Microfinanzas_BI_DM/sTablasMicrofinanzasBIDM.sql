USE [BD_MICROFINANZAS_BI_DM]
GO
/****** Object:  Table [dbo].[controlCarga]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[controlCarga](
	[iIdControlCarga] [int] IDENTITY(1,1) NOT NULL,
	[iDay] [int] NULL,
	[iMonth] [int] NULL,
	[iYear] [int] NULL,
	[iHour] [int] NULL,
	[iMinute] [int] NULL,
	[iSecond] [int] NULL,
	[dtDatetime] [datetime] NULL,
 CONSTRAINT [XPKcontrolCarga] PRIMARY KEY CLUSTERED 
(
	[iIdControlCarga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dimAgencia]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimAgencia](
	[iIdAgencia] [int] IDENTITY(1,1) NOT NULL,
	[iIdAgenciaT] [int] NOT NULL,
	[vNomAgencia] [varchar](100) NULL,
	[fLatitud] [float] NULL,
	[fLongitud] [float] NULL,
	[vDireccion] [varchar](100) NULL,
	[vDistrito] [varchar](100) NULL,
	[vProvincia] [varchar](100) NULL,
	[vDepartamento] [varchar](100) NULL,
	[vGrupoZona] [varchar](100) NULL,
	[vTerritorio] [varchar](100) NULL,
 CONSTRAINT [XPKdimAgencia] PRIMARY KEY CLUSTERED 
(
	[iIdAgencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dimFecha]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimFecha](
	[iIdFecha] [int] NOT NULL,
	[dFecha] [date] NULL,
	[vDescripcionFecha] [varchar](100) NULL,
	[iNumeroDiaDeSemana] [smallint] NULL,
	[iNumeroDiaDelMes] [smallint] NULL,
	[iNumeroDiaDelAño] [smallint] NULL,
	[iNumeroSemanaDelAño] [smallint] NULL,
	[iNumeroMesDelAño] [smallint] NULL,
	[iCalendarioTrimestreDelAño] [smallint] NULL,
	[iCalendarioSemestreDelAño] [smallint] NULL,
	[iCalendarioAño] [smallint] NULL,
	[vNombreDiaDeSemana] [varchar](10) NULL,
	[vNombreMes] [varchar](10) NULL,
 CONSTRAINT [XPKdimFecha] PRIMARY KEY CLUSTERED 
(
	[iIdFecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dimPersona]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimPersona](
	[iIdPersona] [int] IDENTITY(1,1) NOT NULL,
	[iIdTipoPersona] [int] NULL,
	[vTipoPersona] [varchar](100) NULL,
	[iIdPersonaT] [int] NULL,
 CONSTRAINT [XPKdimPersona] PRIMARY KEY CLUSTERED 
(
	[iIdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dimPersonaJuridica]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimPersonaJuridica](
	[vNombre] [varchar](100) NULL,
	[iTipoActividad] [int] NULL,
	[vTipoActividad] [varchar](100) NULL,
	[iTipoGiro] [int] NULL,
	[vTipoGiro] [varchar](100) NULL,
	[iIdPersona] [int] NOT NULL,
 CONSTRAINT [XPKdimPersonaJuridica] PRIMARY KEY CLUSTERED 
(
	[iIdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dimPersonaNatural]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimPersonaNatural](
	[vNombre] [varchar](100) NULL,
	[iTipoIngreso] [int] NULL,
	[vTipoIngreso] [varchar](100) NULL,
	[iTipoSexo] [int] NULL,
	[vTipoSexo] [varchar](100) NULL,
	[iEstadoCivil] [int] NULL,
	[vEstadoCivil] [varchar](100) NULL,
	[iTipoOcupación] [int] NULL,
	[vTipoOcupacion] [varchar](100) NULL,
	[iIdPersona] [int] NOT NULL,
 CONSTRAINT [XPKdimPersonaNatural] PRIMARY KEY CLUSTERED 
(
	[iIdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dimProductoModelo]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimProductoModelo](
	[iIdProductoModelo] [int] IDENTITY(1,1) NOT NULL,
	[iIdProductoT] [int] NULL,
	[vProducto] [varchar](100) NULL,
	[iIdModeloT] [int] NULL,
	[vModelo] [varchar](100) NULL,
	[iIdMoneda] [int] NULL,
	[vMoneda] [varchar](100) NULL,
	[vMonedaSigla] [varchar](3) NULL,
 CONSTRAINT [XPKdimProductoModelo] PRIMARY KEY CLUSTERED 
(
	[iIdProductoModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[factDesembolsoMora]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factDesembolsoMora](
	[iID] [int] IDENTITY(1,1) NOT NULL,
	[iIdPersona] [int] NOT NULL,
	[iIdFecha] [int] NOT NULL,
	[iIdAgencia] [int] NOT NULL,
	[iIdProductoModelo] [int] NOT NULL,
	[iCantidadDiasMora] [int] NULL,
	[dcMontoPromedioMora] [decimal](15, 2) NULL,
	[iCantidadCreditosDesembolsados] [int] NULL,
	[dcMontoTotalDesembolsado] [decimal](15, 2) NULL,
	[dcMontoPromedio] [decimal](15, 2) NULL,
 CONSTRAINT [XPKfactDesembolso] PRIMARY KEY CLUSTERED 
(
	[iID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[factSolicitudCredito]    Script Date: 17/09/2017 15:06:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factSolicitudCredito](
	[iID] [int] IDENTITY(1,1) NOT NULL,
	[iIdPersona] [int] NOT NULL,
	[iIdFecha] [int] NOT NULL,
	[iIdAgencia] [int] NOT NULL,
	[iIdProductoModelo] [int] NOT NULL,
	[dcMontoTotalSolicitado] [numeric](15, 2) NULL,
	[dcMontoPromedioSolicitado] [numeric](15, 2) NULL,
	[iCantidadCreditosSolicitados] [int] NULL,
 CONSTRAINT [XPKfactSolicitudCredito] PRIMARY KEY CLUSTERED 
(
	[iID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[dimPersonaJuridica]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([iIdPersona])
REFERENCES [dbo].[dimPersona] ([iIdPersona])
GO
ALTER TABLE [dbo].[dimPersonaJuridica] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[dimPersonaNatural]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([iIdPersona])
REFERENCES [dbo].[dimPersona] ([iIdPersona])
GO
ALTER TABLE [dbo].[dimPersonaNatural] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[factDesembolsoMora]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([iIdPersona])
REFERENCES [dbo].[dimPersona] ([iIdPersona])
GO
ALTER TABLE [dbo].[factDesembolsoMora] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[factDesembolsoMora]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([iIdFecha])
REFERENCES [dbo].[dimFecha] ([iIdFecha])
GO
ALTER TABLE [dbo].[factDesembolsoMora] CHECK CONSTRAINT [R_18]
GO
ALTER TABLE [dbo].[factDesembolsoMora]  WITH CHECK ADD  CONSTRAINT [R_19] FOREIGN KEY([iIdAgencia])
REFERENCES [dbo].[dimAgencia] ([iIdAgencia])
GO
ALTER TABLE [dbo].[factDesembolsoMora] CHECK CONSTRAINT [R_19]
GO
ALTER TABLE [dbo].[factDesembolsoMora]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([iIdProductoModelo])
REFERENCES [dbo].[dimProductoModelo] ([iIdProductoModelo])
GO
ALTER TABLE [dbo].[factDesembolsoMora] CHECK CONSTRAINT [R_20]
GO
ALTER TABLE [dbo].[factSolicitudCredito]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([iIdPersona])
REFERENCES [dbo].[dimPersona] ([iIdPersona])
GO
ALTER TABLE [dbo].[factSolicitudCredito] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[factSolicitudCredito]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([iIdFecha])
REFERENCES [dbo].[dimFecha] ([iIdFecha])
GO
ALTER TABLE [dbo].[factSolicitudCredito] CHECK CONSTRAINT [R_22]
GO
ALTER TABLE [dbo].[factSolicitudCredito]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([iIdAgencia])
REFERENCES [dbo].[dimAgencia] ([iIdAgencia])
GO
ALTER TABLE [dbo].[factSolicitudCredito] CHECK CONSTRAINT [R_23]
GO
ALTER TABLE [dbo].[factSolicitudCredito]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([iIdProductoModelo])
REFERENCES [dbo].[dimProductoModelo] ([iIdProductoModelo])
GO
ALTER TABLE [dbo].[factSolicitudCredito] CHECK CONSTRAINT [R_24]
GO
