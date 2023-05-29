-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 29, 2023 lúc 03:19 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `car`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add brand', 7, 'add_brand'),
(26, 'Can change brand', 7, 'change_brand'),
(27, 'Can delete brand', 7, 'delete_brand'),
(28, 'Can view brand', 7, 'view_brand'),
(29, 'Can add car', 8, 'add_car'),
(30, 'Can change car', 8, 'change_car'),
(31, 'Can delete car', 8, 'delete_car'),
(32, 'Can view car', 8, 'view_car'),
(33, 'Can add detail car', 9, 'add_detailcar'),
(34, 'Can change detail car', 9, 'change_detailcar'),
(35, 'Can delete detail car', 9, 'delete_detailcar'),
(36, 'Can view detail car', 9, 'view_detailcar'),
(37, 'Can add booking', 10, 'add_booking'),
(38, 'Can change booking', 10, 'change_booking'),
(39, 'Can delete booking', 10, 'delete_booking'),
(40, 'Can view booking', 10, 'view_booking');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookdrivetest_booking`
--

CREATE TABLE `bookdrivetest_booking` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Address` longtext NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `DateDrive` date NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `nameCar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'BookDriveTest', 'booking'),
(5, 'contenttypes', 'contenttype'),
(7, 'Home', 'brand'),
(8, 'Home', 'car'),
(9, 'Home', 'detailcar'),
(11, 'Home', 'registersell'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'BookDriveTest', '0001_initial', '2023-04-28 10:49:21.647394'),
(2, 'Home', '0001_initial', '2023-04-28 10:49:21.808106'),
(3, 'contenttypes', '0001_initial', '2023-04-28 10:49:21.843461'),
(4, 'auth', '0001_initial', '2023-04-28 10:49:22.274990'),
(5, 'admin', '0001_initial', '2023-04-28 10:49:22.420153'),
(6, 'admin', '0002_logentry_remove_auto_add', '2023-04-28 10:49:22.432305'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-28 10:49:22.441096'),
(8, 'contenttypes', '0002_remove_content_type_name', '2023-04-28 10:49:22.516894'),
(9, 'auth', '0002_alter_permission_name_max_length', '2023-04-28 10:49:22.583714'),
(10, 'auth', '0003_alter_user_email_max_length', '2023-04-28 10:49:22.605655'),
(11, 'auth', '0004_alter_user_username_opts', '2023-04-28 10:49:22.615629'),
(12, 'auth', '0005_alter_user_last_login_null', '2023-04-28 10:49:22.672480'),
(13, 'auth', '0006_require_contenttypes_0002', '2023-04-28 10:49:22.675470'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2023-04-28 10:49:22.688466'),
(15, 'auth', '0008_alter_user_username_max_length', '2023-04-28 10:49:22.744286'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2023-04-28 10:49:22.776199'),
(17, 'auth', '0010_alter_group_name_max_length', '2023-04-28 10:49:22.801133'),
(18, 'auth', '0011_update_proxy_permissions', '2023-04-28 10:49:22.821080'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2023-04-28 10:49:22.844077'),
(20, 'sessions', '0001_initial', '2023-04-28 10:49:22.886953');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_brand`
--

CREATE TABLE `home_brand` (
  `idBrand` int(11) NOT NULL,
  `nameBrand` varchar(50) NOT NULL,
  `nation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_brand`
--

INSERT INTO `home_brand` (`idBrand`, `nameBrand`, `nation`) VALUES
(1, 'Hyundai', 'Korea'),
(2, 'Mahindra', 'India'),
(3, 'Ford', 'America'),
(4, 'Maruti', 'India'),
(5, 'Skoda', 'India'),
(6, 'Audi', 'Germany'),
(7, 'Toyota', 'Japan'),
(8, 'Renault', 'France'),
(9, 'Honda', 'Japan'),
(10, 'Datsun', 'Japan'),
(11, 'Mitsubishi', 'Japan'),
(12, 'Volkswagen', 'Germany'),
(13, 'Chevrolet', 'America'),
(14, 'Nissan', 'Japan'),
(15, 'Mercedes', 'Germany'),
(16, 'Tata', 'India'),
(17, 'Mini', 'England'),
(18, 'BMW', 'Germany'),
(19, 'Hindustan', 'India'),
(20, 'Fiat', 'Italy'),
(21, 'Force', 'India'),
(22, 'Land', 'England'),
(23, 'Jaguar', 'England'),
(24, 'Jeep', 'America'),
(25, 'Volvo', 'Sweden');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_car`
--

CREATE TABLE `home_car` (
  `idCar` int(11) NOT NULL,
  `nameCar` varchar(50) NOT NULL,
  `image` varchar(2048) NOT NULL,
  `year` varchar(5) NOT NULL,
  `price` varchar(20) NOT NULL,
  `kmsDriven` varchar(12) NOT NULL,
  `fuelType` varchar(20) NOT NULL,
  `idBrand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_car`
--

INSERT INTO `home_car` (`idCar`, `nameCar`, `image`, `year`, `price`, `kmsDriven`, `fuelType`, `idBrand_id`) VALUES
(1, 'Hyundai Santro Xing', 'https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-2124955619_763_572_636_424.png', '2007', '80000', '45000', 'Petrol', 1),
(2, 'Hyundai Grand i10', 'https://danchoioto.vn/wp-content/uploads/2021/08/gia-xe-hyundai-i10.jpeg', '2014', '325000', '28000', 'Petrol', 1),
(3, 'Hyundai Eon', 'https://img1.oto.com.vn/resize/750x422/2019/05/09/nuad8ol9/hyundai-eon-1-0031.jpg', '2013', '190000', '25000', 'Petrol', 1),
(4, 'Mahindra Jeep CL550', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Mahindra/Mahindra-Jeep/3526/1545286956016/front-left-side-47.jpg?imwidth=420&impolicy=resize', '2006', '425000', '40', 'Diesel', 2),
(5, 'Ford EcoSport Titanium', 'https://fordthanglong.com.vn/wp-content/uploads/2020/10/ford-ecosport-titanium-10l-moi-2021-2022-moi-mau-do-tai-ford-ha-dong-12.jpeg', '2014', '575000', '36000', 'Diesel', 3),
(6, 'Ford Figo', 'https://stimg.cardekho.com/images/carexteriorimages/930x620/Ford/Figo/7594/1627023729889/front-left-side-47.jpg', '2012', '175000', '41000', 'Diesel', 3),
(7, 'Ford EcoSport Ambiente', 'https://fordthanglong.com.vn/wp-content/uploads/2020/03/ford-ecosport-ambiente-1-5-l-at-4.png', '2016', '830000', '24530', 'Diesel', 3),
(8, ' Maruti Suzuki Alto', 'https://stimg2.cardekho.com/images/carNewsimages/userimages/30640/1680505849016/MarutiAlto.jpg?tr=w-300', ' 2015', ' 250000', ' 60000', ' Petrol', 4),
(9, ' Skoda Fabia Classic', ' https://www.autoopat.cz/wp-content/uploads/cars/88836/deca9ff9-b738-4df0-8832-dc8f96950d55.jpg', ' 2010', ' 182000', ' 60000', ' Petrol', 5),
(10, ' Maruti Suzuki Stingray', ' https://imgd.aeplcdn.com/664x374/ec/E0/33/11066/img/m/Maruti-Suzuki-Stingray-Right-Front-Three-Quarter-52940_ol.jpg?v=201711021421&q=75', ' 2015', ' 315000', ' 30000', ' Petrol', 4),
(11, ' Hyundai Elite i20', ' https://hyundai-api.thanhcong.vn/storage/uploads/editors/2022/01/07/Hyundai-Elite-i20%20(1).jpg', ' 2014', ' 415000', ' 32000', ' Petrol', 1),
(12, ' Mahindra Scorpio SLE', ' https://imgd.aeplcdn.com/664x374/cw/cars/discontinued/mahindra/scorpio-2009-2014.jpg?q=75', ' 2015', ' 320000', ' 48660', 'Diesel', 2),
(13, 'Audi A8', ' https://img1.oto.com.vn/2022/07/08/OpzfnMD2/dai-dien1-84d1.jpg', '2017', '1000000', '4000', 'Petrol', 6),
(14, 'Audi Q7', 'https://danchoioto.vn/wp-content/uploads/2022/11/Audi-Q7-2022-co-ve-ngoai-sang-trong-va-trang-bi-tien-nghi-day-du-cua-mot-chiec-SUV-hang-sang.jpg.webp', '2014', '500000', '16934', 'Diesel', 6),
(15, 'Mahindra Scorpio S10', 'https://imgd.aeplcdn.com/664x374/cw/cars/mahindra/scorpio.jpg?q=75', '2016', '350000', '43000', 'Diesel', 2),
(16, 'Maruti Suzuki Alto', 'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Alto-800/7072/1675858100628/front-left-side-47.jpg', '2014', '160000', '35550', 'Petrol', 4),
(17, 'Mahindra Scorpio S10', 'https://imgd.aeplcdn.com/664x374/cw/cars/mahindra/scorpio.jpg?q=75', '2016', '310000', '39522', 'Diesel', 2),
(18, 'Maruti Suzuki Alto', 'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Alto-800/7072/1675858100628/front-left-side-47.jpg', '2015', '75000', '39000', 'Petrol', 4),
(19, 'Hyundai i20 Sportz', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Hyundai/i20/6986/1604567349336/front-left-side-47.jpg?imwidth=420&impolicy=resize', '2012', '100000', '55000', 'Petrol', 1),
(20, 'Maruti Suzuki Alto', 'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Alto-800/7072/1675858100628/front-left-side-47.jpg', '2017', '190000', '72000', 'Petrol', 4),
(21, 'Maruti Suzuki Vitara', 'https://suzuki-binhduong.vn/wp-content/uploads/2021/07/xe-Suzuki-vitara-33-800x400.jpg', '2016', '290000', '15975', 'Diesel', 4),
(22, 'Maruti Suzuki Alto', 'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Alto-800/7072/1675858100628/front-left-side-47.jpg', '2008', '95000', '70000', 'Petrol', 4),
(23, 'Mahindra Bolero DI	', 'https://imgd.aeplcdn.com/664x374/cw/ec/10472/Mahindra-Bolero-Right-Front-Three-Quarter-80015.jpg?wm=0&q=75', '2017', '180000', '23452', 'Diesel', 2),
(24, 'Maruti Suzuki Swift', 'https://i2-vnexpress.vnecdn.net/2021/09/19/031jpg-1632023058.jpg?w=750&h=450&q=100&dpr=2&fit=crop&s=8CJaJOgB6e6900f1ckE9-w', '2014', '385000', '35522', 'Diesel', 4),
(25, 'Mahindra Scorpio S10', 'https://imgd.aeplcdn.com/664x374/cw/cars/mahindra/scorpio.jpg?q=75', '2015', '250000', '48508', 'Diesel', 2),
(26, 'Maruti Suzuki Swift', 'https://i2-vnexpress.vnecdn.net/2021/09/19/031jpg-1632023058.jpg?w=750&h=450&q=100&dpr=2&fit=crop&s=8CJaJOgB6e6900f1ckE9-w', '2017', '180000', '15487', 'Petrol', 4),
(27, 'Maruti Suzuki Wagon', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/112947/wagon-r-2022-exterior-right-front-three-quarter.jpeg?isig=0&q=75', '2013', '105000', '39000', 'Petrol', 4),
(28, 'Toyota Innova 2.0', 'https://ssa-api.toyotavn.com.vn/Resources/Images/2223E021D9951F7E86B9117BE70E68FA.jpg', '2012', '650000', '82000', 'Diesel', 7),
(29, 'Renault Lodgy 85', 'https://images.garipoint.com/get_new_car_images.php?width=580&height=320&path=model_images/renault/lodgy/renault-lodgy-Pearl-White.jpg', '2018', '689999', '20000', 'Diesel', 8),
(30, 'Skoda Yeti Ambition', 'https://carsguide-res.cloudinary.com/image/upload/f_auto%2Cfl_lossy%2Cq_auto%2Ct_default/v1/editorial/Skoda-Yeti-Ambition-1.jpg', '2012', '448000', '68000', 'Diesel', 5),
(31, 'Maruti Suzuki Baleno', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Maruti/Baleno/8674/1675858584706/front-left-side-47.jpg?tr=w-456', '2017', '549000', '32000', 'Diesel', 4),
(32, 'Renault Duster 110', 'https://ic1.maxabout.us/autos/cars_india//2/2016/3/2016-new-renault-duster-p.jpg', '2012', '501000', '38000', 'Diesel', 8),
(33, 'Renault Duster 85', 'https://imgd-ct.aeplcdn.com/0x0/cw/cars/discontinued/renault/duster-2012-2015.jpg?q=75', '2013', '489999', '27000', 'Diesel', 8),
(34, 'Honda City 1.5', 'https://hondagiaiphong.net/media/k2/galleries/80/Z01.jpg', '2011', '280000', '33000', 'Petrol', 9),
(35, 'Maruti Suzuki Dzire', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Maruti/Swift-Dzire/7664/1675859508504/front-left-side-47.jpg?tr=w-456', '2013', '349999', '46000', 'Diesel', 4),
(36, 'Honda Amaze', 'https://danchoioto.vn/wp-content/uploads/2019/03/Honda-Amaze-2018-co-nhieu-thay-doi-trong-dong-co.jpg.webp', '2013', '284999', '46000', 'Diesel', 9),
(37, 'Honda Amaze 1.5', 'https://imgd.aeplcdn.com/664x374/n/cktuoua_1556035.jpg?q=75', '2015', '345000', '36000', 'Diesel', 9),
(38, 'Honda City', 'https://i2-vnexpress.vnecdn.net/2021/09/18/HondaCity1jpg-1631979297.jpg?w=750&h=450&q=100&dpr=2&fit=crop&s=Vl-ay3e9INPii3oZgee5mw', '2015', '499999', '55000', 'Petrol', 9),
(39, 'Datsun Redi GO', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Datsun/RediGO/7843/1662016027572/front-left-side-47.jpg?tr=w-456', '2017', '235000', '16000', 'Petrol', 10),
(40, 'Maruti Suzuki SX4', 'https://imgd.aeplcdn.com/664x374/ec/D5/77/9713/img/orig/Maruti-Suzuki-SX4-Left-Front-Three-Quarter-28662.jpg?v=201711021421&q=75', '2010', '249999', '36000', 'Petrol', 4),
(41, 'Mitsubishi Pajero Sport', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/315/488/products/a90fb2ec8635416b1824.jpg?v=1666020878453', '2015', '1475000', '47000', 'Diesel', 11),
(42, 'Mahindra Scorpio S10', 'https://imgd.aeplcdn.com/664x374/cw/cars/mahindra/scorpio.jpg?q=75', '2015', '395000', '35000', 'Diesel', 2),
(43, 'Maruti Suzuki Swift', 'https://i2-vnexpress.vnecdn.net/2021/09/19/031jpg-1632023058.jpg?w=750&h=450&q=100&dpr=2&fit=crop&s=8CJaJOgB6e6900f1ckE9-w', '2017', '220000', '30874', 'Petrol', 4),
(44, 'Honda City ZX', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Honda/City/9710/1677914238296/front-left-side-47.jpg?imwidth=420&impolicy=resize', '2017', '170000', '15000', 'Diesel', 9),
(45, 'Maruti Suzuki Wagon', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Maruti/Wagon-R/8835/1675922419979/front-left-side-47.jpg?tr=w-456', '2013', '85000', '29685', 'Petrol', 4),
(46, 'Tata Indigo eCS', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Tata/Tata-Indigo-CS/1204/front-left-side-47.jpg?tr=w-456', '2017', '200000', '130000', 'Diesel', 16),
(47, 'Mahindra Scorpio SLE', 'https://imgd.aeplcdn.com/664x374/cw/cars/discontinued/mahindra/scorpio-2009-2014.jpg?q=75', '2012', '570000', '19000', 'Diesel', 2),
(48, 'Volkswagen Polo Highline', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/29628/polo-exterior-right-front-three-quarter-2.jpeg?q=75', '2014', '315000', '60000', 'Petrol', 12),
(49, 'Chevrolet Spark LS', 'https://cdn.dailyxe.com.vn/image/chevrolet-spark-2017-ngoai-that-mau-super-red-1-33657j.jpg', '2010', '110000', '41000', 'Petrol', 13),
(50, 'Renault Duster 110PS', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Renault/Duster/7704/1598257607089/front-left-side-47.jpg?imwidth=420&impolicy=resize', '2012', '501000', '35000', 'Diesel', 8),
(51, 'Honda City', 'https://i2-vnexpress.vnecdn.net/2021/09/18/HondaCity1jpg-1631979297.jpg?w=750&h=450&q=100&dpr=2&fit=crop&s=Vl-ay3e9INPii3oZgee5mw', '2015', '448999', '54000', 'Petrol', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_detailcar`
--

CREATE TABLE `home_detailcar` (
  `ID` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `img` longtext NOT NULL,
  `location` varchar(30) NOT NULL,
  `advange` longtext NOT NULL,
  `phoneContact` varchar(11) NOT NULL,
  `idCar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_detailcar`
--

INSERT INTO `home_detailcar` (`ID`, `description`, `img`, `location`, `advange`, `phoneContact`, `idCar_id`) VALUES
(1, '[value-2]', 'https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-1562731739_763_572_636_424.png,https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-2124955619_763_572_636_424.png,https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-1882495621_763_572_636_424.png', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(2, '[value-2]', 'https://i2-vnexpress.vnecdn.net/2021/09/18/CopyofHyundaii10hatchback9jpg-1631933344.jpg?w=750&h=450&q=100&dpr=2&fit=crop&s=YY2Yp_NfahG3W81GrY4ZQw, https://i2-vnexpress.vnecdn.net/2021/09/18/Copy-of-Hyundai-i10-hatchback-12.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=H50QG03KktZ0z6A6WEQOYQ&t=image, https://i2-vnexpress.vnecdn.net/2021/09/18/Copy-of-Hyundai-i10-hatchback-16.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=aLV-04H-YbgYsQ5oULHzjA&t=image, https://i2-vnexpress.vnecdn.net/2021/09/18/Copy-of-Hyundai-i10-hatchback-18.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=Vnvk-SozRPy39p6LU1fM2A&t=image, https://i2-vnexpress.vnecdn.net/2021/09/18/Copy-of-Hyundai-i10-hatchback-19.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=rKSTjlkuSwtbc5q_2zw4ww&t=image, https://i2-vnexpress.vnecdn.net/2021/09/18/Copy-of-Hyundai-i10-hatchback-20.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=Qha44DIhOxiGdrUYzxTPUQ&t=image', 'Hồ Chí Minh', 'Hoạt động tốt', '0904573739', 2),
(3, '[value-2]', 'https://www.sanxehot.vn/files/hyundai-eon-chiec-xe-nho-tiet-kiem-nhien-lieu-sAGkKwhPFQ.png, https://www.sanxehot.vn/files/hyundai-eon-chiec-xe-nho-tiet-kiem-nhien-lieu-2-1kqjomjYwf.jpg, https://hyundaipasig.com/wp-content/uploads/2016/07/eon2.jpg', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 3),
(4, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(5, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(6, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(7, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(8, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(9, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(10, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(11, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(12, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(13, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(14, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(15, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(16, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(17, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(18, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(19, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(20, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(21, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(22, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(23, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(24, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(25, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(26, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(27, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(28, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(29, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(30, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(31, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(32, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(33, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(34, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(35, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(36, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(37, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(38, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(39, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(40, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(41, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(42, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(43, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(44, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(45, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(46, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(47, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(48, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(49, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(50, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(51, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(52, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(53, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(54, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(55, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(56, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(57, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(58, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(59, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(60, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(61, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(62, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(63, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(64, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(65, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(66, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(67, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(68, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(69, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(70, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(71, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(72, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(73, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(74, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(75, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(76, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(77, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(78, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(79, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(80, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(81, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(82, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(83, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(84, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(85, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(86, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(87, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(88, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(89, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(90, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(91, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(92, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(93, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(94, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(95, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(96, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(97, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(98, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(99, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(100, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(101, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(102, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(103, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(104, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(105, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(106, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(107, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(108, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(109, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(110, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(111, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(112, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(113, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(114, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(115, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(116, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(117, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(118, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(119, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(120, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(121, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(122, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(123, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(124, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(125, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(126, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(127, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(128, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(129, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(130, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(131, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(132, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(133, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(134, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(135, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(136, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(137, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(138, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(139, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(140, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(141, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(142, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(143, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(144, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(145, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(146, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(147, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(148, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(149, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(150, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(151, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(152, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(153, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(154, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(155, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(156, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(157, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(158, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(159, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(160, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(161, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(162, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(163, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(164, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(165, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(166, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(167, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(168, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(169, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(170, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(171, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(172, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(173, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(174, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(175, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(176, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(177, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(178, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(179, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(180, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(181, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(182, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(183, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(184, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(185, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(186, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(187, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(188, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(189, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(190, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(191, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(192, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(193, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(194, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(195, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(196, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(197, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(198, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(199, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(200, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1),
(201, '[value-2]', '', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_registersell`
--

CREATE TABLE `home_registersell` (
  `ID` int(11) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `nameCar` varchar(50) NOT NULL,
  `Year` varchar(10) NOT NULL,
  `kmsDriven` varchar(10) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `OwnerName` varchar(50) NOT NULL,
  `Accept` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `bookdrivetest_booking`
--
ALTER TABLE `bookdrivetest_booking`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `home_brand`
--
ALTER TABLE `home_brand`
  ADD PRIMARY KEY (`idBrand`);

--
-- Chỉ mục cho bảng `home_car`
--
ALTER TABLE `home_car`
  ADD PRIMARY KEY (`idCar`),
  ADD KEY `Home_car_idBrand_id_0ebd35af_fk_Home_brand_idBrand` (`idBrand_id`);

--
-- Chỉ mục cho bảng `home_detailcar`
--
ALTER TABLE `home_detailcar`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Home_detailcar_idCar_id_cb59332c_fk_Home_car_idCar` (`idCar_id`);

--
-- Chỉ mục cho bảng `home_registersell`
--
ALTER TABLE `home_registersell`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bookdrivetest_booking`
--
ALTER TABLE `bookdrivetest_booking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `home_brand`
--
ALTER TABLE `home_brand`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `home_car`
--
ALTER TABLE `home_car`
  MODIFY `idCar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT cho bảng `home_detailcar`
--
ALTER TABLE `home_detailcar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `home_car`
--
ALTER TABLE `home_car`
  ADD CONSTRAINT `Home_car_idBrand_id_0ebd35af_fk_Home_brand_idBrand` FOREIGN KEY (`idBrand_id`) REFERENCES `home_brand` (`idBrand`);

--
-- Các ràng buộc cho bảng `home_detailcar`
--
ALTER TABLE `home_detailcar`
  ADD CONSTRAINT `Home_detailcar_idCar_id_cb59332c_fk_Home_car_idCar` FOREIGN KEY (`idCar_id`) REFERENCES `home_car` (`idCar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
