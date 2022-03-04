USE [master]
GO
/****** Object:  Database [BDBAC]    Script Date: 2022/03/03 11:15:39 PM ******/
CREATE DATABASE [BDBAC] ON  PRIMARY 
( NAME = N'BDBAC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BDBAC.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDBAC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BDBAC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDBAC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDBAC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDBAC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDBAC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDBAC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDBAC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDBAC] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDBAC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDBAC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDBAC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDBAC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDBAC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDBAC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDBAC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDBAC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDBAC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDBAC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDBAC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDBAC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDBAC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDBAC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDBAC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDBAC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDBAC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDBAC] SET RECOVERY FULL 
GO
ALTER DATABASE [BDBAC] SET  MULTI_USER 
GO
ALTER DATABASE [BDBAC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDBAC] SET DB_CHAINING OFF 
GO
USE [BDBAC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetContraseñaVarbinary]    Script Date: 2022/03/03 11:15:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetContraseñaVarbinary] 
(
    @Contraseña VARCHAR(25)
)
RETURNS VarBinary(8000)
AS
BEGIN
    DECLARE @pass AS VarBinary(8000)
    SET @pass = ENCRYPTBYPASSPHRASE('BAC',@Contraseña)
    RETURN @pass
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetContraseñaVarchar]    Script Date: 2022/03/03 11:15:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[fnGetContraseñaVarchar]
(
    @Contraseña VARBINARY(8000)
)
RETURNS VARCHAR(25)
AS
BEGIN
    DECLARE @pass AS VARCHAR(25)
    SET @pass = DECRYPTBYPASSPHRASE('BAC',@Contraseña)
    RETURN @pass
END

GO
/****** Object:  Table [dbo].[tbCategoriaProductos]    Script Date: 2022/03/03 11:15:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCategoriaProductos](
	[codCategoriaProductos] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[codUsuarioIngreso] [int] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[codUsuarioModificacion] [int] NULL,
	[Eliminado] [bit] NOT NULL,
	[FechaEliminacion] [datetime] NULL,
	[codUsuarioEliminacion] [int] NULL,
 CONSTRAINT [PK_tbCategoriaProductos] PRIMARY KEY CLUSTERED 
(
	[codCategoriaProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProducto]    Script Date: 2022/03/03 11:15:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProducto](
	[codProducto] [int] IDENTITY(1,1) NOT NULL,
	[tbCategoriaProductos_codCategoriaProductos] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[codUsuarioIngreso] [int] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[codUsuarioModificacion] [int] NULL,
	[imagen] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbProducto] PRIMARY KEY CLUSTERED 
(
	[codProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuario]    Script Date: 2022/03/03 11:15:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuario](
	[codUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Contraseña] [varbinary](8000) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
 CONSTRAINT [PK_tbUsuario] PRIMARY KEY CLUSTERED 
(
	[codUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbCategoriaProductos] ON 
GO
INSERT [dbo].[tbCategoriaProductos] ([codCategoriaProductos], [Descripcion], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [Eliminado], [FechaEliminacion], [codUsuarioEliminacion]) VALUES (1, N'Categoría 1', 1, CAST(N'2022-03-03T15:54:51.240' AS DateTime), 1, CAST(N'2022-03-03T16:11:39.033' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[tbCategoriaProductos] ([codCategoriaProductos], [Descripcion], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [Eliminado], [FechaEliminacion], [codUsuarioEliminacion]) VALUES (2, N'Categoría 2', 1, CAST(N'2022-03-03T16:10:59.643' AS DateTime), 1, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[tbCategoriaProductos] ([codCategoriaProductos], [Descripcion], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [Eliminado], [FechaEliminacion], [codUsuarioEliminacion]) VALUES (3, N'Categoría 3', 1, CAST(N'2022-03-03T16:11:52.153' AS DateTime), 1, CAST(N'2022-03-03T16:12:07.457' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[tbCategoriaProductos] ([codCategoriaProductos], [Descripcion], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [Eliminado], [FechaEliminacion], [codUsuarioEliminacion]) VALUES (4, N'cat4', 0, CAST(N'2022-03-03T19:47:08.150' AS DateTime), 1, CAST(N'2022-03-03T19:47:34.217' AS DateTime), 1, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbCategoriaProductos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbProducto] ON 
GO
INSERT [dbo].[tbProducto] ([codProducto], [tbCategoriaProductos_codCategoriaProductos], [Descripcion], [Precio], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [imagen]) VALUES (1, 1, N'Producto 1', CAST(20.00 AS Decimal(18, 2)), 1, CAST(N'2022-03-03T19:25:55.363' AS DateTime), 1, CAST(N'2022-03-03T19:39:54.140' AS DateTime), 1, N'd596204d-dbab-4451-bd9d-084bedae9e5a.png')
GO
INSERT [dbo].[tbProducto] ([codProducto], [tbCategoriaProductos_codCategoriaProductos], [Descripcion], [Precio], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [imagen]) VALUES (2, 1, N'otro producto', CAST(10.00 AS Decimal(18, 2)), 1, CAST(N'2022-03-03T19:52:14.387' AS DateTime), 1, CAST(N'2022-03-03T19:53:03.743' AS DateTime), 1, N'1164863b-86f4-4967-b7a8-aa6116124d26.png')
GO
INSERT [dbo].[tbProducto] ([codProducto], [tbCategoriaProductos_codCategoriaProductos], [Descripcion], [Precio], [Activo], [FechaIngreso], [codUsuarioIngreso], [FechaModificacion], [codUsuarioModificacion], [imagen]) VALUES (3, 1, N'test', CAST(12.00 AS Decimal(18, 2)), 1, CAST(N'2022-03-03T19:54:30.690' AS DateTime), 1, NULL, NULL, N'4429ea97-8a3a-4069-9e00-3ba17297d7f8.png')
GO
SET IDENTITY_INSERT [dbo].[tbProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[tbUsuario] ON 
GO
INSERT [dbo].[tbUsuario] ([codUsuario], [Nombre], [Apellido], [UserName], [Contraseña], [Activo], [FechaIngreso]) VALUES (1, N'Gustavo', N'Mendieta', N'Gus123', 0x01000000DC01DC1DABEE5850BD1F8036FE726F98D502209E89A4D2D7D7295392D188F939, 1, CAST(N'2022-03-03T12:27:05.427' AS DateTime))
GO
INSERT [dbo].[tbUsuario] ([codUsuario], [Nombre], [Apellido], [UserName], [Contraseña], [Activo], [FechaIngreso]) VALUES (2, N'Mayra', N'Cajeta', N'cabezona', 0x010000005ECD6F55DB0BBB957EB9DF1BBD9F546BA28BD805648E8B44, 1, CAST(N'2022-03-03T19:44:57.807' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbUsuario] OFF
GO
ALTER TABLE [dbo].[tbProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbProducto_tbCategoriaProductos] FOREIGN KEY([tbCategoriaProductos_codCategoriaProductos])
REFERENCES [dbo].[tbCategoriaProductos] ([codCategoriaProductos])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbProducto] CHECK CONSTRAINT [FK_tbProducto_tbCategoriaProductos]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCategoriaProductos]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 02 de marzo de 2022
-- Description:	consultar lista de categorias de productos
-- exec [dbo].[ConsultarCategoriaProductos] -1,-1
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarCategoriaProductos]
	-- Add the parameters for the stored procedure here
	@_Categoria INT, @_Estado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT codCategoriaProductos,Descripcion,Activo 
   FROM tbCategoriaProductos
   WHERE codCategoriaProductos = CASE WHEN @_Categoria = -1 THEN codCategoriaProductos ELSE @_Categoria END
   AND Activo = CASE WHEN @_Estado = -1 THEN Activo ELSE @_Estado END
  AND Eliminado = 0
	
END
GO
/****** Object:  StoredProcedure [dbo].[espConsultarCategoriaFiltro]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 02 de marzo de 2022
-- Description:	consultar categorias de productos
-- exec [dbo].[espConsultarCategoriaFiltro]
-- =============================================
CREATE PROCEDURE [dbo].[espConsultarCategoriaFiltro]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT codCategoriaProductos,Descripcion
	FROM tbCategoriaProductos
	where Activo =1
	
END
GO
/****** Object:  StoredProcedure [dbo].[espConsultarCategoriXcodCategoria]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 02 de MARZO de 2022
-- Description:	obtener una categoria x cod de categoria
-- exec [dbo].[espConsultarCategoriXcodCategoria]  1
-- =============================================
CREATE PROCEDURE [dbo].[espConsultarCategoriXcodCategoria]
	-- Add the parameters for the stored procedure here
	@_codCategoria INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


     SELECT codCategoriaProductos,Descripcion,Activo FROM tbCategoriaProductos
	 WHERE codCategoriaProductos = @_codCategoria
	
END

GO
/****** Object:  StoredProcedure [dbo].[espConsultarEstadoFiltro]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 02 de marzo de 2022
-- Description:	consultar estado de categorias
-- exec [dbo].[espConsultarEstadoFiltro]
-- =============================================
CREATE PROCEDURE [dbo].[espConsultarEstadoFiltro]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	SELECT 1 codEstado, 'Activo' Descripcion
	union
	SELECT 0 codEstado, 'Inactivo' Descripcion
	
END
GO
/****** Object:  StoredProcedure [dbo].[espConsultarProductoFiltro]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 03 de marzo de 2022
-- Description:	consultar productos
-- exec [dbo].[espConsultarProductoFiltro] -1
-- =============================================
CREATE PROCEDURE [dbo].[espConsultarProductoFiltro]
	-- Add the parameters for the stored procedure here
	@_codcategoria int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT codProducto,Descripcion
	FROM tbProducto
	where tbCategoriaProductos_codCategoriaProductos =  @_codcategoria
	and Activo = 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[espConsultarProductos]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 02 de marzo de 2022
-- Description:	consultar lista de categorias de productos
-- exec [dbo].[espConsultarProductos] -1,-1,-1
-- =============================================
CREATE PROCEDURE [dbo].[espConsultarProductos]
	-- Add the parameters for the stored procedure here
	@_Categoria INT, @_Producto INT, @_Estado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT codProducto,CP.Descripcion Categoria, P.Descripcion,P.Precio, p.Activo, P.imagen
   FROM tbProducto P
   JOIN tbCategoriaProductos CP ON CP.codCategoriaProductos = P.tbCategoriaProductos_codCategoriaProductos
   WHERE codProducto = CASE WHEN @_Producto = -1 THEN codProducto ELSE @_Producto END
   AND tbCategoriaProductos_codCategoriaProductos = CASE WHEN @_Categoria = -1 THEN tbCategoriaProductos_codCategoriaProductos ELSE @_Categoria END
   AND P.Activo = CASE WHEN @_Estado = -1 THEN P.Activo ELSE @_Estado END
  
	
END
GO
/****** Object:  StoredProcedure [dbo].[espConsultarProductoXcodProducto]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 03 de MARZO de 2022
-- Description:	obtener una producto x cod de producto
-- exec [dbo].[espConsultarProductoXcodProducto]  1
-- =============================================
CREATE PROCEDURE [dbo].[espConsultarProductoXcodProducto]
	-- Add the parameters for the stored procedure here
	@_codProducto INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


     SELECT p.codProducto,p.Descripcion,p.Activo,CP.codCategoriaProductos,p.Precio, CP.Descripcion Categoria
	 FROM tbProducto p
	 INNER JOIN tbCategoriaProductos CP ON CP.codCategoriaProductos = p.tbCategoriaProductos_codCategoriaProductos
	 WHERE p.codProducto = @_codProducto
	
END

GO
/****** Object:  StoredProcedure [dbo].[espMantenimientoProductos]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 03 de marzo de 2022
-- Description:	actualizar e insertar Productos 
-- exec [dbo].[espMantenimientoProductos]
-- =============================================
CREATE PROCEDURE [dbo].[espMantenimientoProductos]
	-- Add the parameters for the stored procedure here
	@_codProducto INT,
	@_codCategoria INT,
	@_descripcion nvarchar(100),
	@_precio decimal(18,2),
	@_activo bit,
	@_imagen nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION

		MERGE INTO [dbo].[tbProducto] tbOrigen
		USING(SELECT 
				@_codProducto,
				@_codCategoria,
				@_descripcion,
				@_precio,
				@_activo,
				getdate(),
				1,
				null,
				null,
				@_imagen
		) AS tbDestino (
				 codProducto
				 ,tbCategoriaProductos_codCategoriaProductos		
				 ,Descripcion
				 ,Precio
				 ,Activo
				 ,FechaIngreso
				 ,codUsuarioIngreso
				 ,FechaModificacion
				 ,codUsuarioModificacion
				 ,imagen
		)
		ON tbDestino.codProducto = tbOrigen.codProducto
		OR (tbDestino.Descripcion = tbOrigen.Descripcion and tbDestino.tbCategoriaProductos_codCategoriaProductos = tbOrigen.tbCategoriaProductos_codCategoriaProductos )
		WHEN MATCHED THEN
					UPDATE SET 
						 tbOrigen.Descripcion = tbDestino.Descripcion
						,tbOrigen.Precio = tbDestino.Precio
						,tbOrigen.Activo = tbDestino.Activo
						,tbOrigen.FechaModificacion = getdate()
						,tbOrigen.codUsuarioModificacion = 1
						,tbOrigen.imagen = case when @_imagen = '0' then tbOrigen.imagen else tbDestino.imagen end 
				WHEN NOT MATCHED THEN
							INSERT(
						tbCategoriaProductos_codCategoriaProductos
						,Descripcion
						,Precio
						,Activo
						,FechaIngreso
						,codUsuarioIngreso
						,FechaModificacion
						,codUsuarioModificacion
						,imagen
						) VALUES (
						tbDestino.tbCategoriaProductos_codCategoriaProductos,
						tbDestino.Descripcion,
						tbDestino.Precio,
						tbDestino.Activo,
						tbDestino.FechaIngreso,
						tbDestino.codUsuarioIngreso,
						tbDestino.FechaModificacion,
						tbDestino.codUsuarioModificacion,
						tbDestino.imagen
						);

		SELECT '1' Estado, 'Acción completada con exito.' MensajeUsuario, @_codCategoria codCategoria
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @_msjError VARCHAR(2000)=ERROR_MESSAGE()
		SELECT '0' Estado, 'Se produjo un error al tratar de completar la acción.' MensajeUsuario, @_msjError Mensaje , 0 ErrorRegistrado
	END CATCH 
END



GO
/****** Object:  StoredProcedure [dbo].[espRegistrarUsuario]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 03 de marzo de 2022
-- Description:	REGISTRAR  usuario
-- exec [dbo].[espRegistrarUsuario] 
-- =============================================
CREATE PROCEDURE [dbo].[espRegistrarUsuario]
	-- Add the parameters for the stored procedure here
	@_Nombre nvarchar(100),
	@_Apellido nvarchar(100),
	@_Usuario nvarchar(100),
	@_Contraseña nvarchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO tbUsuario
		VALUES(@_Nombre,@_Apellido,@_Usuario,dbo.fnGetContraseñaVarbinary(@_Contraseña),1,GETDATE())




		SELECT '1' Estado, 'Acción completada con exito.' MensajeUsuario
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @_msjError VARCHAR(2000)=ERROR_MESSAGE()
		SELECT '0' Estado, 'Se produjo un error al tratar de completar la acción.' MensajeUsuario, @_msjError Mensaje , 0 ErrorRegistrado
	END CATCH 
END



GO
/****** Object:  StoredProcedure [dbo].[espValidarSesion]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 03 de marzo de 2022
-- Description:	validar si existe usuario
-- exec [dbo].[espValidarSesion] 'Gus123', 'Contra123.'
-- =============================================
CREATE PROCEDURE [dbo].[espValidarSesion]
	-- Add the parameters for the stored procedure here
	@_Usuario nvarchar(max),
	@_Contraseña nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION
		declare @flag int 
		 SELECT @flag = COUNT(1) FROM tbUsuario where UserName = @_Usuario 
					and dbo.fnGetContraseñaVarchar(Contraseña) = @_Contraseña  and Activo = 1
		 IF @flag = 0
		 begin
			
			 SELECT '0' Estado
		 end
		 else
		 begin
			SELECT '1' Estado
		 end

		
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @_msjError VARCHAR(2000)=ERROR_MESSAGE()
		SELECT '0' Estado, 'Se produjo un error al tratar de completar la acción.' MensajeUsuario, @_msjError Mensaje , 0 ErrorRegistrado
	END CATCH 
END



GO
/****** Object:  StoredProcedure [dbo].[espValidarUsuario]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 03 de marzo de 2022
-- Description:	validar si existe usuario
-- exec [dbo].[espValidarUsuario] 'hola'
-- =============================================
CREATE PROCEDURE [dbo].[espValidarUsuario]
	-- Add the parameters for the stored procedure here
	@_Usuario nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION
		declare @flag int 
		 SELECT @flag = COUNT(1) FROM tbUsuario where UserName = @_Usuario and Activo = 1
		 IF @flag = 0
		 begin
			
			 SELECT '1' Estado
		 end
		 else
		 begin
			SELECT '0' Estado
		 end

		
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @_msjError VARCHAR(2000)=ERROR_MESSAGE()
		SELECT '0' Estado, 'Se produjo un error al tratar de completar la acción.' MensajeUsuario, @_msjError Mensaje , 0 ErrorRegistrado
	END CATCH 
END



GO
/****** Object:  StoredProcedure [dbo].[MantenimientoCategoriaProductos]    Script Date: 2022/03/03 11:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gustavo Mendieta
-- Create date: 02 de marzo de 2022
-- Description:	actualizar e insertar categoria 
-- exec [dbo].[MantenimientoCategoriaProductos]
-- =============================================
CREATE PROCEDURE [dbo].[MantenimientoCategoriaProductos]
	-- Add the parameters for the stored procedure here
	@_codCategoria INT,
	@_descripcion nvarchar(100),
	@_activo bit,
	@_eleminar bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     BEGIN TRY
		BEGIN TRANSACTION

		MERGE INTO [dbo].[tbCategoriaProductos] tbOrigen
		USING(SELECT 
				@_codCategoria int,
				@_descripcion,
				@_activo,
				getdate(),
				1,
				getdate(),
				1,
				0,
				getdate(),
				1
		) AS tbDestino (
				  codCategoriaProductos
				 ,Descripcion
				 ,Activo
				 ,FechaIngreso
				 ,codUsuarioIngreso
				 ,FechaModificacion
				 ,codUsuarioModificacion
				 ,Eliminado
				 ,FechaEliminacion
				 ,codUsuarioEliminacion
		)
		ON tbDestino.codCategoriaProductos = tbOrigen.codCategoriaProductos
		OR tbDestino.Descripcion = tbOrigen.Descripcion
		WHEN MATCHED THEN
					UPDATE SET 
						 tbOrigen.Descripcion = CASE WHEN @_eleminar = 1 then tbOrigen.Descripcion else tbDestino.Descripcion end 
						,tbOrigen.Activo = tbDestino.Activo
						,tbOrigen.FechaModificacion = tbDestino.FechaModificacion
						,tbOrigen.codUsuarioModificacion = tbDestino.codUsuarioModificacion
						,tbOrigen.Eliminado = CASE WHEN @_eleminar = 1 then 1 else 0 end
						,tbOrigen.FechaEliminacion = CASE WHEN @_eleminar = 1 then getdate() else null end
						,tbOrigen.codUsuarioEliminacion = CASE WHEN @_eleminar = 1 then 1 else null end

				WHEN NOT MATCHED THEN
							INSERT(
						 Descripcion
						,Activo
						,FechaIngreso
						,codUsuarioIngreso
						,FechaModificacion
						,codUsuarioModificacion
						,Eliminado
						,FechaEliminacion
						,codUsuarioEliminacion
						) VALUES (
						tbDestino.Descripcion,
						tbDestino.Activo,
						tbDestino.FechaIngreso,
						tbDestino.codUsuarioIngreso,
						null,
						null,
						tbDestino.Eliminado,
						null,
						null
						);

		SELECT '1' Estado, 'Acción completada con exito.' MensajeUsuario, @_codCategoria codCategoria
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @_msjError VARCHAR(2000)=ERROR_MESSAGE()
		SELECT '0' Estado, 'Se produjo un error al tratar de completar la acción.' MensajeUsuario, @_msjError Mensaje , 0 ErrorRegistrado
	END CATCH 
END



GO
USE [master]
GO
ALTER DATABASE [BDBAC] SET  READ_WRITE 
GO
