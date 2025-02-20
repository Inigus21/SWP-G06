USE [SWPver4]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NOT NULL,
	[email] [nchar](100) NULL,
	[full_name] [nchar](100) NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[phone] [int] NULL,
	[address] [nchar](100) NULL,
	[googleID] [nchar](100) NULL,
	[create_date] [date] NULL,
	[is_delete] [bit] NULL,
	[password] [nchar](100) NULL,
	[avatar] [nchar](100) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trip_id] [int] NULL,
	[account_id] [int] NULL,
	[customer_number] [int] NOT NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feature]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature](
	[featureID] [int] IDENTITY(1,1) NOT NULL,
	[feature_url] [nchar](100) NULL,
 CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](1000) NOT NULL,
	[image] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[discount_percentage] [decimal](5, 2) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[account_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](1000) NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [nchar](100) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rolefeature]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rolefeature](
	[roleID] [int] NULL,
	[featureID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_images]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[image_url] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_promotion]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_promotion](
	[tour_id] [int] NOT NULL,
	[promotion_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC,
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_schedule]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[day_number] [int] NOT NULL,
	[itinerary] [nvarchar](1000) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tours]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tours](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[img] [nvarchar](255) NULL,
	[region] [nvarchar](255) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[price_children] [decimal](10, 2) NOT NULL,
	[price_adult] [decimal](10, 2) NOT NULL,
	[suitable_for] [nvarchar](500) NULL,
	[best_time] [nvarchar](255) NULL,
	[cuisine] [nvarchar](255) NULL,
	[duration] [nvarchar](255) NULL,
	[sightseeing] [nvarchar](1000) NULL,
	[available_slot] [int] NOT NULL,
	[max_capacity] [int] NOT NULL,
	[departure_location_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[transaction_type] [nvarchar](50) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[description] [nvarchar](500) NULL,
	[transaction_date] [datetime] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip]    Script Date: 2/20/2025 6:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departure_city_id] [int] NULL,
	[destination_city_id] [int] NULL,
	[tour_id] [int] NULL,
	[departure_date] [datetime] NOT NULL,
	[return_date] [datetime] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[available_slot] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[created_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
	[is_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [roleId], [email], [full_name], [dob], [gender], [phone], [address], [googleID], [create_date], [is_delete], [password], [avatar]) VALUES (7, 1, N'john.doe@gmail.com                                                                                  ', N'John Doe                                                                                            ', CAST(N'1990-05-15' AS Date), 1, 987654321, N'New York, USA                                                                                       ', N'google123                                                                                           ', CAST(N'2024-02-20' AS Date), 0, N'123                                                                                                 ', NULL)
INSERT [dbo].[Account] ([id], [roleId], [email], [full_name], [dob], [gender], [phone], [address], [googleID], [create_date], [is_delete], [password], [avatar]) VALUES (8, 2, N'admin@gmail.com                                                                                     ', N'Jane Smith                                                                                          ', CAST(N'1995-08-22' AS Date), 0, 987654322, N'Los Angeles, USA                                                                                    ', NULL, CAST(N'2024-02-19' AS Date), 0, N'123                                                                                                 ', NULL)
INSERT [dbo].[Account] ([id], [roleId], [email], [full_name], [dob], [gender], [phone], [address], [googleID], [create_date], [is_delete], [password], [avatar]) VALUES (9, 1, N'michael.brown@gmail.com                                                                             ', N'Michael Brown                                                                                       ', CAST(N'1988-11-10' AS Date), 1, 987654323, N'Chicago, USA                                                                                        ', N'google456                                                                                           ', CAST(N'2024-02-18' AS Date), 1, N'123                                                                                                 ', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Nghỉ dưỡng')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Trải nghiệm')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Du lịch')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([id], [name]) VALUES (1, N'An Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (2, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[city] ([id], [name]) VALUES (3, N'Bắc Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (4, N'Bắc Kạn')
INSERT [dbo].[city] ([id], [name]) VALUES (5, N'Bạc Liêu')
INSERT [dbo].[city] ([id], [name]) VALUES (6, N'Bắc Ninh')
INSERT [dbo].[city] ([id], [name]) VALUES (7, N'Bến Tre')
INSERT [dbo].[city] ([id], [name]) VALUES (8, N'Bình Định')
INSERT [dbo].[city] ([id], [name]) VALUES (9, N'Bình Dương')
INSERT [dbo].[city] ([id], [name]) VALUES (10, N'Bình Phước')
INSERT [dbo].[city] ([id], [name]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[city] ([id], [name]) VALUES (12, N'Cà Mau')
INSERT [dbo].[city] ([id], [name]) VALUES (13, N'Cần Thơ')
INSERT [dbo].[city] ([id], [name]) VALUES (14, N'Cao Bằng')
INSERT [dbo].[city] ([id], [name]) VALUES (15, N'Đà Nẵng')
INSERT [dbo].[city] ([id], [name]) VALUES (16, N'Đắk Lắk')
INSERT [dbo].[city] ([id], [name]) VALUES (17, N'Đắk Nông')
INSERT [dbo].[city] ([id], [name]) VALUES (18, N'Điện Biên')
INSERT [dbo].[city] ([id], [name]) VALUES (19, N'Đồng Nai')
INSERT [dbo].[city] ([id], [name]) VALUES (20, N'Đồng Tháp')
INSERT [dbo].[city] ([id], [name]) VALUES (21, N'Gia Lai')
INSERT [dbo].[city] ([id], [name]) VALUES (22, N'Hà Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (23, N'Hà Nam')
INSERT [dbo].[city] ([id], [name]) VALUES (24, N'Hà Nội')
INSERT [dbo].[city] ([id], [name]) VALUES (25, N'Hà Tĩnh')
INSERT [dbo].[city] ([id], [name]) VALUES (26, N'Hải Dương')
INSERT [dbo].[city] ([id], [name]) VALUES (27, N'Hải Phòng')
INSERT [dbo].[city] ([id], [name]) VALUES (28, N'Hậu Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (29, N'Hòa Bình')
INSERT [dbo].[city] ([id], [name]) VALUES (30, N'Hưng Yên')
INSERT [dbo].[city] ([id], [name]) VALUES (31, N'Khánh Hòa')
INSERT [dbo].[city] ([id], [name]) VALUES (32, N'Kiên Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (33, N'Kon Tum')
INSERT [dbo].[city] ([id], [name]) VALUES (34, N'Lai Châu')
INSERT [dbo].[city] ([id], [name]) VALUES (35, N'Lâm Đồng')
INSERT [dbo].[city] ([id], [name]) VALUES (36, N'Lạng Sơn')
INSERT [dbo].[city] ([id], [name]) VALUES (37, N'Lào Cai')
INSERT [dbo].[city] ([id], [name]) VALUES (38, N'Long An')
INSERT [dbo].[city] ([id], [name]) VALUES (39, N'Nam Định')
INSERT [dbo].[city] ([id], [name]) VALUES (40, N'Nghệ An')
INSERT [dbo].[city] ([id], [name]) VALUES (41, N'Ninh Bình')
INSERT [dbo].[city] ([id], [name]) VALUES (42, N'Ninh Thuận')
INSERT [dbo].[city] ([id], [name]) VALUES (43, N'Phú Thọ')
INSERT [dbo].[city] ([id], [name]) VALUES (44, N'Phú Yên')
INSERT [dbo].[city] ([id], [name]) VALUES (45, N'Quảng Bình')
INSERT [dbo].[city] ([id], [name]) VALUES (46, N'Quảng Nam')
INSERT [dbo].[city] ([id], [name]) VALUES (47, N'Quảng Ngãi')
INSERT [dbo].[city] ([id], [name]) VALUES (48, N'Quảng Ninh')
INSERT [dbo].[city] ([id], [name]) VALUES (49, N'Quảng Trị')
INSERT [dbo].[city] ([id], [name]) VALUES (50, N'Sóc Trăng')
INSERT [dbo].[city] ([id], [name]) VALUES (51, N'Sơn La')
INSERT [dbo].[city] ([id], [name]) VALUES (52, N'Tây Ninh')
INSERT [dbo].[city] ([id], [name]) VALUES (53, N'Thái Bình')
INSERT [dbo].[city] ([id], [name]) VALUES (54, N'Thái Nguyên')
INSERT [dbo].[city] ([id], [name]) VALUES (55, N'Thanh Hóa')
INSERT [dbo].[city] ([id], [name]) VALUES (56, N'Thừa Thiên Huế')
INSERT [dbo].[city] ([id], [name]) VALUES (57, N'Tiền Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (58, N'TP. Hồ Chí Minh')
INSERT [dbo].[city] ([id], [name]) VALUES (59, N'Trà Vinh')
INSERT [dbo].[city] ([id], [name]) VALUES (60, N'Tuyên Quang')
INSERT [dbo].[city] ([id], [name]) VALUES (61, N'Vĩnh Long')
INSERT [dbo].[city] ([id], [name]) VALUES (62, N'Vĩnh Phúc')
INSERT [dbo].[city] ([id], [name]) VALUES (63, N'Yên Bái')
SET IDENTITY_INSERT [dbo].[city] OFF
GO
SET IDENTITY_INSERT [dbo].[feature] ON 

INSERT [dbo].[feature] ([featureID], [feature_url]) VALUES (1, N'/admin/homepage                                                                                     ')
SET IDENTITY_INSERT [dbo].[feature] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([roleID], [rolename]) VALUES (1, N'customer                                                                                            ')
INSERT [dbo].[role] ([roleID], [rolename]) VALUES (2, N'admin                                                                                               ')
INSERT [dbo].[role] ([roleID], [rolename]) VALUES (3, N'staff                                                                                               ')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
INSERT [dbo].[rolefeature] ([roleID], [featureID]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[tour_images] ON 

INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (3, 9, N'https://baithojunks.com/wp-content/uploads/2023/10/halongbay-2.jpg', CAST(N'2025-02-20T18:15:34.817' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (8, 10, N'https://upload.wikimedia.org/wikipedia/commons/c/cc/Ngomon2.jpg', CAST(N'2025-02-20T18:16:36.590' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (9, 11, N'https://discoveryindochina.com/wp-content/uploads/2017/01/mekong-2.png', CAST(N'2025-02-20T18:18:04.310' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (10, 12, N'https://static.vinwonders.com/production/Sapa-trekking-1.webp', CAST(N'2025-02-20T18:18:24.187' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (11, 13, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQd5eko6f3whcOaWvT8of73Ig9_Gi6htPQ7A&s', CAST(N'2025-02-20T18:18:43.903' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (12, 14, N'https://duan-sungroup.com/wp-content/uploads/2022/03/Hon-Thom-Paradise-Island-Thien-duong-la-co-that-1.jpg', CAST(N'2025-02-20T18:19:08.797' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (13, 15, N'https://cf.bstatic.com/xdata/images/hotel/max1024x768/269208554.jpg?k=8b13e46e79799683b200bd192d9fe348611b1313c0a20466f8897717c67c562e&o=&hp=1', CAST(N'2025-02-20T18:19:22.293' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (15, 16, N'https://static.vinwonders.com/production/nha-trang-islands-1.jpg', CAST(N'2025-02-20T18:19:55.703' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (16, 17, N'https://ik.imagekit.io/tvlk/blog/2021/11/dia-diem-du-lich-can-tho-cover.jpg', CAST(N'2025-02-20T18:21:43.220' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (17, 18, N'https://en.bacgiang.gov.vn/documents/2433657/22621847/1729654268238_1.jpg/19a5a624-3e36-476a-a238-a68742338e1f?t=1729654268241', CAST(N'2025-02-20T18:21:59.900' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (18, 19, N'https://vtgtravel.vn/wp-content/uploads/2024/08/quang-binh.jpg', CAST(N'2025-02-20T18:22:27.160' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (19, 20, N'https://travelmedia.com.vn/wp-content/uploads/2023/10/1-2.jpg', CAST(N'2025-02-20T18:22:45.383' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (21, 21, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBEUdDqEUyiHpfOtzulfd9q6FlYdl9WP1tgQ&s', CAST(N'2025-02-20T18:22:55.793' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (22, 22, N'https://cdn3.ivivu.com/2014/09/Khu-ngh%E1%BB%89-d%C6%B0%E1%BB%A1ng-Coffee-Tour-Buon-Me-Thuot-iVIVU.com-9.jpg', CAST(N'2025-02-20T18:23:12.750' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (23, 23, N'https://www.uncovervietnam.com/wp-content/uploads/2021/12/Hang-Duong-Cemetery.jpg', CAST(N'2025-02-20T18:23:33.107' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (24, 24, N'https://image.kkday.com/v2/image/get/w_960%2Cc_fit%2Cq_55%2Ct_webp/s1.kkday.com/product_138230/20230118011902_o8SuG/jpg', CAST(N'2025-02-20T18:23:58.780' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (25, 25, N'https://img.vigotrip.com/crop/1000x760/photo/2024/01/11/31EBEB67FD7EE509763AF5D6B64AC673.jpg', CAST(N'2025-02-20T18:24:25.900' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (26, 26, N'https://datviettour.com.vn/uploads/images/mien-tay/hinh-khach-hang/cheo-thuyen-1.jpg', CAST(N'2025-02-20T18:24:56.083' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (27, 27, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37K1R06ipG_2FVYlK8XABI3DQe5B5J-Lxtw&s', CAST(N'2025-02-20T18:25:26.833' AS DateTime), NULL, 0)
INSERT [dbo].[tour_images] ([id], [tour_id], [image_url], [created_date], [deleted_date], [is_delete]) VALUES (28, 28, N'https://image.vietnam.travel/sites/default/files/styles/top_banner/public/2022-10/shutterstock_2065827521_0.jpg?itok=7myYoH2K', CAST(N'2025-02-20T18:25:33.763' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[tour_images] OFF
GO
SET IDENTITY_INSERT [dbo].[tours] ON 

INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (9, 1, N'img1.jpg', N'Bắc', N'Hạ Long Bay Tour', CAST(500000.00 AS Decimal(10, 2)), CAST(1000000.00 AS Decimal(10, 2)), N'Gia đình', N'Mùa hè', N'Hải sản', N'3 ngày 2 đêm', N'Vịnh Hạ Long, Đảo Titop', 30, 40, 1)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (10, 1, N'img2.jpg', N'Trung', N'Huế Cố Đô', CAST(400000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)), N'Nhóm bạn', N'Mùa xuân', N'Món Huế', N'2 ngày 1 đêm', N'Kinh thành Huế, Chùa Thiên Mụ', 20, 30, 2)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (11, 3, N'img3.jpg', N'Nam', N'Mekong Delta Discovery', CAST(300000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)), N'Gia đình', N'Mùa nước nổi', N'Đặc sản miền Tây', N'1 ngày', N'Chợ nổi Cái Răng, Làng nghề truyền thống', 25, 35, 3)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (12, 2, N'img4.jpg', N'Bắc', N'Sapa Trekking', CAST(600000.00 AS Decimal(10, 2)), CAST(1200000.00 AS Decimal(10, 2)), N'Phượt thủ', N'Mùa đông', N'Đặc sản Tây Bắc', N'3 ngày 2 đêm', N'Fansipan, Bản Cát Cát', 15, 25, 4)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (13, 1, N'img5.jpg', N'Trung', N'Đà Nẵng - Hội An', CAST(450000.00 AS Decimal(10, 2)), CAST(950000.00 AS Decimal(10, 2)), N'Gia đình', N'Mùa thu', N'Mì Quảng, Cao Lầu', N'3 ngày 2 đêm', N'Bà Nà Hills, Phố cổ Hội An', 35, 45, 5)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (14, 3, N'img6.jpg', N'Nam', N'Phú Quốc Paradise', CAST(700000.00 AS Decimal(10, 2)), CAST(1500000.00 AS Decimal(10, 2)), N'Cặp đôi', N'Mùa hè', N'Hải sản Phú Quốc', N'4 ngày 3 đêm', N'Bãi Sao, VinWonders Phú Quốc', 40, 50, 6)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (15, 3, N'img7.jpg', N'Bắc', N'Mộc Châu Retreat', CAST(550000.00 AS Decimal(10, 2)), CAST(1100000.00 AS Decimal(10, 2)), N'Cặp đôi', N'Mùa hoa mận', N'Đặc sản Mộc Châu', N'2 ngày 1 đêm', N'Đồi chè, Thác Dải Yếm', 20, 30, 7)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (16, 2, N'img8.jpg', N'Trung', N'Nha Trang Getaway', CAST(500000.00 AS Decimal(10, 2)), CAST(1000000.00 AS Decimal(10, 2)), N'Gia đình', N'Mùa hè', N'Hải sản Nha Trang', N'3 ngày 2 đêm', N'Vinpearl Land, Hòn Mun', 30, 40, 8)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (17, 1, N'img9.jpg', N'Nam', N'Cần Thơ Discovery', CAST(350000.00 AS Decimal(10, 2)), CAST(850000.00 AS Decimal(10, 2)), N'Nhóm bạn', N'Mùa nước nổi', N'Đặc sản miền Tây', N'1 ngày', N'Chợ nổi Cái Răng, Cồn Sơn', 25, 35, 9)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (18, 1, N'img10.jpg', N'Bắc', N'Yên Tử Spiritual Tour', CAST(400000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)), N'Phật tử', N'Mùa xuân', N'Đặc sản Quảng Ninh', N'1 ngày', N'Chùa Yên Tử, Thiền Viện Trúc Lâm', 20, 30, 10)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (19, 3, N'img11.jpg', N'Trung', N'Quảng Bình Adventure', CAST(600000.00 AS Decimal(10, 2)), CAST(1300000.00 AS Decimal(10, 2)), N'Phiêu lưu', N'Mùa khô', N'Đặc sản Quảng Bình', N'3 ngày 2 đêm', N'Hang Sơn Đoòng, Động Phong Nha', 15, 25, 11)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (20, 1, N'img12.jpg', N'Nam', N'Tây Ninh Pilgrimage', CAST(500000.00 AS Decimal(10, 2)), CAST(1000000.00 AS Decimal(10, 2)), N'Tín đồ tôn giáo', N'Mùa lễ hội', N'Đặc sản Tây Ninh', N'1 ngày', N'Núi Bà Đen, Tòa Thánh Cao Đài', 30, 40, 12)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (21, 1, N'img13.jpg', N'Bắc', N'Hà Giang Loop', CAST(700000.00 AS Decimal(10, 2)), CAST(1500000.00 AS Decimal(10, 2)), N'Phượt thủ', N'Mùa hoa tam giác mạch', N'Đặc sản Hà Giang', N'4 ngày 3 đêm', N'Mã Pì Lèng, Dinh Vua Mèo', 20, 30, 13)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (22, 2, N'img14.jpg', N'Trung', N'Buôn Ma Thuột Coffee Tour', CAST(450000.00 AS Decimal(10, 2)), CAST(950000.00 AS Decimal(10, 2)), N'Nhóm bạn', N'Mùa thu', N'Cafe Buôn Ma Thuột', N'2 ngày 1 đêm', N'Làng Cà phê Trung Nguyên, Hồ Lắk', 25, 35, 14)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (23, 2, N'img15.jpg', N'Nam', N'Côn Đảo Remembrance', CAST(550000.00 AS Decimal(10, 2)), CAST(1100000.00 AS Decimal(10, 2)), N'Truyền thống', N'Mùa hè', N'Đặc sản Côn Đảo', N'3 ngày 2 đêm', N'Nhà tù Côn Đảo, Hòn Bảy Cạnh', 30, 40, 15)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (24, 1, N'img16.jpg', N'Bắc', N'Ninh Bình Eco Tour', CAST(500000.00 AS Decimal(10, 2)), CAST(1000000.00 AS Decimal(10, 2)), N'Gia đình', N'Mùa xuân', N'Đặc sản Ninh Bình', N'2 ngày 1 đêm', N'Bái Đính, Tràng An', 25, 35, 16)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (25, 1, N'img17.jpg', N'Trung', N'Pleiku Highlands', CAST(400000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)), N'Nhóm bạn', N'Mùa khô', N'Đặc sản Pleiku', N'2 ngày 1 đêm', N'Biển Hồ, Núi Hàm Rồng', 20, 30, 17)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (26, 3, N'img18.jpg', N'Nam', N'My Tho & Ben Tre', CAST(350000.00 AS Decimal(10, 2)), CAST(850000.00 AS Decimal(10, 2)), N'Cặp đôi', N'Mùa nước nổi', N'Đặc sản miền Tây', N'1 ngày', N'Chùa Vĩnh Tràng, Cù lao Thới Sơn', 25, 35, 18)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (27, 1, N'img19.jpg', N'Bắc', N'Cao Bằng Nature', CAST(600000.00 AS Decimal(10, 2)), CAST(1200000.00 AS Decimal(10, 2)), N'Phiêu lưu', N'Mùa thu', N'Đặc sản Cao Bằng', N'3 ngày 2 đêm', N'Thác Bản Giốc, Động Ngườm Ngao', 15, 25, 19)
INSERT [dbo].[tours] ([id], [category_id], [img], [region], [name], [price_children], [price_adult], [suitable_for], [best_time], [cuisine], [duration], [sightseeing], [available_slot], [max_capacity], [departure_location_id]) VALUES (28, 2, N'img20.jpg', N'Trung', N'Lý Sơn Island', CAST(700000.00 AS Decimal(10, 2)), CAST(1500000.00 AS Decimal(10, 2)), N'Gia đình', N'Mùa hè', N'Đặc sản Lý Sơn', N'3 ngày 2 đêm', N'Chùa Hang, Cổng Tò Vò', 30, 40, 20)
SET IDENTITY_INSERT [dbo].[tours] OFF
GO
ALTER TABLE [dbo].[booking] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[booking] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[review] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[review] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[tour_images] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tour_images] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[tour_schedule] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tour_schedule] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[transaction] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[transaction] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[trip] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[trip] ADD  DEFAULT ((0)) FOR [is_delete]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_role] FOREIGN KEY([roleId])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_role]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD FOREIGN KEY([trip_id])
REFERENCES [dbo].[trip] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_Account]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_Account]
GO
ALTER TABLE [dbo].[rolefeature]  WITH CHECK ADD  CONSTRAINT [FK_rolefeature_feature] FOREIGN KEY([featureID])
REFERENCES [dbo].[feature] ([featureID])
GO
ALTER TABLE [dbo].[rolefeature] CHECK CONSTRAINT [FK_rolefeature_feature]
GO
ALTER TABLE [dbo].[rolefeature]  WITH CHECK ADD  CONSTRAINT [FK_rolefeature_role] FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[rolefeature] CHECK CONSTRAINT [FK_rolefeature_role]
GO
ALTER TABLE [dbo].[tour_images]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tour_promotion]  WITH CHECK ADD FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotion] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tour_promotion]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tour_schedule]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD FOREIGN KEY([departure_location_id])
REFERENCES [dbo].[city] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[booking] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD FOREIGN KEY([departure_city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD FOREIGN KEY([departure_city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD FOREIGN KEY([destination_city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD FOREIGN KEY([destination_city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD CHECK  (([region]=N'Nam' OR [region]=N'Trung' OR [region]=N'Bắc'))
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD CHECK  (([region]=N'Nam' OR [region]=N'Trung' OR [region]=N'Bắc'))
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD CHECK  (([status]='Refunded' OR [status]='Failed' OR [status]='Completed' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD CHECK  (([status]='Refunded' OR [status]='Failed' OR [status]='Completed' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD CHECK  (([status]='Completed' OR [status]='Cancelled' OR [status]='Scheduled'))
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD CHECK  (([status]='Completed' OR [status]='Cancelled' OR [status]='Scheduled'))
GO
