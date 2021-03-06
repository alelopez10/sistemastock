USE [centro_salud]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 04/28/2014 00:30:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[dni] [nvarchar](50) NOT NULL,
	[calle] [nvarchar](50) NULL,
	[nroCalle] [int] NULL,
	[localidad] [nvarchar](50) NULL,
	[departamento] [nvarchar](50) NULL,
	[provincia] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[tipoDocumento] [nvarchar](50) NOT NULL,
	[codigoPersona] [int] IDENTITY(1,1) NOT NULL,
	[esActiva] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persona] SET (LOCK_ESCALATION = DISABLE)
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 04/28/2014 00:30:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especialidad](
	[añosEspecialidad] [int] NULL,
	[codigoEspecialidad] [int] NOT NULL,
	[complejidad] [int] NULL,
	[descripcionEspecialidad] [varchar](50) NULL,
	[fechaBaja] [date] NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[codigoEspecialidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Complejidad]    Script Date: 04/28/2014 00:30:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complejidad](
	[codComplejidad] [int] NOT NULL,
	[valor] [int] NOT NULL
) ON [PRIMARY]
GO
