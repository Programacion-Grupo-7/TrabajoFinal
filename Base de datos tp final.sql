USE [master]
GO
/****** Object:  Database [Pagina de Musica]    Script Date: 28/11/2019 10:53:14 ******/
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
/****** Object:  User [alumno]    Script Date: 28/11/2019 10:53:15 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 28/11/2019 10:53:15 ******/
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
/****** Object:  Table [dbo].[Canciones]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Artista] [varchar](50) NULL,
	[IdAlbum] [int] NULL,
	[UbicacionCancion] [varchar](200) NULL,
	[Genero] [varchar](50) NULL,
	[UbicacionImagen] [varchar](200) NULL,
 CONSTRAINT [PK_Canciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorito]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorito](
	[Id_Canciones] [int] NOT NULL,
	[Id_Usuarios] [int] NOT NULL,
 CONSTRAINT [PK_Favorito] PRIMARY KEY CLUSTERED 
(
	[Id_Canciones] ASC,
	[Id_Usuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Usuarios] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistxCanciones]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistxCanciones](
	[Id_Playlist] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cancion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 28/11/2019 10:53:15 ******/
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
/****** Object:  Table [dbo].[TipoDeUsuario]    Script Date: 28/11/2019 10:53:15 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre_Usuario] [varchar](20) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Borrado] [bit] NOT NULL,
	[IdTipo] [int] NULL,
 CONSTRAINT [PK_Usuarios_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Canciones] ON 

INSERT [dbo].[Canciones] ([Id], [Nombre], [Artista], [IdAlbum], [UbicacionCancion], [Genero], [UbicacionImagen]) VALUES (14, N'Ariana Grande', N'qwer', NULL, N'Ariana Grande - thank u, next.mp3', NULL, NULL)
INSERT [dbo].[Canciones] ([Id], [Nombre], [Artista], [IdAlbum], [UbicacionCancion], [Genero], [UbicacionImagen]) VALUES (18, N'cANCION', N'admin', NULL, N'Leja Re   Dhvani Bhanushali   Tanishk Bagchi   Rashmi Virag  Radhika Rao  Vinay Sapru   Siddharth.mp3', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Canciones] OFF
INSERT [dbo].[Favorito] ([Id_Canciones], [Id_Usuarios]) VALUES (18, 3)
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Nombre_Usuario], [Contraseña], [Correo], [Borrado], [IdTipo]) VALUES (2, N'Ezequiel', N'Binker', N'ReyDelLabo', N'"È> (š"m÷ÁÚ¯îëþ¨', N'ezebinker@gmail.com', 0, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Nombre_Usuario], [Contraseña], [Correo], [Borrado], [IdTipo]) VALUES (3, N'garca', N'garca', N'admin', N' ,¹b¬Y[–K-#Kp', N'admin@admin.com', 0, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Usuarios1] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Usuarios1]
GO
ALTER TABLE [dbo].[Canciones]  WITH CHECK ADD  CONSTRAINT [FK_Canciones_Album] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([Id])
GO
ALTER TABLE [dbo].[Canciones] CHECK CONSTRAINT [FK_Canciones_Album]
GO
ALTER TABLE [dbo].[Favorito]  WITH CHECK ADD  CONSTRAINT [FK_Favorito_Canciones] FOREIGN KEY([Id_Canciones])
REFERENCES [dbo].[Canciones] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorito] CHECK CONSTRAINT [FK_Favorito_Canciones]
GO
ALTER TABLE [dbo].[Favorito]  WITH CHECK ADD  CONSTRAINT [FK_Favorito_Usuarios] FOREIGN KEY([Id_Usuarios])
REFERENCES [dbo].[Usuarios] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorito] CHECK CONSTRAINT [FK_Favorito_Usuarios]
GO
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD  CONSTRAINT [FK_Playlist_Usuarios] FOREIGN KEY([Id_Usuarios])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Playlist] CHECK CONSTRAINT [FK_Playlist_Usuarios]
GO
ALTER TABLE [dbo].[Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Telefonos_Usuarios1] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Telefonos] CHECK CONSTRAINT [FK_Telefonos_Usuarios1]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TipoDeUsuario] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[TipoDeUsuario] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TipoDeUsuario]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFav]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteFav]
@idCancion int, @idUsuario int
as
delete from Favorito where Id_Canciones=@idCancion and Id_Usuarios=@idUsuario

GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarCancion]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BorrarCancion]
@id int
as

delete from Canciones where Id = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarxAlbum]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BuscarxAlbum]
@Album varchar(50)
as
select * from Canciones 
inner join Album on Canciones.IdAlbum = Album.Id
where Album.Nombre = @Album
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarxNombre]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_BuscarxNombre]
@Nombre varchar(50)
as
select Id,Nombre,UbicacionCancion,UbicacionImagen,IdAlbum,Genero,Artista from Canciones where Nombre  like '%'+@Nombre+'%'


GO
/****** Object:  StoredProcedure [dbo].[SP_CrearPlaylist]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CrearPlaylist]
@Nombre varchar(50),
@id int
as

insert into Playlist(Nombre, Id_Usuarios) values (@Nombre, @id)
GO
/****** Object:  StoredProcedure [dbo].[SP_EditarPerfil]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_EditarPerfil]
@id int, @Nombre_U varchar(50), @contraseña varchar(100), @correo varchar(200),@Nombre varchar(100), @Apellido varchar(100)
as

update Usuarios set Contraseña = HASHBYTES('md5',@contraseña), Correo = @correo , Nombre_Usuario = @Nombre_U,Nombre=@Nombre,Apellido=@Apellido
where Id = @id


GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarCancion]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_EliminarCancion]
@id varchar(50)
AS
DELETE FROM Canciones WHERE @id = id
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarUsuario]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_EliminarUsuario]

@id int, @NombreU varchar(100)
as


DELETE FROM Canciones WHERE @NombreU = Artista
Delete from Favorito where @id=Id_Usuarios
DELETE FROM Usuarios WHERE @id = id
GO
/****** Object:  StoredProcedure [dbo].[SP_Favoritos]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Favoritos]
@id int , @idUsuario int
as
Insert into Favorito (Id_Canciones,Id_Usuarios) Values (@id,@idUsuario)

GO
/****** Object:  StoredProcedure [dbo].[SP_FiltrarCancion]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_FiltrarCancion]
@Genero varchar(50)
as

select * from Canciones where Genero = @Genero
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarCancion]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_InsertarCancion]

@Nombre varchar(50), @Ubicacion varchar(200),@Artista varchar(100)

as

insert into Canciones (Nombre,UbicacionCancion,Artista) values (@Nombre,@Ubicacion,@Artista)
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 28/11/2019 10:53:15 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MusicaxPlaylist]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_MusicaxPlaylist]
@id int
as
insert into PlaylistxCanciones (Id_Cancion) values (@id)


GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarUsuario]    Script Date: 28/11/2019 10:53:15 ******/
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
			IF EXISTS(SELECT Nombre_Usuario FROM Usuarios WHERE Nombre_Usuario=@NomUsuario)
				BEGIN
					PRINT 'EL NOMBRE DE USUARIO YA EXISTE';
				END
					ELSE
						BEGIN
							INSERT INTO Usuarios(Nombre_Usuario, Contraseña, Apellido, Nombre, Correo, Borrado) 
							values (@NomUsuario, HASHBYTES ('MD5' , @Contraseña), @Apellido, @Nombre, @mail, 0)
						END
		END
		ELSE
		BEGIN
			PRINT 'Crear bien el usuario';
		END
GO
/****** Object:  StoredProcedure [dbo].[SP_TraerMiMusica]    Script Date: 28/11/2019 10:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_TraerMiMusica]
@NombreU varchar(100)
as
SELECT * FROM Canciones WHERE Artista = @NombreU
GO
/****** Object:  StoredProcedure [dbo].[SP_TraerMusica]    Script Date: 28/11/2019 10:53:15 ******/
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
