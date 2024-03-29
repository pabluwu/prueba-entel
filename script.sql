USE [Database_Entel]
GO
/****** Object:  StoredProcedure [dbo].[PROC_VENDEDOR_MENOS_SOLICITUDES]    Script Date: 07-02-2024 13:11:13 ******/
DROP PROCEDURE [dbo].[PROC_VENDEDOR_MENOS_SOLICITUDES]
GO
/****** Object:  StoredProcedure [dbo].[PROC_SOLICITUDES_MES_ACTUAL]    Script Date: 07-02-2024 13:11:13 ******/
DROP PROCEDURE [dbo].[PROC_SOLICITUDES_MES_ACTUAL]
GO
/****** Object:  StoredProcedure [dbo].[PROC_MODELOS_SIN_SOLICITUDES]    Script Date: 07-02-2024 13:11:13 ******/
DROP PROCEDURE [dbo].[PROC_MODELOS_SIN_SOLICITUDES]
GO
/****** Object:  StoredProcedure [dbo].[PROC_MESES_MAS_VENTA]    Script Date: 07-02-2024 13:11:13 ******/
DROP PROCEDURE [dbo].[PROC_MESES_MAS_VENTA]
GO
/****** Object:  StoredProcedure [dbo].[PROC_MARCAS_MAS_SOLICITADAS]    Script Date: 07-02-2024 13:11:13 ******/
DROP PROCEDURE [dbo].[PROC_MARCAS_MAS_SOLICITADAS]
GO
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_Vendedor]
GO
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_ModeloAuto]
GO
ALTER TABLE [dbo].[ModeloAuto] DROP CONSTRAINT [FK_ModeloAuto_MarcaAuto]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 07-02-2024 13:11:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor]') AND type in (N'U'))
DROP TABLE [dbo].[Vendedor]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 07-02-2024 13:11:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Solicitud]') AND type in (N'U'))
DROP TABLE [dbo].[Solicitud]
GO
/****** Object:  Table [dbo].[ModeloAuto]    Script Date: 07-02-2024 13:11:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModeloAuto]') AND type in (N'U'))
DROP TABLE [dbo].[ModeloAuto]
GO
/****** Object:  Table [dbo].[MarcaAuto]    Script Date: 07-02-2024 13:11:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MarcaAuto]') AND type in (N'U'))
DROP TABLE [dbo].[MarcaAuto]
GO
/****** Object:  Table [dbo].[MarcaAuto]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaAuto](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_MarcaAuto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModeloAuto]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModeloAuto](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[MarcaID] [int] NULL,
 CONSTRAINT [PK_ModeloAuto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModeloId] [int] NULL,
	[VendedorId] [int] NULL,
	[Fecha] [datetime] NULL,
	[Precio] [float] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Rut] [nchar](10) NULL,
	[Created_at] [datetime] NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MarcaAuto] ([Id], [Nombre]) VALUES (1, N'Toyota')
INSERT [dbo].[MarcaAuto] ([Id], [Nombre]) VALUES (2, N'Ford')
INSERT [dbo].[MarcaAuto] ([Id], [Nombre]) VALUES (3, N'Honda')
INSERT [dbo].[MarcaAuto] ([Id], [Nombre]) VALUES (4, N'Chevrolet')
INSERT [dbo].[MarcaAuto] ([Id], [Nombre]) VALUES (5, N'Nissan')
GO
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (1, N'Camry', 1)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (2, N'Corolla', 1)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (3, N'Rav4', 1)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (4, N'F-150', 2)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (5, N'Mustang', 2)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (6, N'Escape', 2)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (7, N'Civic', 3)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (8, N'Accord', 3)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (9, N'CR-V', 3)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (10, N'Silverado', 4)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (11, N'Malibu', 4)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (12, N'Equinox', 4)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (13, N'Altima', 5)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (14, N'Sentra', 5)
INSERT [dbo].[ModeloAuto] ([Id], [Nombre], [MarcaID]) VALUES (15, N'Rogue', 5)
GO
SET IDENTITY_INSERT [dbo].[Solicitud] ON 

INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (401, 14, 3, CAST(N'2023-12-31T00:00:00.000' AS DateTime), 814637)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (402, 10, 2, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 802246)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (403, 1, 1, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 456434)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (404, 7, 2, CAST(N'2023-12-09T00:00:00.000' AS DateTime), 258001)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (405, 6, 3, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 59677)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (406, 4, 2, CAST(N'2023-11-10T00:00:00.000' AS DateTime), 738869)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (407, 12, 4, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 984830)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (408, 10, 1, CAST(N'2024-01-14T00:00:00.000' AS DateTime), 470490)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (409, 4, 4, CAST(N'2023-11-12T00:00:00.000' AS DateTime), 400877)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (410, 5, 4, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 475696)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (411, 5, 3, CAST(N'2024-01-14T00:00:00.000' AS DateTime), 435985)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (412, 5, 5, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 525309)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (413, 7, 2, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 952336)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (414, 12, 2, CAST(N'2024-01-15T00:00:00.000' AS DateTime), 713931)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (415, 5, 4, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 800970)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (416, 4, 2, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 490617)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (417, 4, 5, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 225936)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (418, 10, 1, CAST(N'2023-12-10T00:00:00.000' AS DateTime), 57679)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (419, 8, 2, CAST(N'2023-10-03T00:00:00.000' AS DateTime), 689343)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (420, 7, 3, CAST(N'2024-01-08T00:00:00.000' AS DateTime), 977013)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (421, 6, 4, CAST(N'2023-12-11T00:00:00.000' AS DateTime), 573190)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (422, 13, 2, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 644880)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (423, 12, 3, CAST(N'2023-11-02T00:00:00.000' AS DateTime), 793885)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (424, 3, 1, CAST(N'2024-01-18T00:00:00.000' AS DateTime), 457947)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (425, 10, 5, CAST(N'2023-10-29T00:00:00.000' AS DateTime), 471922)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (426, 14, 3, CAST(N'2024-01-24T00:00:00.000' AS DateTime), 382216)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (427, 4, 5, CAST(N'2023-10-19T00:00:00.000' AS DateTime), 948394)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (428, 6, 5, CAST(N'2023-11-14T00:00:00.000' AS DateTime), 745805)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (429, 1, 4, CAST(N'2023-11-03T00:00:00.000' AS DateTime), 356162)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (430, 9, 1, CAST(N'2023-12-28T00:00:00.000' AS DateTime), 795640)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (431, 9, 2, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 97272)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (432, 15, 4, CAST(N'2023-10-04T00:00:00.000' AS DateTime), 609061)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (433, 13, 4, CAST(N'2024-01-14T00:00:00.000' AS DateTime), 405720)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (434, 1, 2, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 819760)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (435, 13, 2, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 933666)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (436, 2, 3, CAST(N'2024-01-08T00:00:00.000' AS DateTime), 178651)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (437, 2, 1, CAST(N'2023-10-29T00:00:00.000' AS DateTime), 367081)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (438, 14, 4, CAST(N'2023-12-19T00:00:00.000' AS DateTime), 819749)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (439, 2, 3, CAST(N'2023-11-25T00:00:00.000' AS DateTime), 125033)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (440, 12, 5, CAST(N'2023-10-09T00:00:00.000' AS DateTime), 936288)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (441, 9, 3, CAST(N'2023-10-03T00:00:00.000' AS DateTime), 200796)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (442, 8, 3, CAST(N'2023-10-28T00:00:00.000' AS DateTime), 448713)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (443, 2, 5, CAST(N'2024-02-05T00:00:00.000' AS DateTime), 51322)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (444, 12, 5, CAST(N'2023-11-26T00:00:00.000' AS DateTime), 380022)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (445, 6, 4, CAST(N'2023-11-07T00:00:00.000' AS DateTime), 551841)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (446, 12, 4, CAST(N'2023-10-30T00:00:00.000' AS DateTime), 27562)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (447, 9, 3, CAST(N'2023-12-01T00:00:00.000' AS DateTime), 883164)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (448, 9, 1, CAST(N'2023-12-17T00:00:00.000' AS DateTime), 130433)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (449, 15, 2, CAST(N'2023-10-10T00:00:00.000' AS DateTime), 197067)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (450, 3, 4, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 522801)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (451, 8, 5, CAST(N'2024-01-07T00:00:00.000' AS DateTime), 752283)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (452, 10, 4, CAST(N'2023-12-24T00:00:00.000' AS DateTime), 16721)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (453, 7, 3, CAST(N'2023-12-14T00:00:00.000' AS DateTime), 808557)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (454, 13, 2, CAST(N'2023-12-21T00:00:00.000' AS DateTime), 214068)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (455, 4, 5, CAST(N'2023-10-28T00:00:00.000' AS DateTime), 782727)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (456, 5, 1, CAST(N'2023-12-18T00:00:00.000' AS DateTime), 266673)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (457, 3, 3, CAST(N'2023-10-28T00:00:00.000' AS DateTime), 455578)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (458, 3, 2, CAST(N'2023-12-10T00:00:00.000' AS DateTime), 816911)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (459, 5, 3, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 391420)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (460, 12, 5, CAST(N'2023-10-19T00:00:00.000' AS DateTime), 601826)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (461, 7, 5, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 260596)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (462, 5, 3, CAST(N'2023-12-17T00:00:00.000' AS DateTime), 790795)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (463, 2, 5, CAST(N'2023-10-04T00:00:00.000' AS DateTime), 21168)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (464, 2, 5, CAST(N'2024-01-26T00:00:00.000' AS DateTime), 327618)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (465, 5, 4, CAST(N'2023-12-13T00:00:00.000' AS DateTime), 121056)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (466, 5, 3, CAST(N'2023-11-07T00:00:00.000' AS DateTime), 924574)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (467, 4, 1, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 93453)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (468, 9, 4, CAST(N'2024-01-16T00:00:00.000' AS DateTime), 75514)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (469, 9, 4, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 701662)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (470, 1, 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), 9087)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (471, 15, 4, CAST(N'2023-11-21T00:00:00.000' AS DateTime), 349291)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (472, 3, 2, CAST(N'2023-10-29T00:00:00.000' AS DateTime), 48281)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (473, 9, 2, CAST(N'2023-10-18T00:00:00.000' AS DateTime), 476186)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (474, 15, 3, CAST(N'2023-12-25T00:00:00.000' AS DateTime), 191811)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (475, 6, 5, CAST(N'2023-11-29T00:00:00.000' AS DateTime), 681800)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (476, 10, 5, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 357344)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (477, 13, 2, CAST(N'2024-01-12T00:00:00.000' AS DateTime), 182576)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (478, 4, 2, CAST(N'2024-01-11T00:00:00.000' AS DateTime), 103292)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (479, 8, 5, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 156601)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (480, 12, 4, CAST(N'2024-01-12T00:00:00.000' AS DateTime), 4564)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (481, 6, 4, CAST(N'2023-11-06T00:00:00.000' AS DateTime), 804879)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (482, 15, 1, CAST(N'2023-12-22T00:00:00.000' AS DateTime), 876194)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (483, 8, 2, CAST(N'2023-12-13T00:00:00.000' AS DateTime), 471739)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (484, 3, 1, CAST(N'2023-11-22T00:00:00.000' AS DateTime), 288863)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (485, 12, 1, CAST(N'2023-11-19T00:00:00.000' AS DateTime), 342180)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (486, 2, 2, CAST(N'2023-11-03T00:00:00.000' AS DateTime), 487940)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (487, 12, 3, CAST(N'2023-12-22T00:00:00.000' AS DateTime), 523183)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (488, 5, 4, CAST(N'2023-10-21T00:00:00.000' AS DateTime), 886708)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (489, 13, 2, CAST(N'2023-10-31T00:00:00.000' AS DateTime), 303404)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (490, 9, 2, CAST(N'2024-01-26T00:00:00.000' AS DateTime), 596819)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (491, 8, 4, CAST(N'2023-12-06T00:00:00.000' AS DateTime), 157358)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (492, 5, 1, CAST(N'2023-10-22T00:00:00.000' AS DateTime), 808337)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (493, 8, 2, CAST(N'2023-12-26T00:00:00.000' AS DateTime), 956028)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (494, 12, 1, CAST(N'2023-10-13T00:00:00.000' AS DateTime), 642365)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (495, 7, 2, CAST(N'2023-11-22T00:00:00.000' AS DateTime), 325192)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (496, 9, 1, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 503162)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (497, 12, 4, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 97681)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (498, 2, 2, CAST(N'2023-11-05T00:00:00.000' AS DateTime), 848987)
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (499, 12, 4, CAST(N'2024-02-05T00:00:00.000' AS DateTime), 761039)
GO
INSERT [dbo].[Solicitud] ([Id], [ModeloId], [VendedorId], [Fecha], [Precio]) VALUES (500, 12, 1, CAST(N'2023-12-05T00:00:00.000' AS DateTime), 594523)
SET IDENTITY_INSERT [dbo].[Solicitud] OFF
GO
INSERT [dbo].[Vendedor] ([Id], [Nombre], [Apellido], [Rut], [Created_at]) VALUES (1, N'Juan', N'Perez', N'12345678-9', CAST(N'2024-02-07T12:45:22.850' AS DateTime))
INSERT [dbo].[Vendedor] ([Id], [Nombre], [Apellido], [Rut], [Created_at]) VALUES (2, N'Maria', N'Gonzalez', N'98765432-1', CAST(N'2024-02-07T12:45:22.850' AS DateTime))
INSERT [dbo].[Vendedor] ([Id], [Nombre], [Apellido], [Rut], [Created_at]) VALUES (3, N'Pedro', N'Rodriguez', N'56789012-3', CAST(N'2024-02-07T12:45:22.850' AS DateTime))
INSERT [dbo].[Vendedor] ([Id], [Nombre], [Apellido], [Rut], [Created_at]) VALUES (4, N'Ana', N'Lopez', N'34567890-1', CAST(N'2024-02-07T12:45:22.850' AS DateTime))
INSERT [dbo].[Vendedor] ([Id], [Nombre], [Apellido], [Rut], [Created_at]) VALUES (5, N'Carlos', N'Martinez', N'90123456-7', CAST(N'2024-02-07T12:45:22.850' AS DateTime))
GO
ALTER TABLE [dbo].[ModeloAuto]  WITH CHECK ADD  CONSTRAINT [FK_ModeloAuto_MarcaAuto] FOREIGN KEY([MarcaID])
REFERENCES [dbo].[MarcaAuto] ([Id])
GO
ALTER TABLE [dbo].[ModeloAuto] CHECK CONSTRAINT [FK_ModeloAuto_MarcaAuto]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_ModeloAuto] FOREIGN KEY([ModeloId])
REFERENCES [dbo].[ModeloAuto] ([Id])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_ModeloAuto]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Vendedor] FOREIGN KEY([VendedorId])
REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Vendedor]
GO
/****** Object:  StoredProcedure [dbo].[PROC_MARCAS_MAS_SOLICITADAS]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_MARCAS_MAS_SOLICITADAS]
AS
SELECT TOP 3 COUNT(so.Id) AS Cantidad_Solicitudes, ma.Nombre FROM Solicitud as so
JOIN ModeloAuto AS mo ON mo.Id = so.ModeloId
JOIN MarcaAuto AS ma ON ma.Id = mo.MarcaId
GROUP BY(ma.Nombre)
ORDER BY COUNT(so.Id) DESC;
GO
/****** Object:  StoredProcedure [dbo].[PROC_MESES_MAS_VENTA]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_MESES_MAS_VENTA]
AS
SELECT TOP 3 FORMAT(Fecha, 'MMMM-yyyy') AS Fecha ,FORMAT(SUM(so.precio), '$###,###,###') as Suma_Venta FROM Solicitud AS so
GROUP BY FORMAT(Fecha, 'MMMM-yyyy')
ORDER BY SUM(so.precio) DESC;
GO
/****** Object:  StoredProcedure [dbo].[PROC_MODELOS_SIN_SOLICITUDES]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_MODELOS_SIN_SOLICITUDES]
AS
SELECT mo.Nombre, ISNULL(COUNT(so.id), 0) as Cantidad_Solicitudes FROM ModeloAuto as mo
LEFT JOIN Solicitud AS so on so.ModeloId = mo.id
WHERE so.id IS NULL
GROUP BY mo.Nombre;
GO
/****** Object:  StoredProcedure [dbo].[PROC_SOLICITUDES_MES_ACTUAL]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_SOLICITUDES_MES_ACTUAL]
AS
DECLARE @CurrentMonth INT = MONTH(GETDATE());
DECLARE @CurrentYear INT = YEAR(GETDATE());
SELECT so.id, ma.Nombre AS Marca, mo.Nombre AS Modelo, ve.Nombre AS Nombre_Vendedor, so.Fecha FROM Solicitud AS so
JOIN ModeloAuto AS mo ON mo.id = so.ModeloId
JOIN MarcaAuto AS ma ON ma.id = mo.MarcaId
JOIN Vendedor AS ve ON ve.id = so.VendedorId
WHERE MONTH(fecha) = @CurrentMonth AND YEAR(fecha) = @CurrentYear;
GO
/****** Object:  StoredProcedure [dbo].[PROC_VENDEDOR_MENOS_SOLICITUDES]    Script Date: 07-02-2024 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_VENDEDOR_MENOS_SOLICITUDES]
AS
SELECT TOP 1 COUNT(so.VendedorId) as Cantidad_Solicitudes, so.VendedorId, ve.Nombre as Vendedor FROM Solicitud as so 
JOIN Vendedor as ve on ve.id = so.VendedorId
WHERE Fecha >= DATEADD(day, -30, GETDATE())
GROUP BY so.VendedorId, ve.Nombre
ORDER BY Cantidad_Solicitudes;
GO
