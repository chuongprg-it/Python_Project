    SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
  `Accept` TINYINT(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

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
(15, 'Mercedes', 'Germany');

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
(3, 'Hyundai Eon', 'https://img1.oto.com.vn/resize/750x422/2019/05/09/nuad8ol9/hyundai-eon-1-0031.jpg', '2013', '190000', '25000', 'Petrol', 1);

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
(1, '[value-2]', 'https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-1562731739_763_572_636_424.png,https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-2124955619_763_572_636_424.png,https://static.carmudi.vn/carmudi_v3/storage/68/hang-ban-vios-1-5l-e-2018-xe-1-ch-bcyo-hanh-1-nam-1882495621_763_572_636_424.png', 'Hồ Chí Minh', 'Hoạt động tốt', '08358153508', 1);

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
-- Chỉ mục cho bảng `home_registersell`
--
ALTER TABLE `home_registersell`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `home_brand`
--
ALTER TABLE `home_brand`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `home_car`
--
ALTER TABLE `home_car`
  MODIFY `idCar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `home_detailcar`
--
ALTER TABLE `home_detailcar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
