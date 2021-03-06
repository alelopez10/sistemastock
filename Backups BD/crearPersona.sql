USE [centro_salud]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 04/26/2014 22:16:39 ******/
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
