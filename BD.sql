
USE [TpFinal]
GO
/****** Object:  Table [dbo].[objeto]    Script Date: 23/11/2023 14:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objeto](
	[id_objeto] [int] IDENTITY(1,1) NOT NULL ,
	[stock] [int] NOT NULL,
	[tipo_objeto] [varchar](255) NOT NULL,
	[lugar] [varchar](255) NOT NULL,
	[Nombre_Obj] [nchar](10) NOT NULL,
	[img_obj] [nchar](10) NOT NULL,
 CONSTRAINT [PK__objeto__3213E83F702B8F5C] PRIMARY KEY CLUSTERED 
(
	[id_objeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 23/11/2023 14:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_provedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_prov] [varchar](255) NOT NULL,
	[apellido_prov] [varchar](255) NOT NULL,
	[id_objeto] [int] NOT NULL,
	[email_prov] [nchar](255) NOT NULL,
 CONSTRAINT [PK__proveedo__3213E83F431C9D10] PRIMARY KEY CLUSTERED 
(
	[id_provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 23/11/2023 14:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_US] [varchar](255) NOT NULL,
	[apellido_US] [varchar](255) NOT NULL,
	[email_US] [varchar](255) NOT NULL,
	[nombre_empresa] [varchar](255) NOT NULL,
	[contraseña] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 23/11/2023 14:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_objeto] [int] NOT NULL,
 CONSTRAINT [PK__venta__3213E83F334A645D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[objeto] ( [stock], [tipo_objeto], [lugar], [Nombre_Obj], [img_obj]) VALUES ( 10, N'Electrónico', N'AlmacenA', N'Objeto1   ', N'img1      ')
INSERT [dbo].[objeto] ( [stock], [tipo_objeto], [lugar], [Nombre_Obj], [img_obj]) VALUES ( 5, N'Mueble', N'AlmacenB', N'Objeto2   ', N'img2      ')
INSERT [dbo].[objeto] ( [stock], [tipo_objeto], [lugar], [Nombre_Obj], [img_obj]) VALUES ( 15, N'Ropa', N'AlmacenC', N'Objeto3   ', N'img3      ')
GO
INSERT [dbo].[proveedor] ( [nombre_prov], [apellido_prov], [id_objeto], [email_prov]) VALUES (N'Proveedor1', N'Apellido1', 1,N'proveedor1@gmail.com                                                                                                                                                                                                                                           ')
INSERT [dbo].[proveedor] ( [nombre_prov], [apellido_prov], [id_objeto], [email_prov]) VALUES ( N'Proveedor2', N'Apellido2', 2,N'proveedor2@gmail.com                                                                                                                                                                                                                                           ')
INSERT [dbo].[proveedor] ( [nombre_prov], [apellido_prov], [id_objeto], [email_prov]) VALUES ( N'Proveedor3', N'Apellido3', 3,N'proveedor3@gmail.com                                                                                                                                                                                                                                           ')
GO
INSERT [dbo].[usuario] ( [nombre_US], [apellido_US], [email_US], [nombre_empresa] ,[contraseña]) VALUES ( N'Usuario1', N'Apellido1', N'usuario1@example.com', N'Empresa1',  N'contraseña1')
INSERT [dbo].[usuario] ( [nombre_US], [apellido_US], [email_US], [nombre_empresa] , [contraseña]) VALUES ( N'Usuario2', N'Apellido2', N'usuario2@example.com', N'Empresa2',  N'contraseña2')
INSERT [dbo].[usuario] ( [nombre_US], [apellido_US], [email_US], [nombre_empresa], [contraseña]) VALUES ( N'Usuario3', N'Apellido3', N'usuario3@example.com', N'Empresa3', N'contraseña3')
GO
INSERT [dbo].[venta] ( [id_usuario], [id_proveedor], [cantidad],  [id_objeto]) VALUES (1, 1, 1, 3, 1)
INSERT [dbo].[venta] ( [id_usuario], [id_proveedor], [cantidad], [id_objeto]) VALUES (2, 2, 2, 2,  2)
INSERT [dbo].[venta] ([id_usuario], [id_proveedor], [cantidad],  [id_objeto]) VALUES (3, 3, 3, 1, 3)
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
