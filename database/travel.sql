-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 29, 2020 at 02:45 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'กาญจนบุรี'),
(3, 'พังงา'),
(6, 'เชียงใหม่');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(9, 2, '::1', 0, 2),
(12, 2, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'โปรโมชั่นจองทัวร์ภายในประเทศ'),
(12, 'แพคเกจทัวร์ยอดฮิต'),
(14, 'แพคเกจทัวร์ราคาพิเศษ');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_image` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'ทัวร์กาญจนบุรี สังขละบุรี อุโบสถสำเภาแก้วร้อยล้าน โปรโมชั่นทัวร์ไทย', 4500, 5, 'เที่ยว : วัดหินแท่นลำภาชี สังขละบุรี ด่านเจดีย์สามองค์ วัดเสาร้อยต้น โบสถ์จมน้ำ สะพานมอญ วัดวังวิเวการาม เจดีย์พุทธคยา สะพานข้ามแม่น้ำแคว วัดถ้ำเสือ', '1.jpg', 'กาญจนบุรี,สังขละบุรี '),
(2, 12, 3, 'แพ็คเกจทัวร์หมู่เกาะสิมิลัน โดยเรือสปีดโบ้ท ไปเช้ากลับเย็น โปรโมชั่น', 2050, 5, 'เที่ยว : หมู่เกาะสิมิลัน เกาะเมี่ยง เกาะบางู คริสต์มาสพอยท์ โดนัลดัคเบย์ เกาะหินเรือใบ', '2.jpg', '.'),
(6, 14, 6, 'แพ็คเกจทัวร์เชียงใหม่ เที่ยววันเดียว ปางช้างแม่ตะมาน โปรโมชั่นทัวร์ไทย', 1300, 5, 'แพ็คเกจทัวร์เชียงใหม่ เที่ยววันเดียว ปางช้างแม่ตะมาน โปรโมชั่นทัวร์ไทย อิสระเลือกวันเดินทางได้เอง ปางช้างแม่ตะมานหรือปางช้างแม่แตง ชมกิจกรรมต่างๆ ของช้างแสนรู้ ชมวิถีชีวิตชาวเขา นั่งวัวเทียมเกวียน ล่องแพไม้ไผ่ ฟาร์มกล้วยไม้ชมผีเสื้อนานาพันธุ์ ', '3.jpg', ''),
(7, 12, 6, 'แพ็คเกจทัวร์เชียงใหม่ เที่ยววันเดียว ดอยอินทนนท์ โปรโมชั่นทัวร์ไทย', 1200, 5, 'แพ็คเกจทัวร์เชียงใหม่ เที่ยววันเดียว ดอยอินทนนท์ โปรโมชั่นทัวร์ไทย อิสระเลือกวันเดินทางได้เอง จุดสูงสุดแดนสยาม ชมดอกกุหลาบพันปี ข้าวตอกฤาษี นมัสการพระธาตุนภพลภูมิสิริ ตลาดม้ง อุทยานแห่งชาติดอยอินทนนท์ น้ำตกวชิรธาร', '4.jpg', ''),
(8, 12, 6, 'ทัวร์เชียงใหม่ ดอยอินทนนท์ ดอยอ่างขาง ม่อนแจ่ม ฮิโนกิแลนด์ โปร2020', 6900, 5, 'ทัวร์เชียงใหม่ 4 วัน 2 คืน เดินทางด้วยรถตู้ปรับอากาศ VIP รุ่นใหม่ มุ่งหน้าสู่ อุทยานแห่งชาติดอยอินทนนท์ พระมหาธาตุ น้ำตกวชิรธาร ไร่ชา 2000 ไร่สตอเบอรี่บ้านนอแล สถานีเกษตรดอยอ่างขาง ฮิโนกิแลนด์ ม่อนแจ่ม พระธาตุดอยสุเทพ พระธาตุดอยคำ กาดทุ่งเกวียน ', '5.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(3, 'aom', 'daaf', 'aomza@gmail.com', '25f9e794323b453885f5181f1b624d0b', '0814165121', '123456789Aom', '123456789Ao');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
