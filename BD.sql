USE [master]
GO
/****** Object:  Database [TpFinal]    Script Date: 1/11/2023 10:43:09 ******/
CREATE DATABASE [TpFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TpFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TpFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TpFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TpFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TpFinal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TpFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TpFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TpFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TpFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TpFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TpFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [TpFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TpFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TpFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TpFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TpFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TpFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TpFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TpFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TpFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TpFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TpFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TpFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TpFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TpFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TpFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TpFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TpFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TpFinal] SET RECOVERY FULL 
GO
ALTER DATABASE [TpFinal] SET  MULTI_USER 
GO
ALTER DATABASE [TpFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TpFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TpFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TpFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TpFinal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TpFinal', N'ON'
GO
ALTER DATABASE [TpFinal] SET QUERY_STORE = OFF
GO
USE [TpFinal]
GO
/****** Object:  User [alumno]    Script Date: 1/11/2023 10:43:09 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[objeto]    Script Date: 1/11/2023 10:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objeto](
	[id_objeto] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[tipo_objeto] [varchar](255) NOT NULL,
	[lugar] [varchar](255) NOT NULL,
	[fecha_Fact] [date] NOT NULL,
	[Nombre_Obj] [nchar](10) NOT NULL,
 CONSTRAINT [PK__objeto__3213E83F702B8F5C] PRIMARY KEY CLUSTERED 
(
	[id_objeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 1/11/2023 10:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_provedor] [int] NOT NULL,
	[nombre_prov] [varchar](255) NOT NULL,
	[apellido_prov] [varchar](255) NOT NULL,
	[id_objeto] [int] NOT NULL,
	[fecha_Nac] [date] NOT NULL,
	[email_prov] [nchar](10) NOT NULL,
 CONSTRAINT [PK__proveedo__3213E83F431C9D10] PRIMARY KEY CLUSTERED 
(
	[id_provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 1/11/2023 10:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] NOT NULL,
	[nombre_US] [varchar](255) NOT NULL,
	[apellido_US] [varchar](255) NOT NULL,
	[email_US] [varchar](255) NOT NULL,
	[nombre_empresa] [varchar](255) NOT NULL,
	[fecha_creacion] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 1/11/2023 10:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[id_objeto] [int] NOT NULL,
 CONSTRAINT [PK__venta__3213E83F334A645D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [FK_proveedor_objeto] FOREIGN KEY([id_objeto])
REFERENCES [dbo].[objeto] ([id_objeto])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [FK_proveedor_objeto]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_objeto] FOREIGN KEY([id_objeto])
REFERENCES [dbo].[objeto] ([id_objeto])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_objeto]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_provedor])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_proveedor]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_usuario]
GO
USE [master]
GO
ALTER DATABASE [TpFinal] SET  READ_WRITE 
GO
