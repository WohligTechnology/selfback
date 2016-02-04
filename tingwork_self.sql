-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 03, 2016 at 06:40 AM
-- Server version: 5.5.42-37.1-log
-- PHP Version: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tingwork_self`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesslevel`
--

DROP TABLE IF EXISTS `accesslevel`;
CREATE TABLE IF NOT EXISTS `accesslevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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

DROP TABLE IF EXISTS `asksuman`;
CREATE TABLE IF NOT EXISTS `asksuman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `asksuman`
--

INSERT INTO `asksuman` (`id`, `category`, `name`, `email`, `question`) VALUES
(49, '', '', '', ''),
(50, 'Choose a Category', 'Rohan', 'gadarohan17@gmail.com', 'qwertyuiop');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_cart`
--

DROP TABLE IF EXISTS `fynx_cart`;
CREATE TABLE IF NOT EXISTS `fynx_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(255) NOT NULL,
  `json` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `fynx_cart`
--

INSERT INTO `fynx_cart` (`id`, `user`, `quantity`, `product`, `timestamp`, `design`, `json`) VALUES
(4, 17, 1, '1', '2016-01-25 11:46:45', '', ''),
(5, 17, 3, '2', '2016-01-25 11:54:26', '', ''),
(6, 15, 1, '1', '2016-01-25 12:07:47', '', ''),
(18, 30, 1, '6', '2016-01-26 05:53:11', '', ''),
(19, 30, 1, '8', '2016-01-26 05:53:24', '', ''),
(20, 30, 1, '5', '2016-01-26 05:53:28', '', ''),
(21, 30, 3, '13', '2016-01-26 06:06:57', '', ''),
(22, 30, 1, '16', '2016-01-26 06:09:57', '', ''),
(24, 15, 1, '16', '2016-01-26 09:50:30', '', ''),
(25, 15, 1, '5', '2016-01-26 09:53:22', '', ''),
(33, 32, 3, '7', '2016-01-26 15:15:27', '', ''),
(48, 1, 1, '5', '2016-01-27 06:48:15', '', ''),
(49, 15, 1, '43', '2016-01-27 06:52:19', '', ''),
(50, 1, 1, '19', '2016-01-27 07:22:22', '', ''),
(52, 35, 3, '3', '2016-01-30 12:01:14', '', ''),
(53, 35, 7, '6', '2016-01-30 12:03:01', '', ''),
(54, 36, 3, '4', '2016-02-02 05:50:24', '', ''),
(55, 36, 2, '12', '2016-02-02 05:50:14', '', ''),
(56, 36, 2, '10', '2016-02-02 05:50:17', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_category`
--

DROP TABLE IF EXISTS `fynx_category`;
CREATE TABLE IF NOT EXISTS `fynx_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fynx_category`
--

INSERT INTO `fynx_category` (`id`, `order`, `name`, `parent`, `status`, `image1`, `image2`) VALUES
(1, 1, 'FOOD MUNCHIES & BEVERAGES', '', '2', '1.jpg', 'apple.jpg'),
(2, 2, 'VITAMINS & MINERALS', '', '2', '25.jpg', 'vitaminsandminerals.jpg'),
(3, 3, 'PROTEIN SUPPLEMENT', '', '2', '23.png', 'protiensandsupplements.jpg'),
(4, 4, 'BOOKS & GADGETS', '', '2', '15.png', 'booksandgadgets.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_color`
--

DROP TABLE IF EXISTS `fynx_color`;
CREATE TABLE IF NOT EXISTS `fynx_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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

DROP TABLE IF EXISTS `fynx_config`;
CREATE TABLE IF NOT EXISTS `fynx_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fynx_config`
--

INSERT INTO `fynx_config` (`id`, `text`, `content`) VALUES
(1, 'Enter Text For Config', 'Enter Content For Config');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_credit`
--

DROP TABLE IF EXISTS `fynx_credit`;
CREATE TABLE IF NOT EXISTS `fynx_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `addcredit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_designer`
--

DROP TABLE IF EXISTS `fynx_designer`;
CREATE TABLE IF NOT EXISTS `fynx_designer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `noofdesigns` int(11) NOT NULL,
  `designerid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `commission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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

DROP TABLE IF EXISTS `fynx_designs`;
CREATE TABLE IF NOT EXISTS `fynx_designs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designer` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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

DROP TABLE IF EXISTS `fynx_homeslide`;
CREATE TABLE IF NOT EXISTS `fynx_homeslide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `centeralign` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `fynx_homeslide`
--

INSERT INTO `fynx_homeslide` (`id`, `name`, `description`, `link`, `sorder`, `target`, `status`, `image`, `template`, `class`, `text`, `centeralign`) VALUES
(5, 'Meet Suman Agarwal', '                                                                                                    ', '#/meet', 0, '0', '2', 'Home_banners_2000x8671.jpg', '0', '0', '0', '0'),
(6, 'Health Management', '                                        ', '#/healthmanagement', 0, '0', '2', '02_Home_banners_2000x867.jpg', '0', '0', '0', '0'),
(7, 'Visit E-Store', '                                        ', '#/healthproducts/1', 0, '0', '2', '03_Home2.jpg', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_newsletter`
--

DROP TABLE IF EXISTS `fynx_newsletter`;
CREATE TABLE IF NOT EXISTS `fynx_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fynx_newsletter`
--

INSERT INTO `fynx_newsletter` (`id`, `user`, `email`, `status`) VALUES
(1, '1', 'poojathakare55@gmail.com', '2');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_offer`
--

DROP TABLE IF EXISTS `fynx_offer`;
CREATE TABLE IF NOT EXISTS `fynx_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_offerproduct`
--

DROP TABLE IF EXISTS `fynx_offerproduct`;
CREATE TABLE IF NOT EXISTS `fynx_offerproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_order`
--

DROP TABLE IF EXISTS `fynx_order`;
CREATE TABLE IF NOT EXISTS `fynx_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `paymentmode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `fynx_order`
--

INSERT INTO `fynx_order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`) VALUES
(53, 0, 'sohan', '', '', '', '', '', '', '', '', 'Mumbai', 'chunabhatti', '', '', '24053390', 'Maharashtra', '400022', '', '', '', '1', '2016-01-27 04:55:05', '', '', '', '', '', '', '', NULL),
(54, 0, 'sohan', '', '', '', '', '', '', '', '', 'Mumbai', 'chunabhatti', '', '', '24053390', 'Maharashtra', '400022', '', '', '', '1', '2016-01-27 04:55:08', '', '', '', '', '', '', '', NULL),
(55, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-27 06:49:12', '', '', '', '', '', '', '', NULL),
(56, 0, 'Rohan', '', 'rohanwohlig@gmail.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852963', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 06:49:13', '', '', '', '', '', '', '', NULL),
(57, 0, 'Rohan', '', 'rohanwohlig@gmail.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852963', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 06:49:13', '', '', '', '', '', '', '', NULL),
(58, 0, 'Rohan', '', 'rohanwohlig@gmail.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852963', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 06:53:12', '', '', '', '', '', '', '', NULL),
(59, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-27 07:19:23', '', '', '', '', '', '', '', NULL),
(60, 0, 'ROhan', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '74108520963.', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 07:19:23', '', '', '', '', '', '', '', NULL),
(61, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-27 08:02:33', '', '', '', '', '', '', '', NULL),
(62, 0, 'Rohan', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 08:02:35', '', '', '', '', '', '', '', NULL),
(63, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 07:10:52', '', '', '', '', '', '', '', NULL),
(64, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 07:10:53', '', '', '', '', '', '', '', NULL),
(65, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 09:41:23', '', '', '', '', '', '', '', NULL),
(66, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 09:41:24', '', '', '', '', '', '', '', NULL),
(67, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 09:56:57', '', '', '', '', '', '', '', NULL),
(68, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 09:56:58', '', '', '', '', '', '', '', NULL),
(69, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 09:59:21', '', '', '', '', '', '', '', NULL),
(70, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 09:59:22', '', '', '', '', '', '', '', NULL),
(71, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 12:15:12', '', '', '', '', '', '', '', NULL),
(72, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:15:12', '', '', '', '', '', '', '', NULL),
(73, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 12:39:45', '', '', '', '', '', '', '', NULL),
(74, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:39:48', '', '', '', '', '', '', '', NULL),
(75, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:43:09', '', '', '', '', '', '', '', NULL),
(76, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 12:45:57', '', '', '', '', '', '', '', NULL),
(77, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:45:58', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_orderitem`
--

DROP TABLE IF EXISTS `fynx_orderitem`;
CREATE TABLE IF NOT EXISTS `fynx_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `finalprice` int(11) NOT NULL,
  `design` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `fynx_orderitem`
--

INSERT INTO `fynx_orderitem` (`id`, `discount`, `order`, `product`, `quantity`, `price`, `finalprice`, `design`) VALUES
(25, 0, 20, 1, 1, 800, 800, 6),
(26, 0, 20, 1, 1, 800, 800, 6),
(27, 0, 24, 6, 1, 150, 150, 0),
(28, 0, 24, 8, 1, 250, 250, 0),
(29, 0, 24, 5, 1, 325, 325, 0),
(30, 0, 24, 13, 3, 195, 585, 0),
(31, 0, 24, 16, 1, 245, 245, 0),
(32, 0, 25, 7, 1, 150, 150, 0),
(33, 0, 29, 1, 1, 150, 150, 0),
(34, 0, 29, 16, 1, 245, 245, 0),
(35, 0, 29, 5, 1, 325, 325, 0),
(36, 0, 31, 1, 1, 150, 150, 0),
(37, 0, 31, 16, 1, 245, 245, 0),
(38, 0, 31, 5, 1, 325, 325, 0),
(39, 0, 46, 7, 3, 150, 450, 0),
(40, 0, 47, 1, 3, 150, 150, 0),
(41, 0, 47, 2, 2, 150, 450, 0),
(42, 0, 48, 1, 3, 150, 150, 0),
(43, 0, 48, 2, 2, 150, 450, 0),
(44, 0, 49, 1, 3, 150, 150, 0),
(45, 0, 49, 2, 2, 150, 450, 0),
(46, 0, 50, 1, 3, 150, 150, 0),
(47, 0, 50, 2, 2, 150, 450, 0),
(48, 0, 51, 1, 3, 150, 150, 0),
(49, 0, 51, 2, 2, 150, 450, 0),
(50, 0, 51, 44, 1, 100, 100, 0),
(51, 0, 52, 1, 3, 150, 150, 0),
(52, 0, 52, 2, 2, 150, 450, 0),
(53, 0, 52, 44, 1, 100, 100, 0),
(54, 0, 53, 1, 2, 150, 300, 0),
(55, 0, 54, 1, 2, 150, 300, 0),
(56, 0, 56, 1, 1, 150, 150, 0),
(57, 0, 56, 16, 1, 245, 245, 0),
(58, 0, 56, 5, 1, 325, 325, 0),
(59, 0, 57, 1, 1, 150, 150, 0),
(60, 0, 57, 16, 1, 245, 245, 0),
(61, 0, 57, 5, 1, 325, 325, 0),
(62, 0, 58, 1, 1, 150, 150, 0),
(63, 0, 58, 16, 1, 245, 245, 0),
(64, 0, 58, 5, 1, 325, 325, 0),
(65, 0, 58, 43, 1, 100, 100, 0),
(66, 0, 60, 11, 1, 154, 154, 0),
(67, 0, 62, 7, 4, 150, 600, 0),
(68, 0, 64, 3, 3, 150, 450, 0),
(69, 0, 64, 6, 7, 150, 150, 0),
(70, 0, 66, 1, 1, 150, 150, 0),
(71, 0, 68, 1, 1, 150, 150, 0),
(72, 0, 70, 1, 1, 150, 150, 0),
(73, 0, 72, 1, 1, 150, 150, 0),
(74, 0, 74, 1, 1, 150, 150, 0),
(75, 0, 75, 2, 1, 150, 150, 0),
(76, 0, 77, 2, 1, 150, 150, 0),
(77, 0, 77, 5, 1, 325, 325, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_product`
--

DROP TABLE IF EXISTS `fynx_product`;
CREATE TABLE IF NOT EXISTS `fynx_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL,
  `image4` varchar(255) NOT NULL,
  `image5` varchar(255) NOT NULL,
  `baseproduct` varchar(255) NOT NULL,
  `discountprice` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `fynx_product`
--

INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `weight`, `name`, `type`, `about`, `nutritionalvalue`, `visibility`, `price`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountprice`) VALUES
(1, 1, '0', '200', 'Limbu chana', '0', '                                    ', ' Nutritional Values      per 100 gms     per 25 gms\nEnergy value                 371.0                 92.7\nProtein                           18.4                     4.6\nCarbohydrates               69.4                    17.3\nFats                       ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '121.png', '', '', '', '', '', ''),
(2, 1, '16', '200 ', 'Pudina chana', '0', '                                    ', 'Nutritional Values    100 gms    per 25 gms\nEnergy value           371.0             92.7\nProtein                      18.4               4.6\nCarbohydrates          69.4              17.3\nFats                            2.1                0.5\nCalcium     ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '19.png', '', '', '', '', '', ''),
(3, 1, '27', '200', 'Tangy chana', '0', '', 'N.A.               ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '23.png', '', '', '', '', '', ''),
(4, 1, '30', '500', 'Moong dal khakhra', '0', '*Gluten Free\n*Low Fat\n\nLoaded with protein, fiber and the goodness of potassium and B-vitamins, the Moong Daal Khakra is a gluten-free snack and perfect for weight-watchers and those who love this crispy Indian flat-bread. \n \nMoong Daal Khakra is gently s', 'Nutritional Values           per 100 gms           2 Khakras\nEnergy value                     469.0                       171.0\nProtein                                 23.0                         8.3\nCarbohydrates                    46.4                 ', '1', '325', '', '1', NULL, NULL, NULL, '2', '', '15.png', '', '', '', '', '', ''),
(5, 1, '26', '500', 'Mix - dal khakhra', '0', '', ' Nutritional Values          per 100 gms              2 Khakras\nEnergy value                   460.0                             167\nProtein                              22.6                               8.2\nCarbohydrates                  49.4           ', '1', '325', '', '1', NULL, NULL, NULL, '2', '', '14.png', '', '', '', '', '', ''),
(6, 1, '23', '150', 'Chana Jor', '0', '*Gluten Free\n*Low Fat\n\nChana Jor, which is made from flattened and roasted chickpeas, has all the health benefits of eating chickpeas: a unique supply of anti-oxidants, magnesium, soluble fiber, vitamins and valuable potassium. \n \nTangy and crunchy, this ', ' Nutritional Values           per 100 gms        per 25 gms\nEnergy value                      360.0                      90.0\nProtein                                 10.6                         2.6\nCarbohydrates                  75.8                     ', '1', '150', '', '1', NULL, NULL, NULL, '1', '', '4.png', '', '', '', '', '', ''),
(7, 2, '23', '150', 'Jowar munch', '0', '*Gluten Free\n*Low Fat\n\nThat tiny grain called Jowar is packed with essential nutrients like Vitamins B and E, magnesium, fiber, and iron along with other valuable antioxidants. Our food researcher know that consumption of jowar is beneficial in preventing', ' Nutritional Values      per 100 gms          per 25 gms\nEnergy value                403.0                       100.8\nProtein                           17.5                          4.4\nCarbohydrates              61.9                         15.5\nFats   ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '11.png', '', '', '', '', '', ''),
(8, 4, '30', '200', 'Bajra rings', '0', '                    *Gluten Free\n*Low Fat\n\nIf there is one grain that contains disease-fighting phytochemicals and antioxidants it is the humble bajra or the English Millet. Our spicey-sweet Bajra rings, with the additional goodness of sesame and curd, ma', '                    Nutritional Values    per 100 gms    per 20 gms\nEnergy value           360.0                   90.0\nProtein                      10.6                    2.6\nCarbohydrates          75.8                  18.9\nFats                        ', '1', '250', '', '1', NULL, NULL, NULL, '2', '', '3.png', '', '', '', '', '', ''),
(9, 38, '30', '100', '4 O clock nut munch', '0', '                                                                                                    *Gluten Free\n*Low Fat\n\nWe have for you a perfect mix of nuts and fruits so you Munch Right in the evening! The good quality fats and proteins present in th', '                                                                                                    Nutritional Values         20g                 100g\nEnergy                      506kcal            101kcal\nTotal Fat                     35g               ', '1', '175', '', '1', NULL, NULL, NULL, '2', '', '1.png', '', '', '', '', '', ''),
(10, 8, '30', '', 'Dark Chocolate bar', '0', ' Here is something for dark chocolate lovers. It has no added sugar dark and it is diabetic friendly.                                   ', '   N.A.                                                                     ', '1', '270', '', '1', NULL, NULL, NULL, '2', '', '2.png', '', '', '', '', '', ''),
(11, 32, '29', '', 'Chew 60 K: Chewable vitamin D3 (10 tabs)', '0', ' It is a chewable tablet for curing your vitamin deficiency with delicious orange flavor unlike tablets or powder.                                   ', 'N.A.                                                                        ', '1', '154', '', '2', NULL, NULL, NULL, '2', '', '5.png', '', '', '', '', '', ''),
(12, 8, '30', '', 'Choco-nut discs', '0', ' *Gluten Free\n*Low Fat\n\nCan''t go away with your chocolate cravings? Try our sinful chocolate discs studded with nutritious nuts and dried fruits!!\n\n                                   ', ' Nutritional Values           per 100gms\nEnergy                               529kcals\nProteins                             5.62gms\nFats                                   32.05gms\nCarbohydrates                  54.53gms                                    ', '1', '650', '', '1', NULL, NULL, NULL, '2', '', '6.png', '', '', '', '', '', ''),
(13, 0, '30', '', 'Cinnamon Apple Tea', '0', 'Brand Name: TE-A-ME\nCinnamon has shown an amazing ability to stop medication-resistant yeast infections. This tea gives you a refreshing and soothing effect!!', '                                    ', '1', '195', '', '1', NULL, NULL, NULL, '2', '', 'Cinnamon_Apple_tea.png', '', '', '', '', '', ''),
(14, 6, '30', '', 'Cranberry Apple Tea', '0', 'Brand Name: TE-A-ME\nDelightfully refreshing with a lively tatse of cranberry. It is also known to prevent bladder infection.', '                                    ', '1', '195', '', '1', NULL, NULL, NULL, '2', '', 'Cranberry_apple_tea.png', '', '', '', '', '', ''),
(15, 5, '30', '300gms', 'Functional Fiber', '0', 'Brand Name: Nutrova\nNutrova Functional Fibre contains a blend of soluble and insoluble dietary fibre derived from natural sources. Dietary Fibre has been shown to play an important role in Maintaining blood sugar levels,Decreasing cholesterol and triglyce', '                                    ', '1', '800', '', '1', NULL, NULL, NULL, '2', '', 'Functional_Fiber.png', '', '', '', '', '', ''),
(16, 5, '27', '100gms', 'Fyburn : Instat fiber soup', '0', '', '                              ', '1', '245', '', '1', NULL, NULL, NULL, '2', '', 'Fyburn_Instat_fiber_soup.png', '', '', '', '', '', ''),
(17, 6, '30', '', 'Honey Leomon Green Tea', '0', 'Brand Name: TE-A-ME\nRenew your body, mind and spirit with this balanced blend of green tea leaves, lemon zest and soothing honey; an age-old recipe to cleanse your body and add vitality.', '                                    ', '1', '125', '', '1', NULL, NULL, NULL, '2', '', 'Honey_leomon_green_tea.png', '', '', '', '', '', ''),
(18, 6, '30', '', 'Kashmiri Kahwa Tea', '0', 'Brand Name: TE-A-ME\nUplift yourself with the heavenly flavours of Kashmir; sweet spices blended with natural green tea leaves to create a feeling of bliss overflowing in every cup. A cup of rich-in-anti-oxidant Green tea and REAL spices.', '                                    ', '1', '150', '', '1', NULL, NULL, NULL, '2', '', 'Kashmiri_Kahwa.png', '', '', '', '', '', ''),
(19, 6, '30', '', 'Mint geen Tea', '0', ' Brand Name: TE-A-ME\nRevive yourself with a crisp, top-of-the-world feeling of minty freshness, finely blended with natural green tea leaves.                ', '                    N.A.                ', '1', '125', '', '1', NULL, NULL, NULL, '2', '', 'Mint_green_tea.png', '', '', '', '', '', ''),
(20, 7, '30', '', 'Obicure Tea', '0', '', 'N.A.     ', '1', '420', '', '1', NULL, NULL, NULL, '2', '', 'Obicure_tea.png', '', '', '', '', '', ''),
(22, 6, '30', '', 'Tulsi green Tea', '0', 'Brand Name: TE-A-ME\nRestore yourself with this healing blend of natural green tea leaves ane the sacred herb Tulsi, revered for over 5000 years as the "Mother Medicine of Nature". Present day medical research confirms Tulsi''s unmatched healing properties,', 'N.A.', '1', '125', '', '1', NULL, NULL, NULL, '2', '', 'Tulsi_green_tea.png', '', '', '', '', '', ''),
(23, 9, '30', '', 'ABC Plus', '0', 'Brand Name: Natures Bounty\nA multi-vitamin and multi-mineral formula with the addition of beta carotene, lutein and lycopene.\nProvides all round nutritional support for adults in a convenient one-a-day caplet.', 'N.A.', '1', '1495', '', '2', NULL, NULL, NULL, '2', '', 'ABC_Plus.png', '', '', '', '', '', ''),
(24, 16, '30', '', 'Age Fly', '0', 'Brand Name: ZENITH NUTRITION\nAdvanced formula with Resveratrol and Grape seed. Anti aging resveratrol can be used as a preventive measure, allowing you to retain your youthful appearance, rather than regain it.\n\nGrapeseed extract contain polyphenols (flav', 'N.A.', '1', '1850', '', '2', NULL, NULL, NULL, '2', '', 'Age_Fly.png', '', '', '', '', '', ''),
(25, 24, '30', '', 'Apple Cider Vinegar', '0', '                    Brand Name: Natures Bounty\nNature''s Bounty Original Apple Cider Vinegar contains Chromium, ApplePectin and Vitamin B-6. Chromium helps to promote sugar metabolism while Apple Pectin is a natural soluble fiber well known for its nutriti', '                    N.A.                          ', '1', '1500', '', '2', NULL, NULL, NULL, '2', '', 'Apple_Cider_Vinegar.png', '', '', '', '', '', ''),
(26, 10, '30', '2500 mcg', 'B-12', '0', 'Brand Name: Natures Bounty\nNaturally Cherry Flavor tablets\nAids in normal development and the regeneration of red blood cells\nContributes to proper metabolic functioning and nervous system health.', 'N.A.                                ', '1', '945', '', '2', NULL, NULL, NULL, '2', '', 'B-12_2500_mcg.png', '', '', '', '', '', ''),
(27, 14, '30', '', 'Cal-D-Veg', '0', 'Brand Name: Unived\nCalDveg is a 100% natural high absorption formula to keep bones strong and healthy\nEssential for individuals suffering from osteoporosis and low bone density;\nPrevents calcification of arteries & promotes elasticity of blood vessels, an', ' N.A.                                   ', '1', '660', '', '2', NULL, NULL, NULL, '2', '', 'Cal-D-veg.png', '', '', '', '', '', ''),
(28, 22, '30', '', 'Colox', '0', '', '                    N.A.                                                    ', '1', '1300', '', '2', NULL, NULL, NULL, '2', '', 'Colox.png', '', '', '', '', '', ''),
(29, 12, '30', '', 'Complete Omega 3: Lemon Flavour', '0', '', 'N.A.                                  ', '1', '1200', '', '2', NULL, NULL, NULL, '2', '', 'Complete_Omega_3.png', '', '', '', '', '', ''),
(30, 9, '30', '', 'Daily Active Multiple', '0', 'Brand Name: ZENITH NUTRITION\nContains 25 vital nutrients, vitmains and minerals. Provides specially designed multivitamin formulas that allow you to address health concerns most relevant to you.', ' N.A.                                   ', '1', '840', '', '2', NULL, NULL, NULL, '2', '', 'Daily_Active_Multiple.png', '', '', '', '', '', ''),
(31, 11, '30', '500mg', 'Ester-C 500mg', '0', '                    Brand Name: Natures Bounty\nIntroducing a Non-Ascorbic based Vitamin-C for the first time! Suitable for people who suffer from  acidity regularly and cannot take the ascorbic based vitamin-C supplements. Improves your immunity and helps', '                    N.A.                                                    ', '1', '949', '', '2', NULL, NULL, NULL, '2', '', 'Ester-C_500mg.png', '', '', '', '', '', ''),
(32, 11, '30', '', 'Ester-C 1000mg', '0', '', 'N.A.                                    ', '1', '1799', '', '2', NULL, NULL, NULL, '2', '', 'Ester_C-1000_mg.png', '', '', '', '', '', ''),
(33, 17, '30', '', 'Fab Slim', '0', 'Brand Name: ZENITH NUTRITION\nAdvanced formula with Garcinia, Green tea and Chromium, which help with suppressing your appetite, prevent fat from being made and produced while increasing that "feel good" feeling!!', 'N.A.                                    ', '1', '1760', '', '2', NULL, NULL, NULL, '2', '', 'Fab_Slim.png', '', '', '', '', '', ''),
(34, 12, '30', '', 'Fish oil 1000mg', '0', 'Brand Name: Natures Bounty\nCholesterol free fish oil contains EPA and DHA, two omega-3 fatty acids that help support and maintain the health of your cardiovascular system, plus naturally-occurring omega-6 fatty acids.* Omega-3 fatty acids are considered o', 'N.A.                                    ', '1', '1395', '', '2', NULL, NULL, NULL, '2', '', 'Fish_oil_1000mg.png', '', '', '', '', '', ''),
(35, 17, '30', '', 'Garcinia plus 500mg', '0', '', ' N.A.                                   ', '1', '850', '', '2', NULL, NULL, NULL, '2', '', 'Garcinia_plus_500mg.png', '', '', '', '', '', ''),
(36, 23, '30', '', 'Ginko Biloba (Zenith)', '0', '                    Brand Name: ZENITH NUTRITION\nHelps to improve blood circulation. It is often used for memory disorders, poor conentration problems and other problems related to poor blood flow in the body.                ', '                     N.A.                                                   ', '1', '1220', '', '2', NULL, NULL, NULL, '2', '', 'Ginko_Biloba_(Zenith).png', '', '', '', '', '', ''),
(37, 13, '30', '', 'Iron 65 mg', '0', 'Brand Name: Natures Bounty\nContains the Iron you need each day for proper functioning\nSupports women''s health and energy utilization\nVegetarian tablets play a role in delivering oxygen to the cells', ' N.A.                                   ', '1', '699', '', '2', NULL, NULL, NULL, '2', '', 'Iron_65_mg.png', '', '', '', '', '', ''),
(38, 20, '30', '', 'Melatonin', '0', '', ' N.A.                                   ', '1', '899', '', '2', NULL, NULL, NULL, '2', '', 'Melatonin.png', '', '', '', '', '', ''),
(39, 17, '30', '150gms', 'Obicure Gel', '0', 'Brand Name: Emcure\nStimulates microcirculation\nQuickly penetrates into Skin\nReduces cellulite\nSoftens nourishes & refreshes skin\nReduces body stretch marks\nStrengthens skin elasticity', '  N.A.                                  ', '1', '392', '', '2', NULL, NULL, NULL, '2', '', 'Obicure_Gel.png', '', '', '', '', '', ''),
(40, 19, '30', '', 'Probiotic blend', '0', 'Brand Name: ZENITH NUTRITION\nHelps in maintaining healthy digestive system.Thus, improving GI immunity. Probiotics are bacterial cultures which promote healthy intestinal activity, good digestion and colon regularity.', 'N.A.                                    ', '1', '920', '', '2', NULL, NULL, NULL, '2', '', 'Probiotic_blend.png', '', '', '', '', '', ''),
(41, 25, '30', '100gms', 'Stocon', '0', '                    Brand Name: Nirwana wellness\nNirwana Stomach Cleanser in a 100% natural laxative made from natural herbs and medicinal plants grown on the farms of Nirwana Herbal Healthcare at Kalesar and Yamunanagar, Haryana. It guarantees a thorough', '                      N.A.                                                  ', '1', '204', '', '2', NULL, NULL, NULL, '2', '', 'Stocon_(100_gms).png', '', '', '', '', '', ''),
(42, 32, '30', '', 'Vitamin D3 5000 IU', '0', '                                    ', '                      N.A.                                                  ', '1', '1495', '', '2', NULL, NULL, NULL, '2', '', 'Vitamin_D3_5000_IU.png', '', '', '', '', '', ''),
(43, 30, '29', '75 gms', 'Max Protien Choco Fudge', '0', 'Brand Name: Rite Bite\nRich in cocoa, the bar has got a dominating nutty flavor forming a perfect choice for chocolate lovers. It is a meal replacement bar. Indulge in this fudgy delight, balanced with nutritional benefits!', ' N.A.                                   ', '1', '100', '', '3', NULL, NULL, NULL, '2', '', 'Max_Protien_Choco_Fudge.png', '', '', '', '', '', ''),
(44, 30, '28', '67 gms', 'Max Protien Choco Slim', '0', 'Brand Name: Rite Bite\nThis sugar free bar has a sweet candied taste of chocolate brownie. It contains hi-protein & low carbs; thus, making it a healthy snack. For best results consume it post workout sessions.', ' N.A.                                   ', '1', '100', '', '3', NULL, NULL, NULL, '2', '', 'Max_Protien_Choco_Slim.png', '', '', '', '', '', ''),
(45, 27, '30', '', 'Jane Fonda: Walk-Out DVD', '0', 'Brand Name: DVD''s\nWalking burns a lot of Calories and Slims the waistline,while also improves brain function and increase both heart and lung health.This DVD includes two one-mile walking workout that are simple,fun and fat burning.Stick with this and do ', '  N.A.                                  ', '1', '299', '', '4', NULL, NULL, NULL, '2', '', 'Jane_Fonda_Walk-Out_DVD.png', '', '', '', '', '', ''),
(46, 27, '30', '', 'Jillian Michaels: Banish Fat Boost Metabolism', '0', 'Brand Name: DVD''s\nFire up your metabolism with Banish Fat Boost Metabolism and loose big with fierce formula that adds strength and ab moves to dynamic cardio for increased fat loss.This 40 minute circuit workout blasts your heart rate with challenging in', '  N.A.                                  ', '1', '299', '', '4', NULL, NULL, NULL, '2', '', 'Jillian_Michaels_Banish_Fat_Boost_Metabolism.png', '', '', '', '', '', ''),
(47, 27, '30', '', 'Jillian Michaels: Yoga Meltdown DVD', '0', 'Brand Name: DVD''s\nYoga Meltdown includes two complete 30-minute workouts.Begin with Level 1 and then progress to Level 2 for a more intense burn to gain strength and lose serious weight.so get up,get moving,and lose big now.', '   N.A.                                 ', '1', '299', '', '4', NULL, NULL, NULL, '2', '', 'Jillian_Michaels_Yoga_Meltdown_DVD.png', '', '', '', '', '', ''),
(48, 28, '30', '', 'Tanita weighing scale', '0', 'Brand Name: Tanita\nTanita Body Fat / Body Water Monitor uses Bioelectric Impedance Analysis (BIA), the same accurate technology found in our professional body composition analyzers used by doctors, medical centers, professional athletic teams, fitness clu', '   N.A.                                 ', '1', '4199', '', '4', NULL, NULL, NULL, '2', '', 'Tanita_weighing_scale.png', '', '', '', '', '', ''),
(49, 4, '30', '', 'Nut Pouch', '0', '', ' Nutritional Values           20g               100g\nEnergy                       506kcal            101kcal\nTotal Fat                      35g                         7g\nCarbohydrate              37g                      7.4g\nDietary Fibre               ', '1', '300', '', '1', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(50, 4, '30', '', 'Nut Pouch', '0', '', ' Nutritional Values           20g               100g\nEnergy                       506kcal            101kcal\nTotal Fat                      35g                         7g\nCarbohydrate              37g                      7.4g\nDietary Fibre               ', '1', '300', '', '1', NULL, NULL, NULL, '2', '', '13.png', '', '', '', '', '', ''),
(51, 3, '30', '', 'Cranberry & Oat Cookies', '0', '', ' N.A.                                   ', '1', '200', '', '1', NULL, NULL, NULL, '2', '', '8.png', '', '', '', '', '', ''),
(52, 16, '30', '', 'I-fair', '0', 'I - fair is combination of anti oxidants including glutathione, vitamin C, vitamin E, Alpha lipoic Acid, Grape seed Extract. I - fair helps make skin smoother with a more even tone, gives a rosy white glow and delays aging. Continuous and consistent suppl', '  N.A.                                ', '1', '6500', '', '2', NULL, NULL, NULL, '2', '', '10.png', '', '', '', '', '', ''),
(53, 8, '30', '', 'Milk Chocolate Bar', '0', '                    A sweet substitute for your fruit. It has no added sugar and a piece of this chocolate can be enjoyed when you have a sweet craving.                ', '                    N.A.                                                    ', '1', '270', '', '1', NULL, NULL, NULL, '2', '', '131.png', '', '', '', '', '', ''),
(54, 21, '30', '', 'Nuhair Serum', '0', 'Brand Name: Origo\nNuhair Revitalizing serum is a revolutionary product that fights hair loss and thinning hair with all-natural DHT blockers. Nuhair Products for hair loss are with the latest medical breakthroughs for the treatment of hair loss in men and', ' N.A.                                   ', '1', '1450', '', '2', NULL, NULL, NULL, '2', '', '16.png', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_productimage`
--

DROP TABLE IF EXISTS `fynx_productimage`;
CREATE TABLE IF NOT EXISTS `fynx_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_size`
--

DROP TABLE IF EXISTS `fynx_size`;
CREATE TABLE IF NOT EXISTS `fynx_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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

DROP TABLE IF EXISTS `fynx_sizechart`;
CREATE TABLE IF NOT EXISTS `fynx_sizechart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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

DROP TABLE IF EXISTS `fynx_subcategory`;
CREATE TABLE IF NOT EXISTS `fynx_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `fynx_subcategory`
--

INSERT INTO `fynx_subcategory` (`id`, `category`, `name`, `order`, `status`, `image1`, `image2`) VALUES
(1, 1, 'Protein Snacks', '1', '2', '121.png', ''),
(2, 1, 'Evening Snacks', '2', '2', '', ''),
(3, 1, 'Cookies', '3', '2', '', ''),
(4, 1, 'Nuts', '4', '2', '15.png', ''),
(5, 1, 'Fibre Rich', '5', '2', '', ''),
(6, 1, 'Flavoured Teas', '6', '2', '', ''),
(7, 1, 'Fat Burner', '7', '2', '', ''),
(8, 1, 'Chocolates', '8', '2', '', ''),
(9, 2, 'Multi Vitamins', '9', '2', '1.png', ''),
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
(36, 2, 'Joint Health', '', '2', '', ''),
(37, 2, 'Brain Health', '', '2', '', ''),
(38, 1, 'Nuts', '', '2', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_type`
--

DROP TABLE IF EXISTS `fynx_type`;
CREATE TABLE IF NOT EXISTS `fynx_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subcategory` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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

DROP TABLE IF EXISTS `fynx_useraddress`;
CREATE TABLE IF NOT EXISTS `fynx_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `shippingaddress` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_wishlist`
--

DROP TABLE IF EXISTS `fynx_wishlist`;
CREATE TABLE IF NOT EXISTS `fynx_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `fynx_wishlist`
--

INSERT INTO `fynx_wishlist` (`id`, `user`, `product`, `timestamp`, `design`) VALUES
(7, 7, '3', '2015-12-12 07:32:15', '1');

-- --------------------------------------------------------

--
-- Table structure for table `logintype`
--

DROP TABLE IF EXISTS `logintype`;
CREATE TABLE IF NOT EXISTS `logintype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `linktype` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `isactive` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

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
(8, 'Subscribe\r\n', '', '', 'site/viewsubscribe\r\n\r\n', 1, 0, 1, 8, 'icon-dashboard'),
(9, 'Contact us\n\n', '', '', 'site/viewcontact\r\n\r\n', 1, 0, 1, 9, 'icon-dashboard'),
(10, 'Testimonials', '', '', 'site/viewtestimonial\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(11, 'Orders\n', '', '', 'site/vieworder\r\n\r\n', 1, 0, 1, 6, 'icon-dashboard'),
(30, 'Designer\n', '', '', 'site/viewdesigner\n', 1, 0, 1, 30, 'icon-dashboard'),
(37, 'Type\n', '', '', 'site/viewtype\r\n', 1, 0, 1, 37, 'icon-dashboard'),
(40, 'Offer\n', '', '', 'site/viewoffer\r\n\r\n', 1, 0, 1, 40, 'icon-dashboard'),
(41, 'Color\n', '', '', 'site/viewcolor\r\n\r\n', 1, 0, 1, 41, 'icon-dashboard'),
(43, 'Size Chart\r\n\r\n', '', '', 'site/viewsizechart\r\n\r\n\r\n', 1, 0, 1, 43, 'icon-dashboard'),
(46, 'Config\r\n\r\n', '', '', 'site/viewconfig\r\n\r\n\r\n', 1, 0, 1, 46, 'icon-dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `menuaccess`
--

DROP TABLE IF EXISTS `menuaccess`;
CREATE TABLE IF NOT EXISTS `menuaccess` (
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
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE IF NOT EXISTS `orderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `productdesignimage`
--

DROP TABLE IF EXISTS `productdesignimage`;
CREATE TABLE IF NOT EXISTS `productdesignimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `design` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `productdesignimage`
--

INSERT INTO `productdesignimage` (`id`, `product`, `design`, `image`) VALUES
(1, 5, 6, '61fWioKx9aL._SX522__5.jpg'),
(2, 3, 6, 'Apparels_banners.jpg'),
(3, 3, 4, 'b11.jpg'),
(4, 1, 2, 'images_(1)1.jpg'),
(5, 1, 3, 'sunspel-charcoal-melange-short-sleeve-crew-neck-tshirt-product-1-14847455-259387527.jpeg'),
(6, 1, 2, 'whitetshirt.png'),
(7, 1, 3, 'images.jpg'),
(8, 1, 3, 'red.jpg'),
(9, 11, 0, 'braillestill11.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `relatedproduct`
--

DROP TABLE IF EXISTS `relatedproduct`;
CREATE TABLE IF NOT EXISTS `relatedproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `relatedproduct` int(11) NOT NULL,
  `design` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `relatedproduct`
--

INSERT INTO `relatedproduct` (`id`, `product`, `relatedproduct`, `design`) VALUES
(14, 1, 2, '0'),
(15, 1, 3, '0'),
(16, 1, 6, '0'),
(19, 1, 7, '0');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `timestamp`) VALUES
(1, 'wohlig@wohlig.com', '2016-01-30 11:44:48');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE IF NOT EXISTS `testimonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `weight` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `shippingline3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`) VALUES
(1, 'wohlig', 'a63526467438df9566c508027d9cb06b', 'wohlig@wohlig.com', 1, '0000-00-00 00:00:00', 1, 'images_(2)1.jpg', '', '', 'Facebook', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, '21ab923fa748c1d2d9a6e92c108b243b', 'rohanwohlig@gmail.com', 3, '2016-01-24 15:54:43', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, '1cdc0584659d6b15fb3111dcd7a90243', 'roah@flak.com', 3, '2016-01-25 08:11:31', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, 'a4021e130b1b574c1beb686b6e17e759', 'rohanwohlig1@gmail.com', 3, '2016-01-25 11:45:49', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, '6d0dfc99d66476ab4d0a2d52c2ec2a8f', 'manan@ting.in', 3, '2016-01-25 13:25:33', 2, NULL, '', '', '', '', 'Manan', 'Vora', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, '18ec5cdce0bd7593efb424c54572594e', 'roahasudh@gskjd.com', 3, '2016-01-25 13:27:02', 2, NULL, '', '', '', '', 'Rohan', 'gSUHdxsa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, '408df9a5508a87b6948f06b6cf116364', 'oiadid@gmail.com', 3, '2016-01-25 13:32:17', 2, NULL, '', '', '', '', 'Rohan', 'soadioasi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, 'b89959732d40915da06b11bc7e649442', 'gadarohaaan17@gmail.com', 3, '2016-01-25 13:33:50', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, 'e913ad031442da382062555aa2789699', 'rohan103@gmail.com', 3, '2016-01-25 13:35:24', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, '21ab923fa748c1d2d9a6e92c108b243b', 'rohhan@gmial.com', 3, '2016-01-25 13:37:54', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, '45f800702dce35ac363dc2dbfede04ba', 'ofidsofisdo@gmail.com', 3, '2016-01-25 13:40:42', 2, NULL, '', '', '', '', 'rohan', 'gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, 'e6b7355e284de01a055ff9d5034cabe5', 'daoadiaso@gmail.com', 3, '2016-01-25 13:41:49', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, 'e6b7355e284de01a055ff9d5034cabe5', 'a@gmail.com', 3, '2016-01-25 13:41:59', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, 'f3d44ea927f92736380dc0083963bda2', 'gadarohan17@gmail.com', 3, '2016-01-26 05:50:23', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'rohanwohlig2@gmail.com', 3, '2016-01-26 12:22:21', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, 'e10adc3949ba59abbe56e057f20f883e', 'harshthakkar46@gmail.com', 3, '2016-01-26 12:29:30', 2, NULL, '', '', '', '', 'Harsh', 'Thakkar', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, '6d0dfc99d66476ab4d0a2d52c2ec2a8f', 'manan@tingmail.in', 3, '2016-01-26 16:22:32', 2, NULL, '', '', '', '', 'Manan', 'Vora', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(34, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '', 3, '2016-01-30 10:19:59', 2, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(35, NULL, '3677b23baa08f74c28aba07f0cb6554e', 'jagruti@wohlig.com', 3, '2016-01-30 10:20:03', 2, NULL, '', '', '', '', 'jagruti', 'patil', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(36, NULL, 'a63526467438df9566c508027d9cb06b', 'rohangada17@gmail.com', 3, '2016-02-02 05:49:21', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onuser` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
