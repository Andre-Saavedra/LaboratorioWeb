USE [master]
GO
/****** Object:  Database [UPtel]    Script Date: 10/02/2021 12:50:50 ******/
CREATE DATABASE [UPtel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UPtel', FILENAME = N'C:\Users\JoaoNunes\UPtel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UPtel_log', FILENAME = N'C:\Users\JoaoNunes\UPtel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UPtel] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UPtel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UPtel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UPtel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UPtel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UPtel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UPtel] SET ARITHABORT OFF 
GO
ALTER DATABASE [UPtel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UPtel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UPtel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UPtel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UPtel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UPtel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UPtel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UPtel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UPtel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UPtel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UPtel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UPtel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UPtel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UPtel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UPtel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UPtel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UPtel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UPtel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UPtel] SET  MULTI_USER 
GO
ALTER DATABASE [UPtel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UPtel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UPtel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UPtel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UPtel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UPtel] SET QUERY_STORE = OFF
GO
USE [UPtel]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [UPtel]
GO
/****** Object:  Table [dbo].[Canais]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canais](
	[CanaisId] [int] IDENTITY(1,1) NOT NULL,
	[NomeCanal] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Canais] PRIMARY KEY CLUSTERED 
(
	[CanaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos](
	[CargoId] [int] IDENTITY(1,1) NOT NULL,
	[NomeCargo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[NomeCliente] [nvarchar](80) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[CartaoCidadao] [nvarchar](8) NOT NULL,
	[Contribuinte] [nvarchar](9) NOT NULL,
	[Morada] [nvarchar](80) NOT NULL,
	[CodigoPostal] [nvarchar](4) NOT NULL,
	[Telefone] [nvarchar](9) NULL,
	[Telemovel] [nvarchar](9) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[TipoClienteId] [int] NOT NULL,
	[CodigoPostalExt] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratos]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratos](
	[Contrato] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[FuncionarioId] [int] NOT NULL,
	[PromocaoId] [int] NOT NULL,
	[PacoteId] [int] NOT NULL,
	[DataInicio] [date] NOT NULL,
	[Fidelizacao] [int] NULL,
	[TempoPromocao] [int] NULL,
	[NomeCliente] [nvarchar](80) NOT NULL,
	[NomePacote] [nvarchar](50) NOT NULL,
	[NomePromocao] [nvarchar](50) NOT NULL,
	[NomeFuncionario] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Contratos] PRIMARY KEY CLUSTERED 
(
	[Contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionarios]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionarios](
	[FuncionarioId] [int] IDENTITY(1,1) NOT NULL,
	[NomeFuncionario] [nvarchar](80) NOT NULL,
	[CargoId] [int] NOT NULL,
	[NomeCargo] [nvarchar](50) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[Contribuinte] [nvarchar](9) NOT NULL,
	[Morada] [nvarchar](80) NOT NULL,
	[CodigoPostal] [nvarchar](4) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Telemovel] [nvarchar](9) NOT NULL,
	[CartaoCidadao] [nvarchar](8) NOT NULL,
	[IBAN] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[EstadoFuncionario] [nvarchar](10) NOT NULL,
	[CodigoPostalExt] [nvarchar](3) NOT NULL,
	[Fotografia] [varbinary](max) NULL,
 CONSTRAINT [PK_Funcionarios] PRIMARY KEY CLUSTERED 
(
	[FuncionarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetFixa]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetFixa](
	[NetFixaId] [int] IDENTITY(1,1) NOT NULL,
	[Limite] [decimal](5, 2) NOT NULL,
	[Velocidade] [int] NOT NULL,
	[TipoConexao] [nvarchar](30) NOT NULL,
	[Notas] [nvarchar](100) NULL,
 CONSTRAINT [PK_NetFixa] PRIMARY KEY CLUSTERED 
(
	[NetFixaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetMovel]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetMovel](
	[NetMovelId] [int] IDENTITY(1,1) NOT NULL,
	[Limite] [decimal](5, 2) NOT NULL,
	[Notas] [nvarchar](100) NULL,
	[Numero] [nvarchar](9) NOT NULL,
 CONSTRAINT [PK_NetMovel] PRIMARY KEY CLUSTERED 
(
	[NetMovelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacoteCanais]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacoteCanais](
	[PacoteCanalId] [int] IDENTITY(1,1) NOT NULL,
	[TelevisaoId] [int] NOT NULL,
	[CanaisId] [int] NOT NULL,
 CONSTRAINT [PK_PacoteCanais] PRIMARY KEY CLUSTERED 
(
	[PacoteCanalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacotes]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacotes](
	[PacoteId] [int] IDENTITY(1,1) NOT NULL,
	[NomePacote] [nvarchar](50) NOT NULL,
	[Preco] [decimal](6, 2) NOT NULL,
	[TelevisaoId] [int] NULL,
	[TelemovelId] [int] NULL,
	[NetIFixaId] [int] NULL,
	[TelefoneId] [int] NULL,
	[NetMovelId] [int] NULL,
 CONSTRAINT [PK_Pacotes] PRIMARY KEY CLUSTERED 
(
	[PacoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocoes]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocoes](
	[PromocaoId] [int] IDENTITY(1,1) NOT NULL,
	[NomePromocao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Promocoes] PRIMARY KEY CLUSTERED 
(
	[PromocaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefone]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefone](
	[TelefoneId] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](9) NOT NULL,
	[Limite] [int] NOT NULL,
	[PrecoMinutoNacional] [decimal](4, 2) NOT NULL,
	[PrecoMinutoInternacional] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[TelefoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telemovel]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telemovel](
	[TelemovelId] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](9) NOT NULL,
	[LimiteMinutos] [int] NOT NULL,
	[LimiteSMS] [int] NOT NULL,
	[PrecoMinutoNacional] [decimal](4, 2) NOT NULL,
	[PrecoMinutoInternacional] [decimal](4, 2) NOT NULL,
	[PrecoSMS] [decimal](4, 2) NOT NULL,
	[PrecoMMS] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Telemovel] PRIMARY KEY CLUSTERED 
(
	[TelemovelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Televisao]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Televisao](
	[TelevisaoId] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](20) NOT NULL,
	[Descricao] [nvarchar](100) NULL,
 CONSTRAINT [PK_Televisao] PRIMARY KEY CLUSTERED 
(
	[TelevisaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoClientes]    Script Date: 10/02/2021 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoClientes](
	[TipoClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Designacao] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_TipoClientes] PRIMARY KEY CLUSTERED 
(
	[TipoClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CartaoCidadaoClientes]    Script Date: 10/02/2021 12:50:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CartaoCidadaoClientes] ON [dbo].[Clientes]
(
	[CartaoCidadao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContribuinteClientes]    Script Date: 10/02/2021 12:50:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContribuinteClientes] ON [dbo].[Clientes]
(
	[Contribuinte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CartaoCidadaoFuncionarios]    Script Date: 10/02/2021 12:50:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CartaoCidadaoFuncionarios] ON [dbo].[Funcionarios]
(
	[CartaoCidadao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContribuinteFuncionarios]    Script Date: 10/02/2021 12:50:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContribuinteFuncionarios] ON [dbo].[Funcionarios]
(
	[Contribuinte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EmailFuncionarios]    Script Date: 10/02/2021 12:50:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EmailFuncionarios] ON [dbo].[Funcionarios]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TelemovelFuncionarios]    Script Date: 10/02/2021 12:50:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TelemovelFuncionarios] ON [dbo].[Funcionarios]
(
	[Telemovel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_TipoClientes] FOREIGN KEY([TipoClienteId])
REFERENCES [dbo].[TipoClientes] ([TipoClienteId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_TipoClientes]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Clientes]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Funcionarios] FOREIGN KEY([FuncionarioId])
REFERENCES [dbo].[Funcionarios] ([FuncionarioId])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Funcionarios]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Pacotes] FOREIGN KEY([PacoteId])
REFERENCES [dbo].[Pacotes] ([PacoteId])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Pacotes]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Promocoes] FOREIGN KEY([PromocaoId])
REFERENCES [dbo].[Promocoes] ([PromocaoId])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Promocoes]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_Funcionarios_Cargos] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargos] ([CargoId])
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [FK_Funcionarios_Cargos]
GO
ALTER TABLE [dbo].[PacoteCanais]  WITH CHECK ADD  CONSTRAINT [FK_PacoteCanais_Canais] FOREIGN KEY([CanaisId])
REFERENCES [dbo].[Canais] ([CanaisId])
GO
ALTER TABLE [dbo].[PacoteCanais] CHECK CONSTRAINT [FK_PacoteCanais_Canais]
GO
ALTER TABLE [dbo].[PacoteCanais]  WITH CHECK ADD  CONSTRAINT [FK_PacoteCanais_Televisao] FOREIGN KEY([TelevisaoId])
REFERENCES [dbo].[Televisao] ([TelevisaoId])
GO
ALTER TABLE [dbo].[PacoteCanais] CHECK CONSTRAINT [FK_PacoteCanais_Televisao]
GO
ALTER TABLE [dbo].[Pacotes]  WITH CHECK ADD  CONSTRAINT [FK_Pacotes_NetFixa1] FOREIGN KEY([NetIFixaId])
REFERENCES [dbo].[NetFixa] ([NetFixaId])
GO
ALTER TABLE [dbo].[Pacotes] CHECK CONSTRAINT [FK_Pacotes_NetFixa1]
GO
ALTER TABLE [dbo].[Pacotes]  WITH CHECK ADD  CONSTRAINT [FK_Pacotes_NetMovel] FOREIGN KEY([NetMovelId])
REFERENCES [dbo].[NetMovel] ([NetMovelId])
GO
ALTER TABLE [dbo].[Pacotes] CHECK CONSTRAINT [FK_Pacotes_NetMovel]
GO
ALTER TABLE [dbo].[Pacotes]  WITH CHECK ADD  CONSTRAINT [FK_Pacotes_Telefone] FOREIGN KEY([TelemovelId])
REFERENCES [dbo].[Telefone] ([TelefoneId])
GO
ALTER TABLE [dbo].[Pacotes] CHECK CONSTRAINT [FK_Pacotes_Telefone]
GO
ALTER TABLE [dbo].[Pacotes]  WITH CHECK ADD  CONSTRAINT [FK_Pacotes_Telemovel] FOREIGN KEY([TelemovelId])
REFERENCES [dbo].[Telemovel] ([TelemovelId])
GO
ALTER TABLE [dbo].[Pacotes] CHECK CONSTRAINT [FK_Pacotes_Telemovel]
GO
ALTER TABLE [dbo].[Pacotes]  WITH CHECK ADD  CONSTRAINT [FK_Pacotes_Televisao1] FOREIGN KEY([TelevisaoId])
REFERENCES [dbo].[Televisao] ([TelevisaoId])
GO
ALTER TABLE [dbo].[Pacotes] CHECK CONSTRAINT [FK_Pacotes_Televisao1]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_CartaoCidadaoClientes] CHECK  ((len([CartaoCidadao])=(8)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_CartaoCidadaoClientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_CodigoPostalClientes] CHECK  ((len([CodigoPostal])=(4)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_CodigoPostalClientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_CodigoPostalExtClientes] CHECK  ((len([CodigoPostalExt])=(3)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_CodigoPostalExtClientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_ContribuiteClientes] CHECK  ((len([Contribuinte])=(9)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_ContribuiteClientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_TelefoneClientes] CHECK  ((len([Telefone])=(9)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_TelefoneClientes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_TelemovelClientes] CHECK  ((len([Telemovel])=(9)))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_TelemovelClientes]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [CK_CartaoCidadaoFuncionarios] CHECK  ((len([CartaoCidadao])=(8)))
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [CK_CartaoCidadaoFuncionarios]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [CK_CodigoPostalExtFuncionarios] CHECK  ((len([CodigoPostalExt])=(3)))
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [CK_CodigoPostalExtFuncionarios]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [CK_CodigoPostalFuncionarios] CHECK  ((len([CodigoPostal])=(4)))
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [CK_CodigoPostalFuncionarios]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [CK_ContribuinteFuncionarios] CHECK  ((len([Contribuinte])=(9)))
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [CK_ContribuinteFuncionarios]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [CK_IBANFuncionarios] CHECK  ((len([IBAN])=(25)))
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [CK_IBANFuncionarios]
GO
ALTER TABLE [dbo].[Funcionarios]  WITH CHECK ADD  CONSTRAINT [CK_TelemovelFuncionarios] CHECK  ((len([Telemovel])=(9)))
GO
ALTER TABLE [dbo].[Funcionarios] CHECK CONSTRAINT [CK_TelemovelFuncionarios]
GO
ALTER TABLE [dbo].[NetFixa]  WITH CHECK ADD  CONSTRAINT [CK_LimiteNetFixa] CHECK  (([Limite]>=(0)))
GO
ALTER TABLE [dbo].[NetFixa] CHECK CONSTRAINT [CK_LimiteNetFixa]
GO
ALTER TABLE [dbo].[NetFixa]  WITH CHECK ADD  CONSTRAINT [CK_VelocidadeNetFixa] CHECK  (([Velocidade]>(0)))
GO
ALTER TABLE [dbo].[NetFixa] CHECK CONSTRAINT [CK_VelocidadeNetFixa]
GO
ALTER TABLE [dbo].[NetMovel]  WITH CHECK ADD  CONSTRAINT [CK_ComprimentoNumero] CHECK  ((len([Numero])=(9)))
GO
ALTER TABLE [dbo].[NetMovel] CHECK CONSTRAINT [CK_ComprimentoNumero]
GO
ALTER TABLE [dbo].[NetMovel]  WITH CHECK ADD  CONSTRAINT [CK_LimiteNetMovel] CHECK  (([Limite]>=(0)))
GO
ALTER TABLE [dbo].[NetMovel] CHECK CONSTRAINT [CK_LimiteNetMovel]
GO
ALTER TABLE [dbo].[Pacotes]  WITH CHECK ADD  CONSTRAINT [CK_PrecoPacotes] CHECK  (([Preco]>(0)))
GO
ALTER TABLE [dbo].[Pacotes] CHECK CONSTRAINT [CK_PrecoPacotes]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [CK_CompNumeroTelefone] CHECK  ((len([Numero])=(9)))
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [CK_CompNumeroTelefone]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [CK_LimiteTelefone] CHECK  (([Limite]>=(0)))
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [CK_LimiteTelefone]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [CK_PrecoMinutoInternacionalTelefone] CHECK  (([PrecoMinutoInternacional]>=(0)))
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [CK_PrecoMinutoInternacionalTelefone]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [CK_PrecoMinutoNacionalTelefone] CHECK  (([PrecoMinutoNacional]>=(0)))
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [CK_PrecoMinutoNacionalTelefone]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_CompNumeroTelemovel] CHECK  ((len([Numero])=(9)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_CompNumeroTelemovel]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_LimiteMinutosTelemovel] CHECK  (([LimiteMinutos]>=(0)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_LimiteMinutosTelemovel]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_LimiteSMSTelemovel] CHECK  (([LimiteSMS]>=(0)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_LimiteSMSTelemovel]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_PrecoMinutoInternacionalTelemovel] CHECK  (([PrecoMinutoInternacional]>=(0)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_PrecoMinutoInternacionalTelemovel]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_PrecoMinutoNacionalTelemovel] CHECK  (([PrecoMinutoNacional]>=(0)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_PrecoMinutoNacionalTelemovel]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_PrecoMMSTelemovel] CHECK  (([PrecoMMS]>=(0)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_PrecoMMSTelemovel]
GO
ALTER TABLE [dbo].[Telemovel]  WITH CHECK ADD  CONSTRAINT [CK_PrecoSMSTelemovel] CHECK  (([PrecoSMS]>=(0)))
GO
ALTER TABLE [dbo].[Telemovel] CHECK CONSTRAINT [CK_PrecoSMSTelemovel]
GO
USE [master]
GO
ALTER DATABASE [UPtel] SET  READ_WRITE 
GO
