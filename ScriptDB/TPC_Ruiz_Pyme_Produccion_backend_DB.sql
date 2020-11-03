USE [master]
GO

/****** Object:  Database [TPC_NormanRuiz_DB]    Script Date: 11/2/2020 7:33:43 PM ******/
CREATE DATABASE [TPC_NormanRuiz_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPC_NormanRuiz_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TPC_NormanRuiz_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TPC_NormanRuiz_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TPC_NormanRuiz_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPC_NormanRuiz_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET ARITHABORT OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET  MULTI_USER 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [TPC_NormanRuiz_DB] SET  READ_WRITE 
GO

USE [TPC_NormanRuiz_DB]
GO

/****** Object:  Table [dbo].[perfiles]    Script Date: 11/2/2020 7:46:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[perfiles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[perfil] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [TPC_NormanRuiz_DB]
GO

INSERT INTO [dbo].[perfiles]
           ([perfil]
           ,[estado])
     VALUES
           ('Administrador'
           , 1)
GO

USE [TPC_NormanRuiz_DB]
GO

INSERT INTO [dbo].[perfiles]
           ([perfil]
           ,[estado])
     VALUES
           ('Operador'
           , 1)
GO

USE [TPC_NormanRuiz_DB]
GO

INSERT INTO [dbo].[perfiles]
           ([perfil]
           ,[estado])
     VALUES
           ('Comprador'
           , 1)
GO

USE [TPC_NormanRuiz_DB]
GO

SELECT [id]
      ,[perfil]
      ,[estado]
  FROM [dbo].[perfiles]

GO

USE [TPC_NormanRuiz_DB]
GO

/****** Object:  Table [dbo].[usuarios]    Script Date: 11/2/2020 8:28:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[usuarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[usr] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[idPerfil] [bigint] NOT NULL,
	[avatar] [varchar](100) NOT NULL,
	[sexo] [bit] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_perfiles] FOREIGN KEY([idPerfil])
REFERENCES [dbo].[perfiles] ([id])
GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_perfiles]
GO

USE [TPC_NormanRuiz_DB]
GO

INSERT INTO [dbo].[usuarios]
           ([nombre]
           ,[apellido]
           ,[correo]
           ,[usr]
           ,[pwd]
           ,[idPerfil]
           ,[avatar]
           ,[sexo]
           ,[fechaNacimiento]
           ,[estado])
     VALUES
           ( 'Norman'
           , 'Ruiz'
           , 'norman.ruiz@icloud.com'
           , 'nruiz'
           , 'Nruiz1234'
           , 1
           , 'C:\Imagenes\nruiz-avatar.jpg'
           , 1
           , '04/02/1980'
           , 1)
GO

USE [TPC_NormanRuiz_DB]
GO

SELECT [id]
      ,[nombre]
      ,[apellido]
      ,[correo]
      ,[usr]
      ,[pwd]
      ,[idPerfil]
      ,[avatar]
      ,[sexo]
      ,[fechaNacimiento]
      ,[estado]
  FROM [dbo].[usuarios]

GO