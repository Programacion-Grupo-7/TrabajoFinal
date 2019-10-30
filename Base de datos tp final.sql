USE [master]
GO
/****** Object:  Database [Pagina de Musica]    Script Date: 30/10/2019 09:05:56 ******/
CREATE DATABASE [Pagina de Musica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pagina de Musica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pagina de Musica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pagina de Musica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pagina de Musica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pagina de Musica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pagina de Musica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pagina de Musica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pagina de Musica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pagina de Musica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pagina de Musica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pagina de Musica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pagina de Musica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pagina de Musica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pagina de Musica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pagina de Musica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pagina de Musica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pagina de Musica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pagina de Musica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pagina de Musica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pagina de Musica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pagina de Musica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pagina de Musica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pagina de Musica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pagina de Musica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pagina de Musica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pagina de Musica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pagina de Musica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pagina de Musica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pagina de Musica] SET RECOVERY FULL 
GO
ALTER DATABASE [Pagina de Musica] SET  MULTI_USER 
GO
ALTER DATABASE [Pagina de Musica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pagina de Musica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pagina de Musica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pagina de Musica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pagina de Musica] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pagina de Musica', N'ON'
GO
ALTER DATABASE [Pagina de Musica] SET QUERY_STORE = OFF
GO
USE [Pagina de Musica]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Pagina de Musica]
GO
/****** Object:  User [alumno]    Script Date: 30/10/2019 09:05:57 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 30/10/2019 09:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Albumo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canciones]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Artista] [varchar](50) NULL,
	[Album] [varchar](50) NULL,
	[UbicacionCancion] [varchar](200) NULL,
 CONSTRAINT [PK_Canciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefonos](
	[Id] [int] NOT NULL,
	[Telefono] [int] NULL,
	[Id_Usuario] [int] NULL,
 CONSTRAINT [PK_Telefonos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeUsuario]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeUsuario](
	[Id] [int] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDeUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre_Usuario] [varchar](20) NOT NULL,
	[Contraseña] [varbinary](max) NOT NULL,
	[Correo] [varchar](100) NULL,
	[Borrado] [bit] NOT NULL,
	[IdTipo] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Canciones] ON 

INSERT [dbo].[Canciones] ([Id], [Nombre], [Artista], [Album], [UbicacionCancion]) VALUES (1, N'Cancion', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Canciones] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Nombre_Usuario], [Contraseña], [Correo], [Borrado], [IdTipo]) VALUES (2, N'Ezequiel', N'Binker', N'ReyDelLabo', 0x22C83EA0289A226DF7C1DAAFEEEBFEA8, N'ezebinker@gmail.com', 0, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Telefonos_Usuarios] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Telefonos] CHECK CONSTRAINT [FK_Telefonos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TipoDeUsuario] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[TipoDeUsuario] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TipoDeUsuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarUsuario]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_EliminarUsuario]

@Usuario varchar(50),
@Contraseña varchar(50)

as

update Usuarios
set Borrado = 1
where Nombre_Usuario = @Usuario and Contraseña = @Contraseña
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarCancion]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_InsertarCancion]

@Nombre varchar(50), @Ubicacion varchar(200)

as

insert into Canciones (Nombre,UbicacionCancion) values (@Nombre,@Ubicacion)
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Login]
@Usuario varchar(50), 
@Contraseña varchar(50)

as


if exists (select Nombre_Usuario, Contraseña from Usuarios where Nombre_Usuario = @Usuario and Contraseña = HASHBYTES('MD5', @Contraseña) and Borrado = 0)
begin
	select * from Usuarios where Nombre_Usuario = @Usuario and Contraseña = HASHBYTES('MD5', @Contraseña) and Borrado = 0
end
else
	print 'El Usuario no existe más o el nombre/contraseña están mal'
	


  
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarUsuario]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RegistrarUsuario]
	@NomUsuario varchar(18), @Contraseña varchar(MAX),
	@Apellido varchar(200), @Nombre varchar(200),
	@mail varchar(MAX)
	AS
		IF (@NomUsuario is not null AND @Contraseña is not null AND @Apellido is not null AND @Nombre is not null AND @mail is not null AND @mail LIKE '%@%.%')
		BEGIN
			  INSERT INTO Usuarios(Nombre_Usuario, Contraseña, Apellido, Nombre, Correo, Borrado) 
			  values (@NomUsuario, HASHBYTES ('MD5' , @Contraseña), @Apellido, @Nombre, @mail, 0)
			  
		END
		ELSE
		BEGIN
			PRINT 'Crear bien el usuario';
		END
GO
/****** Object:  StoredProcedure [dbo].[SP_TraerMusica]    Script Date: 30/10/2019 09:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_TraerMusica]
AS
SELECT TOP 50 * from Canciones
GO
USE [master]
GO
ALTER DATABASE [Pagina de Musica] SET  READ_WRITE 
GO
