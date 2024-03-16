USE [master]
GO
/****** Object:  Database [Drones]    Script Date: 15/03/2024 20:58:05 ******/
CREATE DATABASE [Drones]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Drones', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Drones.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Drones_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Drones_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Drones] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Drones].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Drones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Drones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Drones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Drones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Drones] SET ARITHABORT OFF 
GO
ALTER DATABASE [Drones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Drones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Drones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Drones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Drones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Drones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Drones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Drones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Drones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Drones] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Drones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Drones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Drones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Drones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Drones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Drones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Drones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Drones] SET RECOVERY FULL 
GO
ALTER DATABASE [Drones] SET  MULTI_USER 
GO
ALTER DATABASE [Drones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Drones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Drones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Drones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Drones] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Drones] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Drones', N'ON'
GO
ALTER DATABASE [Drones] SET QUERY_STORE = OFF
GO
USE [Drones]
GO
/****** Object:  User [Gene]    Script Date: 15/03/2024 20:58:05 ******/
CREATE USER [Gene] FOR LOGIN [Gene] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[Identificacion] [int] NOT NULL,
	[Actividad] [varchar](50) NOT NULL,
	[Fecha-hora] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[ID_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Numero_Serie] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Precio_Total] [int] NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[ID_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[Identificacion] [int] NOT NULL,
	[ID_Factura] [int] NOT NULL,
	[ID_Compra] [int] NOT NULL,
	[Monto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[ID_Factura] [int] IDENTITY(1,1) NOT NULL,
	[ID_Compra] [int] NOT NULL,
	[Tipo_Pago] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasSeguridad]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasSeguridad](
	[PreguntaID] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PreguntaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Numero_Serie] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Ficha_tecnica] [varchar](200) NOT NULL,
	[Precio] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[Identificacion] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Residencia] [varchar](256) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Contraseña] [varchar](64) NULL,
	[Pregunta1] [varchar](60) NULL,
	[Respuesta1] [varchar](100) NULL,
	[Pregunta2] [varchar](60) NULL,
	[Respuesta2] [varchar](100) NULL,
	[Pregunta3] [varchar](60) NULL,
	[Respuesta3] [varchar](100) NULL,
 CONSTRAINT [PK__Registro__D6F931E4AB62F3B7] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCantidadCarrito]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCantidadCarrito]
    @Numero_Serie VARCHAR(50),
    @NuevaCantidad INT,
    @Identificacion INT,
    @NuevoPrecioTotal DECIMAL(18, 2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener el Precio actual de la tabla Carrito
    DECLARE @PrecioActual DECIMAL(18, 2);
    SELECT @PrecioActual = Precio
    FROM Carrito
    WHERE Identificacion = @Identificacion AND Numero_Serie = @Numero_Serie;

    -- Actualizar la cantidad en la tabla Carrito
    UPDATE Carrito
    SET Cantidad = @NuevaCantidad,
        Precio_Total = @NuevaCantidad * @PrecioActual -- Calcular el nuevo Precio_Total basado en el Precio actual
    WHERE Identificacion = @Identificacion AND Numero_Serie = @Numero_Serie;

    -- Devolver el nuevo Precio_Total
    SELECT @NuevoPrecioTotal = Precio_Total
    FROM Carrito
    WHERE Identificacion = @Identificacion AND Numero_Serie = @Numero_Serie;
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarAlCarrito]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarAlCarrito]
    @Identificacion INT,
    @Numero_Serie VARCHAR(50),
    @Modelo VARCHAR(50),
    @Cantidad INT,
    @Precio INT,
    @Precio_Total INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el producto ya está en el carrito para este usuario
    IF NOT EXISTS (SELECT 1 FROM dbo.Carrito WHERE Identificacion = @Identificacion AND Modelo = @Modelo)
    BEGIN
        -- Si no existe, agregar un nuevo artículo al carrito
        INSERT INTO dbo.Carrito (Identificacion, Numero_Serie, Modelo, Cantidad, Precio, Precio_Total)
        VALUES (@Identificacion, @Numero_Serie, @Modelo, @Cantidad, @Precio, @Precio_Total);
    END
    ELSE
    BEGIN
        -- Si el producto ya está en el carrito, puedes optar por actualizar la cantidad o hacer otra lógica según tus necesidades.
        UPDATE dbo.Carrito
        SET Cantidad = Cantidad + @Cantidad,
            Precio_Total = Precio_Total + @Precio_Total
        WHERE Identificacion = @Identificacion AND Modelo = @Modelo;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[BorrarCarritoPorIdentificacion]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarCarritoPorIdentificacion]
    @Identificacion INT
AS
BEGIN
    DELETE FROM Carrito WHERE Identificacion = @Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarHistorialPorIdentificacion]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarHistorialPorIdentificacion] (@identificacion INT)
AS
BEGIN
    SELECT ID_Factura, ID_Compra, Monto
    FROM Historial
    WHERE Identificacion = @identificacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[CambiarContraseña]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <12/03/2024>
-- Description:	<Restraurar Contraseña>
-- =============================================
CREATE PROCEDURE [dbo].[CambiarContraseña]
    @Correo VARCHAR(50),
    @Contraseña VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el correo existe en la tabla Registro
    IF EXISTS (SELECT 1 FROM Registro WHERE Correo = @Correo)
    BEGIN
        -- Actualizar la contraseña para el usuario especificado
        UPDATE Registro
        SET Contraseña = @Contraseña
        WHERE Correo = @Correo;

        -- Otros pasos necesarios después de cambiar la contraseña, si los hay

        -- Indicar que la operación fue exitosa
        SELECT 1 AS Resultado;
    END
    ELSE
    BEGIN
        -- Indicar que el correo no existe en la tabla Registro
        SELECT 0 AS Resultado;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[CompararRespuestas]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <14/03/2024>
-- Description:	<Respuesta de las preguntas>
-- =============================================
CREATE PROCEDURE [dbo].[CompararRespuestas]
    @Correo VARCHAR(100),
    @Respuesta1 VARCHAR(255),
    @Respuesta2 VARCHAR(255),
    @Respuesta3 VARCHAR(255),
    @Resultado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @Identificacion INT;
 
    IF EXISTS (SELECT 1 FROM Registro WHERE Correo = @Correo)
    BEGIN
        SELECT @Identificacion = Identificacion FROM Registro WHERE Correo = @Correo;
 
        IF EXISTS (
            SELECT 1
            FROM Registro
            WHERE Identificacion = @Identificacion
              AND Respuesta1 = @Respuesta1
              AND Respuesta2 = @Respuesta2
              AND Respuesta3 = @Respuesta3
        )
        BEGIN
            SET @Resultado = 1;
        END
        ELSE
        BEGIN
            SET @Resultado = 0;
        END
    END
    ELSE
    BEGIN
        SET @Resultado = -1;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarContraseña]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <13/04/2024>
-- Description:	<EliminarContraseña>
-- =============================================
CREATE PROCEDURE [dbo].[EliminarContraseña]
    @correo VARCHAR(50)
AS
BEGIN
    -- Buscar el usuario por correo y actualizar la contraseña
    UPDATE Registro
    SET contraseña = NULL
    WHERE correo = @correo;

    IF @@ROWCOUNT > 0
    BEGIN
        PRINT 'Contraseña eliminada y establecida como NULL correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'Correo no encontrado en la tabla Registro.';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[EncriptarContraseña]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <13/03/2024>
-- Description:	<Encriptar>
-- =============================================
CREATE PROCEDURE [dbo].[EncriptarContraseña]
    @ContraseñaOriginal VARCHAR(50),
    @ContraseñaEncriptada VARCHAR(50) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Encriptar la contraseña con SHA-256
    SET @ContraseñaEncriptada = CONVERT(VARCHAR(50), HASHBYTES('SHA2_256', @ContraseñaOriginal), 2);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarContraseña]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarContraseña]

    @correo VARCHAR(50),

    @nuevaContraseña VARCHAR(64)

AS

BEGIN

    -- Verificar si el correo existe en la tabla Registro

    IF EXISTS (SELECT 1 FROM Registro WHERE correo = @correo)

    BEGIN

        -- Encriptar la nueva contraseña antes de la actualización

        DECLARE @hashContraseña VARCHAR(64);

        SET @hashContraseña = (SELECT CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', @nuevaContraseña), 2));

        -- Actualizar la contraseña del usuario con la versión encriptada

        UPDATE Registro

        SET contraseña = @hashContraseña

        WHERE correo = @correo;

        PRINT 'Contraseña insertada correctamente.';

    END

    ELSE

    BEGIN

        PRINT 'Correo no encontrado en la tabla Registro.';

    END

END
GO
/****** Object:  StoredProcedure [dbo].[InsertRegistro]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <16/02/2024>
-- Description:	<Insertar Registro>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRegistro]

    @Identificacion INT,

    @Nombre VARCHAR(500),

    @Apellido VARCHAR(20), -- Nuevo campo para apellido

    @Residencia VARCHAR(256),

    @Telefono INT,

    @Correo VARCHAR(50),

    @Contraseña VARCHAR(50),

	@Pregunta1 VARCHAR(60),

    @Respuesta1 VARCHAR(100),

    @Pregunta2 VARCHAR(60),

    @Respuesta2 VARCHAR(100),

    @Pregunta3 VARCHAR(60),

    @Respuesta3 VARCHAR(100)

AS

BEGIN

    BEGIN TRANSACTION;

    -- Verificar si los datos ya existen en la tabla Registro

    IF NOT EXISTS (SELECT 1 FROM Registro WHERE Identificacion = @Identificacion)

    BEGIN

        -- Encriptar la contraseña antes de la inserción

        DECLARE @HashedPassword VARCHAR(50);

        SET @HashedPassword = (SELECT CONVERT(VARCHAR(50), HASHBYTES('SHA2_256', @Contraseña), 2));

        -- Si no existen, realizar la inserción

        INSERT INTO Registro (Identificacion, Nombre, Apellido, Telefono, Correo, Contraseña, Residencia, Pregunta1, Respuesta1, Pregunta2, Respuesta2, Pregunta3, Respuesta3)

        VALUES (@Identificacion, @Nombre, @Apellido, @Telefono, @Correo, @HashedPassword, @Residencia, @Pregunta1, @Respuesta1, @Pregunta2, @Respuesta2, @Pregunta3, @Respuesta3);


        -- Puedes agregar más lógica aquí si es necesario

        PRINT 'Registro insertado correctamente.';

        COMMIT;

    END

    ELSE

    BEGIN

        -- Si la identificación ya existe, hacer rollback y lanzar un mensaje de error

        ROLLBACK;

        THROW 50000, 'Los datos ya existen en la tabla Registro.', 1;

    END

END
GO
/****** Object:  StoredProcedure [dbo].[MostrarPreguntasSeguridad]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <14/03/2024>
-- Description:	<Mostrar Preguntas>
-- =============================================
CREATE PROCEDURE [dbo].[MostrarPreguntasSeguridad]
AS
BEGIN
    SET NOCOUNT ON;
 
    -- Mostrar todas las preguntas de seguridad
    SELECT PreguntaID, Pregunta FROM PreguntasSeguridad;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCarritoPorIdentificacion]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[ObtenerCarritoPorIdentificacion]
    @Identificacion INT
AS
BEGIN
    SELECT Numero_Serie, Modelo, Cantidad, Precio, Precio_Total
    FROM Carrito
    WHERE Identificacion = @Identificacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCorreoPorIdentificacion]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCorreoPorIdentificacion](@Identificacion INT)
AS
BEGIN
    SELECT Correo
    FROM Registro
    WHERE Identificacion = @Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosRegistro]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <10/03/2024>
-- Description:	<Obtener token>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerDatosRegistro]
    @IdentificacionLogin INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declarar variables para almacenar los resultados
    DECLARE @Correo VARCHAR(50);
    DECLARE @Seguridad INT;

    -- Obtener el correo y la seguridad de la tabla Registro
    SELECT @Correo = R.Correo, @Seguridad = R.Seguridad
    FROM [Drones].[dbo].[Registro] R
    INNER JOIN [Drones].[dbo].[Login] L ON R.Identificacion = L.Identificacion
    WHERE L.Identificacion = @IdentificacionLogin;

    -- Devolver los resultados
    SELECT Correo, Seguridad
    FROM [Drones].[dbo].[Registro]
    WHERE Identificacion = @IdentificacionLogin;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPreguntas]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPreguntas]
    @Correo VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
 
    IF EXISTS (SELECT 1 FROM Registro WHERE Correo = @Correo)
    BEGIN
        SELECT 
            (SELECT Pregunta FROM PreguntasSeguridad WHERE PreguntaID = u.Pregunta1) AS Pregunta1,
            (SELECT Pregunta FROM PreguntasSeguridad WHERE PreguntaID = u.Pregunta2) AS Pregunta2,
            (SELECT Pregunta FROM PreguntasSeguridad WHERE PreguntaID = u.Pregunta3) AS Pregunta3
        FROM Registro u
        WHERE Correo = @Correo;
    END
    ELSE
    BEGIN
        SELECT 'El correo electrónico no está registrado' AS Mensaje;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosDrones]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Genesis Barahona Quirós>
-- Create date: <21/02/2024>
-- Description:	<Drones>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerProductosDrones]
AS
BEGIN
    SELECT Tipo, Modelo, Descripcion, Ficha_tecnica, Precio
    FROM Producto
    WHERE tipo = 'drone';
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosTraktor]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <21/02/2024>
-- Description:	<Traktor>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerProductosTraktor]
AS
BEGIN
    SELECT tipo, modelo, descripcion, ficha_tecnica, precio
    FROM Producto
    WHERE tipo = 'tractor';
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTotalAPagar]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerTotalAPagar]
    @Identificacion INT
AS
BEGIN
    SELECT Identificacion, ISNULL(SUM(Precio_Total), 0) AS TotalAPagar
    FROM Carrito
    WHERE Identificacion = @Identificacion
    GROUP BY Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarAuditoria]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <14/03/2024>
-- Description:	<Auditoria>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarAuditoria]
    @Identificacion INT,
    @Actividad VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el registro en la tabla de Auditoria
    INSERT INTO Auditoria (Identificacion, Actividad, [Fecha-hora])
    VALUES (@Identificacion, @Actividad, GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[ValidarCredenciales]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarCredenciales]

    @Identificacion INT,

    @Contraseña VARCHAR(50),  -- No encriptada

    @Resultado INT OUT

AS

BEGIN

    SET NOCOUNT ON;

    -- Inicializar el resultado

    SET @Resultado = 0;

    -- Obtener la contraseña encriptada almacenada en la base de datos para el usuario

    DECLARE @HashedPasswordFromRegistro VARCHAR(50);

    SELECT @HashedPasswordFromRegistro = contraseña FROM Registro WHERE Identificacion = @Identificacion;

    -- Encriptar la contraseña proporcionada para compararla con la almacenada

    DECLARE @ContraseñaEncriptada VARCHAR(50);

    SET @ContraseñaEncriptada = (SELECT CONVERT(VARCHAR(50), HASHBYTES('SHA2_256', @Contraseña), 2));

    -- Verificar si las credenciales son válidas

    IF @ContraseñaEncriptada = @HashedPasswordFromRegistro

    BEGIN

        -- Si las credenciales son válidas, establecer el resultado en 1

        SET @Resultado = 1;

    END;

END;
GO
/****** Object:  StoredProcedure [dbo].[VerificarCorreo]    Script Date: 15/03/2024 20:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Génesis Barahona Quirós>
-- Create date: <13/04/2024>
-- Description:	<Verificar Correo>
-- =============================================
CREATE PROCEDURE [dbo].[VerificarCorreo]
    @correo_verificar NVARCHAR(50),
    @resultado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el correo existe en la tabla
    SELECT @resultado = COUNT(*)
    FROM registro
    WHERE correo = @correo_verificar;
END;
GO
USE [master]
GO
ALTER DATABASE [Drones] SET  READ_WRITE 
GO
