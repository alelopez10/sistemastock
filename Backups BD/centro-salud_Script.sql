USE [master]
GO
/****** Object:  Database [centro_salud]    Script Date: 02/04/2015 23:10:26 ******/
CREATE DATABASE [centro_salud] ON  PRIMARY 
( NAME = N'centro_salud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\centro_salud.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'centro_salud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\centro_salud_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [centro_salud] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [centro_salud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [centro_salud] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [centro_salud] SET ANSI_NULLS OFF
GO
ALTER DATABASE [centro_salud] SET ANSI_PADDING OFF
GO
ALTER DATABASE [centro_salud] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [centro_salud] SET ARITHABORT OFF
GO
ALTER DATABASE [centro_salud] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [centro_salud] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [centro_salud] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [centro_salud] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [centro_salud] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [centro_salud] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [centro_salud] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [centro_salud] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [centro_salud] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [centro_salud] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [centro_salud] SET  DISABLE_BROKER
GO
ALTER DATABASE [centro_salud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [centro_salud] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [centro_salud] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [centro_salud] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [centro_salud] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [centro_salud] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [centro_salud] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [centro_salud] SET  READ_WRITE
GO
ALTER DATABASE [centro_salud] SET RECOVERY SIMPLE
GO
ALTER DATABASE [centro_salud] SET  MULTI_USER
GO
ALTER DATABASE [centro_salud] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [centro_salud] SET DB_CHAINING OFF
GO
USE [centro_salud]
GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[codigoUnidadMed] [int] NOT NULL,
	[descripcionUnidadMed] [varchar](50) NULL,
 CONSTRAINT [PK_UnidadMedida] PRIMARY KEY CLUSTERED 
(
	[codigoUnidadMed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPersona]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPersona](
	[codigo] [int] NOT NULL,
	[tipo] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[codigoTipoMov] [int] NOT NULL,
	[descripcionTipoMov] [varchar](50) NULL,
	[tipo] [varchar](10) NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[codigoTipoMov] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoMedicamento]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoMedicamento](
	[codigoTipoMedicamento] [int] NOT NULL,
	[descripcionTipoMedicam] [varchar](50) NULL,
	[presentacion] [varchar](50) NOT NULL,
	[unidadMedida] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMedicamento] PRIMARY KEY CLUSTERED 
(
	[codigoTipoMedicamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[codigoTipoComp] [int] NOT NULL,
	[descripcionTipoComp] [varchar](50) NULL,
 CONSTRAINT [PK_TipoComprobante] PRIMARY KEY CLUSTERED 
(
	[codigoTipoComp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockMedicamento]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockMedicamento](
	[stockActual] [float] NULL,
	[stockInicioMes] [float] NULL,
	[stockMinimo] [float] NOT NULL,
	[stockAlerta] [float] NULL,
	[codigoStock] [int] NOT NULL,
	[codigoMedicamento] [int] NULL,
 CONSTRAINT [PK_StockMedicamento] PRIMARY KEY CLUSTERED 
(
	[codigoStock] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salida]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida](
	[nroReceta] [int] NOT NULL,
	[nroMovimiento] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[fechaEntrega] [datetime] NULL,
	[fechaVigencia] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 02/04/2015 23:10:29 ******/
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
/****** Object:  Table [dbo].[Privilegio]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Privilegio](
	[codigoPrivilegio] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Privilegio] PRIMARY KEY CLUSTERED 
(
	[codigoPrivilegio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 02/04/2015 23:10:29 ******/
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
/****** Object:  Table [dbo].[PerfilPrivilegio]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilPrivilegio](
	[fechaDesde] [datetime] NULL,
	[fechaHasta] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[codigoPerfil] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[codigoPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[dni] [varchar](50) NULL,
	[domicilio] [varchar](50) NULL,
	[fechaNacimiento] [datetime] NULL,
	[nombrePaciente] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[tipoDocumento] [varchar](50) NULL,
	[nroPaciente] [int] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[nroPaciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovimientoStock]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoStock](
	[fechaMovimiento] [datetime] NULL,
	[nroMovimiento] [int] NOT NULL,
	[tipoMovimiento] [int] NULL,
	[nroComprobante] [int] NULL,
 CONSTRAINT [PK_MovimientoStock] PRIMARY KEY CLUSTERED 
(
	[nroMovimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medico](
	[legajo] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[matricula] [varchar](50) NULL,
	[dni] [varchar](50) NULL,
	[fechaIngreso] [datetime] NULL,
	[apellido] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MapaSistema]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MapaSistema](
	[codigomapa] [int] NULL,
	[modulo] [int] NULL,
	[opcion] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lote]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lote](
	[fechaElaboracion] [datetime] NULL,
	[fechaVto] [datetime] NULL,
	[nroLote] [int] NOT NULL,
 CONSTRAINT [PK_Lote] PRIMARY KEY CLUSTERED 
(
	[nroLote] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 02/04/2015 23:10:29 ******/
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
/****** Object:  Table [dbo].[Formato]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formato](
	[codigoPresentacion] [int] NOT NULL,
	[descripcionPresentacion] [varchar](50) NULL,
 CONSTRAINT [PK_Formato] PRIMARY KEY CLUSTERED 
(
	[codigoPresentacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 02/04/2015 23:10:29 ******/
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
/****** Object:  Table [dbo].[Entrada]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada](
	[nroRemito] [int] NULL,
	[nroMovimiento] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[codigoEnfermedad] [int] NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[descripcionEnfermedad] [varchar](50) NULL,
	[diasReposo] [int] NULL,
	[gravedad] [int] NULL,
	[requiereInternacion] [binary](10) NULL,
	[tratamiento] [varchar](50) NULL,
	[fechaBaja] [date] NULL,
 CONSTRAINT [PK_Enfermedad] PRIMARY KEY CLUSTERED 
(
	[codigoEnfermedad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DtoEntrada]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DtoEntrada](
	[item] [int] NULL,
	[codigoMedicamenteo] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[codigo] [int] NOT NULL,
 CONSTRAINT [PK_DtoEntrada] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donacion]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donacion](
	[efectorDestino] [int] NULL,
	[efectorOrigen] [int] NULL,
	[nroMovimiento] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 02/04/2015 23:10:29 ******/
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
/****** Object:  Table [dbo].[DetalleReceta]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReceta](
	[cant] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDonacion]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleDonacion](
	[comentario] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleComprobante]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleComprobante](
	[cantidadEntregada] [int] NULL,
	[cantidadSolicitada] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 02/04/2015 23:10:29 ******/
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
/****** Object:  Table [dbo].[Comprobante]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comprobante](
	[estado] [binary](10) NULL,
	[fechaComprobante] [datetime] NULL,
	[nroComprobante] [int] NOT NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[nroComprobante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Complejidad]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complejidad](
	[codComplejidad] [int] NOT NULL,
	[valor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baja]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Baja](
	[motivoBaja] [varchar](50) NULL,
	[nroMovimiento] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[contraseña] [varchar](max) NOT NULL,
	[estado] [bit] NOT NULL,
	[codigoUsuario] [int] NOT NULL,
	[fechaVigencia] [datetime] NULL,
	[login] [varchar](50) NULL,
	[codigoPersona] [int] NULL,
	[perfil] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[codigoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleMovimientoStock]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleMovimientoStock](
	[nroMovimiento] [int] NOT NULL,
	[codigoMedicamento] [int] NULL,
	[cantidad] [int] NULL,
	[nroLote] [int] NULL,
	[codDetalle] [int] NOT NULL,
 CONSTRAINT [PK_DetalleMovimientoStock] PRIMARY KEY CLUSTERED 
(
	[codDetalle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 02/04/2015 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicamento](
	[codigo] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[monoDroga] [varchar](50) NULL,
	[descripcionAmpliada] [varchar](50) NULL,
	[formato] [int] NULL,
	[unidadMedida] [int] NULL,
	[fechaBaja] [date] NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Direccion_Direccion]    Script Date: 02/04/2015 23:10:29 ******/
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Direccion] FOREIGN KEY([codigoDireccion])
REFERENCES [dbo].[Direccion] ([codigoDireccion])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Direccion]
GO
/****** Object:  ForeignKey [FK_Usuario_Pefil]    Script Date: 02/04/2015 23:10:29 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Pefil] FOREIGN KEY([perfil])
REFERENCES [dbo].[Perfil] ([codigoPerfil])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Pefil]
GO
/****** Object:  ForeignKey [FK_DetalleMovimientoStock_MovimientoStock]    Script Date: 02/04/2015 23:10:29 ******/
ALTER TABLE [dbo].[DetalleMovimientoStock]  WITH CHECK ADD  CONSTRAINT [FK_DetalleMovimientoStock_MovimientoStock] FOREIGN KEY([nroMovimiento])
REFERENCES [dbo].[MovimientoStock] ([nroMovimiento])
GO
ALTER TABLE [dbo].[DetalleMovimientoStock] CHECK CONSTRAINT [FK_DetalleMovimientoStock_MovimientoStock]
GO
/****** Object:  ForeignKey [FK_Medicamento_Formato]    Script Date: 02/04/2015 23:10:29 ******/
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Formato] FOREIGN KEY([formato])
REFERENCES [dbo].[Formato] ([codigoPresentacion])
GO
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicamento_Formato]
GO
/****** Object:  ForeignKey [FK_Medicamento_UnidadMedida]    Script Date: 02/04/2015 23:10:29 ******/
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_UnidadMedida] FOREIGN KEY([unidadMedida])
REFERENCES [dbo].[UnidadMedida] ([codigoUnidadMed])
GO
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicamento_UnidadMedida]
GO
