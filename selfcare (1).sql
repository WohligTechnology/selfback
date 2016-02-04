-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 04, 2016 at 07:31 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selfcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesslevel`
--

CREATE TABLE `accesslevel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accesslevel`
--

INSERT INTO `accesslevel` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'Operator'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `asksuman`
--

CREATE TABLE `asksuman` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `firstname`, `lastname`, `name`, `email`, `telephone`, `comment`, `timestamp`) VALUES
(1, '', '', '', 'rohanwohlig@gmail.com', '', '', '2016-01-23 10:13:56'),
(2, 'Rohan', 'Gada', '', 'gadarohan17@gmail.com', '97654310', 'qwertyuiosdfghjk', '2016-01-25 06:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_cart`
--

CREATE TABLE `fynx_cart` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(255) NOT NULL,
  `json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_cart`
--

INSERT INTO `fynx_cart` (`id`, `user`, `quantity`, `product`, `timestamp`, `design`, `json`) VALUES
(3, 11, 1, '1', '2016-02-01 10:01:19', '', ''),
(5, 11, 10, '7', '2016-01-27 05:56:03', '', ''),
(6, 11, 10, '2', '2016-01-27 11:17:34', '', ''),
(7, 11, 1, '11', '2016-01-27 11:24:35', '', ''),
(8, 11, 15, '9', '2016-01-27 11:30:08', '', ''),
(9, 7, 4, '3', '2016-01-30 05:28:27', '', ''),
(34, 1, 5, '1', '2016-02-02 06:42:59', '', ''),
(35, 1, 2, '7', '2016-02-02 06:43:20', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_category`
--

CREATE TABLE `fynx_category` (
  `id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `parent` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_category`
--

INSERT INTO `fynx_category` (`id`, `order`, `name`, `description`, `parent`, `status`, `image1`, `image2`) VALUES
(1, 1, 'FOOD MUNCHIES & BEVERAGES', 'asdd                    ', '', '2', '121.png', 'apple.jpg'),
(2, 2, 'VITAMINS & MINERALS', '', '', '2', '2.jpg', 'apple1.jpg'),
(3, 3, 'PROTEIN SUPPLEMENT', '', '', '2', '3.jpg', 'apple2.jpg'),
(4, 4, 'BOOKS & GADGETS', '', '', '2', '4.jpg', 'apple3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_color`
--

CREATE TABLE `fynx_color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_color`
--

INSERT INTO `fynx_color` (`id`, `name`, `status`, `timestamp`) VALUES
(1, 'Black', '2', '2015-12-11 06:44:44'),
(2, 'Blue', '2', '2015-12-11 06:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_config`
--

CREATE TABLE `fynx_config` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_config`
--

INSERT INTO `fynx_config` (`id`, `text`, `content`) VALUES
(1, 'Enter Text For Config', 'Enter Content For Config');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_credit`
--

CREATE TABLE `fynx_credit` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `addcredit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_designer`
--

CREATE TABLE `fynx_designer` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `noofdesigns` int(11) NOT NULL,
  `designerid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `commission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_designer`
--

INSERT INTO `fynx_designer` (`id`, `email`, `noofdesigns`, `designerid`, `name`, `contact`, `commission`) VALUES
(1, 'pooja1@wohlig.com', 2, 'AS123', 'Aditya', '57876', '40'),
(2, 'jagruti@wohlig.com', 2, 'J12', 'Jagruti Patil', '79798', '10');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_designs`
--

CREATE TABLE `fynx_designs` (
  `id` int(11) NOT NULL,
  `designer` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_designs`
--

INSERT INTO `fynx_designs` (`id`, `designer`, `image`, `status`, `timestamp`, `name`) VALUES
(1, 2, '3Q9Q53316.JPG', '2', '2016-01-15 05:00:29', ''),
(2, 1, '61fWioKx9aL._SX522__1.jpg', '1', '2016-01-15 05:00:33', 'Batman'),
(3, 1, 'b12.jpg', '1', '2016-01-15 05:00:35', 'Spider Man');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_homeslide`
--

CREATE TABLE `fynx_homeslide` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sorder` int(11) NOT NULL,
  `target` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `centeralign` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_homeslide`
--

INSERT INTO `fynx_homeslide` (`id`, `name`, `description`, `link`, `sorder`, `target`, `status`, `image`, `template`, `class`, `text`, `centeralign`) VALUES
(2, 'slide2', '                                                                                            image                                                ', '', 1, '0', '2', 'gopro_11.jpg', '0', '0', '0', '0'),
(3, 'slide2', '                                                            ada                                                            ', 'asd', 2, '0', '2', 'hairsuit2.jpg', '0', '0', '0', '0'),
(4, 'slide3', '                                                        dd                        ', '', 3, '0', '2', 'flitsch_iceresurfacingaddibot9.jpg', '0', '0', '0', '0'),
(5, 'slide4', '                    ', '', 4, '0', '2', 'img_27324.jpg', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_newsletter`
--

CREATE TABLE `fynx_newsletter` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_newsletter`
--

INSERT INTO `fynx_newsletter` (`id`, `user`, `email`, `status`) VALUES
(1, '1', 'poojathakare55@gmail.com', '2');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_offer`
--

CREATE TABLE `fynx_offer` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_offerproduct`
--

CREATE TABLE `fynx_offerproduct` (
  `id` int(11) NOT NULL,
  `offer` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_order`
--

CREATE TABLE `fynx_order` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `billingaddress` varchar(255) NOT NULL,
  `billingcontact` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingaddress` varchar(255) NOT NULL,
  `shippingname` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingcontact` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `trackingcode` varchar(255) NOT NULL,
  `defaultcurrency` varchar(255) NOT NULL,
  `shippingmethod` varchar(255) NOT NULL,
  `orderstatus` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `billingline1` varchar(255) NOT NULL,
  `billingline2` varchar(255) NOT NULL,
  `billingline3` varchar(255) NOT NULL,
  `shippingline1` varchar(255) NOT NULL,
  `shippingline2` varchar(255) NOT NULL,
  `shippingline3` varchar(255) NOT NULL,
  `transactionid` varchar(255) NOT NULL,
  `paymentmode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_order`
--

INSERT INTO `fynx_order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`) VALUES
(1, 1, 'Sachin', 'Patil', 'poojathakare55@gmail.com', 'huh', 'yugh', 'u', 'h', 'hu', 'yh', 'y', 'h', 'uh', 'u', 'yu', 'u', 'h', 'yu', 'u', 'u', '2', '2015-12-24 11:52:58', '', '', '', '', '', '', '1234', NULL),
(2, 1, 'Ramesh', 'Pal', 'wohlig@wohlig.com', 'arioli', '987987', 'navimumbai', 'maharashtra', '400708', 'india', 'navimumbai', 'arioli', 'puja', 'india', '987987', 'maharashtra', '400709', '789', '987', 'road', '1', '2015-12-02 14:20:06', '', '', '', '', '', '', '', NULL),
(20, 1, 'puja', 'thakare', 'puja@wohlig.com', '', '9870969411', 'bcity', 'bstate', 'bpincode', 'bcountry', 'scity', '', '', 'scountry', '9870969411', 'sstate', 'spincode', '', '', '', '5', '2016-01-14 07:54:07', 'b1', 'b2', 'b3', 's1', 's2', 's3', '567', NULL),
(21, 6, 'puja', 'thakare', 'puja@wohlig.com', '', '9870969411', 'bcity', 'bstate', 'bpincode', 'bcountry', 'scity', '', '', 'scountry', '9870969411', 'sstate', 'spincode', '', '', '', '1', '2015-12-24 09:33:31', 'b1', 'b2', 'b3', 's1', 's2', 's3', '', ''),
(43, 11, 'Rohan', '', '', '', '', '', '', '', '', 'asd', 'demo add', '', '', 'phone', 'maharashtra', '1212', '', '', '', '', '2016-01-26 06:51:39', '', '', '', '', '', '', '', NULL),
(45, 11, '', '', 'emailid@email.com', '', '', '', '', '', '', 'asd', 'demo add', '', '', 'phone', 'maharashtra', '1212', '', '', '', '1', '2016-01-26 07:21:30', '', '', '', '', '', '', '', NULL),
(47, 11, '', '', 'emaailid@email.com', '', '', '', '', '', '', 'aaasd', 'daaaemo add', '', '', 'phaone', 'mahaarashtra', '1aaa212', '', '', '', '1', '2016-01-26 10:16:37', '', '', '', '', '', '', '', NULL),
(48, 11, '', '', 'emaailid@email.com', '', '', '', '', '', '', 'aaasd', 'daaaemo add', '', '', 'phaone', 'mahaarashtra', '1aaa212', '', '', '', '1', '2016-01-27 05:57:24', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_orderitem`
--

CREATE TABLE `fynx_orderitem` (
  `id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `finalprice` int(11) NOT NULL,
  `design` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_orderitem`
--

INSERT INTO `fynx_orderitem` (`id`, `discount`, `order`, `product`, `quantity`, `price`, `finalprice`, `design`) VALUES
(25, 0, 20, 1, 1, 800, 800, 6),
(26, 0, 20, 1, 1, 800, 800, 6);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_product`
--

CREATE TABLE `fynx_product` (
  `id` int(11) NOT NULL,
  `subcategory` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  `nutritionalvalue` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `relatedproduct` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `sizechart` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  `baseproduct` varchar(255) DEFAULT NULL,
  `discountprice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_product`
--

INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `weight`, `name`, `type`, `about`, `nutritionalvalue`, `visibility`, `price`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountprice`) VALUES
(1, 0, '10', '', 'Limbu chana', '0', '                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea c', '                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea c', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '121.png', NULL, NULL, NULL, NULL, '', ''),
(2, 0, '10', '', 'Pudina chana', '0', '                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du', '                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '19.png', NULL, NULL, NULL, NULL, '', ''),
(3, 0, '10', '', 'Tangy chana', '0', '                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du', '                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '23.png', NULL, NULL, NULL, NULL, '', ''),
(4, 0, '10', '', 'Moong dal khakhra', '0', '                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du', '                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du', '1', '325', '', '1', NULL, NULL, NULL, '2', '', '15.png', NULL, NULL, NULL, NULL, '', ''),
(5, 0, '10', '', 'Mix - dal khakhra', '0', '                    sadsd                ', '                                                                        ', '1', '325', '', '1', NULL, NULL, NULL, '2', '', '14.png', NULL, NULL, NULL, NULL, '', ''),
(6, 0, '10', '', 'Chana Jor', '0', '                    dfdf                ', '                                                                ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '4.png', NULL, NULL, NULL, NULL, '', ''),
(7, 0, '10', '', 'Jowar munch', '0', '                    sdfdsfs                ', '                                                                        ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '11.png', NULL, NULL, NULL, NULL, '', ''),
(8, 0, 'asd', '', 'test', '0', 'asd', '                                    asd', '1', '', '', '1', NULL, NULL, NULL, '2', '', 'braillestill26.jpg', '', '', '', '', '', 'sad'),
(9, 0, '', '', 'Dasd', '0', '', '                                    ', '', '', '', '', NULL, NULL, NULL, '1', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_productimage`
--

CREATE TABLE `fynx_productimage` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_size`
--

CREATE TABLE `fynx_size` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_size`
--

INSERT INTO `fynx_size` (`id`, `status`, `name`) VALUES
(1, 1, 'xxl'),
(2, 1, 'xl');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_sizechart`
--

CREATE TABLE `fynx_sizechart` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_sizechart`
--

INSERT INTO `fynx_sizechart` (`id`, `name`, `image`) VALUES
(1, 'For Shirt', ''),
(2, 'For Graphics', ''),
(3, 'For Hoodies', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_subcategory`
--

CREATE TABLE `fynx_subcategory` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_subcategory`
--

INSERT INTO `fynx_subcategory` (`id`, `category`, `name`, `order`, `status`, `image1`, `image2`) VALUES
(1, 1, 'Protein Snacks', '1', '2', '121.png', ''),
(2, 1, 'Evening Snacks', '2', '2', '', ''),
(3, 1, 'Cookies', '3', '2', '', ''),
(4, 1, 'Nuts', '4', '1', '', ''),
(5, 1, 'Fibre Rich', '5', '2', '', ''),
(6, 1, 'Flavoured Teas', '6', '2', '', ''),
(7, 1, 'Fat Burner', '7', '2', '', ''),
(8, 1, 'Chocolates', '8', '2', '', ''),
(9, 2, 'Multi Vitamins', '9', '2', '', ''),
(10, 2, 'Vitamin B12', '10', '2', '', ''),
(11, 2, 'Antioxidant', '11', '2', '', ''),
(12, 2, 'Omega', '12', '2', '', ''),
(13, 2, 'Iron', '13', '2', '', ''),
(14, 2, 'Calcium', '14', '2', '', ''),
(15, 2, 'CoQ10', '15', '2', '', ''),
(16, 2, 'Skin Care', '16', '2', '', ''),
(17, 2, 'Fat Burner', '17', '2', '', ''),
(18, 1, 'Heart Health', '18', '1', '', ''),
(19, 2, 'Gut Friendly', '19', '2', '', ''),
(20, 2, 'Others', '20', '2', '', ''),
(21, 2, 'Hair Care', '21', '2', '', ''),
(22, 1, 'Joint Health', '22', '2', '', ''),
(23, 1, 'Brain Health', '23', '2', '', ''),
(24, 2, 'Diabetic Friendly', '24', '2', '', ''),
(25, 2, 'Fiber', '25', '2', '', ''),
(26, 4, 'Book', '26', '2', '', ''),
(27, 4, 'DVD', '27', '2', '', ''),
(28, 4, 'Weighing Scale', '28', '2', '', ''),
(29, 4, 'Pedometer', '29', '2', '', ''),
(30, 3, 'Protein Bars', '30', '2', '', ''),
(31, 3, 'Protein Powder', '31', '2', '', ''),
(32, 2, 'Vitamin D3', '32', '2', '', ''),
(33, 5, '1', '', '1', '', ''),
(34, 5, '2', '', '1', '', ''),
(35, 5, '4', '', '1', '', ''),
(36, 5, '8', '', '1', '', ''),
(37, 6, '32', '', '1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_type`
--

CREATE TABLE `fynx_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_type`
--

INSERT INTO `fynx_type` (`id`, `name`, `status`, `timestamp`, `subcategory`) VALUES
(1, 'Round Neck', '2', '2015-12-14 07:17:07', 1),
(2, 'Graphic T-Shirts', '1', '2015-12-14 07:17:09', 1),
(3, 'Tanks', '1', '2015-12-14 07:17:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_useraddress`
--

CREATE TABLE `fynx_useraddress` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `billingaddress` text NOT NULL,
  `shippingaddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_wishlist`
--

CREATE TABLE `fynx_wishlist` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fynx_wishlist`
--

INSERT INTO `fynx_wishlist` (`id`, `user`, `product`, `timestamp`, `design`) VALUES
(7, 7, '3', '2015-12-12 07:32:15', '1');

-- --------------------------------------------------------

--
-- Table structure for table `logintype`
--

CREATE TABLE `logintype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logintype`
--

INSERT INTO `logintype` (`id`, `name`) VALUES
(1, 'Facebook'),
(2, 'Twitter'),
(3, 'Email'),
(4, 'Google');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `linktype` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `isactive` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `keyword`, `url`, `linktype`, `parent`, `isactive`, `order`, `icon`) VALUES
(0, 'Dashboard', '', '', 'site/index', 1, 0, 1, 0, 'icon-dashboard'),
(1, 'Users', '', '', 'site/viewusers', 1, 0, 1, 1, 'icon-user'),
(2, 'Slider', '', '', 'site/viewhomeslide\n', 1, 0, 1, 2, 'icon-dashboard'),
(3, 'Products', '', '', 'site/viewproduct', 1, 0, 1, 5, 'icon-dashboard'),
(4, 'Category\n', '', '', 'site/viewcategory \r\n\r\n', 1, 0, 1, 3, 'icon-dashboard'),
(6, 'Sub Category\r\n\r\n', '', '', 'site/viewsubcategory\r\n\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(7, 'Ask SUMAN', '', '', 'site/viewasksuman\n\n', 1, 0, 1, 7, 'icon-dashboard'),
(8, 'Subscribe\r\n', '', '', 'site/viewsubscribe\r\n\r\n', 1, 0, 1, 11, 'icon-dashboard'),
(9, 'Contact us\n\n', '', '', 'site/viewcontact\r\n\r\n', 1, 0, 1, 11, 'icon-dashboard'),
(10, 'Testimonials', '', '', 'site/viewtestimonial\n\n', 1, 0, 1, 11, 'icon-dashboard'),
(11, 'Orders\n', '', '', 'site/vieworder\r\n\r\n', 1, 0, 1, 6, 'icon-dashboard'),
(12, 'Health Packages', '', '', 'site/viewhealthpackages\n\n', 1, 0, 1, 8, 'icon-dashboard'),
(13, 'Blog', '', '', 'site/viewblog\n\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(14, 'Health Packages Type', '', '', 'site/viewsubtype\n', 1, 0, 1, 9, 'icon-dashboard'),
(15, 'Tags', '', '', 'site/viewtags\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(16, 'News', '', '', 'site/viewnews\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(30, 'Designer\n', '', '', 'site/viewdesigner\n', 1, 0, 1, 30, 'icon-dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `menuaccess`
--

CREATE TABLE `menuaccess` (
  `menu` int(11) NOT NULL,
  `access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuaccess`
--

INSERT INTO `menuaccess` (`menu`, `access`) VALUES
(1, 1),
(4, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 3),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `image`, `year`, `timestamp`, `status`) VALUES
(1, 'asd', '127.jpeg', 'sa', '2016-02-03 14:10:31', 0),
(2, 'asda', '', 'asd', '2016-02-03 14:13:47', 0),
(3, 'dasd', '', '', '2016-02-03 14:15:06', 0),
(4, 'sad', '', '', '2016-02-03 14:17:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipping'),
(4, 'Delivered'),
(5, 'Cancel');

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `subcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productdesignimage`
--

CREATE TABLE `productdesignimage` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `design` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productdesignimage`
--

INSERT INTO `productdesignimage` (`id`, `product`, `design`, `image`) VALUES
(2, 3, 6, 'Apparels_banners.jpg'),
(3, 3, 4, 'b11.jpg'),
(9, 11, 0, 'braillestill11.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `relatedproduct`
--

CREATE TABLE `relatedproduct` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `relatedproduct` int(11) NOT NULL,
  `design` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relatedproduct`
--

INSERT INTO `relatedproduct` (`id`, `product`, `relatedproduct`, `design`) VALUES
(1, 2, 1, '4'),
(2, 3, 1, '6'),
(3, 3, 2, ''),
(4, 4, 5, ''),
(5, 4, 7, '0'),
(6, 4, 9, '0'),
(7, 10, 12, '0'),
(10, 11, 11, '0'),
(14, 4, 8, '0'),
(17, 4, 10, '0'),
(19, 1, 3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `selftables_blog`
--

CREATE TABLE `selftables_blog` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `posted_by` varchar(255) NOT NULL,
  `dateofposting` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selftables_blog`
--

INSERT INTO `selftables_blog` (`id`, `name`, `image`, `description`, `posted_by`, `dateofposting`, `views`) VALUES
(1, 'blog1', 'braillestill16.jpg', '<p><strong>testing blog 1</strong></p>', 'demo', '2016-02-01 10:22:31', 10),
(2, 'blog2', 'braillestill17.jpg', '<p>blog 2 text</p>', 'demo', '2016-02-01 10:28:24', 5),
(3, 'blog3', 'img_27322.jpg', '<p>blog3 text</p>', 'asd', '2016-02-01 10:29:01', 8),
(4, 'blog15', 'braillestill18.jpg', '<p><strong>Titanosaur, American Museum of Natural History The titanosaur is so long that it''s head reaches out the door, welcoming visitors into its hall. In the fossil halls of New York''s American Museum of Natural History, visitors take a journey through millennTitanosaur, American Museum of Natural History The titanosaur is so long that it''s head reaches out the door, welcoming visitors into its hall. In the fossil halls of New York''s American Museum of Natural History, visitors take a journey through millenn</strong></p>\n<p><em>Titanosaur, American Museum of Natural History The titanosaur is so long that it''s head reaches out the door, welcoming visitors into its hall. In the fossil halls of New York''s American Museum of Natural History, visitors take a journey through millenn</em></p>\n<p>&nbsp;</p>\n<p style="text-align: center;"><em>Titanosaur, American Museum of Natural History The titanosaur is so long that it''s head reaches out the door, welcoming visitors into its hall. In the fossil halls of New York''s American Museum of Natural History, visitors take a journey through millenn</em></p>', 'xcv', '2016-02-01 10:54:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `selftables_comment`
--

CREATE TABLE `selftables_comment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `blog` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selftables_comment`
--

INSERT INTO `selftables_comment` (`id`, `name`, `email`, `website`, `comment`, `blog`, `timestamp`) VALUES
(2, 'asd', 'asd@asd.com', 'website', 'testing comment for xyz blog', 4, '2016-02-01 11:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `selftables_healthpackages`
--

CREATE TABLE `selftables_healthpackages` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `months` int(11) NOT NULL,
  `visits` int(11) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `price_in_INR` int(11) NOT NULL,
  `price_in_dollars` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `selftables_realtedblog`
--

CREATE TABLE `selftables_realtedblog` (
  `id` int(11) NOT NULL,
  `blog` int(255) NOT NULL,
  `relatedblog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selftables_realtedblog`
--

INSERT INTO `selftables_realtedblog` (`id`, `blog`, `relatedblog`) VALUES
(22, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `selftables_subtype`
--

CREATE TABLE `selftables_subtype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(555) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selftables_subtype`
--

INSERT INTO `selftables_subtype` (`id`, `name`, `description`, `image`, `order`, `status`) VALUES
(1, 'WEIGHT LOSS FOR KIDS', '', 'kids1.png', 0, '0'),
(2, 'WEIGHT LOSS WITH HEALTHGAIN', '', 'weightloss1.png', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Disable'),
(2, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `timestamp`) VALUES
(1, 'aarohangada@gmail.com', '2016-01-25 06:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(4, 'Food'),
(5, 'Fruits'),
(6, 'lemon honey water'),
(7, 'monsoon'),
(8, 'skin'),
(9, 'skin friendly');

-- --------------------------------------------------------

--
-- Table structure for table `tagsblog`
--

CREATE TABLE `tagsblog` (
  `id` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `blog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagsblog`
--

INSERT INTO `tagsblog` (`id`, `tag`, `blog`) VALUES
(1, 4, 1),
(2, 5, 1),
(3, 8, 2),
(4, 9, 2),
(5, 5, 3),
(6, 6, 3),
(7, 9, 4),
(8, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `weight` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `name`, `location`, `image`, `description`, `weight`) VALUES
(2, 'pooja', 'airoli', '', '            dfc                        ', '45kg'),
(4, 'abcsad', 'asdairoli', 'download1.jpg', '            asdasd          bgfgf', '65kgsad'),
(6, 'aaa', 'aasas', '', 'asdasd    ad                           adasd', '22kg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accesslevel` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `socialid` varchar(255) NOT NULL,
  `logintype` varchar(255) NOT NULL,
  `json` text NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `billingaddress` text NOT NULL,
  `billingcity` varchar(255) NOT NULL,
  `billingstate` varchar(255) NOT NULL,
  `billingcountry` varchar(255) NOT NULL,
  `billingcontact` varchar(255) NOT NULL,
  `billingpincode` varchar(255) NOT NULL,
  `shippingaddress` text NOT NULL,
  `shippingcity` varchar(255) NOT NULL,
  `shippingcountry` varchar(255) NOT NULL,
  `shippingstate` varchar(255) NOT NULL,
  `shippingpincode` varchar(255) NOT NULL,
  `shippingname` varchar(255) NOT NULL,
  `shippingcontact` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `credit` varchar(255) NOT NULL,
  `companyname` varchar(255) NOT NULL,
  `registrationno` varchar(255) NOT NULL,
  `vatnumber` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(255) NOT NULL,
  `billingline1` varchar(255) DEFAULT NULL,
  `billingline2` varchar(255) DEFAULT NULL,
  `billingline3` varchar(255) DEFAULT NULL,
  `shippingline1` varchar(255) DEFAULT NULL,
  `shippingline2` varchar(255) DEFAULT NULL,
  `shippingline3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`) VALUES
(1, 'wohlig', 'a63526467438df9566c508027d9cb06b', 'wohlig@wohlig.com', 1, '0000-00-00 00:00:00', 1, 'images_(2)1.jpg', '', '', 'Facebook', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Pooja Thakare', '', 'pooja.wohlig@gmail.com', 3, '2015-12-09 06:02:37', 2, 'https://lh5.googleusercontent.com/-5B1PwZZrwdI/AAAAAAAAAAI/AAAAAAAAABw/J3Hf871N8IE/photo.jpg', '', '103402210128529539675', 'Google', '', 'puja', 'thakare', '9870969411', '', 'bcity', 'bstate', 'bcountry', '', 'bpincode', '', 'scity', 'scountry', 'sstate', 'spincode', '', '', '', '', '', '', '', '', '', 0, '', '103402210128529539675', '', '', '', '', '', '0000-00-00', '', 'b1', 'b2', 'b3', 's1', 's2', 's3'),
(7, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, '2015-12-16 06:23:23', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, '81dc9bdb52d04dc20036dbd8313ed055', 'tushar@gmail.com', NULL, '2015-12-16 06:23:23', NULL, NULL, '', '', '', '', 'Tushar', 'Sachde', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'c96d1a174e9bdb6d4c9da3a7fdc1701c', 'jagrtui@wohlig.com', NULL, '2015-12-18 04:56:21', NULL, NULL, '', '', '', '', 'jagruti', 'patil', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, '3677b23baa08f74c28aba07f0cb6554e', 'jagruti@wohlig.com', NULL, '2015-12-18 05:07:59', NULL, NULL, '', '', '', '', 'jagruti', 'patil', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, 'a4021e130b1b574c1beb686b6e17e759', 'rohanwohlig@gmail.com', 3, '2016-01-23 07:46:22', 2, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'aaasd', '', 'mahaarashtra', '1aaa212', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(12, NULL, 'a4021e130b1b574c1beb686b6e17e759', 'arohanwohlig@gmail.com', 3, '2016-01-26 07:10:36', 2, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `onuser` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `onuser`, `status`, `description`, `timestamp`) VALUES
(1, 1, 1, 'User Address Edited', '2014-05-12 06:50:21'),
(2, 1, 1, 'User Details Edited', '2014-05-12 06:51:43'),
(3, 1, 1, 'User Details Edited', '2014-05-12 06:51:53'),
(4, 4, 1, 'User Created', '2014-05-12 06:52:44'),
(5, 4, 1, 'User Address Edited', '2014-05-12 12:31:48'),
(6, 23, 2, 'User Created', '2014-10-07 06:46:55'),
(7, 24, 2, 'User Created', '2014-10-07 06:48:25'),
(8, 25, 2, 'User Created', '2014-10-07 06:49:04'),
(9, 26, 2, 'User Created', '2014-10-07 06:49:16'),
(10, 27, 2, 'User Created', '2014-10-07 06:52:18'),
(11, 28, 2, 'User Created', '2014-10-07 06:52:45'),
(12, 29, 2, 'User Created', '2014-10-07 06:53:10'),
(13, 30, 2, 'User Created', '2014-10-07 06:53:33'),
(14, 31, 2, 'User Created', '2014-10-07 06:55:03'),
(15, 32, 2, 'User Created', '2014-10-07 06:55:33'),
(16, 33, 2, 'User Created', '2014-10-07 06:59:32'),
(17, 34, 2, 'User Created', '2014-10-07 07:01:18'),
(18, 35, 2, 'User Created', '2014-10-07 07:01:50'),
(19, 34, 2, 'User Details Edited', '2014-10-07 07:04:34'),
(20, 18, 2, 'User Details Edited', '2014-10-07 07:05:11'),
(21, 18, 2, 'User Details Edited', '2014-10-07 07:05:45'),
(22, 18, 2, 'User Details Edited', '2014-10-07 07:06:03'),
(23, 7, 6, 'User Created', '2014-10-17 06:22:29'),
(24, 7, 6, 'User Details Edited', '2014-10-17 06:32:22'),
(25, 7, 6, 'User Details Edited', '2014-10-17 06:32:37'),
(26, 8, 6, 'User Created', '2014-11-15 12:05:52'),
(27, 9, 6, 'User Created', '2014-12-02 10:46:36'),
(28, 9, 6, 'User Details Edited', '2014-12-02 10:47:34'),
(29, 4, 6, 'User Details Edited', '2014-12-03 10:34:49'),
(30, 4, 6, 'User Details Edited', '2014-12-03 10:36:34'),
(31, 4, 6, 'User Details Edited', '2014-12-03 10:36:49'),
(32, 8, 6, 'User Details Edited', '2014-12-03 10:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesslevel`
--
ALTER TABLE `accesslevel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `asksuman`
--
ALTER TABLE `asksuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_cart`
--
ALTER TABLE `fynx_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_category`
--
ALTER TABLE `fynx_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_color`
--
ALTER TABLE `fynx_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_config`
--
ALTER TABLE `fynx_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_credit`
--
ALTER TABLE `fynx_credit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_designer`
--
ALTER TABLE `fynx_designer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_designs`
--
ALTER TABLE `fynx_designs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_homeslide`
--
ALTER TABLE `fynx_homeslide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_newsletter`
--
ALTER TABLE `fynx_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_offer`
--
ALTER TABLE `fynx_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_offerproduct`
--
ALTER TABLE `fynx_offerproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_order`
--
ALTER TABLE `fynx_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_orderitem`
--
ALTER TABLE `fynx_orderitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_product`
--
ALTER TABLE `fynx_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_productimage`
--
ALTER TABLE `fynx_productimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_size`
--
ALTER TABLE `fynx_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_sizechart`
--
ALTER TABLE `fynx_sizechart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_subcategory`
--
ALTER TABLE `fynx_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_type`
--
ALTER TABLE `fynx_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_useraddress`
--
ALTER TABLE `fynx_useraddress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fynx_wishlist`
--
ALTER TABLE `fynx_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logintype`
--
ALTER TABLE `logintype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productdesignimage`
--
ALTER TABLE `productdesignimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selftables_blog`
--
ALTER TABLE `selftables_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selftables_comment`
--
ALTER TABLE `selftables_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selftables_healthpackages`
--
ALTER TABLE `selftables_healthpackages`
  ADD PRIMARY KEY (`id`,`price_in_dollars`);

--
-- Indexes for table `selftables_realtedblog`
--
ALTER TABLE `selftables_realtedblog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selftables_subtype`
--
ALTER TABLE `selftables_subtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagsblog`
--
ALTER TABLE `tagsblog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesslevel`
--
ALTER TABLE `accesslevel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `asksuman`
--
ALTER TABLE `asksuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fynx_cart`
--
ALTER TABLE `fynx_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `fynx_category`
--
ALTER TABLE `fynx_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fynx_color`
--
ALTER TABLE `fynx_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fynx_config`
--
ALTER TABLE `fynx_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fynx_credit`
--
ALTER TABLE `fynx_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_designer`
--
ALTER TABLE `fynx_designer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fynx_designs`
--
ALTER TABLE `fynx_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fynx_homeslide`
--
ALTER TABLE `fynx_homeslide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fynx_newsletter`
--
ALTER TABLE `fynx_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fynx_offer`
--
ALTER TABLE `fynx_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_offerproduct`
--
ALTER TABLE `fynx_offerproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_order`
--
ALTER TABLE `fynx_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `fynx_orderitem`
--
ALTER TABLE `fynx_orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `fynx_product`
--
ALTER TABLE `fynx_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `fynx_productimage`
--
ALTER TABLE `fynx_productimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_size`
--
ALTER TABLE `fynx_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fynx_sizechart`
--
ALTER TABLE `fynx_sizechart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fynx_subcategory`
--
ALTER TABLE `fynx_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `fynx_type`
--
ALTER TABLE `fynx_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fynx_useraddress`
--
ALTER TABLE `fynx_useraddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fynx_wishlist`
--
ALTER TABLE `fynx_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `logintype`
--
ALTER TABLE `logintype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productdesignimage`
--
ALTER TABLE `productdesignimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `selftables_blog`
--
ALTER TABLE `selftables_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `selftables_comment`
--
ALTER TABLE `selftables_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `selftables_healthpackages`
--
ALTER TABLE `selftables_healthpackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `selftables_realtedblog`
--
ALTER TABLE `selftables_realtedblog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `selftables_subtype`
--
ALTER TABLE `selftables_subtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tagsblog`
--
ALTER TABLE `tagsblog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
