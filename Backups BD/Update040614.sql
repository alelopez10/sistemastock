USE [centro_salud]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 06/04/2014 00:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[contraseña] [varchar](50) NULL,
	[estado] [binary](10) NULL,
	[fechaVigencia] [datetime] NULL,
	[login] [varchar](50) NOT NULL,
	[codigoPersona] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 06/04/2014 00:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[nombreProvincia] [nvarchar](50) NOT NULL,
	[codigoProvincia] [int] NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[codigoProvincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 06/04/2014 00:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[dni] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](50) NULL,
	[tipoDocumento] [nvarchar](50) NOT NULL,
	[codigoPersona] [int] IDENTITY(1,1) NOT NULL,
	[esActiva] [bit] NULL,
	[codigoDireccion] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[codigoPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persona] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 06/04/2014 00:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[nombreLocalidad] [nvarchar](50) NOT NULL,
	[codigoLocalidad] [int] NOT NULL,
	[codigoDepartamento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 06/04/2014 00:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[codigoDireccion] [int] NOT NULL,
	[calle] [nvarchar](50) NULL,
	[nroCalle] [int] NULL,
	[codigoProvincia] [int] NOT NULL,
	[codigoDepartamento] [int] NULL,
	[codigoLocalidad] [int] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[codigoDireccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 06/04/2014 00:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[codigoDepartamento] [int] NOT NULL,
	[nombreDepartamento] [nvarchar](50) NULL,
	[codigoProvincia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Direccion_Direccion]    Script Date: 06/04/2014 00:27:19 ******/
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Direccion] FOREIGN KEY([codigoDireccion])
REFERENCES [dbo].[Direccion] ([codigoDireccion])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Direccion]
GO
