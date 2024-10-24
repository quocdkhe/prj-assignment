USE [master]
GO
/****** Object:  Database [LaptopShop]    Script Date: 10/21/2024 5:09:12 PM ******/
CREATE DATABASE [LaptopShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaptopShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LaptopShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaptopShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LaptopShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LaptopShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaptopShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaptopShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaptopShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaptopShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaptopShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaptopShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaptopShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaptopShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaptopShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaptopShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaptopShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaptopShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaptopShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaptopShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaptopShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaptopShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LaptopShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaptopShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaptopShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaptopShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaptopShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaptopShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaptopShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaptopShop] SET RECOVERY FULL 
GO
ALTER DATABASE [LaptopShop] SET  MULTI_USER 
GO
ALTER DATABASE [LaptopShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaptopShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaptopShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaptopShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaptopShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LaptopShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LaptopShop', N'ON'
GO
ALTER DATABASE [LaptopShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [LaptopShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LaptopShop]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[cart_id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[is_selected] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contact_email] [nvarchar](255) NOT NULL,
	[contact_date] [datetime] NOT NULL,
	[reply_date] [datetime] NULL,
	[contact_content] [nvarchar](max) NOT NULL,
	[reply_content] [nvarchar](max) NULL,
	[status] [nvarchar](50) NOT NULL,
	[responder_id] [bigint] NULL,
	[sender_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturer](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[manufacturer_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[delivery_address] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[recipient_name] [nvarchar](255) NULL,
	[order_date] [datetime] NULL,
	[delivery_date] [datetime] NULL,
	[received_date] [datetime] NULL,
	[recipient_phone] [nvarchar](255) NULL,
	[order_status] [nvarchar](255) NULL,
	[customer_id] [bigint] NULL,
	[shipper_id] [bigint] NULL,
	[total] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[unit_price] [bigint] NOT NULL,
	[quantity] [int] NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[cpu] [nvarchar](255) NULL,
	[price] [bigint] NOT NULL,
	[units_sold] [int] NOT NULL,
	[stock_units] [int] NOT NULL,
	[battery_capacity] [nvarchar](255) NULL,
	[operating_system] [nvarchar](255) NULL,
	[screen] [nvarchar](255) NULL,
	[ram] [nvarchar](255) NULL,
	[product_name] [nvarchar](255) NULL,
	[design] [nvarchar](255) NULL,
	[warranty_info] [nvarchar](255) NULL,
	[general_info] [nvarchar](max) NULL,
	[category_id] [bigint] NULL,
	[manufacturer_id] [bigint] NULL,
	[image] [nvarchar](255) NULL,
	[vga] [nvarchar](255) NULL,
	[hard_drive] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10/21/2024 5:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[role_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([id], [user_id]) VALUES (1, 4)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 

INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id], [is_selected]) VALUES (35, 2, 1, 4, 0)
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id], [is_selected]) VALUES (36, 1, 1, 5, 0)
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id], [is_selected]) VALUES (37, 2, 1, 11, 0)
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id], [is_selected]) VALUES (38, 1, 1, 18, 0)
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id], [is_selected]) VALUES (41, 1, 1, 59, 1)
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [category_name]) VALUES (1, N'Laptop, PC, máy đồng bộ')
INSERT [dbo].[category] ([id], [category_name]) VALUES (3, N'Camera an ninh')
INSERT [dbo].[category] ([id], [category_name]) VALUES (4, N'Linh kiện máy tính')
INSERT [dbo].[category] ([id], [category_name]) VALUES (5, N'Phụ kiện, gaming gear')
INSERT [dbo].[category] ([id], [category_name]) VALUES (6, N'Tivi')
INSERT [dbo].[category] ([id], [category_name]) VALUES (15, N'Máy in')
INSERT [dbo].[category] ([id], [category_name]) VALUES (17, N'Màn hình')
INSERT [dbo].[category] ([id], [category_name]) VALUES (18, N'Điện thoại')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([id], [contact_email], [contact_date], [reply_date], [contact_content], [reply_content], [status], [responder_id], [sender_id]) VALUES (2, N'member@gmail.com', CAST(N'2024-10-21T17:01:15.520' AS DateTime), CAST(N'2024-10-21T17:01:36.317' AS DateTime), N'asdfadsfsdafsdfsdfsdfsafsad', N'ok bạn', N'Replied', 1, 4)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[income] ON 

INSERT [dbo].[income] ([id], [date], [total]) VALUES (6, CAST(N'2024-07-05' AS Date), 5000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (7, CAST(N'2024-07-15' AS Date), 7500000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (8, CAST(N'2024-07-25' AS Date), 10000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (9, CAST(N'2024-08-01' AS Date), 12000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (10, CAST(N'2024-08-10' AS Date), 8000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (11, CAST(N'2024-08-20' AS Date), 6000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (12, CAST(N'2024-09-05' AS Date), 11000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (13, CAST(N'2024-09-15' AS Date), 9000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (14, CAST(N'2024-09-25' AS Date), 13000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (16, CAST(N'2024-10-21' AS Date), 13830000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (18, CAST(N'2024-10-21' AS Date), 3000000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (20, CAST(N'2024-10-21' AS Date), 590000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (21, CAST(N'2024-10-21' AS Date), 400000)
INSERT [dbo].[income] ([id], [date], [total]) VALUES (22, CAST(N'2024-10-21' AS Date), 471800000)
SET IDENTITY_INSERT [dbo].[income] OFF
GO
SET IDENTITY_INSERT [dbo].[manufacturer] ON 

INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (1, N'Apple')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (2, N'Dell')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (3, N'HP')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (4, N'Lenovo')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (5, N'Asus')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (6, N'Acer')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (7, N'MSI')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (8, N'Microsoft')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (10, N'Samsung')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (11, N'Ezviz')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (12, N'IMOU')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (13, N'Xiaomi')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (14, N'Logitech')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (15, N'Razer')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (16, N'Western Digital (WD)')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (17, N'Kingston')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (18, N'Dareu')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (19, N'Intel')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (20, N'AMD')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (21, N'LG')
INSERT [dbo].[manufacturer] ([id], [manufacturer_name]) VALUES (22, N'Brother')
SET IDENTITY_INSERT [dbo].[manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (1, N'19, 190 Nguyen Du, Quynh Coi Town', N'Khách từ chối nhận hàng', N'Đoàn Kiến Quốc', CAST(N'2024-10-19T16:59:51.597' AS DateTime), CAST(N'2024-10-20T16:49:02.397' AS DateTime), NULL, N'0359462146', N'Cancelled', 4, 3, 20000000)
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (3, N'Số 67, đường Phạm Hùng, Mỹ Đình, Nam Từ Liêm, HN', N'OK, đã giao hàng', N'Đoàn Kiến Quốc', CAST(N'2024-10-21T13:57:57.107' AS DateTime), CAST(N'2024-10-21T13:58:18.030' AS DateTime), CAST(N'2024-10-21T13:58:42.397' AS DateTime), N'0359462146', N'Completed', 4, 3, 13830000)
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (4, N'Số 67, đường Phạm Hùng, Mỹ Đình, Nam Từ Liêm, HN', N'ok', N'Đoàn Kiến Quốc', CAST(N'2024-10-21T14:08:47.300' AS DateTime), CAST(N'2024-10-21T14:09:10.120' AS DateTime), CAST(N'2024-10-21T14:09:26.710' AS DateTime), N'0359462146', N'Completed', 4, 2, 3000000)
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (5, N'19, 190 Nguyen Du, Quynh Coi Town', N'', N'Đoàn Kiến Quốc', CAST(N'2024-10-21T14:13:20.410' AS DateTime), CAST(N'2024-10-21T14:13:39.877' AS DateTime), CAST(N'2024-10-21T14:13:54.613' AS DateTime), N'0359462146', N'Completed', 4, 2, 590000)
INSERT [dbo].[order] ([id], [delivery_address], [note], [recipient_name], [order_date], [delivery_date], [received_date], [recipient_phone], [order_status], [customer_id], [shipper_id], [total]) VALUES (6, N'Thái Bình', N'', N'Đoàn Kiến Quốc', CAST(N'2024-10-21T14:16:50.113' AS DateTime), CAST(N'2024-10-21T14:17:01.647' AS DateTime), CAST(N'2024-10-21T14:17:14.580' AS DateTime), N'0817423074', N'Completed', 4, 2, 400000)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (1, 20000000, 1, 1, 8)
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (5, 1450000, 1, 3, 23)
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (6, 2890000, 1, 3, 25)
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (7, 9490000, 1, 3, 38)
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (8, 3000000, 1, 4, 12)
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (9, 590000, 1, 5, 30)
INSERT [dbo].[order_detail] ([id], [unit_price], [quantity], [order_id], [product_id]) VALUES (10, 400000, 1, 6, 26)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (2, N' Apple M3 Pro 11 nhân', 49190000, 1, 21, N'70 Wh', N' Mac OS', N'14.2 inches 120Hz', N'18GB', N'MacBook Pro 14 M3 Pro', N'Nhôm', N'3 năm ', N'', 1, 1, N'resources/images/group_560_10_.webp', N'14 nhân Neural Engine 16 nhân', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (3, N' Apple M3 Pro 11 nhân', 58590000, 1, 19, N'70 Wh', N' Mac OS', N'14.2 inches 120Hz', N'36 GB', N'Macbook Pro 14 M3 Pro 36GB - 512GB', N'Nhôm', N'3 năm ', N'Macbook Pro 14 inch M3 Pro 2023 36GB 512GB được trang bị con chip M3 cùng 18 nhân GPU, mang lại khả năng tác vụ mượt mà và trải nghiệm đồ họa tuyệt vời. Màn hình 14.2 inch với tấm nền Retina của MacBook Pro 2023 cung cấp chất lượng hiển thị hàng đầu, đi kèm bàn phím được trang bị Touch ID bảo mật cao. Chưa hết, hệ thống âm thanh được nâng cấp với 6 loa và công nghệ Dolby Atmos với đầy đủ các tính năng hiện đại như Wi-Fi 6E và Bluetooth 5.3. ', 1, 1, N'resources/images/group_560_9_.webp', N'14 nhân Neural Engine 16 nhân', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (4, N' AMD Ryzen 7 5700U (8 nhân/16 luồng, xung nhịp tối đa 4.30 GHz, 8MB)', 11990000, 0, 20, N'3 cell 50 Wh', N'Windows 11 Home', N'14inches, 1920 x 1200px, 60Hz', N' 16GB', N'Laptop Acer Aspire 3', N'Nhôm', N'3 năm ', N'Laptop Acer Aspire 3 A314-42P-R3B3 - Hiệu suất cao, tiết kiệm năng lượng
Laptop Acer Aspire 3 A314-42P-R3B3 là một chiếc laptop Acer Aspire đa năng với thiết kế gọn nhẹ và hiệu suất đủ mạnh đáp ứng nhu cầu sử dụng hàng ngày. Với màn hình kích thước 14 inch, máy sở hữu vi xử lý AMD Ryzen 7, RAM 16GB, và ổ cứng SSD 512GB, đảm bảo khởi động nhanh chóng và trải nghiệm làm việc mượt mà. ', 1, 6, N'resources/images/ctm.webp', N'Intel Iris Xe Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (5, N'AMD Ryzen 5 7235HS (4 lõi / 8 luồng, 3.2 / 4.2GHz, 2MB L2 / 8MB L3)', 21390000, 0, 20, N'3 cell 50 Wh', N'Windows 11 Home', N'15.6 inches 1920 x 1200px, 60Hz', N' 16GB', N'Laptop Lenovo LOQ 15ARP9', N'Nhôm', N'3 năm ', N'Sức mạnh của laptop Lenovo LOQ 15ARP9 83JC007HVN được tạo nên bởi sự kết hợp giữa bộ đôi CPU AMD Ryzen™ 5 7235HS và GPU NVIDIA GeForce RTX™ 3050 6GB. Laptop hỗ trợ chuẩn RAM DDR5 với dung lượng lên đến 12GB và có thể mở rộng lên đến 32GB. Không gian lưu trữ của laptop cũng khá rộng lớn nhờ sự hỗ trợ của ổ cứng SSD 512GB. Màn hình sử dụng công nghệ chống chói cùng tấm nền IPS và độ phủ màu 100% sRGB mang đến những khung hình chất lượng.', 1, 4, N'resources/images/text_ng_n_8__4_84.webp', N'NVIDIA GeForce RTX 3050 6GB GDDR6, Boost Clock 1732MHz, TGP 95W', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (6, N'Intel Core i7-13620H (3.6GHz~4.9GHz) 10 Nhân 16 Luồng', 40000000, 0, 17, N'11.4V 4000mAh', N'Win11', N'14', N'16GB (2 x 8GB) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'Laptop gaming Acer Nitro 16 Phoenix ', N'Nhôm', N'2 năm', N'Laptop Acer Gaming Aspire 7 A715-76-53PJ là chiếc laptop sở hữu cấu hình mạnh với bộ vi xử lý Intel Core thế hệ 12 và card đồ họa Intel UHD Graphics. Máy có màn hình 15.6 inch, độ phân giải Full HD (1920 x 1080), bộ nhớ RAM 16GB DDR4 và dung lượng lưu trữ SSD 512GB. Ngoài ra, máy còn được trang bị các cổng kết nối như HDMI, USB Type-C, USB 3.2 Gen 1 Type-A, RJ-45 và có khả năng chơi game tốt.', 1, 6, N'resources/images/ava1_203ccce160c7492d98b65c30e2316a8b_grande.webp', N'NVIDIA® GeForce RTX™ 4060 8GB GDDR6 + AMD Radeon™ 780M', N'512GB SSD M.2 2242 PCIe 4.0x4 NVMe (2 Slots: M.2 2242/M.2 2280 PCIe 4.0 x4)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (7, N'Intel Core i5-12500H 2.5 GHz (18M Cache, up to 4.5 GHz, 12 lõi: 4 P-cores và 8 E-cores)', 20290000, 1, 19, N'56WHrs, 4S1P, 4-cell Li-ion', N'Windows 11 Home', N'15.6 inches 1920 x 1200px, 60Hz', N' 16GB', N'ASUS TUF Gaming F15 FX507ZC4-HN095W', N'Nhựa', N'3 năm ', N'Laptop Asus TUF Gaming F15 FX507ZC4-HN095W có ổ cứng SSD 512GB, với dung lượng RAM 16GB, giúp mang đến tốc độ truy cập thông tin ổn định và mượt mà hơn. Máy có màu sắc hiện đại, kích thước chỉ 35.4 x 25.1 x 2.24 ~ 2.49 cm không lo cồng kềnh khi mang theo. Bên cạnh đó, card đồ họa NVIDIA® GeForce RTX™ 3050, giúp nâng cao đồ họa sắc nét khi sử dụng. Bộ xử lý Intel® Core™ i5-12500H thế hệ 12, đáp ứng nhu cầu khác nhau của người dùng.', 1, 5, N'resources/images/group_509_13__1.webp', N' NVIDIA GeForce RTX 3050 4GB GDDR6 Intel Iris Xe Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (8, N'Intel® Core™ i5-1235U( 3.3 GHz - 4.4 GHz / 12MB / 10 nhân, 12 luồng )', 20000000, 0, 20, N'11.4V 4000mAh', N'Win11', N'14" 16:9 Full HD ', N'16GB (2 x 8GB) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'Laptop gaming Acer Aspire 5 A515 58GM 53PZ', N'Nhôm', N'2 năm', N'Laptop gaming Acer Aspire 5 A515 58GM 53PZ là chiếc laptop chỉ có mức giá tầm trung ngang một chiếc laptop văn phòng nhưng bên trong lại sở hữu cấu hình mạnh mẽ đến kinh ngạc.', 1, 6, N'resources/images/ava_948d63eae6f1421291e0e993add6727e_grande.webp', N'NVIDIA® GeForce RTX™ 3050 6GB GDDR6, Boost Clock 1732MHz, TGP 95W', N'512GB SSD M.2 2242 PCIe 4.0x4 NVMe (2 Slots: M.2 2242/M.2 2280 PCIe 4.0 x4)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (9, N'Intel Core i5-13420H', 18490000, 0, 20, N' 3-Cell 52.4 Battery (Whr)', N'Windows 11 Home', N'15.6 inches 1920 x 1200px, 60Hz', N' 16GB', N'MSI Gaming Thin 15 B13UC-2081VN', N'Nhựa', N'3 năm ', N'Laptop MSI Gaming Thin 15 B13UC-2081VN được tích hợp vi xử lý Intel Core i5-13420H với dung lượng RAM 16GB cùng ổ cứng SSD PCIE có dung lượng 512GB. Laptop MSI có kích thước màn hình 15.6 inch kết hợp cùng tấm nền IPS Full HD. Ngoài ra, laptop còn trang bị viên pin 52.4Whr cùng sạc công suất lớn tiện lợi.', 1, 7, N'resources/images/text_d_i_5__2.webp', N' NVIDIA GeForce RTX 3050 4GB GDDR6 Intel Iris Xe Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (10, N' R5 7535HS', 15000000, 0, 20, N'11.4V 4000mAh', N'Win11', N'15.6', N'8GB DDR4 3200MHz (còn 1 slot, nâng cấp tối đa 16GB)', N'Laptop MSI GF63 Thin 12UCX-898US', N'Nhôm', N'2 năm', N'MSI GF63 Thin 12UCX - mẫu laptop gaming huyền thoại giá rẻ đến từ thương hiệu laptop MSI. Mẫu MSI gaming này sở hữu thiết kế cơ động, dễ dàng mang theo mọi nơi. Ngoài ra, mẫu laptop/máy tính xách tay gaming này còn sở hữu sức mạnh vượt trội để đáp ứng nhu cầu làm việc, giải trí và chơi game với chip i5 12450H + RTX 2050. Đặc biệt, SSD 1TB và khả năng nâng cấp RAM cực tốt, làm đa nhiệm cực mượt. Cùng Laptop88 tìm hiểu kỹ hơn dưới đây nhé:', 1, 7, N'resources/images/8743_untitled_1.jpg', N'NVIDIA® GeForce RTX™ 3050 6GB GDDR6, Boost Clock 1732MHz, TGP 95W', N'512GB SSD M.2 2242 PCIe 4.0x4 NVMe (2 Slots: M.2 2242/M.2 2280 PCIe 4.0 x4)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (11, N'Intel Core i5-12450H (8 lõi: (4P + 4E) ', 15990000, 0, 20, N' 3-Cell 52.4 Battery (Whr)', N'Windows 11 Home', N'14 inches 1920 x 1200px, 60Hz', N' 16GB', N'Laptop Lenovo Ideapad Slim 5', N'Nhựa', N'3 năm ', N'Laptop Lenovo Ideapad Slim 5 14IAH8 83BF002NVN – Xử lý ổn định mọi tác vụ văn phòng
Laptop Lenovo Ideapad Slim 5 14IAH8 83BF002NVN là một lựa chọn đáng cân nhắc trong phân khúc tầm trung. Với thiết kế hiện đại, mỏng nhẹ cùng bộ nhớ ấn tượng, sản phẩm laptop Lenovo Ideapad hứa hẹn sẽ khiến người dùng hài lòng.', 1, 4, N'resources/images/text_ng_n_8__1_91.webp', N'Intel UHD Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (12, NULL, 3000000, 1, 19, NULL, NULL, NULL, NULL, N'Logitech Superlight 2', NULL, N'2 năm', N'Sự phát triển lên bước tiếp theo của con chuột đã giành giải vô địch. Giới thiệu vũ khí lựa chọn mới cho những vận động viên thể thao điện tử hàng đầu thế giới.', 5, 14, N'resources/images/gallery-5-pro-x-superlight-2-gaming-mouse-white.png', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (13, N'Intel Core i3-N305', 9490000, 0, 20, N'40Wh Li-ion battery', N'Windows 11 Home', N'14 inches 1920 x 1200px, 60Hz', N'8GB', N'Laptop Acer Aspire 3 Spin', N'Nhựa', N'3 năm ', N'Laptop Acer Aspire 3 Spin 14 A3SP14-31PT-387Z với chip Intel Core i3-N305, 8GB RAM và SSD 512GB, mang lại hiệu năng ổn định cho các tác vụ, kể cả đồ hoạ. Thiết bị này còn có màn hình cảm ứng 14 inch, giúp thao tác trực quan và tiện lợi hơn. Đặc biệt hơn, phân khúc laptop Acer Aspire này cũng thể xoay 360 độ, dễ dàng biến hoá thành một chiếc tablet nhanh chóng và linh hoạt.', 1, 6, N'resources/images/text_d_i_1__3_13.webp', N'Intel UHD Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (16, N'Intel Core i5-12500H', 16290000, 0, 20, N'50WHrs, 3S1P, 3-cell Li-ion', N'Windows 11 Home', N'14 inches 2880 x 1800 pixels', N' 16GB', N'ASUS Vivobook 14 OLED A1405ZA-KM264W', N'Nhựa', N'3 năm ', N'Laptop Asus Vivobook 14 OLED A1405ZA-KM264W sở hữu màn hình OLED 2.8K rực rỡ với gam màu DCI-P3 chuẩn điện ảnh, mang lại trải nghiệm thị giác tuyệt vời. Được trang bị bộ vi xử lý Intel Core i5-12500H, VGA Intel Iris Xe đi kèm 16GB RAM và ổ SSD 512GB, chiếc laptop này dễ dàng xử lý mọi tác vụ từ văn phòng đến đồ họa. Thiết kế tiện lợi với bản lề 180°, nắp che webcam vật lý, và cảm biến vân tay trên touchpad, cùng công nghệ kháng khuẩn ASUS Antimicrobial Guard Plus, đảm bảo an toàn và thoải mái cho người dùng. ', 1, 5, N'resources/images/text_ng_n_1__5_13.webp', N'Intel Iris Xe Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (18, N'Intel Core i5-12500H', 19290000, 0, 20, N'50WHrs, 3S1P, 3-cell Li-ion', N'Windows 11 Home', N'14 inches 2880 x 1800 pixels', N' 16GB', N'ASUS Gaming VivoBook', N'Nhựa', N'3 năm ', N'Laptop Asus Gaming VivoBook K3605ZC-RP564W sở hữu con chip Intel Core i5-12500H kết hợp với chiếc card đồ họa GeForce RTX 3050 4GB với mức đồ họa cao. Bên cạnh đó, chiếc laptop còn tích hợp màn hình 16 inch với độ phân giải 1920x1200 pixels và tần số quét 144Hz. Dung lượng RAM và ổ cứng SSD laptop lần lượt là 16GB và 512GB.', 1, 5, N'resources/images/group_509_-_2024-07-31t162730.053.webp', N'NVIDIA Geforce RTX 3050 4GB GDDR6', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (19, NULL, 400000, 0, 20, NULL, NULL, NULL, NULL, N'Chuột Razer DeathAdder Essential-Ergonomic Wired', NULL, N'2 năm', N'Cảm biến quang học 6400 DPI

5 nút bấm, tuổi thọ 10 triệu lần nhấp

Tốc độ tối đa: 220 IPS

Gia tốc tối đa: 30G

Tần số quét: 1000 Hz

Chiều dài cáp: 1,8m

Kích thước: 127 x 73 x 43mm', 5, 15, N'resources/images/250-7591-chuot-razer-deathadder-essential-ergonomic-001.jpg', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (20, NULL, 2890000, 0, 20, NULL, NULL, NULL, NULL, N'Ổ cứng HDD WD Blue 4TB 3.5" SATA', NULL, N'3 năm', N'Ổ cứng HDD WD Blue 4TB 3.5” SATA (WD40EZAX) sở hữu dung lượng cực khủng nhằm mang tới một không gian lưu trữ thoải mái cho nhu cầu công việc lẫn giải trí. Mẫu ổ cứng của Western Digital còn được tối ưu về kích thước và tốc độ ghi để phù hợp với các mẫu máy tính để bàn hay máy trạm.', 4, 16, N'resources/images/o-cung-hdd-wd-blue-4tb-3-5-sata-wd40ezax_1_.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (21, NULL, 1390000, 0, 20, NULL, NULL, NULL, NULL, N'Ổ cứng HDD WD Blue 1TB', NULL, N'3 năm', N'Ổ cứng HDD WD Blue 1TB 3.5" SATA WD10EZEX có khả năng tương thích với các bộ PC All in One, HDD Box,… do đó bạn hoàn toàn có thể yên tâm trang bị cho thiết bị của bạn. Với kích thước 3.5’’ sản phẩm giúp bạn tháo lắp trên các thiết bị một cách đơn giản. Được đạt chuẩn chứng nhận RoHS, phiên bản còn mang đến cho người dùng trải nghiệm hoàn hảo với hiệu năng mạnh mẽ. ', 4, 16, N'resources/images/t_i_xu_ng_-_2023-01-28t224540.685.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (22, NULL, 1990000, 0, 20, NULL, NULL, NULL, NULL, N'Ổ cứng di động SSD Kingston XS1000', NULL, N'3 năm', N'Ổ cứng di động SSD Kingston XS1000 USB 3.2 thể hiện sự vượt trội với dung lượng khổng lồ, tốc độ đọc ghi nhanh chóng và khả năng tương thích đa dạng. Sản phẩm ổ cứng di động này giúp đáp ứng đầy đủ nhu cầu lưu trữ và truy cập dữ liệu của bạn cho dù bạn là một người làm việc chuyên nghiệp, game thủ hay người dùng thông thường.', 5, 17, N'resources/images/o-cung-di-dong-ssd-kingston-xs1000-usb-3-2-gen-2-den-1tb_4_.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (23, NULL, 1450000, 1, 19, NULL, NULL, NULL, NULL, N'SSD Kingston NV2 M.2 PCIe Gen4 NVMe 1TB', NULL, N'3 năm', N'Ổ cứng SSD Kingston NV2 M.2 PCIe GEN4 NVMe 1TB SNV2S/1000G là một giải pháp lưu trữ vượt trội thế hệ mới. Hơn thế, chiếc ổ cứng SSD còn giúp cho người dùng có thể tối ưu hóa hiệu năng, mang lại giá trị cao cho người sở hữu.

Dung lượng lưu trữ lớn, ít tiêu tốn điện năng
Nhờ được trang bị bộ điều khiển sẽ có khả năng lưu trữ vượt trội hơn. Cạnh đó, việc sở hữu dung lượng 1TB giúp cho người dùng có thể thoải mái lưu trữ.', 4, 17, N'resources/images/1tb_1.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (24, NULL, 2000000, 0, 20, NULL, NULL, NULL, NULL, N'Chuột Razer Viper Ultimate Wireless', NULL, N'2 năm', N'Razer Viper Ultimate Wireless là một trong những sản phẩm chuột không dây hàng đầu của Razer, được thiết kế đặc biệt cho các game thủ chuyên nghiệp. Với nhiều tính năng đột phá và hiệu suất tuyệt vời, chuột này không chỉ mang lại trải nghiệm chơi game mượt mà mà còn đảm bảo độ chính xác cao. Dưới đây là một cái nhìn chi tiết về những điểm nổi bật của Razer Viper Ultimate Wireless.', 5, 15, N'resources/images/chuot-razer-viper-ultimate-wireless-lapvip-3-1675933507.jpg', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (25, NULL, 2890000, 1, 19, NULL, NULL, NULL, NULL, N'CPU Intel Core i5 12400F', NULL, N'3 năm', N'Bộ vi xử lý Intel Core i5 12400F khi mới ra mắt trên thị trường đã được người dùng săn lùng thông tin khắp nơi. Từ đó sản phẩm được rất nhiều khách hàng, đặt biệt là các game thủ tin dùng, bởi thế được coi như đối thủ nặng ký của nhiều thiết bị cùng chức năng khác.
Hiệu năng mạnh mẽ
Bộ vi xử lý Intel Core i5 12400F mang thiết kế dành cho đa số người dùng chơi game, nhà sản xuất đã quan tâm đến người dùng khi cung cấp một hiệu năng nổi trội, CPU Intel Core i5-12400F với TDP là 65W và có bo mạch chủ tự động đạt 117W.', 4, 19, N'resources/images/cpu-intel-core-i5-12400f.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (26, NULL, 400000, 1, 19, NULL, NULL, NULL, NULL, N'Tai Nghe Dareu EH416 RGB (7.1, USB, LED RGB)', NULL, N'2 năm', N'Tai nghe gaming giá rẻ DareU EH416 RGB với tông màu chủ đạo là đen bóng huyền bí, cá tính cùng với hai củ tai to và dày mang lại cảm giác mạnh mẽ nhưng cũng không kém phần sang trọng. Trọng lượng của tai nghe khá nhẹ chỉ 450gr dù dáng vẻ hơi cồng kềnh, nên không thích hợp lắm khi mang ra ngoài đường.

Phần ốp tai ôm gọn vành tai được bọc da khá dày dặn. Tai nghe game thủ DareU EH416 RGB giúp hạn chế những âm thanh bên ngoài lọt vào khi đang sử dụng. Đồng thời lớp da êm ái cũng giúp người dùng thoải mái hơn khi sử dụng để nghe nhạc, xem phim, chơi game trong thời gian dài.', 5, 18, N'resources/images/53805-tai-nghe-dareu-eh416-rgb-7-1-usb-led-rgb-0001-2-jpg-v-1632136172873.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (27, NULL, 5090000, 0, 20, NULL, NULL, NULL, NULL, N'CPU Intel Core i5 13400F', NULL, N'3 năm', N'Băng thông cao, xử lý mượt mà và tiết kiệm điện năng
Bộ vi xử lý CPU Intel Core i5-13400F có băng thông tối đa đạt đến 76.8 GB/s cùng sự hỗ trợ PCI-E Gen 5 mới, giúp hệ thống có được hiệu suất xử lý mượt mà. Do đó, với CPU này, người dùng có thể dùng để dựng phim, chơi game với cấu hình cao mà không cần ép xung.', 4, 19, N'resources/images/t_i_xu_ng_-_2023-02-08t210655.677_1.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (28, NULL, 3590000, 0, 20, NULL, NULL, NULL, NULL, N'CPU AMD Ryzen 5 5600G', NULL, N'3 năm', N'CPU AMD Ryzen 5 5600G là bộ vi xử lý xuất sắc dành cho người mê game và có yêu cầu cao trong sáng tạo nội dung. Thiết kế chuyên nghiệp, tích hợp nhiều công nghệ mới cải thiện thời gian tải, thời gian xử lý dữ liệu. Hãy xem đoạn mô tả dưới đây để hiểu rõ hơn chiếc CPU AMD này có gì đáng chọn.

Xung nhịp cao, tiêu thụ ít điện năng 
CPU AMD Ryzen 5 5600G bao gồm 6 nhân 12 luồng, mang đến khả năng ép xung cao đạt đến 4.4GHz. Nhờ vậy, hiệu suất của thiết bị được nâng cao để xử lý dữ liệu hiệu quả, mượt mà và lâu dài ổn định.', 4, 20, N'resources/images/t_i_xu_ng_-_2023-01-02t221507.270_2_1.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (29, NULL, 390000, 0, 20, NULL, NULL, NULL, NULL, N'Camera IP hồng ngoại Wifi Ezviz C6N', NULL, N'3 năm', N'Camera Ezviz C6N có độ phân giải 1920 x 1080 pixels giúp tái tạo hình ảnh sắc nét, giám sát hiệu quả hơn. Với màu sắc chân thực & trực quan sinh động, camera sẽ giúp bạn quan sát mọi góc cạnh trong căn nhà, đảm bảo an tâm mọi lúc mọi nơi. Chỉ cần lắp đặt, camera Ezviz C6N sẽ hoạt động liên tục và theo dõi mọi cử chỉ, hành vi bên trong không gian nhà bạn.', 3, 11, N'resources/images/camera-ip-wifi-ezviz-c6n-1080p-2mp_1_.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (30, NULL, 590000, 1, 19, NULL, NULL, NULL, NULL, N'Camera không dây 4.0 MP IMOU IPC-A42P-D', NULL, N'3 năm', N'Camera IP wifi IMOU IPC-A42P-D 4MP chính là lựa chọn lý tưởng với hình ảnh sắc nét, góc quay rộng, tính năng phát hiện thông minh cùng nhiều ưu điểm vượt trội khác. Sản phẩm mang đến sự an tâm cho bạn với khả năng giám sát mọi ngóc ngách trong căn nhà, đặc biệt trang bị thêm chế độ bảo vệ quyền riêng tư cá nhân.', 3, 12, N'resources/images/camera-ip-wifi-imou-ipc-a42p-d-4mp.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (31, NULL, 650000, 0, 20, NULL, NULL, NULL, NULL, N'Camera không dây 4MP Ezviz H6c Pro', NULL, N'3 năm', N'Camera Ezviz H6C Pro 2K không dây 4MP cung cấp hình ảnh rõ ràng và sắc nét, giúp giám sát mọi chi tiết xung quanh một cách chi tiết. Trong điều kiện ánh sáng yếu, Ezviz H6C Pro vẫn đảm bảo khả năng quan sát với hồng ngoại ban đêm lên đến 10m. Ngoài ra, sản phẩm camera Ezviz này còn trang bị nhiều tính năng tiên tiến, bao gồm phát hiện chuyển động thông minh và theo dõi thu phóng thông minh. ', 3, 11, N'resources/images/camera-ip-khong-day-ezviz-h6c-pro-4mp.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (32, NULL, 450000, 0, 20, NULL, NULL, NULL, NULL, N'Camera Xiaomi MI Home Security C200', NULL, N'3 năm', N'Dòng camera Xiaomi 360 C200 của Xiaomi giúp bạn quan sát với chất lượng video Full HD sắc nét. Dù trong môi trường thiếu sáng, những hình ảnh trong video được camera Xiaomi C200 vẫn ghi lại vẫn đảm bảo rõ nét. Ngoài ra, camera Xiaomi Mi Home C200 này cũng ghi điểm với khả năng quan sát đạt đến 360 độ. Nhờ vào đó, bạn có thể quan sát mọi chi tiết trong không gian nhà hay văn phòng của mình.', 3, 13, N'resources/images/camera-xiaomi-mi-home-security-c200-bhr6766gl_4_.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (33, NULL, 11990000, 0, 20, NULL, NULL, NULL, NULL, N'Smart Tivi LG 4K 65 inch LED 2024', NULL, N'3 năm', N'Smart Tivi LG 65UT73 LED 4K 65 inch sở hữu màn hình LED với độ phân giải 4K (3840 x 2160) Ultra HD cho hình ảnh chân thật, rõ nét gấp 4 lần Full HD. Độ lớn màn hình 65 inch phù hợp cho mọi không gian. Tivi LG 65UT73 trang bị hệ thống loa AI Sound Pro 2.0 (20W) cho âm thanh mạnh mẽ, sôi động. Công nghệ AI Sound Pro tự động điều chỉnh âm thanh theo nội dung đang xem, tối ưu hóa trải nghiệm giải trí cho từng thể loại.', 6, 21, N'resources/images/smart_tivi_qned_lg_4k_75_inch_75qned80sra_11__1.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (34, NULL, 8890000, 0, 20, NULL, NULL, NULL, NULL, N'Smart Tivi Samsung Crystal UHD 4K 55 inch', NULL, N'3 năm', N'Samsung Crystal 4K UA55AU7700KXXV mang thiết kế tối giản đầy thanh lịch, là sự bổ sung tuyệt vời cho không gian căn phòng của bạn. Sản phẩm còn được chế tạo cho giải pháp giấu dây nối hữu ích, đảm bảo không gian đặt TV luôn tinh tế và gọn gàng. Ngoài ra chiếc TV thông minh từ Samsung còn áp dụng thiết kế không viền ở ba cạnh trên, trái và phải, giúp gia tăng thêm tầm quan sát đầy chân thực không thua gì rạp phim.', 6, 10, N'resources/images/ua55au7700kxxv.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (36, NULL, 1000000, 0, 20, NULL, NULL, NULL, NULL, N'Bàn phím cơ không dây DAREU EK861 61KEY', NULL, N'2 năm', N'Layout：61Key
Key Cap:PBT+Thermal sublimation
Switch :Kaih
Driver： Yes
Battery:1900mah
Key Conflict ：N-Key Rollover
LED Light：White Backlight', 5, 18, N'resources/images/ban-phim-co-khong-day-dareu-ek861-01-600x600.png', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (37, NULL, 6990000, 0, 20, NULL, NULL, NULL, NULL, N'Tivi Xiaomi A Pro 4K 43 inch QLED 2025', NULL, N'3 năm', N'Tivi Xiaomi QLED A Pro 43 inch 4K 2025 là mẫu vô tuyến sử dụng màn hình chấm lượng tử (quantum dot) của thương hiệu công nghệ này. Sản phẩm tivi Xiaomi 43 inch được trang bị độ phân giải 4K chuẩn UHD cùng hệ thống âm thanh cao cấp sẽ đưa người dùng tới thế giới đa phương tiện đắm chìm. Tận hưởng kho nội dung bất tận ngay tại nhà thông qua hệ điều hành Google TV hỗ trợ đa dạng các ứng dụng giải trí.', 6, 13, N'resources/images/smart_tivi_xiaomi.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (38, NULL, 9490000, 1, 20, NULL, NULL, NULL, NULL, N'Smart Tivi LG 4K 55 inch', NULL, N'3 năm', N'Tivi LG 55UQ7550 mang tới trải nghiệm đắm chìm trong từng khung hình hiển thị thông qua màn hình 55 inch cỡ lớn cùng độ phân giải hình ảnh lên tới 4K. Kết hợp với hàng loạt các điểm nhấn về vi xử lý a5 Gen5 AI 4K, chuẩn hình ảnh HDR10 Pro và âm thanh AI Sound siêu chân thực, LG 55UQ7550PSF sẽ giúp bạn có được những phút giây nghe nhạc, xem phim giải trí tuyệt vời nhất.', 6, 21, N'resources/images/smart-tivi-lg-55uq7550psf-4k-55-inch.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (39, NULL, 10990000, 0, 20, NULL, NULL, NULL, NULL, N'Smart Tivi NanoCell LG 4K 55 inch', NULL, N'3 năm', N'Tivi Nanocell LG 4K 55 inch 55NANO76SQA là một lựa chọn tuyệt vời cho việc nâng cấp trải nghiệm giải trí tại gia đình. Với chất lượng hình ảnh sắc nét, âm thanh chất lượng cao, cùng với đó là nhiều tính năng thông minh, chiếc tivi LG 55 inch sẽ mang đến một thế giới giải trí tuyệt vời ngay trong căn nhà của bạn.', 6, 21, N'resources/images/65578dfv.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (40, N'Intel Core Ultra 7-258V', 44990000, 0, 20, N'72WHrs, 2S2P, 4-cell Li-ion', N'Windows 11 Home', N'14 inches 2880 x 1800 pixels', N' 32GB', N'ASUS Zenbook S 14 OLED', N'Nhôm', N'3 năm ', N'Laptop ASUS Zenbook S 14 OLED UX5406SA PV140WS là một chiếc laptop cao cấp nổi bật với màn hình 14 inch và bộ vi xử lý Core™ Ultra 7 ấn tượng. Zenbook S14 được thiết kế gọn gàng, dễ dàng mang theo. Màn hình 14 inch OLED có độ phân giải 3K mang đến màu sắc sống động và độ tương phản cao, lý tưởng cho việc xem phim và chỉnh sửa hình ảnh. Máy còn đi kèm với RAM 32GB LPDDR5X và bộ nhớ SSD lớn, cho khả năng lưu trữ và truy cập nhanh.', 1, 5, N'resources/images/text_ng_n_24__3_5.webp', N'NVIDIA Geforce RTX 3050 4GB GDDR6', N' 1TB M.2 NVMe PCIe 4.0 SSD')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (41, N'Intel® Core™ Ultra 7 155H', 30890000, 0, 20, N'75WHrs, 2S2P, 4-cell Li-ion', N'Windows 11 Home', N'14 inches 2880 x 1800 pixels', N'32GB', N'Laptop ASUS Zenbook 14 OLED', N'Nhôm', N'3 năm ', N'Laptop Asus Zenbook 14 OLED UX3405MA PP152W có kích thước nhỏ gọn 14 inch, độ phân giải 3K cùng màn hình OLED Lumia cho chất lượng hiển thị chi tiết. Bên cạnh đó, sản phẩm laptop Asus Zenbook còn trang bị chipset Intel Core Ultra 7 125H, GPU Intel Arc Graphics cùng bộ nhớ RAM 32GB và SSD 1TB, mang đến hiệu năng ưu việt với các tác vụ đồ họa nặng cùng không gian lưu trữ rộng lớn. ', 1, 5, N'resources/images/laptop-asus-zenbook-14-oled-ux3405ma-pp152w_2.webp', N'Intel® Arc™ Graphics', N' 1TB M.2 NVMe PCIe 4.0 SSD')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (42, NULL, 2890000, 0, 20, NULL, NULL, NULL, NULL, N'Màn hình Gaming LG UltraGear 24 inch', NULL, N'3 năm', N'Màn hình LG ULTRAGEAR 24GS50F-B 24 inch với tần số làm mới cao đến 180Hz giúp giảm thiểu các tình trạng trễ khung hình nhờ đó tái tạo hình ảnh rõ nét và mượt mà. Cùng với đó màn hình 24 inch này còn được trang bị tốc độ phản hồi nhanh 1ms MBR nhờ vậy người dùng có thể quan sát được các chuyển động một cách nhanh chóng, đặc biệt trong các trò chơi.', 17, 21, N'resources/images/frame_195_26_.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (44, N'AMD Ryzen 7 7735H (8 nhân 16 luồng)', 16990000, 0, 20, N'4-cell, 62 Wh', N'Windows 11 Home', N'14 inches 2880 x 1800 pixels', N'16GB LPDDR5 6400MHz', N'ThinkBook 14 G5+ 2023', N'Nhôm', N'3 năm ', N'Thật ra những chiếc laptop Thinkbook đã không quá xa lạ với người dùng Việt Nam nữa, nhưng chắc chắn bạn chưa tham khảo tới phiên bản mới nhất của dòng laptop mỏng nhẹ này với Thinkbook 14+ 2023 với CPU hiệu năng cao và tấm màn 2.8K siêu đỉnh.', 1, 4, N'resources/images/THINKBOOK_14+_2023 (1)_1702096261_1.png', N'AMD Radeon Graphics 680M', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (45, NULL, 2990000, 0, 20, NULL, NULL, NULL, NULL, N'Máy in Laser Brother HL-L2321D', NULL, N'3 năm', N'Công suất in mạnh mẽ lên đến 12.0000 trang/tháng. Tốc độ in đến 30 trang/phút giúp tiết kiệm thời gian. Thao tác nhanh chóng với bảng điều khiển trực quan. Khay nạp giấy 250 tờ và khay đựng giấy đã in 100 tờ', 15, 22, N'resources/images/may-in-laser-brother-hl-l2321d.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (46, NULL, 2890000, 0, 20, NULL, NULL, NULL, NULL, N'Máy in HP LaserJet M211d', NULL, N'3 năm', N'Sở hữu thiết kế gọn nhẹ, tinh tế có thể đặt ngay trên bàn làm việc tiện lợi. Độ phân giải 600 x 600 dpi giúp văn bản in rõ nét, không bị mờ, mất chữ.
Tốc độ in mạnh mẽ 29 trang/phút cùng công suất in đến 20.000 trang/tháng. Khay nạp giấy 150 tờ, khay giấy ra 100 tờ đáp ứng nhu cầu in tần suất cao', 15, 3, N'resources/images/may-in-hp-laserjet-m211d-9yf82a_2_.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (47, NULL, 5690000, 0, 20, NULL, NULL, NULL, NULL, N'Máy in Laser Brother DCP-B7535DW', NULL, N'3 năm', N'Tốc độ in ấn nhanh chóng: 34 - 36 trang/phút (đen trắng). Khả năng in ấn đa dạng: A4, Letter, A5, A5 (Long Edge), A6...
In đảo mặt tự động giúp tiết kiệm giấy. Chất lượng in ấn cao: 600 x 600 dpi, HQ1200 (2400 x 600 dpi) quality, 1200 x 1200 dpi. Chức năng scan, copy tiện lợi. Hỗ trợ kết nối USB, Wifi Direct, in ấn từ thiết bị di động.', 15, 22, N'resources/images/may-in-laser-brother-dcp-b7535dw.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (48, NULL, 2690000, 0, 20, NULL, NULL, NULL, NULL, N'Máy in phun màu HP Smart Tank 210', NULL, N'3 năm', N'Thiết kế nhỏ gọn, phù hợp để ở góc bàn làm việc, tiết kiệm diện tích. Độ phân giải lên đến 1200 x 1200 dpi, cho chất lượng in sắc nét.
Hỗ trợ in nhanh chóng với 12 trang/phút (Đen trắng) - 5 trang/phút (Màu). Tương thích hệ điều hành Windows 10 trở lên, Android, iOS, macOS (10.15) Catalina trở lên.', 15, 3, N'resources/images/may-in-phun-mau-hp-smart-tank-210.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (49, NULL, 2990000, 0, 20, NULL, NULL, NULL, NULL, N'Máy in phun màu Brother DCP T220', NULL, N'3 năm', N'Máy in có khả năng in lên đến 16 trang/phút (đơn sắc) và 9 trang/phút (in màu), giúp bạn hoàn thành công việc một cách hiệu quả. Khay nạp giấy có dung tích 150 tờ, có thể điều chỉnh cho nhiều khổ giấy khác nhau. Khay chứa mực in phun có thiết kế nắp trong suốt, giúp bạn dễ dàng quan sát và nạp mực. Máy in được thiết kế với giao diện dễ sử dụng, giúp người dùng thao tác một cách thuận tiện.', 15, 22, N'resources/images/may-in-phun-mau-brother-dcp-t220-thumbnails_1.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (50, NULL, 3890000, 0, 20, NULL, NULL, NULL, NULL, N'Máy in HP Laser MFP 136A', NULL, N'3 năm', N'Thiết kế nhỏ gọn, dễ dàng đặt trên bàn làm việc hoặc kệ sách, tông màu trắng chủ đạo mang lại vẻ đẹp sang trọng cho không gian sử dụng. Công nghệ in laser cho ra những bản in sắc nét, rõ ràng với độ phân giải lên đến 1200 x 1200 dpi. Tốc độ in ấn lên đến 21 trang/phút, giúp bạn tiết kiệm thời gian và nâng cao hiệu quả công việc. Máy in cũng tương thích với nhiều hệ điều hành phổ biến như Windows, macOS và Linux.', 15, 3, N'resources/images/frame_266_3_5.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (51, NULL, 2290000, 0, 20, NULL, NULL, NULL, NULL, N'Màn hình Monitor Xiaomi 27 inch', NULL, N'3 năm', N'Gam màu sRGB 99% giúp hiển thị màu sắc rực rỡ, chân thực, hạn chế tình trạng lệch màu. Trải nghiệm giải trí và làm việc mượt mà, nhanh chóng với tốc độ làm mới lên đến 100 Hz. Thiết kế viền mỏng cùng màn hình có kích thước 27 inch mang đến không gian hiển thị rộng. Độ phân giải Full HD cùng tấm nền IPS mang đến hình ảnh đẹp mắt, trải nghiệm sống động.', 17, 21, N'resources/images/man-hinh-xiaomi-a27i-ela5345eu-27-inch.webp', NULL, NULL)
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (52, N'Intel Core i5-1340P (up to 4.6 GHz, 12MB, 12 lõi/luồng)', 27990000, 0, 20, N' 72 Wh Li-Ion', N'Windows 11 Home', N'14 inches 2880 x 1800 pixels', N'16GB LPDDR5 6000MHz', N'Laptop LG Gram 2023', N'Nhôm', N'3 năm ', N'Laptop LG Gram 2023 14Z90RS-G.AH54A5 là một dòng máy tính xách tay nhẹ và mạnh mẽ được phát hành vào năm 2023. Thông qua nhiều đặc điểm nổi bật, phiên bản laptop LG Gram 2023 này hứa hẹn sẽ mang đến những giây phút làm việc và giải trí tuyệt vời dành cho bạn.', 1, 21, N'resources/images/14z90rs-ah54a5.webp', N'Intel Iris Xe Graphics', N' 512 GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (53, N'Intel Core i5-1340P (up to 4.6 GHz, 12MB, 12 lõi/luồng)', 22990000, 0, 20, N' 72 Wh Li-Ion', N'Windows 11 Home', N'14inches, 1920 x 1200px, 60Hz', N'16GB LPDDR5 6000MHz', N'Laptop LG Gram 2023', N'Nhôm', N'3 năm ', N'Laptop LG Gram 2023 14Z90R-G.AH53A5 được tích hợp bộ RAM có dung lượng 16GB, thỏa sức đa nhiệm xử lý dữ liệu nhanh chóng cùng lúc. Ổ cứng lưu trữ SSD có không gian 256GB, đảm bảo đủ rộng để giữ lại các ứng dụng và dữ liệu cá nhân theo ý muốn.', 1, 21, N'resources/images/14z90r.webp', N'Intel Iris Xe Graphics', N' 256GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (54, N'Intel Core Ultra 5 - 125H', 35790000, 0, 20, N' 72 Wh Li-Ion', N'Windows 11 Home', N'14inches, 1920 x 1200px, 60Hz', N'16GB', N'Laptop LG Gram 2024', N'Nhôm', N'3 năm ', N'Laptop LG Gram 2024 14Z90S-G.AH55A5 ấn tượng bởi hiệu quả xử lý ưu trội qua bộ chip Intel Core Ultra 5, kết hợp RAM chuẩn LPDRR5X 16GB cùng ổ cứng 512GB. Chiếc laptop LG này được trang bị màn hình IPS 14 inch phân giải cao với tốc độ làm mới 60Hz. Bên cạnh đó, mẫu laptop LG Gram 2024 này còn sở hữu thêm viên pin dung lượng đủ để chạy tác vụ trong nhiều giờ cùng đa dạng cổng giao tiếp phổ biến.', 1, 21, N'resources/images/text_d_i_4_17.webp', N'Intel Iris Xe Graphics', N' 256GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (55, N'Intel Core i5-1235U', 16490000, 0, 20, N'  3 Cell Int (41Wh)', N'Windows 11 Home', N'15.6 inches 1920 x 1200px, 120Hz', N'16GB', N'Laptop Dell Inspiron 15 3520', N'Nhôm', N'3 năm ', N'Laptop Dell Inspiron 15 3520 có kích thước 35.85 x 23.49 x 1.75 cm với trọng lượng 1.7kg cùng màu bạc trang nhã. Laptop được trang bị RAM 16GB và SSD 512GB nâng cấp lưu trữ. CPU Intel Core i5-1235U tích hợp card đồ họa Intel Iris Xe cho nguồn sức mạnh vượt trội xử lý đa tác vụ nhanh chóng, chơi game đồ họa trung bình cao. Màn hình 15.6 inch FHD và tần số 120Hz mang đến những khung hình ấn tượng, sống động.', 1, 2, N'resources/images/text_d_i_2__2_4.webp', N'Intel Iris Xe Graphics', N'512GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (57, N'AMD Ryzen 7 7730U', 12990000, 0, 20, N'39.3Wh', N'Windows 11 Home', N'15.6 inches 1920 x 1200px, 60Hz', N' 16GB', N'Laptop MSI Modern 15 B7M-238VN', N'Nhôm', N'3 năm ', N'Laptop MSI Modern 15 B7M-238VN được đánh giá cao bởi sự mạnh mẽ, ổn định nhằm đáp ứng nhu cầu công việc và giải trí. Với cấu hình ấn tượng và thiết kế hiện đại, chiếc laptop MSI Modern này sẽ khiến bạn hài lòng khi sử dụng trong thời gian dài.', 1, 7, N'resources/images/text_ng_n_-_2023-06-19t173614.213.webp', N'Intel Iris Xe Graphics', N'512GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (58, N'Intel Core i5-1235U (10 lõi / 12 luồng, 1.30 GHz to 4.40 GHz, 12 MB)', 9490000, 0, 20, N'39.3Wh', N'Windows 11 Home', N'15.6 inches 1920 x 1200px, 60Hz', N'8GB', N'Laptop Acer Aspire 3', N'Nhôm', N'3 năm ', N'abcxyz', 1, 6, N'resources/images/text_d_i_1__3_13 (1).webp', N'Intel Iris Xe Graphics', N'256GB (M.2 NVMe)')
INSERT [dbo].[product] ([id], [cpu], [price], [units_sold], [stock_units], [battery_capacity], [operating_system], [screen], [ram], [product_name], [design], [warranty_info], [general_info], [category_id], [manufacturer_id], [image], [vga], [hard_drive]) VALUES (59, NULL, 24990000, 0, 20, NULL, NULL, NULL, NULL, N'iPhone 16 Pro Max', NULL, N'3 năm', N'ok', 18, 1, N'resources/images/iphone-16-pro_1.webp', NULL, NULL)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Customer')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'Shipper')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (1, N'Hà Nam', N'admin@gmail.com', N'Vũ Vaăn Admin', N'0000', N'0123456789879879', 1)
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (2, N'Hà Nội', N'shipper@gmail.com', N'Nguyen Thi Shipper', N'123456', N'123456', 3)
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (3, N'Hà Nội', N'VNPost@gmail.com', N'Bưu điện Việt Nam', N'123456', N'1234567890', 3)
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (4, N'19, 190 Nguyen Du, Quynh Coi Town', N'member@gmail.com', N'Nguyễn Thị Member', N'123456', N'123456789', 2)
INSERT [dbo].[user] ([id], [address], [email], [full_name], [password], [phone_number], [role_id]) VALUES (5, N'hà nội', N'dung@gmail.com', N'dũng', N'123456', N'123456789', 1)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Responder] FOREIGN KEY([responder_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Responder]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Sender] FOREIGN KEY([sender_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Sender]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([shipper_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [LaptopShop] SET  READ_WRITE 
GO
