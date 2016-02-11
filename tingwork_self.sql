-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 11, 2016 at 03:50 AM
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
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `fynx_cart`
--

INSERT INTO `fynx_cart` (`id`, `user`, `quantity`, `product`, `timestamp`, `design`, `json`, `status`) VALUES
(4, 17, 1, '1', '2016-01-25 11:46:45', '', '', 0),
(5, 17, 3, '2', '2016-01-25 11:54:26', '', '', 0),
(6, 15, 1, '1', '2016-01-25 12:07:47', '', '', 0),
(18, 30, 1, '6', '2016-01-26 05:53:11', '', '', 0),
(19, 30, 1, '8', '2016-01-26 05:53:24', '', '', 0),
(20, 30, 1, '5', '2016-01-26 05:53:28', '', '', 0),
(21, 30, 3, '13', '2016-01-26 06:06:57', '', '', 0),
(22, 30, 1, '16', '2016-01-26 06:09:57', '', '', 0),
(24, 15, 1, '16', '2016-01-26 09:50:30', '', '', 0),
(25, 15, 1, '5', '2016-01-26 09:53:22', '', '', 0),
(33, 32, 3, '7', '2016-01-26 15:15:27', '', '', 0),
(49, 15, 1, '43', '2016-01-27 06:52:19', '', '', 0),
(53, 35, 7, '6', '2016-01-30 12:03:01', '', '', 0),
(54, 36, 3, '4', '2016-02-02 05:50:24', '', '', 0),
(55, 36, 2, '12', '2016-02-02 05:50:14', '', '', 0),
(56, 36, 2, '10', '2016-02-02 05:50:17', '', '', 0),
(58, 1, 0, '', '2016-02-08 05:26:11', '', '', 0),
(59, 35, 0, '', '2016-02-08 05:30:40', '', '', 0),
(62, 35, 0, '23', '2016-02-08 05:41:50', '', '', 3),
(63, 40, 0, '5', '2016-02-08 05:42:30', '', '', 3),
(64, 40, 1, '2', '2016-02-08 06:15:27', '', '', 0),
(65, 40, 1, '5', '2016-02-08 06:17:22', '', '', 0),
(66, 35, 0, '19', '2016-02-08 06:23:42', '', '', 3),
(67, 35, 0, '7', '2016-02-08 06:28:14', '', '', 3),
(68, 35, 0, '123', '2016-02-08 06:32:28', '', '', 3),
(77, 1, 4, '4', '2016-02-11 09:04:00', '', '', 0),
(79, 38, 2, '44', '2016-02-11 07:13:30', '', '', 0),
(80, 1, 2, '1', '2016-02-11 07:33:13', '', '', 0),
(81, 1, 1, '2', '2016-02-11 07:32:05', '', '', 0),
(82, 1, 0, '18', '2016-02-11 07:36:12', '', '', 3),
(83, 46, 0, '6', '2016-02-11 08:15:52', '', '', 3),
(84, 46, 1, '1', '2016-02-11 08:20:50', '', '', 0),
(85, 46, 0, '10', '2016-02-11 08:25:13', '', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_category`
--

DROP TABLE IF EXISTS `fynx_category`;
CREATE TABLE IF NOT EXISTS `fynx_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fynx_category`
--

INSERT INTO `fynx_category` (`id`, `order`, `name`, `description`, `parent`, `status`, `image1`, `image2`) VALUES
(1, 1, 'FOOD MUNCHIES & BEVERAGES', 'We have created a whole range of healthy, delicious and low-calorie snacks for those “4 o’clock cravings”. The best part is that all these munchies are guilt-free versions of your favourite snacks.                              ', '', '2', '121.png', 'apple.jpg'),
(2, 2, 'VITAMINS & MINERALS', 'We provide a range of essential vitamins & minerals specially curated by our nutritionists after personally trying and testing each product to ensure that we only give our clients products that meet our “sky-high expectations.                        ', '', '2', '19.png', 'vitaminsandminerals.jpg'),
(3, 3, 'PROTEIN SUPPLEMENT', 'We provide a range a protein powders and bars to suit your pre and post workout needs. We ensure that the protein bars are well balanced and can work as meal replacements when you are on the go.', '', '2', '23.png', 'protiensandsupplements.jpg'),
(4, 4, 'BOOKS & GADGETS', 'From Suman Agarwal’s best-selling cookbooks to the most effective and easy-to-do workout DVD’s, we have everything you need to ensure you meet your diet and fitness goals. ', '', '2', '15.png', 'booksandgadgets.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `fynx_homeslide`
--

INSERT INTO `fynx_homeslide` (`id`, `name`, `description`, `link`, `sorder`, `target`, `status`, `image`, `template`, `class`, `text`, `centeralign`) VALUES
(5, 'Meet Suman Agarwal', '                                                                                                                        ', '#/meet', 0, '0', '1', 'Home_banners_2000x8671.jpg', '0', '0', '0', '0'),
(6, 'Health Management', '                                                            ', '#/healthmanagement', 0, '0', '1', '02_Home_banners_2000x867.jpg', '0', '0', '0', '0'),
(10, 'Visit E-Store', '                                                            ', '#/healthproducts/1', 0, '0', '2', '03_Home7.jpg', '0', '0', '0', '0'),
(15, 'Cool Sculpting', '                                        ', '#/coolsculpting', 0, '0', '2', '04_Home6.jpg', '0', '0', '0', '0'),
(16, 'Online Programs', '                                        ', '', 0, '0', '2', '07_Home4.jpg', '0', '0', '0', '0'),
(17, 'Super Kids', '                                        ', '', 0, '0', '2', '05_Home6.jpg', '0', '0', '0', '0'),
(18, 'About Selfcare', '                                                            ', '', 0, '0', '2', '06_Home5.jpg', '0', '0', '0', '0');

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
  `nb_bid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=159 ;

--
-- Dumping data for table `fynx_order`
--

INSERT INTO `fynx_order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`, `nb_bid`) VALUES
(53, 0, 'sohan', '', '', '', '', '', '', '', '', 'Mumbai', 'chunabhatti', '', '', '24053390', 'Maharashtra', '400022', '', '', '', '1', '2016-01-27 04:55:05', '', '', '', '', '', '', '', NULL, ''),
(54, 0, 'sohan', '', '', '', '', '', '', '', '', 'Mumbai', 'chunabhatti', '', '', '24053390', 'Maharashtra', '400022', '', '', '', '1', '2016-01-27 04:55:08', '', '', '', '', '', '', '', NULL, ''),
(55, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-27 06:49:12', '', '', '', '', '', '', '', NULL, ''),
(56, 0, 'Rohan', '', 'rohanwohlig@gmail.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852963', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 06:49:13', '', '', '', '', '', '', '', NULL, ''),
(57, 0, 'Rohan', '', 'rohanwohlig@gmail.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852963', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 06:49:13', '', '', '', '', '', '', '', NULL, ''),
(58, 0, 'Rohan', '', 'rohanwohlig@gmail.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852963', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 06:53:12', '', '', '', '', '', '', '', NULL, ''),
(59, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-27 07:19:23', '', '', '', '', '', '', '', NULL, ''),
(60, 0, 'ROhan', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '74108520963.', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 07:19:23', '', '', '', '', '', '', '', NULL, ''),
(61, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-27 08:02:33', '', '', '', '', '', '', '', NULL, ''),
(62, 0, 'Rohan', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'Mumbai', '140/A-101,Navkar Co-op Housing Society, Jawahar  Nagar, Road No. 9, Goregaon(West).', '', '', '741852', 'Maharashtra', '400062', '', '', '', '1', '2016-01-27 08:02:35', '', '', '', '', '', '', '', NULL, ''),
(63, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 07:10:52', '', '', '', '', '', '', '', NULL, ''),
(64, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 07:10:53', '', '', '', '', '', '', '', NULL, ''),
(65, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 09:41:23', '', '', '', '', '', '', '', NULL, ''),
(66, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 09:41:24', '', '', '', '', '', '', '', NULL, ''),
(67, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 09:56:57', '', '', '', '', '', '', '', NULL, ''),
(68, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 09:56:58', '', '', '', '', '', '', '', NULL, ''),
(69, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 09:59:21', '', '', '', '', '', '', '', NULL, ''),
(70, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 09:59:22', '', '', '', '', '', '', '', NULL, ''),
(71, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 12:15:12', '', '', '', '', '', '', '', NULL, ''),
(72, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:15:12', '', '', '', '', '', '', '', NULL, ''),
(73, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 12:39:45', '', '', '', '', '', '', '', NULL, ''),
(74, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:39:48', '', '', '', '', '', '', '', NULL, ''),
(75, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:43:09', '', '', '', '', '', '', '', NULL, ''),
(76, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-02 12:45:57', '', '', '', '', '', '', '', NULL, ''),
(77, 0, 'jagruti patil', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', 'varadvinayak soc', '', '', '09898989898', 'maharashtra', '421201', '', '', '', '1', '2016-02-02 12:45:58', '', '', '', '', '', '', '', NULL, ''),
(78, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:06:00', '', '', '', '', '', '', '', NULL, ''),
(79, 0, '', '', 'wohlig@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:06:01', '', '', '', '', '', '', '', NULL, ''),
(80, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:34:41', '', '', '', '', '', '', '', NULL, ''),
(81, 0, '', '', 'jagruti@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:34:42', '', '', '', '', '', '', '', NULL, ''),
(82, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:46:41', '', '', '', '', '', '', '', NULL, ''),
(83, 0, '', '', 'jagruti@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:46:42', '', '', '', '', '', '', '', NULL, ''),
(84, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:48:30', '', '', '', '', '', '', '', NULL, ''),
(85, 0, '', '', 'jagruti@wohlig.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:48:31', '', '', '', '', '', '', '', NULL, ''),
(86, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:54:34', '', '', '', '', '', '', '', NULL, ''),
(87, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'kjlk', '', '', '', '', 'lkjlin', '', '', '', '', '1', '2016-02-04 05:54:35', '', '', '', '', '', '', '', NULL, ''),
(88, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 05:59:23', '', '', '', '', '', '', '', NULL, ''),
(89, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 05:59:23', '', '', '', '', '', '', '', NULL, ''),
(90, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 06:05:43', '', '', '', '', '', '', '', NULL, ''),
(91, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 06:05:43', '', '', '', '', '', '', '', NULL, ''),
(92, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 06:43:20', '', '', '', '', '', '', '', NULL, ''),
(93, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 06:43:21', '', '', '', '', '', '', '', NULL, ''),
(94, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 06:44:51', '', '', '', '', '', '', '', NULL, ''),
(95, 0, 'jagruti', '', 'jagruti@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 06:44:51', '', '', '', '', '', '', '', NULL, ''),
(96, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 06:51:53', '', '', '', '', '', '', '', NULL, ''),
(97, 0, 'jagruti', '', 'patiljagruti181@gmail.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 06:51:54', '', '', '', '', '', '', '', NULL, ''),
(98, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 07:22:22', '', '', '', '', '', '', '', NULL, ''),
(99, 0, 'jagruti', '', 'patiljagruti181@gmail.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 07:22:23', '', '', '', '', '', '', '', NULL, ''),
(100, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 07:40:11', '', '', '', '', '', '', '', NULL, ''),
(101, 0, 'jagruti', '', 'patiljagruti181@gmail.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 07:40:12', '', '', '', '', '', '', '', NULL, ''),
(102, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 07:55:29', '', '', '', '', '', '', '', NULL, ''),
(103, 0, 'jagruti', '', 'patiljagruti181@gmail.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 07:55:30', '', '', '', '', '', '', '', NULL, ''),
(104, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 07:56:29', '', '', '', '', '', '', '', NULL, ''),
(105, 0, 'jagruti', '', 'patiljagruti181@gmail.com', '', '', '', '', '', '', 'jh', '', '', '', '', 'kjhk', '', '', '', '', '1', '2016-02-04 07:56:29', '', '', '', '', '', '', '', NULL, ''),
(106, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 08:00:51', '', '', '', '', '', '', '', NULL, ''),
(107, 0, 'jagruti', '', 'patiljagruti181@gmail.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 08:00:52', '', '', '', '', '', '', '', NULL, ''),
(108, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 08:01:46', '', '', '', '', '', '', '', NULL, ''),
(109, 0, 'jagruti', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 08:01:47', '', '', '', '', '', '', '', NULL, ''),
(110, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 08:16:18', '', '', '', '', '', '', '', NULL, ''),
(111, 0, 'jagruti', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 08:16:19', '', '', '', '', '', '', '', NULL, ''),
(112, 0, 'jagruti', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 08:25:15', '', '', '', '', '', '', '', NULL, ''),
(113, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 08:27:52', '', '', '', '', '', '', '', NULL, ''),
(114, 0, 'jagruti', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 08:27:52', '', '', '', '', '', '', '', NULL, ''),
(115, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-04 09:25:35', '', '', '', '', '', '', '', NULL, ''),
(116, 0, 'jagruti', '', 'wohlig@wohlig.com', '', '', '', '', '', '', 'thane', '', '', '', '', 'maharashtra', '', '', '', '', '1', '2016-02-04 09:25:36', '', '', '', '', '', '', '', NULL, ''),
(117, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-06 06:14:19', '', '', '', '', '', '', '', '', ''),
(118, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-06 06:14:22', 'varadvinayak soc', 'kjhkj', 'kjhkj', 'varadvinayak soc', 'kjhkj', 'kjhkj', '', '', ''),
(119, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-06 06:23:37', 'varadvinayak soc', 'khkj', 'kjhkj', 'varadvinayak soc', 'khkj', 'kjhkj', '', '', ''),
(120, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-06 06:58:27', '', '', '', '', '', '', '', '', ''),
(121, 0, 'dfghjk', 'fghjkl', 'wohlig@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-02-06 06:58:28', 'fghjkl;', 'fghjkl;', 'dfghjkl', 'fghjkl;', 'fghjkl;', 'dfghjkl', '', '', ''),
(122, 0, 'dfghjk', 'fghjkl', 'wohlig@wohlig.com', '', '', 'dfghjkl', 'Maharashtra', '400022', 'India', 'dfghjkl', '', '', 'India', '', 'Maharashtra', '400022', '', '', '', '1', '2016-02-06 06:58:28', 'fghjkl;', 'fghjkl;', 'dfghjkl', 'fghjkl;', 'fghjkl;', 'dfghjkl', '', '', ''),
(123, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-06 07:33:25', '', '', '', '', '', '', '', '', ''),
(124, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-06 07:33:26', 'varadvinayak soc', 'kjh', 'kjhkjh', 'varadvinayak soc', 'kjh', 'kjhkjh', '', '', ''),
(125, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-06 07:42:22', '', '', '', '', '', '', '', '', ''),
(126, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-06 07:42:23', 'varadvinayak soc', 'hkj', 'khkj', 'varadvinayak soc', 'hkj', 'khkj', '', '', ''),
(127, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-08 11:12:47', '', '', '', '', '', '', '', '', ''),
(128, 35, 'Jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-08 11:12:48', 'B 808 Sambhavnath Towers, Sudha Park', 'khkj', 'kjhkj', 'B 808 Sambhavnath Towers, Sudha Park', 'khkj', 'kjhkj', '', '', ''),
(129, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 10:01:11', '', '', '', '', '', '', '', '', ''),
(130, 1, 'amit', 'verma', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 10:01:12', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(131, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 10:06:30', '', '', '', '', '', '', '', '', ''),
(132, 1, 'amit', 'verma', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 10:06:31', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(133, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 11:13:15', '', '', '', '', '', '', '', '', ''),
(134, 1, 'amit', 'verma', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 11:13:16', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(135, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 12:57:51', '', '', '', '', '', '', '', '', ''),
(136, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 12:57:53', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(137, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:04:53', '', '', '', '', '', '', '', '', ''),
(138, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 13:04:53', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(139, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:15:59', '', '', '', '', '', '', '', '', ''),
(140, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 13:15:59', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(141, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:18:15', '', '', '', '', '', '', '', '', ''),
(142, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 13:18:17', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(143, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:18:47', '', '', '', '', '', '', '', '', ''),
(144, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 13:18:48', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(145, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:29:39', '', '', '', '', '', '', '', '', ''),
(146, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 13:29:39', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(147, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:30:10', '', '', '', '', '', '', '', '', ''),
(149, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-10 13:31:45', '', '', '', '', '', '', '', '', ''),
(150, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-10 13:31:45', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(151, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-11 05:16:12', '', '', '', '', '', '', '', '', ''),
(152, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-11 05:16:13', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(153, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-11 05:19:45', '', '', '', '', '', '', '', '', ''),
(154, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-11 05:19:45', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(155, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-11 05:28:29', '', '', '', '', '', '', '', '', ''),
(156, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '1', '2016-02-11 05:28:30', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', '', '', ''),
(157, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-02-11 05:35:33', '', '', '', '', '', '', '', '', ''),
(158, 1, 'amit', 'verma', 'wohlig@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'India', 'thane', '', '', 'India', '', 'maharashtra', '421201', '', '', '', '5', '2016-02-11 05:36:36', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj', 'CCADB1CKA569', '', '');

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
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `fynx_orderitem`
--

INSERT INTO `fynx_orderitem` (`id`, `discount`, `order`, `product`, `quantity`, `price`, `finalprice`, `design`, `status`) VALUES
(25, 0, 20, 1, 1, 800, 800, 6, 0),
(26, 0, 20, 1, 1, 800, 800, 6, 0),
(27, 0, 24, 6, 1, 150, 150, 0, 0),
(28, 0, 24, 8, 1, 250, 250, 0, 0),
(29, 0, 24, 5, 1, 325, 325, 0, 0),
(30, 0, 24, 13, 3, 195, 585, 0, 0),
(31, 0, 24, 16, 1, 245, 245, 0, 0),
(32, 0, 25, 7, 1, 150, 150, 0, 0),
(33, 0, 29, 1, 1, 150, 150, 0, 0),
(34, 0, 29, 16, 1, 245, 245, 0, 0),
(35, 0, 29, 5, 1, 325, 325, 0, 0),
(36, 0, 31, 1, 1, 150, 150, 0, 0),
(37, 0, 31, 16, 1, 245, 245, 0, 0),
(38, 0, 31, 5, 1, 325, 325, 0, 0),
(39, 0, 46, 7, 3, 150, 450, 0, 0),
(40, 0, 47, 1, 3, 150, 150, 0, 0),
(41, 0, 47, 2, 2, 150, 450, 0, 0),
(42, 0, 48, 1, 3, 150, 150, 0, 0),
(43, 0, 48, 2, 2, 150, 450, 0, 0),
(44, 0, 49, 1, 3, 150, 150, 0, 0),
(45, 0, 49, 2, 2, 150, 450, 0, 0),
(46, 0, 50, 1, 3, 150, 150, 0, 0),
(47, 0, 50, 2, 2, 150, 450, 0, 0),
(48, 0, 51, 1, 3, 150, 150, 0, 0),
(49, 0, 51, 2, 2, 150, 450, 0, 0),
(50, 0, 51, 44, 1, 100, 100, 0, 0),
(51, 0, 52, 1, 3, 150, 150, 0, 0),
(52, 0, 52, 2, 2, 150, 450, 0, 0),
(53, 0, 52, 44, 1, 100, 100, 0, 0),
(54, 0, 53, 1, 2, 150, 300, 0, 0),
(55, 0, 54, 1, 2, 150, 300, 0, 0),
(56, 0, 56, 1, 1, 150, 150, 0, 0),
(57, 0, 56, 16, 1, 245, 245, 0, 0),
(58, 0, 56, 5, 1, 325, 325, 0, 0),
(59, 0, 57, 1, 1, 150, 150, 0, 0),
(60, 0, 57, 16, 1, 245, 245, 0, 0),
(61, 0, 57, 5, 1, 325, 325, 0, 0),
(62, 0, 58, 1, 1, 150, 150, 0, 0),
(63, 0, 58, 16, 1, 245, 245, 0, 0),
(64, 0, 58, 5, 1, 325, 325, 0, 0),
(65, 0, 58, 43, 1, 100, 100, 0, 0),
(66, 0, 60, 11, 1, 154, 154, 0, 0),
(67, 0, 62, 7, 4, 150, 600, 0, 0),
(68, 0, 64, 3, 3, 150, 450, 0, 0),
(69, 0, 64, 6, 7, 150, 150, 0, 0),
(70, 0, 66, 1, 1, 150, 150, 0, 0),
(71, 0, 68, 1, 1, 150, 150, 0, 0),
(72, 0, 70, 1, 1, 150, 150, 0, 0),
(73, 0, 72, 1, 1, 150, 150, 0, 0),
(74, 0, 74, 1, 1, 150, 150, 0, 0),
(75, 0, 75, 2, 1, 150, 150, 0, 0),
(76, 0, 77, 2, 1, 150, 150, 0, 0),
(77, 0, 77, 5, 1, 325, 325, 0, 0),
(78, 0, 79, 12, 1, 650, 650, 0, 0),
(79, 0, 81, 8, 1, 250, 250, 0, 0),
(80, 0, 83, 2, 1, 150, 150, 0, 0),
(81, 0, 85, 2, 1, 150, 150, 0, 0),
(82, 0, 87, 2, 1, 150, 150, 0, 0),
(83, 0, 89, 2, 1, 150, 150, 0, 0),
(84, 0, 91, 2, 1, 150, 150, 0, 0),
(85, 0, 93, 2, 1, 150, 150, 0, 0),
(86, 0, 95, 2, 1, 150, 150, 0, 0),
(87, 0, 97, 3, 3, 150, 450, 0, 0),
(88, 0, 97, 6, 7, 150, 150, 0, 0),
(89, 0, 99, 3, 3, 150, 450, 0, 0),
(90, 0, 99, 6, 7, 150, 150, 0, 0),
(91, 0, 101, 3, 3, 150, 450, 0, 0),
(92, 0, 101, 6, 7, 150, 150, 0, 0),
(93, 0, 103, 3, 3, 150, 450, 0, 0),
(94, 0, 103, 6, 7, 150, 150, 0, 0),
(95, 0, 105, 3, 3, 150, 450, 0, 0),
(96, 0, 105, 6, 7, 150, 150, 0, 0),
(97, 0, 107, 3, 3, 150, 450, 0, 0),
(98, 0, 107, 6, 7, 150, 150, 0, 0),
(99, 0, 109, 8, 1, 250, 250, 0, 0),
(100, 0, 111, 3, 1, 150, 150, 0, 0),
(101, 0, 112, 3, 1, 150, 150, 0, 0),
(102, 0, 114, 3, 1, 150, 150, 0, 0),
(103, 0, 116, 3, 1, 150, 150, 0, 0),
(104, 0, 118, 3, 1, 150, 150, 0, 0),
(105, 0, 119, 3, 1, 150, 150, 0, 0),
(106, 0, 121, 3, 1, 150, 150, 0, 0),
(107, 0, 122, 3, 1, 150, 150, 0, 0),
(108, 0, 124, 3, 1, 150, 150, 0, 0),
(109, 0, 126, 12, 1, 650, 650, 0, 0),
(110, 0, 128, 23, 0, 28500, 0, 0, 0),
(111, 0, 128, 19, 0, 17500, 0, 0, 0),
(112, 0, 128, 7, 0, 18500, 0, 0, 0),
(113, 0, 128, 123, 0, 17900, 0, 0, 0),
(114, 0, 128, 6, 7, 150, 1050, 0, 0),
(115, 0, 130, 1, 1, 150, 150, 0, 0),
(116, 0, 130, 2, 1, 150, 150, 0, 0),
(117, 0, 132, 1, 1, 150, 150, 0, 0),
(118, 0, 132, 2, 1, 150, 150, 0, 0),
(119, 0, 134, 1, 1, 150, 150, 0, 0),
(120, 0, 134, 2, 1, 150, 150, 0, 0),
(121, 0, 136, 1, 1, 150, 150, 0, 0),
(122, 0, 136, 2, 1, 150, 150, 0, 0),
(123, 0, 138, 1, 1, 150, 150, 0, 0),
(124, 0, 138, 2, 1, 150, 150, 0, 0),
(125, 0, 140, 4, 1, 325, 325, 0, 0),
(126, 0, 142, 4, 1, 325, 325, 0, 0),
(127, 0, 144, 4, 1, 325, 325, 0, 0),
(128, 0, 146, 4, 1, 325, 325, 0, 0),
(129, 0, 148, 4, 1, 325, 325, 0, 0),
(130, 0, 150, 4, 1, 325, 325, 0, 0),
(131, 0, 152, 4, 1, 325, 325, 0, 0),
(132, 0, 154, 4, 1, 325, 325, 0, 0),
(133, 0, 156, 4, 1, 325, 325, 0, 0),
(134, 0, 158, 4, 1, 325, 325, 0, 0);

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
  `about` longtext NOT NULL,
  `nutritionalvalue` longtext NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `fynx_product`
--

INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `weight`, `name`, `type`, `about`, `nutritionalvalue`, `visibility`, `price`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountprice`) VALUES
(1, 1, '95', '200', 'Limbu chana', '0', '<p style="text-align: justify;"><span class="s1">Lemony crunchy chanas are everyone&rsquo;s favourite and it goes well with your evening tea and drinks. This chana is a good source of protein, soluble fiber and iron.</span></p>\n<p style="text-align: justify;">This product is Gluten Free and Low Fat.</p>', '<div class="tdtitle">\n<table>\n<tbody>\n<tr>\n<td style="text-align: center;" width="166">\n<p>Nutritional Values</p>\n</td>\n<td style="text-align: center;" width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p style="text-align: center;">per 25 gms</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>371.0</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>92.7</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>18.4</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>4.6</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>69.4</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>17.3</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>2.1</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0.5</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>172.2</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>43.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>7.0</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>1.7</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n<td style="text-align: right;" width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>\n</div>\n<div class="tablerow">\n<div class="tablecol1">&nbsp;</div>\n<div class="tablecol1">&nbsp;</div>\n</div>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '121.png', '', '', '', '', '', ''),
(2, 1, '95', '200 ', 'Poodina chana', '0', '<p class="p1" style="text-align: justify;"><span class="s1">Minty crunchy chanas are everyone&rsquo;s favorite and it goes well with your evening tea and drinks. This chana is a good source of protein, soluble fiber and iron.</span></p>\n<p class="p1" style="text-align: justify;">This product is Gluten Free and Low Fat.</p>', '<p>&nbsp;</p>\n<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>per 25 gms</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>371.0</p>\n</td>\n<td width="166">\n<p>92.7</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>18.4</p>\n</td>\n<td width="166">\n<p>4.6</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>69.4</p>\n</td>\n<td width="166">\n<p>17.3</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>2.1</p>\n</td>\n<td width="166">\n<p>0.5</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>172.2</p>\n</td>\n<td width="166">\n<p>43.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>7.0</p>\n</td>\n<td width="166">\n<p>1.7</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '19.png', '', '', '', '', '', ''),
(3, 1, '100', '200', 'Tangy chana', '0', '<p class="p1" style="text-align: justify;"><span class="s1">Crunchy chanas with a tangy twist are everyone&rsquo;s favorite and it goes well with your evening tea and drinks. This chana is a good source of protein, soluble fiber and iron.</span></p>', '<p>N.A.</p>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '23.png', '', '', '', '', '', ''),
(4, 1, '90', '500', 'Moong dal khakhra', '0', '<p style="text-align: justify;">Loaded with protein, fiber and the goodness of potassium and B-vitamins, the Moong Daal Khakra is a gluten-free snack and perfect for weight-watchers and those who love this crispy Indian flat-bread.&nbsp;</p>\n<p style="text-align: justify;">Moong Daal Khakra is gently spiced with pepper and ajwain, light and easy to digest, so that you enjoy a wholesome meal without worrying about calorie intake.</p>\n<p style="text-align: justify;">This product is Gluten Free and Low Fat.</p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>2 Khakras</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>469.0</p>\n</td>\n<td width="166">\n<p>171.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>23.0</p>\n</td>\n<td width="166">\n<p>8.3</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>46.4</p>\n</td>\n<td width="166">\n<p>17.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>21.0</p>\n</td>\n<td width="166">\n<p>7.6</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>707.0</p>\n</td>\n<td width="166">\n<p>257.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '325', '', '1', NULL, NULL, NULL, '2', '', '15.png', '', '', '', '', '', ''),
(5, 1, '100', '500', 'Mix - Dal Khakhra', '0', '<p class="p1" style="text-align: justify;"><span class="s1">The staple snack of the Gujarati community may be healthy, light and yummy to eat, but Khakras are not a good idea if you are watching your weight or your calorie intake because of the high oil content of these roasted crisps.</span></p>\n<p class="p2" style="text-align: justify;"><span class="s1">But do try the Selfcare Mixed Daal Khakra. Made with the multiple protein-filled goodness of five of all Indian kitchen&rsquo;s important pulses: Moong Dal, Chana Dal, Urad Dal, Moth and Chawli -- this Mixed Daal Khakra is an all time favourite because it is roasted oil-free. It is a gluten-free snack, also. Light, crisp and chatpata, this is one khakra you&rsquo;ll crave for.</span></p>\n<p class="p2" style="text-align: justify;"><span class="s1">This product is Gluten Free and Low Fat.</span></p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>2 Khakras</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>460.0</p>\n</td>\n<td width="166">\n<p>167.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>22.6</p>\n</td>\n<td width="166">\n<p>8.2</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>49.4</p>\n</td>\n<td width="166">\n<p>18.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>19.6</p>\n</td>\n<td width="166">\n<p>6.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>1060.0</p>\n</td>\n<td width="166">\n<p>386.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '325', '', '1', NULL, NULL, NULL, '2', '', '14.png', '', '', '', '', '', ''),
(6, 1, '100', '150', 'Chana Jor', '0', '<p class="p1" style="text-align: justify;">Chana Jor, which is made from flattened and roasted chickpeas, has all the health benefits of eating chickpeas: a unique supply of anti-oxidants, magnesium, soluble fiber, vitamins and valuable potassium.</p>\n<p class="p1" style="text-align: justify;"><span class="s1">Tangy and crunchy, this high-protein snack can be eaten by diabetics because it stabilizes blood sugar. Baked not roasted or deep-fried, this low fat snack is as authentic as the street food original, but with lesser calories.</span></p>\n<p class="p1" style="text-align: justify;"><span class="s1">This product is Gluten Free and Low Fat.</span></p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>per 25 gms</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>360.0</p>\n</td>\n<td width="166">\n<p>90.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>10.6</p>\n</td>\n<td width="166">\n<p>2.6</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>75.8</p>\n</td>\n<td width="166">\n<p>18.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>1.6</p>\n</td>\n<td width="166">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>27.1</p>\n</td>\n<td width="166">\n<p>6.8</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>1.5</p>\n</td>\n<td width="166">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>23.7</p>\n</td>\n<td width="166">\n<p>5.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>4.2</p>\n</td>\n<td width="166">\n<p>1.1</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>1238.8</p>\n</td>\n<td width="166">\n<p>308.7</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '4.png', '', '', '', '', '', ''),
(7, 2, '100', '150', 'Jowar munch', '0', '<p class="p1" style="text-align: justify;">That tiny grain called Jowar is packed with essential nutrients like Vitamins B and E, magnesium, fiber, and iron along with other valuable antioxidants. Our food researcher know that consumption of jowar is beneficial in preventing common cardiovascular disease, helps to fight cholesterol responsible for blood coagulation and high blood pressure and is beneficial in weight loss because it keeps the body feeling full for longer periods of time.</p>\n<p class="p1" style="text-align: justify;"><span class="s1">Our Jowar Munch is not only full of the health benefits of this grain, it is mixed with melon seeds spices, black salt, gram dal,<span class="Apple-converted-space">&nbsp; </span>pudina powder, tomato seasoning and saffola rice bran that makes it a good healthy snack.</span></p>\n<p class="p1" style="text-align: justify;"><span class="s1">This product is Gluten Free and Low Fat.</span></p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>per 25 gms</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>403.0</p>\n</td>\n<td width="166">\n<p>100.8</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>17.5</p>\n</td>\n<td width="166">\n<p>4.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>61.9</p>\n</td>\n<td width="166">\n<p>15.5</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>9.5</p>\n</td>\n<td width="166">\n<p>2.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>70.2</p>\n</td>\n<td width="166">\n<p>17.6</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>1.1</p>\n</td>\n<td width="166">\n<p>0.3</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>1.7</p>\n</td>\n<td width="166">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>8.5</p>\n</td>\n<td width="166">\n<p>2.1</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>1228.7</p>\n</td>\n<td width="166">\n<p>307.2</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '11.png', '', '', '', '', '', ''),
(8, 2, '100', '200', 'Bajra rings', '0', '<p class="p1" style="text-align: justify;"><span class="s1">If there is one grain that contains disease-fighting phytochemicals and antioxidants it is the humble bajra or the English Millet. Our spicey-sweet Bajra rings, with the additional goodness of sesame and curd, make a crunchy treat with a cup of hot chai. Combining the fine qualities of cholesterol-lowering, fiber-filled goodness that Bajra contains, this tasty snack is also full of iron, magnesium, copper and zinc, and vitamins E and B-complex.</span></p>\n<p class="p1" style="text-align: justify;"><span class="s1">Snack on this crisp, baked, biscuit-like treat without the fear of adding to those extra calories.</span></p>\n<p class="p1" style="text-align: justify;"><span class="s1">This product is Gluten Free and Low Fat.</span></p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>Per 20 gms</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>360.0</p>\n</td>\n<td width="166">\n<p>90.0</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>10.6</p>\n</td>\n<td width="166">\n<p>2.6</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>75.8</p>\n</td>\n<td width="166">\n<p>18.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>1.6</p>\n</td>\n<td width="166">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>27.1</p>\n</td>\n<td width="166">\n<p>6.8</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>1.5</p>\n</td>\n<td width="166">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>23.7</p>\n</td>\n<td width="166">\n<p>5.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>4.2</p>\n</td>\n<td width="166">\n<p>1.1</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>1238.8</p>\n</td>\n<td width="166">\n<p>308.7</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '250', '', '1', NULL, NULL, NULL, '2', '', '3.png', '', '', '', '', '', ''),
(9, 38, '100', '100', '4''O clock nut munch', '0', '<p class="p1" style="text-align: justify;"><span class="s1">We have for you a perfect mix of nuts and fruits so you Munch Right in the evening! The good quality fats and proteins present in this mixture will give you the perfect satiety you require for your snack time, which will impede you from binging!</span></p>\n<p class="p1" style="text-align: justify;"><span class="s1">This product is Gluten Free and Low Fat.</span></p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>20g</p>\n</td>\n<td width="166">\n<p>100g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy</p>\n</td>\n<td width="166">\n<p>506kcal</p>\n</td>\n<td width="166">\n<p>101kcal</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Total Fat</p>\n</td>\n<td width="166">\n<p>35g</p>\n</td>\n<td width="166">\n<p>7g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>37g</p>\n</td>\n<td width="166">\n<p>7.4g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Dietary Fibre</p>\n</td>\n<td width="166">\n<p>2.0g</p>\n</td>\n<td width="166">\n<p>0.4g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sugars</p>\n</td>\n<td width="166">\n<p>22.0g</p>\n</td>\n<td width="166">\n<p>5.4g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>15.0g</p>\n</td>\n<td width="166">\n<p>3.0g</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '175', '', '1', NULL, NULL, NULL, '2', '', '24.png', '', '', '', '', '', ''),
(10, 8, '100', '', 'Dark Chocolate Bar', '0', '<p style="text-align: justify;">Here is something for dark chocolate lovers. It has no added sugar dark and it is diabetic friendly.</p>', '<p>N.A.</p>', '1', '270', '', '1', NULL, NULL, NULL, '2', '', '9.png', '', '', '', '', '', ''),
(11, 32, '100', '', 'Chew 60 K', '0', '<p style="text-align: justify;">It is a chewable tablet for curing your vitamin deficiency with delicious orange flavor unlike tablets or powder.</p>', '<p>N.A.</p>', '1', '154', '', '2', NULL, NULL, NULL, '2', '', '52.png', '', '', '', '', '', ''),
(12, 8, '100', '', 'Choco-nut discs', '0', '<p style="text-align: justify;">Can''t go away with your chocolate cravings? Try our sinful chocolate discs studded with nutritious nuts and dried fruits!!</p>\n<p style="text-align: justify;">This product is Gluten Free and Low Fat.</p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>Per 11g</p>\n</td>\n<td width="166">\n<p>Per 100g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy</p>\n</td>\n<td width="166">\n<p>59 kcal</p>\n</td>\n<td width="166">\n<p>529 kcal</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>0.6g</p>\n</td>\n<td width="166">\n<p>5.6g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>6.0g</p>\n</td>\n<td width="166">\n<p>54.53g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>3.5g</p>\n</td>\n<td width="166">\n<p>32.0g</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '650', '', '1', NULL, NULL, NULL, '2', '', '6.png', '', '', '', '', '', ''),
(13, 0, '100', '', 'Cinnamon Apple Tea', '0', '<h3><span class="black">Brand Name:</span>&nbsp;TE-A-ME</h3>\n<p style="text-align: justify;">Cinnamon has shown an amazing ability to stop medication-resistant yeast infections. This tea gives you a refreshing and soothing effect!</p>', '<p>N.A.</p>', '1', '195', '', '1', NULL, NULL, NULL, '2', '', 'Cinnamon_Apple_tea.png', '', '', '', '', '', ''),
(14, 6, '100', '', 'Cranberry Apple Tea', '0', '<h3><span class="black">Brand Name:</span>&nbsp;TE-A-ME</h3>\n<p style="text-align: justify;">Delightfully refreshing with a lively tatse of cranberry. It is also known to prevent bladder infection.</p>', '<p>N.A.</p>', '1', '195', '', '1', NULL, NULL, NULL, '2', '', 'Cranberry_apple_tea.png', '', '', '', '', '', ''),
(15, 5, '100', '300', 'Functional Fiber', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Nutrova</h3>\n<p>&nbsp;</p>\n<p class="p1" style="text-align: justify;"><span class="s1">Nutrova Functional Fibre contains a blend of soluble and insoluble dietary fibre derived from natural sources. Dietary Fibre has been shown to play an important role in Maintaining blood sugar levels,Decreasing cholesterol and triglyceride levels, Improving digestive health. Nutrova Functional Fibre is formulated using natural extracts. A specially formulated combination of high pure dietary fibre from natural sources, including debitterized soluble fibre from Fenugreek (Methi) seeds and insoluble fibre from a Gluten Free Wheat fibre extract. There are no added flavours, preservatives or colours. The product does not cause any side effects. Recommended dosage is 1 spoonful 30 minutes prior to meals for 2-3 meals or as been prescribed by health care provider.</span></p>', '<p>N.A.</p>', '1', '800', '', '1', NULL, NULL, NULL, '2', '', 'Functional_Fiber.png', '', '', '', '', '', ''),
(16, 0, '100', '100', 'Fybur: Instant fiber soup', '0', '<h3><span class="black">Brand Name:</span> Gold standard</h3>\n<p>Whey Protein islolates are 90% pure protein by weight. They are the purest and most expensive form of whey protein that exists. That''s why they are the first ingredients you read on the 100% Whey Protein label. By using Whey Protein Isolates as our primary protein source, we''re able to pack 23 grams of the purest, muscle-building protein per serving, and a lot less of the fat, cholesterol, lactose, and other stuff you can do without. There''s no question this is the standard by which other whey proteins are measured.</p>\n<p>Brand Name: Unived</p>\n<p>It&rsquo;s a low calorie, high fiber instant soup that lowers cholesterol, regulates sugar, manages weight and relieves constipation.</p>\n<ul>\n<li>5 grams of soluble &amp; insoluble fibers</li>\n<li>Clinically proven benefits related to cholesterol, sugar &amp; weight control</li>\n<li>Natural, vegetarian &amp; vegan friendly ingredients &ndash; free of artificial colors, additives, &amp; preservatives &nbsp;</li>\n<li>All in a great tasting flavor &ndash; Tangy Tomato</li>\n</ul>\n<h3>&nbsp;</h3>\n<p style="text-align: justify;">&nbsp;</p>', '', '1', '245', '', '1', NULL, NULL, NULL, '2', '', 'Fyburn_Instat_fiber_soup.png', '', '', '', '', '', ''),
(17, 6, '100', '', 'Honey Lemon Green Tea', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span>&nbsp;TE-A-ME</h3>\n<p style="text-align: justify;">Renew your body, mind and spirit with this balanced blend of green tea leaves, lemon zest and soothing honey; an age-old recipe to cleanse your body and add vitality.</p>', '<p>N.A.</p>', '1', '125', '', '1', NULL, NULL, NULL, '2', '', 'Honey_leomon_green_tea.png', '', '', '', '', '', ''),
(18, 6, '100', '', 'Kashmiri Kahwa Tea', '0', '<h3><span class="black">Brand Name:</span>&nbsp;TE-A-ME</h3>\n<p style="text-align: justify;">Uplift yourself with the heavenly flavours of Kashmir; sweet spices blended with natural green tea leaves to create a feeling of bliss overflowing in every cup. A cup of rich-in-anti-oxidant Green tea and REAL spices.</p>', '<p>N.A.</p>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', 'Kashmiri_Kahwa.png', '', '', '', '', '', ''),
(19, 6, '100', '', 'Mint geen Tea', '0', '<h3><span class="black">Brand Name:</span>&nbsp;TE-A-ME</h3>\n<p style="text-align: justify;">Revive yourself with a crisp, top-of-the-world feeling of minty freshness, finely blended with natural green tea leaves.</p>', '<p>N.A.</p>', '1', '125', '', '1', NULL, NULL, NULL, '2', '', 'Mint_green_tea.png', '', '', '', '', '', ''),
(20, 7, '100', '', 'Obicure Tea', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Emcure</h3>\n<ul>\n<li style="text-align: justify;">Natural<strong>&nbsp;''Fat Burner''</strong>&nbsp;formula made of&nbsp;<strong>''Selective Herbs''</strong>&nbsp;like Green tea, Hoodia, Ginger, Garcinia Combogia and Piperine.</li>\n<li style="text-align: justify;"><strong>Green Tea</strong>&nbsp;&ndash; Contains a component called EGCG [EpigalloCatechin Gallate] which has a proven significant effect on Fat Oxidation; Best Composition of Anti-Oxidants.</li>\n<li style="text-align: justify;"><strong>Ginger</strong>&nbsp;- helps improve digestion AND metabolism.</li>\n<li style="text-align: justify;"><strong>Garcinia Combogia</strong>&nbsp;- boosts BMR of the body.</li>\n<li style="text-align: justify;"><strong>Piperine</strong>&nbsp;&ndash; has a potential for fat reduction and lipid lowering effect. Helps to increase thermogenic activity as it increases body&rsquo;s metabolic rate, which helps in fat loss. Improves production of serotonin, a neurotransmitter that enhances mood &amp; relieves pain.</li>\n</ul>', '<p>N.A.</p>', '1', '420', '', '1', NULL, NULL, NULL, '2', '', 'Obicure_tea.png', '', '', '', '', '', ''),
(22, 6, '100', '', 'Tulsi green Tea', '0', '<p style="text-align: justify;">Restore yourself with this healing blend of natural green tea leaves and the sacred herb Tulsi, revered for over 5000 years as the "Mother Medicine of Nature". Present day medical research confirms Tulsi''s unmatched healing properties, thanks to phytonutrients and antioxidants that aid immunity, metabolism, energy and overall good health.</p>', '<p>N.A.</p>', '1', '125', '', '1', NULL, NULL, NULL, '2', '', 'Tulsi_green_tea.png', '', '', '', '', '', ''),
(23, 9, '100', '', 'ABC Plus', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p style="text-align: justify;">A multi-vitamin and multi-mineral formula with the addition of beta carotene, lutein and lycopene. Provides all round nutritional support for adults in a convenient one-a-day caplet.</p>', '<p>N.A.</p>', '1', '1495', '', '2', NULL, NULL, NULL, '2', '', 'ABC_Plus.png', '', '', '', '', '', ''),
(24, 16, '100', '', 'Age Fly', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Advanced formula with Resveratrol and Grape seed. Anti aging resveratrol can be used as a preventive measure, allowing you to retain your youthful appearance, rather than regain it.<br /> <br /> Grape seed extract contain polyphenols (flavonoids) that are known for their high antioxidant activity that help your body against the free radical damage!</p>', '<p>N.A.</p>', '1', '1850', '', '2', NULL, NULL, NULL, '2', '', 'Age_Fly.png', '', '', '', '', '', ''),
(25, 0, '100', '', 'Apple Cider Vinegar', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Nature''s Bounty Original Apple Cider Vinegar contrains Chromium, ApplePectin and&nbsp;Vitamin B-6. Chromium helps to promote sugar metabolism while Apple Pectin is a natural soluble fiber well known for its nutritional goodness. Vitamin B-6 supports protein and energy metabolism.</p>', '<p>N.A.</p>', '1', '1500', '', '2', NULL, NULL, NULL, '2', '', 'Apple_Cider_Vinegar.png', '', '', '', '', '', ''),
(26, 10, '100', '2500 mcg', 'B-12', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p style="text-align: justify;">Naturally Cherry Flavor tablets Aids in normal development and the regeneration of red blood cells Contributes to proper metabolic functioning and nervous system health.</p>', '<p>N.A.</p>', '1', '945', '', '2', NULL, NULL, NULL, '2', '', 'B-12_2500_mcg.png', '', '', '', '', '', ''),
(27, 14, '100', '', 'Cal-D-veg', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Unived</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Cal-D-veg is a 100%&nbsp;natural high&nbsp;absorption formula to keep bones strong and healthy</p>\n<p style="text-align: justify;">Essential for individuals suffering from&nbsp;osteoporosis and low&nbsp;bone density</p>\n<p style="text-align: justify;">Prevents calcification of arteries &amp; promotes elasticity of blood vessels, and it''s ideal for pregnant and breastfeeding&nbsp;women</p>', '<p>N.A.</p>', '1', '660', '', '2', NULL, NULL, NULL, '2', '', 'Cal-D-veg.png', '', '', '', '', '', ''),
(28, 0, '100', '', 'Colox', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Unived</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Unived has developed a very effective formulation using a blend of standardized extracts of three natural indigenous herbs &ndash;Boswellia serrata&nbsp;(Shallaki),&nbsp;Curcuma longa&nbsp;(Turmeric), andWithania somnifera&nbsp;(Ashwagandha). This completely natural, herbal, and vegan solution helps strengthen the cartilage, reduce inflammation, and increase flexibility, effective on osteoarthritis and rheumatoid arthritis, helps in maintaining healthy cartilages and connective tissues, relieves pain, swelling, stiffness, and supports free movements of all joints, increases energy and improves overall health.</p>', '<p>N.A.</p>', '1', '1300', '', '2', NULL, NULL, NULL, '2', '', 'Colox.png', '', '', '', '', '', ''),
(29, 12, '100', '', 'Complete Omega 3: Lemon Flavour', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Nutrova</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">A 100% vegetarian source of the long chain Omega 3 fatty acid DHA, derived from marine algae. DHA is an important structural component of cells in the brain and retina and has a number of demonstrated health benefits including:&nbsp;</p>\n<p style="text-align: justify;">Improved cholesterol status<br />Anti inflammatory effects<br />Improved cardiovascular health</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '<p>N.A.</p>', '1', '1200', '', '2', NULL, NULL, NULL, '2', '', 'Complete_Omega_3.png', '', '', '', '', '', ''),
(30, 9, '100', '', 'Daily Active Multiple', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Zenith Nutrition</h3>\n<p style="text-align: justify;">Contains 25 vital nutrients, vitmains and minerals. Provides specially designed multivitamin formulas that allow you to address health concerns most relevant to you.</p>', '<p>N.A.</p>', '1', '840', '', '2', NULL, NULL, NULL, '2', '', 'Daily_Active_Multiple.png', '', '', '', '', '', ''),
(31, 11, '100', '500mg', 'Ester-C 500mg', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Introducing a Non-Ascorbic based Vitamin-C for the first time! Suitable for people who suffer from&nbsp;acidity regularly and cannot take the ascorbic based Vitamin-C supplements. Improves your immunity and helps in your wound healing process.</p>', '<p>N.A.</p>', '1', '949', '', '2', NULL, NULL, NULL, '2', '', 'Ester-C_500mg.png', '', '', '', '', '', ''),
(32, 11, '100', '', 'Ester-C 1000mg', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">You need your immune system working at its best all the time. That''s why there''s Ester-C<sup>&reg;</sup>, The Better Vitamin C<sup>&reg;</sup>.<br /> Ester-C<sup>&reg;</sup>&nbsp;is a unique, exclusive form of Vitamin C designed to stay in your white blood cells for 24-hours, providing you with around-the-clock immune system support.* Ester-C<sup>&reg;</sup>&nbsp;is non-acidic and stomach friendly, so you can take it all year long to support your heart, skin, gums and antioxidant health, too.* After all, you don''t want your immune system unsupported when you need it most.</p>', '<p>N.A.</p>', '1', '1799', '', '2', NULL, NULL, NULL, '2', '', 'Ester_C-1000_mg.png', '', '', '', '', '', ''),
(33, 0, '100', '', 'Fab Slim', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Advanced formula with Garcinia, Green tea and Chromium, which help with suppressing your appetite, prevent fat from being made and produced while increasing that "feel good" feeling!</p>', '<p>N.A.</p>', '1', '1760', '', '2', NULL, NULL, NULL, '2', '', 'Fab_Slim.png', '', '', '', '', '', ''),
(34, 12, '100', '', 'Fish oil 1000mg', '0', '<h3><span class="black">Brand Name: Natures Bounty</span></h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Cholesterol free fish oil contains EPA and DHA, two omega-3 fatty acids that help support and maintain the health of your cardiovascular system, plus naturally-occurring omega-6 fatty acids.* Omega-3 fatty acids are considered one of the "good" fats important for cellular, heart and metabolic health, and help maintain triglyceride levels already within a normal range.* In addition, research has found a positive association between omega-3 fish oil intake and a positive mood.* Supportive but not conclusive research shows that consumption of EPA and DHA omega-3 fatty acids may reduce the risk of coronary heart disease.</p>\n<p>No artificial color, flavor or sweetener, preservatives, sugar, starch, milk, lactose, gluten, wheat, yeast, or shellfish</p>\n<p>Cholesterol and sodium free</p>\n<p>Purified to eliminate mercury</p>', '<p>N.A.</p>', '1', '1395', '', '2', NULL, NULL, NULL, '2', '', 'Fish_oil_1000mg.png', '', '', '', '', '', ''),
(35, 17, '100', '', 'Garcinia plus 500mg', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Garcinia Cambogia aids you in your weight loss efforts by also providing a well-being boost into your lifestyle. Taken within an active and health-conscious context, Garcinia has the ability to improve one&rsquo;s mood and help lose weight safely and efficiently.<br /> <br />In view of its focus on emotional eating, Garcinia proves to be a strong ally against stress-triggered, mindless eating, a common culprit for weight loss sabotaging.Garcinia assists you in weight loss will at the same time helping you have an improved overall disposition.</p>', '<p>N.A.</p>', '1', '850', '', '2', NULL, NULL, NULL, '2', '', 'Garcinia_plus_500mg.png', '', '', '', '', '', ''),
(36, 0, '100', '', 'Ginko Biloba (Zenith)', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Helps to improve blood circulation. It is often used for memory disorders, poor conentration problems and other problems related to poor blood flow in the body.</p>', '<p>N.A.</p>', '1', '1220', '', '2', NULL, NULL, NULL, '2', '', 'Ginko_Biloba_(Zenith).png', '', '', '', '', '', ''),
(37, 13, '100', '', 'Iron 65 mg', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Contains the Iron you need each day for proper functioning Supports women''s health and energy utilization Vegetarian tablets play a role in delivering oxygen to the cells</p>', '<p>N.A.</p>', '1', '699', '', '2', NULL, NULL, NULL, '2', '', 'Iron_65_mg.png', '', '', '', '', '', ''),
(38, 20, '100', '', 'Melatonin', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Melatonin works in harmony with your natural sleep cycle to nutritionally support sound sleep.<br /><br />Alternative sleep aid for occasional sleeplessness.<br /><br />Supports a relaxed mood &ndash; which promotes restful sleep.<br /><br />Our tablets are an excellent choice for vegetarians.</p>', '<p>N.A.</p>', '1', '899', '', '2', NULL, NULL, NULL, '2', '', 'Melatonin.png', '', '', '', '', '', ''),
(39, 17, '100', '150', 'Obicure Gel', '0', '<h3>Brand Name: Emcure</h3>\n<ul>\n<li style="text-align: justify;">Stimulates microcirculation</li>\n<li style="text-align: justify;">Quickly penetrates into Skin</li>\n<li style="text-align: justify;">Reduces cellulite</li>\n<li style="text-align: justify;">Softens nourishes &amp; refreshes skin</li>\n<li style="text-align: justify;">Reduces body stretch marks</li>\n<li style="text-align: justify;">Strengthens skin elasticity</li>\n</ul>', '<p>N.A.</p>', '1', '392', '', '2', NULL, NULL, NULL, '2', '', 'Obicure_Gel.png', '', '', '', '', '', ''),
(40, 19, '100', '', 'Probiotic blend', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Helps in maintaining healthy digestive system.Thus, improving GI immunity. Probiotics are bacterial cultures which promote healthy intestinal activity, good digestion and colon regularity.</p>', '<p>N.A.</p>', '1', '920', '', '2', NULL, NULL, NULL, '2', '', 'Probiotic_blend.png', '', '', '', '', '', ''),
(41, 0, '100', '100', 'Stocon', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Nirwana Wellness</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Nirwana Stomach Cleanser in a 100% natural laxative made from natural herbs and medicinal plants grown on the farms of Nirwana Herbal Healthcare at Kalesar and Yamunanagar, Haryana. It guarantees a thorough cleansing of the stomach by releasing toxins and undigested food by lubricating the mucus membrane. Feel the difference within a few days and experience a lightness of being. Curing acidity, Flatulence and chronic constipation, regular consumption will repair the mucus membrane of the intestine and rectum. Recommended also for those who have irregular food habits and who eat large portions of non-vegetarian food. Young weight watchers too will be delighted to see fat dissolve from the stomach area.</p>', '<p>N.A.</p>', '1', '204', '', '2', NULL, NULL, NULL, '2', '', 'Stocon_(100_gms).png', '', '', '', '', '', ''),
(42, 32, '100', '', 'Vitamin D3', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span> ZENITH NUTRITION&nbsp;</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<table border="0" width="100%" cellspacing="0" cellpadding="0" align="left">\n<tbody>\n<tr>\n<td align="left">\n<p>Vitamin D is a fat-soluble vitamin that is naturally present in very few foods, added to others, and available as a dietary supplement. It is also produced endogenously when ultraviolet rays from sunlight strike the skin and trigger vitamin D synthesis. Vitamin D obtained from sun exposure, food, and supplements is biologically inert and must undergo two hydroxylations in the body for activation. The first occurs in the liver and converts vitamin D to 25-hydroxyvitamin D [25(OH)D], also known as calcidiol. The second occurs primarily in the kidney and forms the physiologically active 1,25-dihydroxyvitamin D [1,25(OH)<sub>2</sub>D], also known as calcitriol.<br />&nbsp;</p>\n<p><br /><strong><em>Vital for calcium absorption and the maintenance of healthy bones and teeth.</em></strong><br /><em><strong>Supports cellular health and proper nervous system and immune function.</strong></em></p>\n</td>\n</tr>\n</tbody>\n</table>', '<p>N.A.</p>', '1', '1495', '', '2', NULL, NULL, NULL, '2', '', 'Vitamin_D3_5000_IU.png', '', '', '', '', '', ''),
(43, 0, '100', '75 gms', 'Max Protein Choco Fudge', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Rite Bite</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Rich in cocoa, the bar has got a dominating nutty flavor forming a perfect choice for chocolate lovers. It is a meal replacement bar. Indulge in this fudgy delight, balanced with nutritional benefits!</p>', '<p>N.A.</p>', '1', '100', '', '3', NULL, NULL, NULL, '2', '', 'Max_Protien_Choco_Fudge.png', '', '', '', '', '', ''),
(44, 0, '100', '67 gms', 'Max Protein Choco Slim', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span>&nbsp;Rite Bite</h3>\n<p style="text-align: justify;">This sugar free bar has a sweet candied taste of chocolate brownie. It contains hi-protein &amp; low carbs; thus, making it a healthy snack. For best results consume it post workout sessions.</p>', '<p>N.A.</p>', '1', '100', '', '3', NULL, NULL, NULL, '2', '', 'Max_Protien_Choco_Slim.png', '', '', '', '', '', ''),
(45, 0, '100', '', 'Jane Fonda: Walk-Out DVD', '0', '<h3 style="text-align: left;"><span class="black">Brand Name:</span>&nbsp;DVD''s</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Walking burns a lot of Calories and Slims the waistline, while also improves brain function and increase both heart and lung health. This DVD includes two one-mile walking workout that are simple, fun and fat burning. Stick with this and do walkout regularly. Remember its never too late to start.</p>', '<p>N.A.</p>', '1', '299', '', '4', NULL, NULL, NULL, '2', '', 'Jane_Fonda_Walk-Out_DVD.png', '', '', '', '', '', ''),
(46, 0, '100', '', 'Jillian Michaels: Banish Fat Boost Metabolism', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span> DVD''s</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Fire up your metabolism with Banish Fat Boost Metabolism and loose big with fierce formula that adds strength and ab moves to dynamic cardio for increased fat loss.This 40 minute circuit workout blasts your heart rate with challenging intervals to turn up the burn and melt off the pounds.</p>', '<p>N.A.</p>', '1', '299', '', '4', NULL, NULL, NULL, '2', '', 'Jillian_Michaels_Banish_Fat_Boost_Metabolism.png', '', '', '', '', '', ''),
(47, 0, '100', '', 'Jillian Michaels: Yoga Meltdown DVD', '0', '<h3><span class="black">Brand Name:</span>&nbsp;DVD''s</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Yoga Meltdown includes two complete 30-minute workouts. Begin with Level 1 and then progress to Level 2 for a more intense burn to gain strength and lose serious weight. So get up, get moving, and lose big now.</p>', '<p>N.A.</p>', '1', '299', '', '4', NULL, NULL, NULL, '2', '', 'Jillian_Michaels_Yoga_Meltdown_DVD.png', '', '', '', '', '', ''),
(48, 0, '100', '', 'Tanita weighing scale', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span> Tanita</h3>\n<div class="clr30" style="text-align: justify;">&nbsp;</div>\n<p style="text-align: justify;">Tanita Body Fat / Body Water Monitor uses Bioelectric Impedance Analysis (BIA), the same accurate technology found in our professional body composition analyzers used by doctors, medical centers, professional athletic teams, fitness clubs, and personal trainers. Electrodes in the foot sensor pads send a low, safe signal through the body. The signal passes with less resistance through the fluids contained in muscle tissue, but encounters more resistance when passing through fat tissue, which contains little water. By using the impedance reading, gender, height, and weight, the scale can quickly and reliably calculate body fat and total body water percentages.</p>', '<p>N.A.</p>', '1', '4199', '', '4', NULL, NULL, NULL, '2', '', 'Tanita_weighing_scale.png', '', '', '', '', '', ''),
(49, 4, '100', '200', 'Nut Pouch', '0', '<p style="text-align: justify;">We have for you easy to carry pouch while you&rsquo;re on the go with a perfect mix of nuts and fruits so you Munch Right in the evening! The good quality fats and proteins present in this mixture will give you the perfect satiety you require for your snack time, which will impede you from binging!</p>\n<p style="text-align: justify;">This product is Gluten Free and Low Fat.</p>', '<p>&nbsp;</p>\n<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>20g</p>\n</td>\n<td width="166">\n<p>100g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy</p>\n</td>\n<td width="166">\n<p>506kcal</p>\n</td>\n<td width="166">\n<p>101kcal</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Total Fat</p>\n</td>\n<td width="166">\n<p>35g</p>\n</td>\n<td width="166">\n<p>7g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>37g</p>\n</td>\n<td width="166">\n<p>7.4g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Dietary Fibre</p>\n</td>\n<td width="166">\n<p>2.0g</p>\n</td>\n<td width="166">\n<p>0.4g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sugars</p>\n</td>\n<td width="166">\n<p>22.0g</p>\n</td>\n<td width="166">\n<p>5.4g</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>15.0g</p>\n</td>\n<td width="166">\n<p>3.0g</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '300', '', '1', NULL, NULL, NULL, '2', '', '18.png', '', '', '', '', '', ''),
(51, 3, '100', '', 'Cranberry & Oat Cookies', '0', '<p style="text-align: justify;">Favorite snack for sweet lovers. It&rsquo;s is fiber rich, heart healthy and a tea time snack.</p>', '<p>N.A.</p>', '1', '200', '', '1', NULL, NULL, NULL, '2', '', '8.png', '', '', '', '', '', ''),
(52, 0, '100', '', 'I-fair', '0', '<p style="text-align: justify;">I - fair is combination of anti oxidants including glutathione, vitamin C, vitamin E, Alpha lipoic Acid, Grape seed Extract. I - fair helps make skin smoother with a more even tone, gives a rosy white glow and delays aging. Continuous and consistent supplementation will result into gradual skin lightening until you reach the skin tone you desire. results vary from skin type to skin type.</p>', '<p>N.A.</p>', '1', '6500', '', '2', NULL, NULL, NULL, '2', '', '101.png', '', '', '', '', '', ''),
(53, 8, '100', '', 'Milk Chocolate Bar', '0', '<p style="text-align: justify;">A sweet substitute for your fruit. It has no added sugar and a piece of this chocolate can be enjoyed when you have a sweet craving.</p>', '<p>N.A.</p>', '1', '270', '', '1', NULL, NULL, NULL, '2', '', '131.png', '', '', '', '', '', ''),
(54, 0, '100', '', 'Nuhair Serum', '0', '<h3><span class="black">Brand Name:</span> Origo</h3>\n<div class="clr30">&nbsp;</div>\n<p>Nuhair Revitalizing serum is a revolutionary product that fights hair loss and thinning hair with all-natural DHT blockers. Nuhair Products for hair loss are with the latest medical breakthroughs for the treatment of hair loss in men and women. They use scientifically proven natural ingredients to help promote new hair growth and decrease thinning hair</p>', '<p>N.A.</p>', '1', '1450', '', '2', NULL, NULL, NULL, '2', '', '110.png', '', '', '', '', '', ''),
(55, 0, '100', '50', 'Workout Bar', '0', '<h3><span class="black">Brand Name:</span> Rite Bite</h3>\n<div class="clr30">&nbsp;</div>\n<p style="text-align: justify;">Rite Bite Work-Out bar is a great tasting nutrition bar. This bar is blended with 20% Protein, 21 Vitamins &amp; Minerals, High in Fiber, Electrolytes and Amino Acids like L Glutamine, Creatine and more. It is a delicious power packed bar made of Soy Nuggets, Whey Protein and goodness of nuts over a bed of chocolate. It is formulated by nutrition experts to give you an edge to perform at your best.</p>\n<p>.</p>', '<p>N.A.</p>', '1', '50', '', '3', NULL, NULL, NULL, '2', '', 'Workout_Bar.png', '', '', '', '', '', ''),
(57, 0, '100', '1lbs', 'Whey Protein Powder 1Lbs (Gold Standard)', '0', '<h3><span class="black">Brand Name:</span> Gold standard</h3>\n<div class="clr30">&nbsp;</div>\n<p>Whey Protein islolates are 90% pure protein by weight. They are the purest and most expensive form of whey protein that exists. That''s why they are the first ingredients you read on the 100% Whey Protein label. By using Whey Protein Isolates as our primary protein source, we''re able to pack 23 grams of the purest, muscle-building protein per serving, and a lot less of the fat, cholesterol, lactose, and other stuff you can do without. There''s no question this is the standard by which other whey proteins are measured.</p>', '<p>N.A.</p>', '1', '1849', '', '3', NULL, NULL, NULL, '2', '', 'Whey_protein_powder_1lbs.png', '', '', '', '', '', ''),
(58, 0, '100', '2lbs', 'Whey Protein Powder 2Lbs', '0', '<h3><span class="black">Brand Name:</span> Gold standard</h3>\n<div class="clr30">&nbsp;</div>\n<p>Whey Protein islolates are 90% pure protein by weight. They are the purest and most expensive form of whey protein that exists. That''s why they are the first ingredients you read on the 100% Whey Protein label. By using Whey Protein Isolates as our primary protein source, we''re able to pack 23 grams of the purest, muscle-building protein per serving, and a lot less of the fat, cholesterol, lactose, and other stuff you can do without. There''s no question this is the standard by which other whey proteins are measured.</p>', '', '1', '3699', '', '3', NULL, NULL, NULL, '2', '', 'Whey_protein_powder_2lbs.png', '', '', '', '', '', ''),
(59, 0, '100', '500', 'Whey Protein 500gms', '0', '<h3><span class="black">Brand Name:</span> Bodyfuelz</h3>\n<p>&nbsp;</p>\n<p>BODYFUELZ 100% Whey Protein is a great tasting whey protien made from a blend of Whey protein concentrates, micro-filtered Whey isolates- as a primary source and strategically hydrolysed Whey peptides with less fat, cholesterol and lactose content.</p>\n<p>23.7gms of pure whey protein<br />Over 7.8gms of BCAA<br />Over 4.9gms of glutamine precursors<br />Fortified with digestive enzymes<br />Low in carbohydrates and fat<br />Mixes instantly</p>', '', '1', '1749', '', '3', NULL, NULL, NULL, '2', '', 'Whey_Protein_500gms.png', '', '', '', '', '', '');
INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `weight`, `name`, `type`, `about`, `nutritionalvalue`, `visibility`, `price`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountprice`) VALUES
(60, 21, '100', '', 'Nuhair Plus', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Origo</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Nuhair is a capsule of Saw Palmetto, Biotin, multi Vitamin and Multi minerals for healthy and stronger hair. Nuhair contains Saw Palmetto which is a natural DHT inhibitor and all the vitamins and minerals which are necessary for keeping hair healthy and strong from inside. Nu Hair also helps in treating thyroid deficiency.<br /> <br /> Saw palmetto (also known as sabal palmetto) is a reddish brown-to-black berry growing on a 6''-8" palm tree (Serenoa repens). The fruit of this palm have been part of the diet of natives of the southeastern U.S. for hundreds of years.</p>', '<p>N.A.</p>', '1', '590', '', '2', NULL, NULL, NULL, '2', '', '161.png', '', '', '', '', '', ''),
(61, 0, '100', '', 'Q-veg', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span>&nbsp;Unived</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Coenzyme Q10 is one of the most important compounds found in each of our body cells. This fat-soluble vitamin like coenzyme is a component of the electron transport chain. It plays a key role in producing cellular energy in the form of ATP, by participating in aerobic cellular respiration. This way the Q10 Coenzyme is involved in the synthesis of up to 95% of our body&rsquo;s energy.</p>\n<p style="text-align: justify;">As an integral component of the human cellular structure, the coenzyme contributes to the human health in many ways. Vital organs consuming high energy levels such as heart, lungs, and kidneys have the highest concentration of Coenzyme Q10. These depend upon the benefits of its functional relevance for their optimum performance.&nbsp; The benefits of CoQ10 include its anti-oxidant properties that boost the heart&rsquo;s functioning, our immune system and overall energy levels and stamina.</p>\n<p style="text-align: justify;">As our age progresses beyond 20 years, CoQ10 levels continue to deplete, leaving our body in need of supplements. Also, among those using cholesterol-lowering drugs (statins), the levels drop at a faster rate depriving our body from the much-needed benefits of the Coenzyme. Supplements of CoQ10 thus become an important component of a healthy life. They help by replenishing its requisite levels in the body.</p>\n<p style="text-align: justify;">Supplements of CoQ10 are available in three types. Those derived from bacteria, tobacco and natural yeast. Some supplements of CoQ10, derived from tobacco and bacteria contain impurities due to their structural difference in comparison to the naturally found coenzyme of our body. Natural supplements, derived from fermentation are bio identical and make for a healthy replacement for the naturally occurring CoQ10 in our bodies.</p>\n<p style="text-align: justify;">Unived uses KanekaQ10&trade; &ndash; a 100% natural, single bond, fermented CoQ10 that is bio-identical to the CoQ10 produced within the body. Kaneka&rsquo;s uncompromising commitment to its quality over the past 30 years has made KanekaQ10&trade; the industry standard in CoQ10.</p>', '<p>N.A.</p>', '1', '1800', '', '2', NULL, NULL, NULL, '2', '', 'Q-veg.png', '', '', '', '', '', ''),
(62, 16, '100', '', 'Amino Collagen', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Meiji</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Meiji Amino Collagen is made from high quality, low-molecular collagen peptide. Three more ingredients that add to the effectiveness of collagen are:</p>\n<ol>\n<li style="text-align: justify;">Arginine: A type of amino acid, essential for maintaining healthy skin.</li>\n<li style="text-align: justify;">Vitamin C: An essential vitamin that supports collagen.</li>\n<li style="text-align: justify;">Glucosamine: A raw material for hyaluronic acid, which helps maintain the skin&rsquo;s moisture.</li>\n</ol>\n<p style="text-align: justify;">The recommended daily intake is 5000mg of collagen. One leveled spoon of Meiji Amino Collagen gives you the daily-required amount for a healthy, supple and glowing skin.</p>', '<p>N.A.</p>', '1', '1800', '', '2', NULL, NULL, NULL, '2', '', 'Amino_Collagen.png', '', '', '', '', '', ''),
(63, 0, '100', '', 'Soft DB', '0', '<h3><span class="black">Brand Name: Softech Pharma Pvt Ltd</span></h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Tired with your rising blood glucose levels? Soft-DB is a unique formulation to support healthy blood glucose levels.</p>', '<p>N.A.</p>', '1', '525', '', '2', NULL, NULL, NULL, '2', '', '20.png', '', '', '', '', '', ''),
(64, 0, '100', '', 'Stress Fly', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Advanced formula with Ashwagandha and Ginseng. Ashwagandha soothes and calms down the stressed mind and nerves. It helps in relieving nervous exhaustion, brain fag, loss of memory and loss of muscular energy.</p>\n<p style="text-align: justify;">Ginseng is rich in ginsenosides that help in stress management.</p>', '<p>N.A.</p>', '1', '1220', '', '2', NULL, NULL, NULL, '2', '', 'Stress_Fly.png', '', '', '', '', '', ''),
(65, 0, '100', '', 'Memory Fab', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Advanced formula with Ginkgo, Shankhpushpi and Brahmi. Ginkgo promotes oxygen and glucose delivery to the nerve cells for healthy nervous system support.</p>\n<p style="text-align: justify;">Shankhpuhpi is the natures'' gift to enhance memory.</p>\n<p style="text-align: justify;">Brahmi has been known to aid in learning and memory improvement.</p>', '<p>N.A.</p>', '1', '1350', '', '2', NULL, NULL, NULL, '2', '', 'Memory_Fab.png', '', '', '', '', '', ''),
(66, 0, '100', '', 'Ubiquinol', '0', '<h3><span class="black">Brand Name:</span>&nbsp;ZENITH NUTRITION</h3>\n<p>&nbsp;</p>\n<p style="text-align: justify;">Aging compromises the natural production of CoQ10 in the body, as well as the conversion of ubiquinone to ubiquinol. This product provides seniors with the active form of CoQ10 their bodies can immediately utilize. Availablein easy-to-swallow veg capsules for maximum assimilation and absorption.</p>\n<p style="text-align: justify;">Zenith Nutrition&rsquo;s&nbsp; Ubiquinol provide 100 mg of the reduced form of CoQ10 (ubiquinol) rather than the common, oxidized form of CoQ10 (ubiquinone) currently sold on the market, which must be converted to the active form (ubiquinol) in the body.</p>', '', '1', '3799', '', '2', NULL, NULL, NULL, '2', '', 'Ubiquinol.png', '', '', '', '', '', ''),
(67, 0, '100', '', 'Get Active Pedometer', '0', '<h3><span class="black">Brand Name:</span> Get Active</h3>\n<ul>\n<li style="text-align: justify;">Ultra Slim Design</li>\n<li style="text-align: justify;">Activity Tracker</li>\n<li style="text-align: justify;">Sleep Tracker</li>\n<li style="text-align: justify;">Cloud &amp; Mobile App</li>\n</ul>', '<p>N.A.</p>', '1', '3499', '', '4', NULL, NULL, NULL, '2', '', 'Get_Active_pedometer.png', '', '', '', '', '', ''),
(68, 0, '100', '', 'Cranberry with Vitamin C', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<ul>\n<li style="text-align: justify;">Helps maintain a healthy urinary tract</li>\n<li style="text-align: justify;">Enhanced with Vitamin C to support antioxidant and immune health</li>\n</ul>', '<p>N.A.</p>', '1', '1795', '', '2', NULL, NULL, NULL, '2', '', 'Cranberry_with_Vitamin_C.png', '', '', '', '', '', ''),
(69, 0, '100', '', 'Hair, Skin & Nails', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<ul style="text-align: justify;">\n<li>Supports hair, skin &amp; nails</li>\n</ul>\n<ul style="text-align: justify;">\n<li>Provides 3000 mcg of biotin per serving</li>\n</ul>\n<ul>\n<li style="text-align: justify;">Contains key ingredients &amp; antioxidants</li>\n</ul>', '', '1', '1495', '', '2', NULL, NULL, NULL, '2', '', 'Hair,SkinandNails.png', '', '', '', '', '', ''),
(70, 0, '100', '', 'Acetyl L-Carnitine HCl', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Natures Bounty</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Alpha lipoic acid and acetyl L-carnitine form an excellent combination for promoting metabolic functioning to fight against free radicals and oxidative stress. Free radicals can contribute to oxidative stress which in turn may contribute to the premature aging of cells. As a supplement, Alpha Lipoic Acid and Acetyl L- Carnitine can be used as part of a healthy aging program.</p>', '<p>N.A.</p>', '1', '1200', '', '2', NULL, NULL, NULL, '2', '', 'Acetyl_L-Carnitine_HCl.png', '', '', '', '', '', ''),
(71, 39, '100', '', 'Red Yeast Rice', '0', '<h3><span class="black">Brand Name:</span>&nbsp;Unived</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Unived Red Yeast Rice, fermented with the yeast&nbsp;Monascus purpureus, which has the active compound Monacolin K. The cholesterol lowering activity of Red Yeast Rice is attributed to its active ingredient Monacolin K. Its&nbsp; been found to be greater than that obtained from equivalent doses of the pharmaceutical form of lovastatin (Mevacor). This is due to the presence of other substances in Red Yeast Rice besides the HMG-CoA reductase inhibitors that have hypocholesterolemic activity.&nbsp;</p>', '', '1', '1200', '', '2', NULL, NULL, NULL, '2', '', 'RYR.png', '', '', '', '', '', ''),
(72, 0, '100', '', 'Zenith Protein Pure Soy', '0', '<h3><span class="black">Brand Name:</span> ZENITH NUTRITION</h3>\n<div class="clr30">&nbsp;</div>\n<p>Zenith Protein Pure Soy brings a truly vegan source of protein,in its purest form,Soya protein isolate with all eseential amino acids,conditionally essential amino acids &amp; non essential amino acids too.zenith Protein Pure Soy has the maximum protein per serving ratio.25g.of Soy protein has been recomended for healthy cholestral levels in the body.</p>\n<p>&nbsp;</p>', '', '1', '760', '', '3', NULL, NULL, NULL, '2', '', 'Zeneth_pure_soy.png', '', '', '', '', '', ''),
(73, 0, '100', '', 'Pure Whey Protein-Green Apple Fusion', '0', '<h3><span class="black">Brand Name:</span> ZENITH NUTRITION</h3>\n<div class="clr30">&nbsp;</div>\n<p>Zenith Protien Pure Whey is an ideal nutritional supplement to attain lean muscular body. It contains whey protien isolate with maximum protein blended with delicious flavour for palatability.It is made of easily digestible source of protein.</p>', '', '1', '980', '', '3', NULL, NULL, NULL, '2', '', 'Pure_Whey_Protein-Green_Apple_Fusion.png', '', '', '', '', '', ''),
(74, 0, '100', '', 'Pure Whey Protein-Chocolate', '0', '                    <h3><span class="black">Brand Name:</span> ZENITH NUTRITION</h3>\n<div class="clr30">&nbsp;</div>\n<p>Zenith Protien Pure Whey is an ideal nutritional supplement to attain lean muscular body. It contains whey protien isolate with maximum protein blended with delicious flavour for palatability.It is made of easily digestible source of protein.</p>                ', '                                    ', '1', '980', '', '3', NULL, NULL, NULL, '2', '', 'Pure_Whey_Protein-Chocolate_600X600.png', '', '', '', '', '', ''),
(75, 0, '100', '', 'Soy Protien 2lbs', '0', '<h3><span class="black">Brand Name:</span> Gold standard</h3>\n<div class="clr30">&nbsp;</div>\n<p>100% Soy Protein is a economical and great-tasting protein supplement specifically formulated to meet the FDAs heart-healthy claim for soy in just one serving. 100% Soy Protein offers a wide range of benefits and conveniences for vegetarians, those with specific food allergies, and health conscious individuals alike.<br /><br />With only 2 grams or less of carbs per serving (less depending on the flavor variety), 100% Soy Proteins low-fat, sugar-free formula is also ideal for anyone on a low-carb diet. 100% Soy Protein can also be used in pancake batters, hot cereals, and other baked goods to increase the protein content.<br /><br />&bull; 25g of Soy Protein Isolate Per Scoop<br /><br />&bull; Lactose Free &amp; Cholesterol Free<br /><br />&bull; Meets the FDA&rsquo;s &ldquo;Heart-Healthy&rdquo; Claim For Soy in Just One Scoop<br /><br />&bull; No Cholesterol, Sugar, or Saturated Fats</p>', '', '1', '2499', '', '3', NULL, NULL, NULL, '2', '', 'Soy_Protein_2lbs.png', '', '', '', '', '', ''),
(76, 0, '100', '', 'Prototal Whey-Vanilla Flavour', '0', '<h3><span class="black">Brand Name:</span> Emcure</h3>\n<div class="clr30">&nbsp;</div>\n<p>PROTOTAL WHEY is a new- edge protein supplement for wholesome nourishment.</p>\n<ul>\n<li>Enriched with antioxidants</li>\n<li>High fibre content</li>\n<li>sugar free</li>\n</ul>', '', '1', '650', '', '3', NULL, NULL, NULL, '2', '', 'Prototal_Whey-Vanilla_Flavour.png', '', '', '', '', '', ''),
(77, 0, '100', '', 'The Don’t Diet Diet Book - Author: Suman Agarwal & Tinu Sanghvi', '0', '<p style="text-align: justify;">The Don&rsquo;t Diet Diet Book&rsquo;s mantra is easy: don&rsquo;t diet. Eat! Eat satisfying and wonderfully filling food. Eat food that your taste buds will actually love. Eat so you find your way to good health!</p>\n<p style="text-align: justify;">The book is the result of over two years of vigilant research, scientific planning on the principles of nutrition, stringent testing, and extensive tasting as well! It contains a carefully structured selection of recipes that are healthy, low-fat and very tasty.</p>\n<p style="text-align: justify;">The book has been laid-out attractively, with instant information on the protein, calcium, iron and fiber content in each item, and the ease of preparation. Additionally, the cooking-tips and the guidelines on how a set of recipes can create a complete meal, make this an invaluable book!</p>\n<p style="text-align: justify;">Co-authored by Suman Agarwal, one of India''s Leading nutritionists certified by Oxford University, UK and frequent colomnist in leading newspapers; and Tinu Shanghvi, a highly regarded cook, caterer to restaurants and culinary instructor. With a wide array of recipes using everyday ingredients, simple techniques, and a wealth of nutrition advice, this cook book is an absolute must-have if you want to ensure your family eats healthy!&nbsp;<br /><br /><br /><strong>Release date &ndash; </strong>September 2009<br /><strong>Publisher &ndash; </strong>Vakils, Feffer &amp; Simons Pvt. Ltd.&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<h5 style="text-align: justify;"><strong>Book Features</strong></h5>\n<ul class="listing1">\n<li style="text-align: justify;">Over 80 vegetarian recipes (Including Jain and Gluten free recipes)</li>\n<li style="text-align: justify;">Suman''s 5 golden rules for weightloss</li>\n<li style="text-align: justify;">Calorie calculator</li>\n<li style="text-align: justify;">Calorie swap</li>\n<li style="text-align: justify;">Holiday survival guide &amp; Eating out guide</li>\n<li style="text-align: justify;">7 day sample weight-loss menu for men and women (using recipes from the book)</li>\n</ul>', '<p>"Very easy to follow, has tasty food and it still helped me lose 1 kg per week."</p>\n<p>By&nbsp;<strong>Mohd Faiz Cutterwala, Businessman</strong></p>\n<p>&nbsp;</p>\n<p>"The don&rsquo;t diet diet cookbook &ndash; a new way to lose weight."</p>\n<p>By&nbsp;<strong>Naomi Canton</strong></p>\n<p>&nbsp;</p>\n<p>"How about a book that encapsulates all the health and nutrition information under one umbrella, and also has some yummy recipes those are high on health."</p>\n<p>By <strong>Aditi Pant</strong></p>\n<p>&nbsp;</p>\n<p>"The healthy meals in this glossy hardbound book look delectable enough to whet the appetite."</p>\n<p>By&nbsp;<strong>Roshni Bajaj Sanghvi, Reader&rsquo;s Digest</strong></p>\n<p>&nbsp;</p>\n<p>"For weight watches, the cheat sheet, menu plans and calorie calculators are a big draw. Go ahead. Eat the book."</p>\n<p>By&nbsp;<strong>Amy Fernandes</strong></p>\n<p>&nbsp;</p>\n<p>"The book has everything from a lean lasagna and a dhanshak to a Hyderabadi biryani plus quick lunch wraps."</p>\n<p>By&nbsp;<strong>Ismat Tahseen</strong></p>\n<p>&nbsp;</p>\n<p>"A book that truly lives up to its name. An absolute MUST HAVE!"</p>\n<p>By&nbsp;<strong>Shirin Joshi, Homemaker</strong></p>', '1', '750', '', '4', NULL, NULL, NULL, '2', '', 'cover-01.png', '', '', '', '', '', ''),
(78, 0, '100', '', 'Unjunked - Healthy eating for weight loss - Author: Suman Agarwal', '0', '<p style="text-align: justify;">Do you think that healthy food couldn''t possibly taste good? Does the idea of &ldquo;eating healthy&rdquo; conjure up images of roughage and steamed vegetables? Author Suman Agarwal''s latest Publication ''UNJUNKED'' will change all that. Nutritionist &amp; Founder of Selfcare, Suman is also a lover and proponent of good, fresh food that&rsquo;s simply but deliciously prepared. And she''s not about denial &ndash; no nonfat foods here, because when you take the fat out of natural foods, in go the chemicals.<br />&nbsp;<br />Unjunked is all you&rsquo;ll need to change the way you eat and feel. It contains over 100 recipes to take care of every meal of the day and every craving you might have. Each recipe comes with a complete nutritional breakdown, as well as tips on ingredients and techniques that will keep you eating smart.<br />&nbsp;<br />Suman&rsquo;s recipes take the &ldquo;junk&rdquo; out of junk food and replace it with healthy yet tasty ingredients. So whether it&rsquo;s Mumbai&rsquo;s famous pav bhaji you crave or Kolkata&rsquo;s scrumptious bread chaat, you can enjoy all your favourite street grub. Mithais and desserts are part of the deal, too.</p>\n<p><br /><strong>Extent &ndash; </strong>216 Pages<br /><strong>Publication Date &ndash; </strong>January 2013<br /><strong>Publisher &ndash; </strong>Selfcare India</p>\n<p>&nbsp;</p>\n<h5>Book Features</h5>\n<ul class="listing1">\n<li>Weight Loss section in the beginning</li>\n<li>Cookbook cum weight loss book</li>\n<li>Easily Available ingredients used</li>\n<li>Nutritionally balanced recipes</li>\n<li>Simple, easy to make and quick recipes</li>\n<li>Recipes divided according to meal times to make it easy to plan your meals</li>\n<li>Seven day sample weight loss menu provided using the book</li>\n<li>Eating out guide</li>\n<li>Holiday survival guide</li>\n<li>Calorie calculator</li>\n<li>Calorie swap</li>\n<li>Jain and Gluten free recipes</li>\n<li>No artifice, everything is 100 % natural (food shot exactly as cooked)</li>\n<li>Complete nutritional breakdown of each recipe given</li>\n</ul>\n<p><br /><br /></p>\n<div class="italictxt">* Available at all leading bookstores.</div>', '<p style="text-align: justify;">"Unjunked - I must compliment Suman for doing a fabulous job for everyone who wants to lead a good, healthy and quality life. It has given me so many options in meals. Desserts are outstanding and have enjoyed cooking and serving them to friends as well. Carry on the good work. Thank you for all the efforts you put in to help all the people who want to lose weight."</p>\n<p>By&nbsp;<strong>Nandini Kaul, Homemaker</strong></p>\n<p>&nbsp;</p>\n<p style="text-align: justify;">"Banish boring ways to look fab! If you are one of those who are tired of dieting to lose weight and are clinging on to boring and tasteless food items to stay fit, then here comes a quick fix solution which breaks that myth."</p>\n<p style="text-align: justify;">By&nbsp;<strong>Hina Nainani</strong></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">"Indulging in your favorite snacks need not be a guilty pleasure. Diet guru Suman Agarwal shows how its done."</p>\n<p style="text-align: justify;">By&nbsp;<strong>Aruna Rathod</strong></p>\n<p style="text-align: justify;">&nbsp;</p>\n<div class="headline" style="text-align: justify;">\n<div class="headline">"Her recipes strive to bring about balance of the major macronutrients providing a healthy, tasty, and wholesome meal. In addition to the recipes the book also provides some basic principles of healthy living, the importance of the various macronutrients and a calorie chart of various common foods."</div>\n<div class="headline">&nbsp;</div>\n<div class="headline">By <strong>Preeti Zachariah</strong></div>\n<div class="headline">&nbsp;</div>\n<div class="headline">&nbsp;</div>\n<div class="headline">"My favorite section in Suman Agarwal&rsquo;s book, which has more than 80 vegetarian recipes and weigh-loss tips, is calorie swap. It tells me that I can compensate for a packet of McDonalds fries by playing 45 minutes of wii tennis, 30 minutes of yoga makes up for a scoop of ice cream. She has my attention and I am drawn to her thesis."</div>\n<div class="headline">&nbsp;</div>\n<div class="headline">By <strong>Udita Jhunjhunwala</strong></div>\n</div>\n<div class="headline" style="text-align: justify;">\n<p>&nbsp;</p>\n<p>"Unjunked is an excellent book for a foodie like me who loves junk food. Whilst on my diet I am finding it very useful to make accommodations and changes in the calorie intake even if I am satisfying my taste buds with all those yummy dishes. A great reference book to take recipes from whilst on a diet or maintenance."</p>\n<p>By<strong> Kajal Modi</strong></p>\n</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">"Unjunked is one of the best books I have gone through. The recipes are very well given and easily understood. They are delicious."</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">By<strong> Shradha Jain</strong></div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">"The book Unjunked has truly lived up to its name. Diet food never tasted so good. The meals are well balanced and very easy to make. The Chloe wrap is the best in the book."</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">By<strong> Aditi Mehta</strong></div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">"Just wanted to tell you what a fantastic book ''Unjunked'' is.&nbsp;&nbsp;I have been trying all the recipes one by one and all of them are truly delicious."</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">By<strong>&nbsp;Harsh Goenka, Businessman</strong></div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<div class="headline" style="text-align: justify;">&nbsp;</div>\n<p style="text-align: justify;">&nbsp;</p>', '1', '496', '', '4', NULL, NULL, NULL, '2', '', 'cover-03.png', '', '', '', '', '', ''),
(79, 0, '100', '', 'Super Kids - Author: Suman Agarwal', '0', '', '<p>N.A.</p>', '', '', '', '4', NULL, NULL, NULL, '1', '', 'cover-02.png', '', '', '', '', '', ''),
(81, 2, '100', '200', 'Sweet & Sour Bhel', '0', '<p style="text-align: justify;">Your favourite roadside bhel, may seem like an innocent, light meal, but look into the contents a little deeper: the generously sprinkled sev and the puris that are crushed into it are fried. Try our Sweet and Sour Bhel and enjoy the tangy taste of street food while knowing that the contents are baked: low in fat and high in flavors and enriched with nutrients. Rice puffs, beaten rice, cornflakes, groundnut potato crisps all add to the nutritional value of the snack.&nbsp;</p>\n<p style="text-align: justify;">This product is Gluten Free and Low Fat.</p>', '<table>\n<tbody>\n<tr>\n<td width="166">\n<p>Nutritional Values</p>\n</td>\n<td width="166">\n<p>per 100 gms</p>\n</td>\n<td width="166">\n<p>per 25 gms</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Energy value</p>\n</td>\n<td width="166">\n<p>446.0</p>\n</td>\n<td width="166">\n<p>111.5</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Protein</p>\n</td>\n<td width="166">\n<p>11.9</p>\n</td>\n<td width="166">\n<p>2.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Carbohydrates</p>\n</td>\n<td width="166">\n<p>59.6</p>\n</td>\n<td width="166">\n<p>14.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fats</p>\n</td>\n<td width="166">\n<p>17.8</p>\n</td>\n<td width="166">\n<p>4.5</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Calcium</p>\n</td>\n<td width="166">\n<p>48.9</p>\n</td>\n<td width="166">\n<p>12.2</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Fiber</p>\n</td>\n<td width="166">\n<p>1.6</p>\n</td>\n<td width="166">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>SFA</p>\n</td>\n<td width="166">\n<p>19.8</p>\n</td>\n<td width="166">\n<p>4.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Iron</p>\n</td>\n<td width="166">\n<p>5.3</p>\n</td>\n<td width="166">\n<p>1.3</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Sodium</p>\n</td>\n<td width="166">\n<p>1859.8</p>\n</td>\n<td width="166">\n<p>464.9</p>\n</td>\n</tr>\n<tr>\n<td width="166">\n<p>Zinc</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n<td width="166">\n<p>0</p>\n</td>\n</tr>\n</tbody>\n</table>', '1', '150', '', '1', NULL, NULL, NULL, '2', '', '222.png', '', '', '', '', '', ''),
(82, 3, '100', '200', 'Oat Meal Cookies', '0', '<div style="text-align: justify;">If you want to pack the goodness of Oats, then what better way than an Oatmeal Cookie. Oats is known for its soluble fiber content benefitting in diabetes, cholesterol and for weight watchers.</div>\n<div style="text-align: justify;">&nbsp;</div>\n<div style="text-align: justify;">These oatmeal cookies are rich in protein, complex carbohydrates, iron and antioxidants, and are baked with the healing essence of powdered cinnamon. This is one of the best and tasty ways to start your day. Bite into one cookie now and allow the flavors melt into your mouth.&nbsp;</div>\n<div style="text-align: justify;">&nbsp;</div>\n<div style="text-align: justify;">This product is Gluten Free and Low Fat.</div>', '<table>\n<tbody>\n<tr>\n<td width="164">\n<p>Nutritional Values</p>\n</td>\n<td width="164">\n<p>per 100 gms</p>\n</td>\n<td width="164">\n<p>per 20 gms</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Energy value</p>\n</td>\n<td width="164">\n<p>360.0</p>\n</td>\n<td width="164">\n<p>90.0</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Protein</p>\n</td>\n<td width="164">\n<p>10.6</p>\n</td>\n<td width="164">\n<p>2.6</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Carbohydrates</p>\n</td>\n<td width="164">\n<p>75.8</p>\n</td>\n<td width="164">\n<p>18.9</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Fats</p>\n</td>\n<td width="164">\n<p>1.6</p>\n</td>\n<td width="164">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Calcium</p>\n</td>\n<td width="164">\n<p>27.1</p>\n</td>\n<td width="164">\n<p>6.8</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Fiber</p>\n</td>\n<td width="164">\n<p>1.5</p>\n</td>\n<td width="164">\n<p>0.4</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>SFA</p>\n</td>\n<td width="164">\n<p>23.7</p>\n</td>\n<td width="164">\n<p>5.9</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Iron</p>\n</td>\n<td width="164">\n<p>4.2</p>\n</td>\n<td width="164">\n<p>1.1</p>\n</td>\n</tr>\n<tr>\n<td width="164">\n<p>Sodium</p>\n</td>\n<td width="164">\n<p>1238.8</p>\n</td>\n<td width="164">\n<p>308.7</p>\n</td>\n</tr>\n</tbody>\n</table>', '', '250', '', '1', NULL, NULL, NULL, '1', '', '171.png', '', '', '', '', '', ''),
(83, 0, '100', '', '70% Dark Chocolate', '0', '<p style="text-align: justify;">70% dark chocolate is a good source of antioxidant which has positive effects on health. A piece or this dark chocolate can be added to the daily diet in place of your fruit.</p>', '<p>N.A.</p>', '1', '270', '', '1', NULL, NULL, NULL, '2', '', '25.png', '', '', '', '', '', ''),
(84, 0, '100', '', 'Happy Kidz', '0', '<p style="text-align: justify;">Give your children that extra boost of nutrition by supplementing their food with these yummy gummies. Looks attractive, great to taste, no need to swallow the tasteless tablets and supplements your child with all essential nutrients.</p>', '', '1', '400', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(86, 0, '100', '', 'Sublingual B12', '0', '<p style="text-align: justify;">Sublingual B complex with B 12 drops helps correcting your B 12 deficiency it also offers a distinct advantage over conventional nutritional supplement. It comes in an easy - to - use liquid form which is perfect for those who have difficulty in swollowing tablets and capsules.This vitamin works with your body to promote nervous system health and support energy metabolism.</p>', '<p>N.A.</p>', '1', '895', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(87, 0, '100', '', 'Salmon Oil 1000mg', '0', '<p style="text-align: justify;">Salmon oil contains EPA and DHA which helps support and maintain the health of cardio vascular system. These omega 3 fatty acids present in salmon oil are important for cellular and metabolic health. Also people with arthritis pain benefits with Salmon oil. Getting adequate amount of good fats is not easy in today&rsquo;s fast food world. Therefore, salmon oil is an important supplement for heart health.</p>', '<p>N.A.</p>', '1', '1999', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(88, 0, '100', '', 'Ovegha: Orange flavour liquid DHA (20 ml)', '0', '<p style="text-align: justify;">It is a vegetarian source of DHA which is essential for the development and function of the brain, eyes, and heart. It is also essential for growing children and pregnant women.</p>', '', '1', '850', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(89, 0, '100', '', 'Cosmetox', '0', '', '<p style="text-align: justify;">Cosmetox is a combination of L-glutathione, Alpha lipoic acid, grape seed and vitamin C , a unique combination of all the essential antioxidants required for a healthy and bright skin.</p>', '1', '1833', '', '2', NULL, NULL, NULL, '2', '', '7.png', '', '', '', '', '', ''),
(90, 0, '100', '', 'Green Coffee Bean Plus', '0', '<p style="text-align: justify;">Green coffee bean extract contains Svetol, which enhances the fat burning potential as the ratio of phyto chemicals specifically found in Svetol helps promote weight loss and boost fat metabolism.</p>', '', '1', '2080', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(91, 0, '100', '', 'Collagen + Antioxidant: Cranberry', '0', '', '<p style="text-align: justify;">Amino Collagen contains specific collagen peptide that makes skin healthy and naturally glowing. Amino collagen is clinically tested, it is zero fat and zero cholesterol and it shows visible results in 28 days.</p>', '1', '2750', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(92, 0, '100', '', 'Hair Fab', '0', '<p style="text-align: justify;">Hair fab is a multi vitamin enriched with choline, inositol, Para-amino benzoic acid and Metyl sulphonyl methane which helps in enrichment and hair growth.</p>', '<p>N.A.</p>', '1', '1920', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(93, 0, '100', '', 'Ordex Forte', '0', '<p style="text-align: justify;">It contains great herbs like Bosewellia Seratta extract and Whithania Somnifera, beneficial for pain, swelling, bone strength and recovery from cartilage injury.</p>', '<p>N.A.</p>', '1', '450', '', '2', NULL, NULL, NULL, '2', '', '181.png', '', '', '', '', '', ''),
(94, 0, '100', '', 'Glucosamine with Chondroitin', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span> ZENITH NUTRITION</h3>\n<div class="clr30" style="text-align: justify;">&nbsp;</div>\n<p style="text-align: justify;"><strong><em>Your body uses glucosamine, a natural compound, to stimulate your cells to create one of the main building blocks of joint cartilage -- proteoglycans.</em></strong><br /><br />As you age, the amount of glucosamine created by your body decreases. The result? Your cartilage and bones begin to scrape against each other, your joints become damaged, and the lubricating synovial fluid in your joint spaces becomes thin and watery.&nbsp;<br /><br />To ensure effective absorption and tissue utilization, it''s highly recommended that one takes glucosamine in the sulfate form. This is the way glucosamine is found in the body.<br />&nbsp;<br />Chondroitin sulfate attracts and holds large amounts of water to the cartilage-building proteoglycan molecules. Since cartilage has no blood supply, this fluid is necessary to nourish and lubricate joints.</p>', '<p>N.A.</p>', '1', '1020', '', '2', NULL, NULL, NULL, '2', '', '115.png', '', '', '', '', '', ''),
(95, 0, '100', '', 'Joirel: Glucosamine & Boswellia', '0', '<p style="text-align: justify;">Joirel is a perfect combination of glucosamine sulphate, bosewellia serrata and curcumin extract which are most effective joint health ingredients.</p>', '<p>N.A.</p>', '1', '660', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(96, 0, '100', '', 'Gaia lite Stevia (25 sachets)', '0', '<p style="text-align: justify;">Stevia is a South American herb that has a delicious and refreshing taste that is 300 times sweeter than sugar. Body does not metabolize stevia in any form and thus no caloic intake, making it most ideal sweetener for diabetics. <br />One sachet of Gaia Stevia is equivalent to sweetness of two teaspoons of sugar</p>', '<p>N.A.</p>', '1', '85', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(97, 0, '100', '', 'Gaia lite Stevia (100 tabs)', '0', '<p style="text-align: justify;">Stevia is a South American herb that has a delicious and refreshing taste that is 300 times sweeter than sugar. Body does not metabolize stevia in any form and thus no caloic intake, making it most ideal sweetener for diabetics. <br />Each tablet of Gaia Stevia is equivalent to sweetness of one tsp of sugar</p>', '', '1', '100', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(98, 0, '100', '', 'Chromium Picolinate', '0', '<h3><span class="black">Brand Name:</span> Natures Bounty</h3>\n<div class="clr30">&nbsp;</div>\n<p>As a key component of the glucose tolerance factor (GTF), Chromium works to support your body''s use of sugar.</p>\n<p>Chromium is also involved in the release of energy from cells, and plays a role in protein and fat metabolism.</p>', '<p>N.A.</p>', '1', '749', '', '2', NULL, NULL, NULL, '2', '', 'chrom.png', '', '', '', '', '', ''),
(100, 0, '100', '', 'Fibero Essential', '0', '<h3 style="text-align: justify;"><span class="black">Brand Name:</span> Azzurra</h3>\n<p style="text-align: justify;">&nbsp;</p>\n<ul style="text-align: justify;">\n<li>Helps in lowering Triglyceride &amp; Cholesterol level</li>\n<li>Helps in reducing the risk of Heart Disease</li>\n<li>Maintains Gut Integrity</li>\n</ul>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>', '<p>N.A.</p>', '1', '645', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(101, 0, '100', '', 'Minus', '0', '<p style="text-align: justify;">Minus contains natural ingredients like green coffee bean extract, L - Carnitine and Garcinia Combogia extracts that supports weight losss, appetite control and promotes fat burning and fat metabolism.</p>', '<p>N.A.</p>', '1', '2400', '', '2', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', ''),
(102, 0, '100', '', 'Stocon Capsules', '0', '<p style="text-align: justify;">Removes constipation naturally and also fights toxins. Available in tablet form for easy motion.</p>', '<p>N.A.</p>', '1', '204', '', '2', NULL, NULL, NULL, '2', '', '211.png', '', '', '', '', '', ''),
(103, 0, '100', '', 'Zenith Daily Protien: Chocolate', '0', '<p style="text-align: justify;">This Daily protein supplement is a combination of soy and whey . It has added benifit of colostrum, peeyusha and haridra which improves body''s defense mechanism, spriluna which helps in muscle building, Mandukaparni boosts cognitive perfomance and lastly amla a rich source of vitamin C to possess growth promoting ability.</p>', '<p>N.A.</p>', '1', '690', '', '3', NULL, NULL, NULL, '2', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

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
(22, 2, 'Joint Health', '22', '2', 'Tulsi_green_tea.png', ''),
(23, 2, 'Brain Health', '23', '2', 'ABC_Plus.png', ''),
(24, 2, 'Diabetic Friendly', '24', '2', '', ''),
(25, 2, 'Fiber', '25', '2', '', ''),
(26, 4, 'Book', '26', '2', '', ''),
(27, 4, 'DVD', '27', '2', '', ''),
(28, 4, 'Weighing Scale', '28', '2', '', ''),
(29, 4, 'Pedometer', '29', '2', '', ''),
(30, 3, 'Protein Bars', '30', '2', '', ''),
(31, 3, 'Protein Powder', '31', '2', '', ''),
(32, 2, 'Vitamin D3', '32', '2', '', ''),
(39, 2, 'Heart Health', '', '2', '', '');

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
-- Table structure for table `imagepull`
--

DROP TABLE IF EXISTS `imagepull`;
CREATE TABLE IF NOT EXISTS `imagepull` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

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
(14, 'Health Packages Type', '', '', 'site/viewsubtype\n', 1, 0, 1, 9, 'icon-dashboard'),
(15, 'Video', '', '', 'site/viewvideo', 1, 0, 1, 10, 'icon-dashboard'),
(16, 'News', '', '', 'site/viewnews\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(17, 'Blog', '', '', 'site/viewblog\n\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(18, 'Tags', '', '', 'site/viewtags\n\n', 1, 0, 1, 10, 'icon-dashboard'),
(19, 'Image', '', '', 'site/viewimagepull', 1, 0, 1, 12, 'icon-dashboard'),
(20, 'Recipes', '', '', 'site/viewrecipes', 1, 0, 1, 10, 'icon-dashboard');

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
(18, 1),
(19, 1),
(20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=369 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `image`, `year`, `timestamp`, `status`) VALUES
(3, 'The Sunday Free Press', '1-_15.07:2001_(Mumbai)_The_Sunday_Free_Press_.jpg', '2001', '2016-02-06 06:13:23', 0),
(4, 'The Sunday Free Press', '2-_22.07:2001_(Mumbai)_The_Sunday_Free_Press_.jpg', '2001', '2016-02-06 06:15:34', 0),
(5, 'The Sunday Free Press', '3-_21.10:2001_(Mumbai)_The_Sunday_Free_Press_.jpg', '2001', '2016-02-06 06:17:49', 0),
(6, 'November Issue', '4-November_Issue_2001_(India)_Femina_(2).jpg', '2001', '2016-02-06 06:19:48', 0),
(7, 'November Issue', '4-November_Issue_2001_(India)_Femina_(3).jpg', '2001', '2016-02-06 06:22:00', 0),
(8, 'November Issue', '4-November_Issue_2001_(India)_Femina.jpg', '2001', '2016-02-06 06:24:17', 0),
(9, 'Ahmedabad Times', '1-_24.08:2003_(Ahemdabad)_Ahemdabad_Times_.jpg', '2003', '2016-02-06 06:27:03', 0),
(10, 'The Sunday Free Press', '2-_5.10:2003_(Mumbai)_The_Sunday_Free_Press_-_Spectrum_.jpg', '2003', '2016-02-06 06:28:46', 0),
(11, 'Ahmedabad Times', '3_-16.11:2003_(Ahemdabad)_Ahemdabad_Times_.jpg', '2003', '2016-02-06 06:30:25', 0),
(12, 'Ahmedabad Times', '4_-_30._11:2003_(Ahemdabad)_Ahemdabad_Times2_.jpg', '2003', '2016-02-06 06:31:14', 0),
(13, 'Femina', '1_-_18.08:2005_-_(India)_Femina_pg1_.jpg', '2005', '2016-02-06 06:32:39', 0),
(14, 'Femina', '1_-_18.08:2005_-_(India)_Femina_.jpg', '2005', '2016-02-06 06:33:41', 0),
(15, 'DNA (Mumbai)', '2_-_29.10:2005_(Mumbai)_DNA_.jpg', '2005', '2016-02-06 06:34:28', 0),
(16, 'DNA (Mumbai)', '3_-_06.11:2005_(Mumbai)_DNA_.jpg', '2005', '2016-02-06 06:35:37', 0),
(17, 'Hindustan Times (Mumbai)', '1:10.02_.06(Mumbai)_Hindustan_Times_.jpg', '2006', '2016-02-06 06:38:40', 0),
(18, 'Femina (India)', '2:24.05_.06_(India)_Femina_.jpg', '2006', '2016-02-06 06:40:29', 0),
(19, 'Hindustan Times (Mumbai)', '3:16.08_.06_(Mumbai)_Hindustan_Times_.jpg', '2006', '2016-02-06 06:41:31', 0),
(20, 'Wellness.com (Mumbai Times)', '1_-_25.10_.2009_(Mumbai)_Times_Wellness_.Com_.jpg', '2009', '2016-02-06 06:42:56', 0),
(21, 'Chitralekha Gujarati', '2_-_15.11_.2009_(India)_Chitralekha_Gujarati_(1)_.jpg', '2009', '2016-02-06 06:43:44', 0),
(22, 'Chitralekha Gujarati', '2_-_15.11_.2009_(India)_Chitralekha_Gujarati_(2)_.jpg', '2009', '2016-02-06 06:44:46', 0),
(23, 'DNA After Hrs', '3_-_03.11_.2009_(Mumbai)_DNA_After_Hrs_.jpg', '2009', '2016-02-06 06:45:18', 0),
(24, 'DNA (Mumbai)', '4_-_18.11_.2009_(Mumbai)_DNA_.jpg', '2009', '2016-02-06 06:46:18', 0),
(25, 'Hindustan Times (Mumbai)', '5_-_03.11_.2009_(Mumbai)_Hindustan_Times_.jpg', '2009', '2016-02-06 06:47:41', 0),
(26, 'HT Cafe (Mumbai)', '6_-_08.11_.2009_(Mumbai)_HT_Cafe_.jpg', '2009', '2016-02-06 06:48:56', 0),
(27, 'Readers Digest (Mumbai)', '7_-November_issue_2009_(Mumbai)_Readers_Digest.jpg', '2009', '2016-02-06 06:49:44', 0),
(28, 'The Asian Age (Mumbai)', '8_-_03.11_.2009_(Mumbai)_The_Asian_Age_.jpg', '2009', '2016-02-06 06:51:50', 0),
(29, 'Beauty and Salon', '1_-_April_issue_2011_(India)_Beauty_and_Salon.jpg', '2011', '2016-02-06 06:53:16', 0),
(30, 'Beauty and Salon', '1_-_April_issue_2011_(India)_Beauty_and_Salon_(2).jpg', '2011', '2016-02-06 06:54:23', 0),
(31, 'Sadguru Echoes', '2_-_April_issue_2011_(India)_Sadguru_Echoes.jpg', '2011', '2016-02-06 06:55:13', 0),
(32, 'Beauty and Salon', '4_-_May_issue_2011_(India)_Beauty_and_Salon.jpg', '2011', '2016-02-06 06:56:22', 0),
(33, 'Beauty and Salon', '4_-_May_iissue_2011_(India)_Beauty_and_Salon_(2).jpg', '2011', '2016-02-06 06:57:17', 0),
(34, 'Beauty and Salon', '5_-_June_issue_2011_(India)_Beauty_and_Salon.jpg', '2011', '2016-02-06 06:58:42', 0),
(35, 'Beauty and Salon', '5_-_June_issue_2011_(India)_Beauty_and_Salon1.jpg', '2011', '2016-02-06 07:05:45', 0),
(36, 'Beauty and Salon', '5_-_June_issue_2011_(India)_Beauty_and_Salon_(2).jpg', '2011', '2016-02-06 07:06:52', 0),
(37, 'iDiva', '6_-15.07_.2011_(Mumbai)_IDiva_.jpg', '2011', '2016-02-06 07:08:42', 0),
(38, 'Beauty and Salon', '7_-_September_Issue_2011_(India)_Beauty_and_Salon_(2).jpg', '2011', '2016-02-06 07:11:26', 0),
(39, 'Beauty and Salon', '7_-_September_Issue_2011_(India)_Beauty_and_Salon_(2)1.jpg', '2011', '2016-02-06 07:13:39', 0),
(40, 'Sadguru Echoes', '09:2012_(India)_Sadguru_Echoes_pg1.jpg', '2012', '2016-02-06 07:20:22', 0),
(41, 'Sadguru Echoes', '09:2012_(India)_Sadguru_Echoes_pg2.jpg', '2012', '2016-02-06 07:22:01', 0),
(42, 'Mint HT', '1_-_12:02:2013_(Mumbai)_HT_Mint.jpg', '2013', '2016-02-06 07:23:25', 0),
(43, 'Indian Express', '4_-_6:03:2013_(Pune)_Indian_Express.jpg', '2013', '2016-02-06 07:24:05', 0),
(44, 'Mumbai Mirror', '5_-_9:03:2013_(Mumbai)_Mumbai_Mirror.jpg', '2013', '2016-02-06 07:26:34', 0),
(45, 'Pune Mirror', '6_-_10:03:2013_(Pune)_Pune_Mirror_pg1.jpg', '2013', '2016-02-06 07:27:03', 0),
(46, 'Pune Mirror', '6_-_10:03:2013_(Pune)_Pune_Mirror_pg2.jpg', '2013', '2016-02-06 07:27:19', 0),
(47, 'Sakal Times', '7_-_11:03:2013_(Pune)_Sakal_Times_pg1.jpg', '2013', '2016-02-06 07:27:41', 0),
(48, 'Sakal Times', '7_-_11:03:2013_(Pune)_Sakal_Times_pg2.jpg', '2013', '2016-02-06 07:27:56', 0),
(49, 'Sakal Times', '8_-_12:03:2013_(Pune)_Sakal_Times.jpg', '2013', '2016-02-06 07:28:13', 0),
(50, 'Pune Mirror', '9_-_13:03:2013_(Pune)_Pune_Mirror.jpg', '2013', '2016-02-06 07:28:38', 0),
(51, 'The Hindu (Bangalore)', '10_-_18:03:2013_(Bangalore)_The_Hindu.jpg', '2013', '2016-02-06 07:31:28', 0),
(52, 'The Hindu (Bangalore)', '10_-_18:03:2013_(Bangalore)_The_Hindu1.jpg', '2013', '2016-02-06 07:34:17', 0),
(53, 'Health Fix (Chennai)', '11_-_20:03:2013_(Chennai)_Health_Fix.jpg', '2013', '2016-02-06 07:36:19', 0),
(54, 'Mid Day (Pune)', '12_-_20:03:2013_(Pune)_Mid_Day.jpg', '2013', '2016-02-06 07:38:36', 0),
(55, 'Jansatta (Kolkata)', '13_-_22:03:2013_(Kolkata)_Jansatta.jpg', '2013', '2016-02-06 07:39:10', 0),
(56, 'Sutrakar (Kolkata)', '14_-_23:03:2013_(Kolkata)_Sutrakar.jpg', '2013', '2016-02-06 07:39:32', 0),
(57, 'Mumbai Times', '15_-_23:03:2013_(Mumbai)_Bombay_Times.jpg', '2013', '2016-02-06 07:40:09', 0),
(58, 'The New Indian Express (Bangalore)', '16_-_26:03:2013_(Bangalore)_The_New_Indian_Express.jpg', '2013', '2016-02-06 07:41:02', 0),
(59, 'The Bengal Post (Kolkata)', '17_-_27:03:2013_(Kolkata)_The_Bengal_Post.jpg', '2013', '2016-02-06 07:41:30', 0),
(60, 'Sambad Prabha', '18_-_31:03:2013_(Kolkata)_Sambad_Prabaha.jpg', '2013', '2016-02-06 07:44:18', 0),
(61, 'Sanmarg (Kolkata)', '19_-_31:03:2013_(Kolkata)_Sanmarg.jpg', '2013', '2016-02-06 07:45:19', 0),
(62, 'Elle (India)', '20_-_1:04:2013_(India)_Elle.jpg', '2013', '2016-02-06 07:49:50', 0),
(63, 'BBC Good Food (india)', '21_-_01:04:2013_(India)_BBC_Good_Food.jpg', '2013', '2016-02-06 07:51:33', 0),
(64, 'Savvy (India)', '22_-_1:04:2013_(India)_Savvy_pg1.jpg', '2013', '2016-02-06 08:44:01', 0),
(65, 'Savvy (India)', '22_-_01:04:2013_(India)_Savvy_pg2.jpg', '2013', '2016-02-06 08:46:00', 0),
(66, 'Savvy (India)', '22_-_01:04:2013_(India)_Savvy_pg3.jpg', '2013', '2016-02-06 08:47:27', 0),
(67, 'Savvy (India)', '22_-_01:04:2013_(India)_Savvy_pg4.jpg', '2013', '2016-02-06 08:48:38', 0),
(68, 'Savvy (India)', '22_-_01:04:2013_(India)_Savvy_pg5.jpg', '2013', '2016-02-06 08:49:55', 0),
(69, 'Society (India)', '23_-_1:04:2013_(India)_Society.jpg', '2013', '2016-02-06 08:50:18', 0),
(70, 'Asian Age (Kolkata)', '25_-_3:04:2013_(Kolkata)_Asian_Age.jpg', '2013', '2016-02-06 08:51:17', 0),
(71, 'Dainik Jagran (Kolkata)', '26_-_4:04:2013_(Kolkata)_Dainik_Jagran.jpg', '2013', '2016-02-06 08:52:24', 0),
(72, 'The Hindustan Times (Kolkata)', '27_-_5:04:2013_(Kolkata)_The_Hindustan_Times.jpg', '2013', '2016-02-06 08:52:56', 0),
(73, 'Bangla News (Kolkata)', '28_-_6:04:2013_(Kolkata)_News_Bangla.jpg', '2013', '2016-02-06 08:53:56', 0),
(74, 'Sakal Bela (Kolkata)', '29_-_6:04:2013_(Kolkata)_Sakal_Bela.jpg', '2013', '2016-02-06 08:54:56', 0),
(75, 'Loksatta (Kolkata)', '30_-_12:04:2013_(Kolkata)_Loksatta.jpg', '2013', '2016-02-06 08:56:15', 0),
(76, 'Ekdin (Kolkata)', '31_-_13:04:2013_(Kolkata)_Ekdin.jpg', '2013', '2016-02-06 08:57:10', 0),
(77, 'Aabar Yugantar (Kolkata)', '32_-_16:04:2013_(Kolkata)_Aabar_Yugantar.jpg', '2013', '2016-02-06 08:57:34', 0),
(78, 'Sambad Pratidin (Kolkata)', '33_-_20:04:2013_(Kolkata)_Sambad_Pratidin.jpg', '2013', '2016-02-06 08:59:13', 0),
(79, 'Bartaman (Kolkata)', '34_-_20:04:2013_(Kolkata)_Bartaman.jpg', '2013', '2016-02-06 08:59:48', 0),
(80, 'DNA (Ahemdabad)', '35_-_21:04:2013_(Ahemdabad)_DNA_After_Hours.jpg', '2013', '2016-02-06 09:00:47', 0),
(81, 'Gujarat Vaibhav (Ahemdabad)', '36_-_21:04:2013_(Ahemdabad)_Gujarat_Vaibhav.jpg', '2013', '2016-02-06 09:01:16', 0),
(82, 'Jaihind (Ahemdabad)', '37_-_21:04:2013_(Ahemdabad)_Jaihind.jpg', '2013', '2016-02-06 09:02:04', 0),
(83, 'Rajasthan Patrika (Ahembadad)', '38_-_21:04:2013_(Ahemdabad)_Rajasthan_Patrika.jpg', '2013', '2016-02-06 09:03:16', 0),
(84, 'Times of India (Ahemdabad)', '39_-_21:04:2013_(Ahemdabad)_Times_of_India.jpg', '2013', '2016-02-06 09:03:50', 0),
(85, 'Divya Bhaskar (Ahemdabad)', '40_-_22:04:2013_(Ahemdabad)_Divya_Bhaskar.jpg', '2013', '2016-02-06 09:04:24', 0),
(86, 'DNA (Ahemdabad)', '41_-_22:04:2013_(Ahemdabad)_DNA.jpg', '2013', '2016-02-06 09:04:54', 0),
(87, 'Jaihind (Ahemdabad)', '42_-_22:04:2013_(Ahemdabad)_Jaihind.jpg', '2013', '2016-02-06 09:06:09', 0),
(88, 'Sandesh (Ahemdabad)', '43_-_24:04:2013_(Ahemdabad)_Sandesh.jpg', '2013', '2016-02-06 09:07:08', 0),
(89, 'Time Out (Mumbai)', '45_-_May_issue_(Mumbai)_Time_Out.jpg', '2013', '2016-02-06 09:10:00', 0),
(90, 'Akila (Rajkot)', '46_-_9:05:2013_(Rajkot)_Akila.jpg', '2013', '2016-02-06 09:14:06', 0),
(91, 'Gujarat Guardian (Surat)', '47_-_9:05:2013_(Surat)_Gujarat_Guardian.jpg', '2013', '2016-02-06 09:14:35', 0),
(92, 'Navgujarat Times (Surat)', '48_-_9:05:2013_(Surat)_Navgujarat_Times.jpg', '2013', '2016-02-06 09:15:09', 0),
(93, 'Dhabkar (Surat)', '49_-_10:05:2013_(Surat)_Dhabkar.jpg', '2013', '2016-02-06 09:15:32', 0),
(94, 'DNA (Mumbai)', '50_-_12:05:2013_(Mumbai)_DNA.jpg', '2013', '2016-02-06 09:16:00', 0),
(95, 'DNA2 (Ahemdabad)', '51_-_12:05:2013_(Ahemdabad)_DNA2.jpg', '2013', '2016-02-06 09:16:46', 0),
(96, 'Sanj Samachar (Rajkot)', '52_-_13:05:2013_(Rajkot)_Sanj_Samachar.jpg', '2013', '2016-02-06 09:17:17', 0),
(97, 'jaihind (Rajkot)', '53_-_14:05:2013_(Rajkot)_jaihind.jpg', '2013', '2016-02-06 09:17:55', 0),
(98, 'Hindustan Times (Mumbai)', '54_-_24:05:2013_(Mumbai)_Hindustan_Times.jpg', '2013', '2016-02-06 09:18:46', 0),
(99, 'Time Out (Bangalore)', '55_-_June_Issue_(Bangalore)_Time_Out.jpg', '2013', '2016-02-06 09:21:10', 0),
(100, 'Hindustan Times (Delhi)', '57_-_22:06:2013_(Delhi)_Hindustan_Times_City.jpg', '2013', '2016-02-06 09:22:36', 0),
(101, 'Brunch HT (Delhi)', '58_-_23:06:2013_(Delhi)_HT_Brunch.jpg', '2013', '2016-02-06 09:29:27', 0),
(102, 'Punjab Kesari (Delhi)', '59_-_25:06:2013_(Delhi)_Punjab_Kesari.jpg', '2013', '2016-02-06 09:31:01', 0),
(103, 'Bombay Times (Mumbai)', '60_-_29:06:2013_(Mumbai)_Bombay_Times.jpg', '2013', '2016-02-06 09:34:06', 0),
(104, 'Millennium Post (Delhi)', '62_-_8:07:2013_(Delhi)_Millennium_Post.jpg', '2013', '2016-02-06 09:41:08', 0),
(105, 'G2 magazine (Gujarat)', '63_-_Issue_4_(Gujrat)_G2_magazine_.jpg', '2013', '2016-02-06 09:42:24', 0),
(106, 'The Gateway (Mumbai)', '64_-_23:07:2013_(Mumbai)_The_Gateway1.jpg', '2013', '2016-02-06 09:52:09', 0),
(107, 'The Gateway (Mumbai)', '64_-_23:07:2013_(Mumbai)_The_Gateway2.jpg', '2013', '2016-02-06 09:55:41', 0),
(109, 'High On Passion (India)', '80_-_Oct_2013_(India)_High_On_Passion.jpg', '2013', '2016-02-06 09:58:20', 0),
(110, 'Parents India (India)', '81_-_Nov_2013_(India)_Parents_India.jpg', '2013', '2016-02-06 09:58:48', 0),
(111, 'Women''s Health Issue', '82_-_Nov_2013_issue_Womens_Health_.jpg', '2013', '2016-02-06 10:00:52', 0),
(112, 'Wonder Woman', '84_-_8:11:2013_(Web)_Wonder_Woman_.jpg', '2013', '2016-02-06 10:01:39', 0),
(113, 'Deccan Chronicle (India)', '85_-_17:11:2013_(India)_Deccan_Chronicle.jpg', '2013', '2016-02-06 10:02:53', 0),
(114, 'Deccan Chronicle', '86_-_18:11:2013_(Web)_Deccan_Chronicle.jpg', '2013', '2016-02-06 10:03:42', 0),
(115, 'Health Me Up', '87_-_20:11:2013_(Web)_Health_Me_Up.jpg', '2013', '2016-02-06 10:04:40', 0),
(116, 'Asian Age (India)', '88_-_24:11:2013_(India)_Asian_Age.jpg', '2013', '2016-02-06 10:06:43', 0),
(117, 'Bombay Times (Mumbai)', '89_-_27:11:2013_(Mumbai)_Bombay_Times.jpg', '2013', '2016-02-06 10:10:08', 0),
(118, 'Idiva', '90_-_27:11:2013_(Web)_Idiva.jpg', '2013', '2016-02-06 10:11:21', 0),
(119, 'Dainik Dabang Duniya (Kolkata)', '91_-_4:12:2013_(Kolkata)_Dainik_Dabang_Duniya_-_Super_Woman_(1).jpg', '2013', '2016-02-06 10:13:43', 0),
(120, 'Dainik Dabang Duniya (Kolkata)', '91_-_4:12:2013_(Kolkata)_Dainik_Dabang_Duniya_-_Super_Woman_(2).jpg', '2013', '2016-02-06 10:14:37', 0),
(121, 'Dainik Dabang Duniya (Kolkata)', '91_-_4:12:2013_(Kolkata)_Dainik_Dabang_Duniya_-_Super_Woman_(3).jpg', '2013', '2016-02-06 10:15:13', 0),
(122, 'Health Me Up', '92_-_4:12:2013_(Web)_Health_Me_Up.jpg', '2013', '2016-02-06 10:20:02', 0),
(123, 'The Times Of India', '93_-_4:12:2013_(Web)_The_Times_Of_India_.jpg', '2013', '2016-02-06 10:20:45', 0),
(124, 'Directory Round', '94_-_4:12:2013_(Web)_Directory_Round.jpg', '2013', '2016-02-06 10:22:15', 0),
(125, 'The Kashmir Monitor', '95_-_5:12:2013_(Web)_The_Kashmir_Monitor.jpg', '2013', '2016-02-06 10:22:55', 0),
(126, 'Sangbaad Pratidin (Kolkata)', '96_-_7:12:2013_(Kolkata)_Sangbaad_Pratidin.jpg', '2013', '2016-02-06 10:23:44', 0),
(127, 'Asian Age (India)', '97_-_8:12:2013_(India)_Asian_Age.jpg', '2013', '2016-02-06 10:24:58', 0),
(128, 'Times Life (Mumbai)', '99_-_8:12:2013_(Mumbai)_Times_Life.jpg', '2013', '2016-02-06 10:27:10', 0),
(129, 'The Times Of India', '100_-_8:12:2013_(Web)_The_Times_Of_India.jpg', '2013', '2016-02-06 10:29:40', 0),
(130, 'UNB Connect', '101_-_8:12:2013_(Web)_UNB_Connect.jpg', '2013', '2016-02-06 10:31:33', 0),
(131, 'Deccan Chronicle', '102_-_9:12:2013_(Web)_Deccan_Chronicle.jpg', '2013', '2016-02-06 10:32:22', 0),
(132, 'IDiva', '103_-_11:12:2013_(Web)_IDiva.jpg', '2013', '2016-02-06 10:32:53', 0),
(133, 'The Asian Age', '104_-_11:12:2013_(Web)_The_Asian_Age.jpg', '2013', '2016-02-06 10:33:35', 0),
(134, 'Andhra Jyothy (Hyderabad)', '105_-_13:12:2013_(Hyderabad)_Andhra_Jyothy.jpg', '2013', '2016-02-06 10:34:20', 0),
(135, 'Eenadu (Hyderabad)', '106_-_13:12:2013_(Hyderabad)_Eenadu.jpg', '2013', '2016-02-06 10:36:31', 0),
(136, 'Hindi Milap (Hyderabad)', '107_-_13:12:2013_(Hyderabad)_Hindi_Milap.jpg', '2013', '2016-02-06 10:42:12', 0),
(137, 'Sakshi (Hyderabad)', '108_-_13:12:2013_(Hyderabad)_Sakshi_.jpg', '2013', '2016-02-06 10:43:28', 0),
(138, 'Bombay Times (Mumbai)', '109_-_14:12:2013_(Mumbai)_Bombay_Times.jpg', '2013', '2016-02-06 10:44:47', 0),
(139, 'Metro India', '110_-_14:12:2013_(Web)_Metro_India.jpg', '2013', '2016-02-06 10:45:51', 0),
(140, 'The Times Of India', '111_-_15:12:2013_(Web)_The_Times_Of_India_.jpg', '2013', '2016-02-06 10:47:15', 0),
(141, 'Metro India (Hyderabad)', '112_-_16:12:2013_(Hyderabad)_Metro_India.jpg', '2013', '2016-02-06 10:49:54', 0),
(142, 'Cafe HT', '113_-_17:12:2013_(Mumbai)_HT_Cafe.jpg', '2013', '2016-02-06 10:51:31', 0),
(143, 'IDiva', '114_-_18:12:2013_(Web)_IDiva.jpg', '2013', '2016-02-06 10:53:54', 0),
(144, 'Metro India', '115_-_21:12:2013_(Web)_Metro_India.jpg', '2013', '2016-02-06 10:54:21', 0),
(145, 'Asian Age (India)', '116_-_22:12:2013_(India)_Asian_Age.jpg', '2013', '2016-02-06 10:57:55', 0),
(146, 'The Asian Age', '117_-_22:12:2013_(Web)_The_Asian_Age.jpg', '2013', '2016-02-06 10:58:25', 0),
(147, 'Asian Age (India)', '118_-_25:12:2013_(India)_Asian_Age.jpg', '2013', '2016-02-06 10:59:02', 0),
(148, 'Sukhi Grihokon (Kolkata)', '119_-_Dec_2013_issue_(Kolkata)_Sukhi_Grihokon.jpg', '2013', '2016-02-06 10:59:40', 0),
(149, 'IDiva', '122_-_18.12_.2013(Web)_Idiva_.com_.jpg', '2013', '2016-02-06 11:00:28', 0),
(150, 'Miss Malini', '123_-_18.12_.2013_(Web)_Miss_Malini_.jpg', '2013', '2016-02-06 11:01:02', 0),
(151, 'Bharat Darpan (Siligudi)', 'Bharat_Darpan,_Siligudi.jpg', '2008', '2016-02-06 11:47:57', 0),
(152, 'Chapte Chapte', 'Chapte_Chapte_01-05-08.jpg', '2008', '2016-02-06 11:48:26', 0),
(153, 'Chapte Chapte', 'Chapte_Chapte_25-04-08.jpg', '2008', '2016-02-06 11:48:57', 0),
(154, 'Dainik Jagran', 'Dainik_Jagran_01-05-08.jpg', '2008', '2016-02-06 11:49:17', 0),
(155, 'Dainik Vishwamitra', 'Dainik_Vishwamitra_26-04-08.jpg', '2008', '2016-02-06 11:49:38', 0),
(156, 'Jagran', 'Jagran_25-04-08.jpg', '2008', '2016-02-06 11:49:57', 0),
(157, 'Prabhat Khabar', 'Prabhat_Khabar_01-05-08.jpg', '2008', '2016-02-06 11:50:15', 0),
(158, 'Rajasthan Patrika', 'Rajasthan_Patrika_01-05-08.jpg', '2008', '2016-02-06 11:50:44', 0),
(159, 'Rashtriya Mahanagar', 'Rashtriya_Mahanagar_02-05-08.jpg', '2008', '2016-02-06 11:51:06', 0),
(160, 'Rashtriya Mahanagar', 'Rashtriya_Mahanagar_25-04-08.jpg', '2008', '2016-02-06 11:51:24', 0),
(161, 'Sanmarga', 'Sanmarga_26-04-08.jpg', '2008', '2016-02-06 11:51:42', 0),
(162, 'Seva Sansar', 'Seva_Sansar_25-04-08.jpg', '2008', '2016-02-06 11:52:16', 0),
(163, 'IDiva', '1_-_3:01:2014_(web)_idiva.jpg', '2014', '2016-02-06 11:53:31', 0),
(164, 'The Asian Age', '2_-_03:01:2014_(web)_The_Asian_Age.jpg', '2014', '2016-02-06 11:53:52', 0),
(165, 'DNA', '3_-_5:01:2014_(web)_DNA.jpg', '2014', '2016-02-06 11:54:34', 0),
(166, 'DNA (Mumbai)', '4_-_5:01:2014_(mumbai)_DNA_after_Hrs.jpg', '2014', '2016-02-06 11:55:06', 0),
(167, 'Purj News', '5_-_5:01:2014_(web)_purj_news.jpg', '2014', '2016-02-06 11:58:34', 0),
(168, 'Asian Age (India)', '6_-_5:01:2014_(India)_Asian_Age.jpg', '2014', '2016-02-06 11:58:58', 0),
(169, 'Midday (Mumbai)', '7_-_7:01:2014_(mumbai)_Midday.jpg', '2014', '2016-02-06 11:59:36', 0),
(170, 'IDiva', '9_-_8:01:2014_(web)_idiva.jpg', '2014', '2016-02-06 12:04:06', 0),
(172, 'Midday', '8_-_7:01:2014_(web)_Midday1.jpg', '2014', '2016-02-06 12:17:06', 0),
(173, 'Absolute India (Mumbai)', '10_-_11:01:2014_(mumbai)_Absolute_India_.jpg', '2014', '2016-02-06 12:20:00', 0),
(174, 'B Positive (India)', '11_-_Jan_2014_(India)_B_Positive_1.jpg', '2014', '2016-02-06 12:22:40', 0),
(175, 'B Positive (India)', '11_-_Jan_2014_(India)_B_Positive_2.jpg', '2014', '2016-02-06 12:23:39', 0),
(176, 'Women''s Health (India)', '13_-_Jan-Feb_2014_(India)_Womens_Health_1.jpg', '2014', '2016-02-06 12:25:07', 0),
(177, 'Women''s Health (India)', '13_-_Jan-Feb_2014_(India)_Womens_Health.jpg', '2014', '2016-02-06 12:25:52', 0),
(178, 'IDiva', '17_-_16:01:2014_(Web)_IDiva.jpg', '2014', '2016-02-06 12:26:26', 0),
(179, 'Ehads', '18_-_16:01:2014_(web)_Ehads_.jpg', '2014', '2016-02-06 12:27:00', 0),
(180, 'Mumbai Mirror (Mumbai)', '19_-_17:01:2014_(mumbai)_Mumbai_Mirror.jpg', '2014', '2016-02-06 12:28:33', 0),
(181, 'Mumbai Mirror', '20_-_17:01:2014_(web)_Mumbai_Mirror.jpg', '2014', '2016-02-06 12:29:14', 0),
(182, 'Pune Mirror', '21_-_19:01:2014_(web)_Pune_Mirror.jpg', '2014', '2016-02-06 12:29:59', 0),
(183, 'The Times of India', '22_-_19:01:2014_(web)_The_Times_of_India.jpg', '2014', '2016-02-06 12:30:28', 0),
(184, 'Asian Age (India)', '23_-_19:01:2014_(India)_Asian_Age.jpg', '2014', '2016-02-06 12:31:20', 0),
(185, 'Health Me Up', '24_-_20:01:2014_(web)_Health_Me_Up.jpg', '2014', '2016-02-06 12:32:08', 0),
(186, 'Cafe HT (Mumbai)', '25_-_21:01:2014_(mumbai)_HT_Cafe.jpg', '2014', '2016-02-06 12:35:29', 0),
(187, 'Ei Somoye (Kolkata)', '26_-_22:01:2014_(kolkata)_Ei_Somoye.jpg', '2014', '2016-02-06 12:44:36', 0),
(188, 'Mumbai Mirror', '27_-_25:01:2014_(web)_Mumbai_Mirror.jpg', '2014', '2016-02-06 12:44:55', 0),
(189, 'The Times of India', '28_-_25:01:2014_(web)_The_Times_of_India.jpg', '2014', '2016-02-06 12:45:14', 0),
(190, 'Mumbai Mirror (Mumbai)', '29_-_25:01:2014_(mumbai)_Mumbai_Mirror.jpg', '2014', '2016-02-06 12:46:08', 0),
(191, 'Bangalore Mirror', '30_-_26:01:2014_(web)_Bangalore_Mirror.jpg', '2014', '2016-02-06 12:46:28', 0),
(192, 'Pune Mirror', '31_-_26:01:2014_(web)_Pune_Mirror.jpg', '2014', '2016-02-06 12:46:49', 0),
(193, 'Asian Age (India)', '32_-_26:01:2014_(India)_Asian_Age.jpg', '2014', '2016-02-06 12:47:15', 0),
(194, 'IDiva', '33_-_30:01:2014_(web)_idiva.jpg', '2014', '2016-02-06 12:47:35', 0),
(195, 'Asian Age (India)', '34_-_02:02:2014_(India)_Asian_Age.jpg', '2014', '2016-02-06 12:47:54', 0),
(196, 'IDiva', '35_-_06:02:2014_(Web)_Idiva.jpg', '2014', '2016-02-06 12:48:19', 0),
(197, 'Alive', '36_-_08:08:2014_(Web)_Alive.com_.jpg', '2014', '2016-02-06 12:48:45', 0),
(198, 'New Woman (India)', '37_-_Feb_2014_(India)_New_Woman_1.jpg', '2014', '2016-02-06 12:49:24', 0),
(199, 'New Woman (India)', '37_-_Feb_2014_(India)_New_Woman_2.jpg', '2014', '2016-02-06 12:50:05', 0),
(200, 'Men''s Health (India)', '38_-_Feb_2014_(India)_Mens_Health.jpg', '2014', '2016-02-06 12:50:39', 0),
(201, 'Right Choice (India)', '39_-_Feb_2014_(India)_Right_Choice.jpg', '2014', '2016-02-06 12:51:09', 0),
(202, 'Articlecleapi', '40_-_11.02_.14_(Web)_Articlecleapi_.com_.jpg', '2014', '2016-02-06 12:51:26', 0),
(203, 'Bubblenews', '41_-_13.02_.14_(Web)_Bubblenews_.com_.jpg', '2014', '2016-02-06 12:51:48', 0),
(204, 'DNA (Mumbai)', '42_-_20.02_.2014_(Mumbai)Dna_After_Hrs_.jpg', '2014', '2016-02-06 12:52:07', 0),
(205, 'Dnaindia', '43_-_14.02_.14_(Web)_Dnaindia_.com_.jpg', '2014', '2016-02-06 12:52:59', 0),
(206, 'Health Me Up', '44_-_25.02_.14_(Web)_healthmeup_.com_.jpg', '2014', '2016-02-06 12:53:55', 0),
(207, 'IDiva', '45_-_20.02_.14_(Web)_Idiva_.com_.jpg', '2014', '2016-02-06 12:54:26', 0),
(208, 'IDiva', '46_-_13.02_.14_(Web)_Idiva_.com_.jpg', '2014', '2016-02-06 12:54:46', 0),
(209, 'Burrp (Mumbai)', '47_-_14.02_.14_(Web)_Mumbai_.burrp_.com_.jpg', '2014', '2016-02-06 12:55:12', 0),
(210, 'Mumbaimag', '48_-_18.02_.14_(Web)_Mumbaimag_.com_.jpg', '2014', '2016-02-06 12:55:59', 0),
(211, 'Midday', '49_-_20.02_.14_(Web)_Mid-day_.com_.jpg', '2014', '2016-02-06 12:56:20', 0),
(212, 'Sharir O Sasthya (India)', '50_-_15.02_.14_(India)_Sharir_O_Sasthya_.jpg', '2014', '2016-02-06 12:56:44', 0),
(213, 'Absolute India (India)', '60_-_12.01_.14_(India)_Absolute_India_.jpg', '2014', '2016-02-06 12:57:04', 0),
(214, 'Yahoo', '62_-_21.02_.14_(Web)_yahoo_.com_.jpg', '2014', '2016-02-06 12:57:21', 0),
(215, 'India Today (Mumbai)', '1-January_2015-(Mumbai)_India_Today-Simply_Mumbai.jpg', '2015', '2016-02-06 12:59:08', 0),
(216, 'The New Indian Express (Chennai)', '2-14.02_.2015-(Chennai)The_New_Indian_Express_.jpg', '2015', '2016-02-06 12:59:26', 0),
(217, 'Deccan Chronicle (Chennai)', '3-19.02_.2015-(Chennai)Deccan_Chronicle_.png', '2015', '2016-02-06 12:59:58', 0),
(218, 'Midday (Mumbai)', '7_-14.03_.2015(Mumbai)_Midday_.jpg', '2015', '2016-02-06 13:01:51', 0),
(219, 'You & I', '8-March_2015-_You_I.jpg', '2015', '2016-02-06 13:02:19', 0),
(220, 'You & I', '8-March_2015-_You_I_(2).jpg', '2015', '2016-02-06 13:02:46', 0),
(221, 'Times Life (India)', '10.05_.2015_(India)_Times_Life_.jpg', '2015', '2016-02-06 13:03:08', 0),
(222, 'Harpers Bazaar', '12-May_2015-Harpers_Bazaar.jpg', '2015', '2016-02-06 13:03:30', 0),
(223, 'Harpers Bazaar', '12-May_2015-Harpers_Bazaar_(2).jpg', '2015', '2016-02-06 13:03:50', 0),
(224, 'Womens Exclusive (Chennai)', '15_-_May_2015(Chennai)_Womens_Exclusive_(1).jpg', '2015', '2016-02-06 13:04:21', 0),
(225, 'Womens Exclusive (Chennai)', '15_-_May_2015(Chennai)_Womens_Exclusive_(2).jpg', '2015', '2016-02-06 13:04:37', 0),
(226, 'Womens Exclusive (Chennai)', '15_-_May_2015(Chennai)_Womens_Exclusive_(3).jpg', '2015', '2016-02-06 13:04:57', 0),
(227, 'Womens Exclusive (Chennai)', '15_-_May_2015(Chennai)_Womens_Exclusive_(4).jpg', '2015', '2016-02-06 13:05:17', 0),
(228, 'Wedding Mantra (India)', '16_-_May-June_2015(India)_Wedding_Mantra_(1).jpg', '2015', '2016-02-06 13:05:46', 0),
(229, 'Wedding Mantra (India)', '16_-_May-June_2015(India)_Wedding_Mantra_(2).jpg', '2015', '2016-02-06 13:06:05', 0),
(230, 'Wedding Mantra (India)', '16_-_May-June_2015(India)_Wedding_Mantra_(3).jpg', '2015', '2016-02-06 13:06:29', 0),
(231, 'Vogue (India)', '19_-_November_2015(India)_Vogue.jpg', '2015', '2016-02-06 13:06:54', 0),
(232, 'Vogue (India)', '19_-_November_2015(India)_Vogue_(2).jpg', '2015', '2016-02-06 13:07:23', 0),
(233, 'Noblesse (India)', '21_-_December_2015(India)_Noblesse.jpg', '2015', '2016-02-06 13:07:46', 0),
(234, 'Explore (India)', '24_-_1:04:2013_(India)_Explore-1.jpg', '2013', '2016-02-06 13:13:42', 0),
(235, 'Explore (India)', '24_-_1:04:2013_(India)_Explore-2.jpg', '2013', '2016-02-06 13:15:21', 0),
(236, 'Marwar (India)', '44_-_May:June_issue_(India)_Marwar-1.jpg', '2013', '2016-02-06 13:15:54', 0),
(237, 'Marwar (India)', '44_-_May:June_issue_(India)_Marwar-2.jpg', '2013', '2016-02-06 13:16:55', 0),
(238, 'Marwar (India)', '44_-_May:June_issue_(India)_Marwar-3.jpg', '2013', '2016-02-06 13:17:25', 0),
(239, 'Health and Nutrition (India)', '56_-_June_Issue_(India)_Health_and_Nutrition.jpg', '2013', '2016-02-06 13:18:58', 0),
(240, 'Asian Age (Mumbai)', '65_-_4:08:2013_(Mumbai)_Asian_Age.jpg', '2013', '2016-02-06 13:19:36', 0),
(241, 'Spicy Sangria', '66_-_4:08:2013_(Web)_Spicy_Sangria-1.jpg', '2013', '2016-02-06 13:20:02', 0),
(242, 'Spicy Sangria', '66_-_4:08:2013_(Web)_Spicy_Sangria-2.jpg', '2013', '2016-02-06 13:20:49', 0),
(244, 'Spicy Sangria', '66_-_4:08:2013_(Web)_Spicy_Sangria-3.jpg', '2013', '2016-02-06 13:25:09', 0),
(245, 'Health Me Up', '67_-_10:08:2013_(Web)_Healthmeup-11.jpg', '2013', '2016-02-06 13:25:34', 0),
(246, 'Health Me Up', '67_-_10:08:2013_(Web)_Healthmeup-2.jpg', '2013', '2016-02-06 13:26:53', 0),
(247, 'Health Me Up', '67_-_10:08:2013_(Web)_Healthmeup-3.jpg', '2013', '2016-02-06 13:27:15', 0),
(248, 'Health Me Up', '67_-_10:08:2013_(Web)_Healthmeup-4.jpg', '2013', '2016-02-06 13:27:33', 0),
(249, 'Health Me Up', '67_-_10:08:2013_(Web)_Healthmeup-5.jpg', '2013', '2016-02-06 13:27:51', 0),
(250, 'Health Me Up', '67_-_10:08:2013_(Web)_Healthmeup-6.jpg', '2013', '2016-02-06 13:28:17', 0),
(251, 'Asian Age (Mumbai)', '68_-_11:08:2013_(Mumbai)_Asian_Age_2.jpg', '2013', '2016-02-06 13:28:55', 0),
(252, 'Healthy Dunia', '69_-_19:08:2013_(Web)_Healthy_Dunia-1.jpg', '2013', '2016-02-06 13:29:20', 0),
(253, 'Healthy Dunia', '69_-_19:08:2013_(Web)_Healthy_Dunia-2.jpg', '2013', '2016-02-06 13:31:21', 0),
(254, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-1.jpg', '2013', '2016-02-06 13:31:47', 0),
(255, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-2.jpg', '2013', '2016-02-06 13:32:03', 0),
(256, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-3.jpg', '2013', '2016-02-06 13:32:21', 0),
(257, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-4.jpg', '2013', '2016-02-06 13:32:54', 0),
(258, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-5.jpg', '2013', '2016-02-06 13:33:18', 0),
(259, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-6.jpg', '2013', '2016-02-06 13:33:45', 0),
(260, 'Healthy Dunia', '70_-_19:08:2013_(Web)_Healthy_Dunia-7.jpg', '2013', '2016-02-06 13:34:34', 0),
(261, 'Health Me Up', '71_-_25:08:2013_(Web)_Health_Me_Up.jpg', '2013', '2016-02-06 13:35:00', 0),
(262, 'Inside Salon & Spa', '72-_September_2013-Inside_Salon_Spa-1.jpg', '2013', '2016-02-06 13:36:10', 0),
(263, 'Inside Salon & Spa', '72-_September_2013-Inside_Salon_Spa-2.jpg', '2013', '2016-02-06 13:36:34', 0),
(264, 'Inside Salon & Spa', '72-_September_2013-Inside_Salon_Spa-3.jpg', '2013', '2016-02-06 13:37:00', 0),
(265, 'Wedding Mantra (Mumbai)', '73_-_September_2013_issue_(Mumbai)_Wedding_Mantra_(3)-1.jpg', '2013', '2016-02-06 13:37:55', 0),
(266, 'Wedding Mantra (Mumbai)', '73_-_September_2013_issue_(Mumbai)_Wedding_Mantra_(3)-2.jpg', '2013', '2016-02-06 13:38:33', 0),
(267, 'New Woman (India)', '74_-_Sept_Issue_(India)_New_Woman-1.jpg', '2013', '2016-02-06 13:48:51', 0),
(268, 'New Woman (India)', '74_-_Sept_Issue_(India)_New_Woman-2.jpg', '2013', '2016-02-06 13:49:24', 0),
(269, 'New Woman (India)', '74_-_Sept_Issue_(India)_New_Woman-3.jpg', '2013', '2016-02-06 13:49:44', 0),
(270, 'New Woman (India)', '74_-_Sept_Issue_(India)_New_Woman-4.jpg', '2013', '2016-02-06 13:50:04', 0),
(271, 'Healthy Dunia', '75_-_5:09:2013_(Web)_Healthy_Dunia-1.jpg', '2013', '2016-02-06 13:50:25', 0),
(272, 'Healthy Dunia', '75_-_5:09:2013_(Web)_Healthy_Dunia-2.jpg', '2013', '2016-02-06 13:50:49', 0),
(273, 'Healthy Dunia', '75_-_5:09:2013_(Web)_Healthy_Dunia-3.jpg', '2013', '2016-02-06 13:51:07', 0),
(274, 'Asian Age (Mumbai)', '76_-_8:09:2013_(Mumbai)_Asian_Age.jpg', '2013', '2016-02-06 13:51:47', 0),
(275, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-1.jpg', '2013', '2016-02-06 13:52:12', 0),
(276, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-2.jpg', '2013', '2016-02-06 13:52:30', 0),
(277, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-3.jpg', '2013', '2016-02-06 13:52:50', 0),
(278, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-4.jpg', '2013', '2016-02-06 13:53:10', 0),
(279, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-5.jpg', '2013', '2016-02-06 13:53:38', 0),
(280, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-6.jpg', '2013', '2016-02-06 13:53:58', 0),
(281, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-7.jpg', '2013', '2016-02-06 13:54:18', 0),
(282, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-8.jpg', '2013', '2016-02-06 13:54:36', 0),
(283, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-9.jpg', '2013', '2016-02-06 13:54:55', 0),
(284, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-10.jpg', '2013', '2016-02-06 13:55:15', 0),
(285, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-11.jpg', '2013', '2016-02-06 13:55:31', 0),
(286, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-12.jpg', '2013', '2016-02-06 13:55:50', 0),
(287, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-13.jpg', '2013', '2016-02-06 13:56:08', 0),
(288, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-14.jpg', '2013', '2016-02-06 13:56:27', 0),
(289, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-15.jpg', '2013', '2016-02-06 13:56:49', 0),
(290, 'Health Me Up', '77_-_11:09:2013_(Web)_Health_Me_Up-16.jpg', '2013', '2016-02-06 13:57:09', 0),
(291, 'Health Me Up', '79_-_26:09:2013_(Web)_Health_me_up-1.jpg', '2013', '2016-02-06 13:57:44', 0),
(292, 'Health Me Up', '79_-_26:09:2013_(Web)_Health_me_up-2.jpg', '2013', '2016-02-06 13:58:03', 0),
(293, 'Health Me Up', '79_-_26:09:2013_(Web)_Health_me_up-3.jpg', '2013', '2016-02-06 13:58:20', 0),
(294, 'Health Me Up', '79_-_26:09:2013_(Web)_Health_me_up-4.jpg', '2013', '2016-02-06 13:58:38', 0),
(295, 'Parents India (India)', '121_-_Nov_2013_issue(India)_Parents_India-1.jpg', '2013', '2016-02-06 13:59:38', 0),
(296, 'Parents India (India)', '121_-_Nov_2013_issue(India)_Parents_India-2.jpg', '2013', '2016-02-06 14:00:06', 0),
(297, 'Parents India (India)', '121_-_Nov_2013_issue(India)_Parents_India-3.jpg', '2013', '2016-02-06 14:00:37', 0),
(298, 'Parents India (India)', '121_-_Nov_2013_issue(India)_Parents_India-4.jpg', '2013', '2016-02-06 14:00:58', 0),
(299, 'Asian Age (Mumbai)', '83_-_29_.jpg', '2013', '2016-02-06 14:01:52', 0),
(300, 'Asian Age (Mumbai)', '120_-_06.jpg', '2013', '2016-02-06 14:02:33', 0),
(302, 'Dainik Bhaskar', '4-1.03_.jpg', '2015', '2016-02-06 14:09:02', 0),
(303, 'Afternoon D&C (Mumbai)', '5-10.03_.jpg', '2015', '2016-02-06 14:09:32', 0),
(304, 'lifehacker', '9-06.04_.2015-lifehacker_.co_.in-page-001_.jpg', '2015', '2016-02-06 19:47:10', 0),
(305, 'lifehacker', '9-06.04_.2015-lifehacker_.co_.in-page-002_.jpg', '2015', '2016-02-06 19:47:34', 0),
(306, 'B Positive', '10-April_2015-B_Positive-page-001.jpg', '2015', '2016-02-06 19:49:05', 0),
(307, 'B Positive', '10-April_2015-B_Positive-page-002.jpg', '2015', '2016-02-06 19:49:24', 0),
(308, 'Afternoon D&C (Mumbai)', '11-05.05_.2015-(Mumbai)Afternoon_DC-page-001_.jpg', '2015', '2016-02-06 19:51:04', 0),
(309, 'Vogue (India)', '13-04.05_.2015_(India)_Vogue_.in-page-001_.jpg', '2015', '2016-02-06 19:51:49', 0),
(311, 'Vogue (India)', '14-25.05_.2015_(India)_Vogue_.in-page-001_.jpg', '2015', '2016-02-06 19:53:54', 0),
(312, 'Vogue (India)', '14-25.05_.2015_(India)_Vogue_.in-page-002_.jpg', '2015', '2016-02-06 19:54:11', 0),
(313, 'Vogue (India)', '14-25.05_.2015_(India)_Vogue_.in-page-003_.jpg', '2015', '2016-02-06 19:54:26', 0),
(314, 'Vogue (India)', '17_-_06.07_.2015_(India)_Vogue_.in-page-001_.jpg', '2015', '2016-02-06 19:56:05', 0),
(315, 'Vogue (India)', '17_-_06.07_.2015_(India)_Vogue_.in-page-002_.jpg', '2015', '2016-02-06 19:56:24', 0),
(316, 'Vogue (India)', '17_-_06.07_.2015_(India)_Vogue_.in-page-003_.jpg', '2015', '2016-02-06 19:56:44', 0),
(317, 'Vogue (India)', '17_-_06.07_.2015_(India)_Vogue_.in-page-003_1.jpg', '2015', '2016-02-06 19:57:27', 0),
(318, 'Vogue (India)', '17_-_06.07_.2015_(India)_Vogue_.in-page-004_.jpg', '2015', '2016-02-06 19:57:45', 0),
(319, 'Vogue (India)', '18_-_29.09_.2015_(India)_Vogue_.in-page-001_.jpg', '2015', '2016-02-06 19:58:32', 0),
(320, 'Vogue (India)', '18_-_29.09_.2015_(India)_Vogue_.in-page-002_.jpg', '2015', '2016-02-06 19:58:49', 0),
(321, 'Asian Age', '12_-_12-01-2014_(India)_Asian_Age-page-001.jpg', '2014', '2016-02-06 20:20:54', 0),
(322, 'Beauty Book', '15_-_16-01-2014_(Web)_Beauty_Book-page-001.jpg', '2014', '2016-02-06 20:21:27', 0),
(323, 'Beauty Book', '15_-_16-01-2014_(Web)_Beauty_Book-page-002.jpg', '2014', '2016-02-06 20:21:44', 0),
(324, 'Beauty Book', '15_-_16-01-2014_(Web)_Beauty_Book-page-003.jpg', '2014', '2016-02-06 20:22:14', 0),
(325, 'Beauty Book', '15_-_16-01-2014_(Web)_Beauty_Book-page-004.jpg', '2014', '2016-02-06 20:22:32', 0),
(326, 'Beauty Book', '15_-_16-01-2014_(Web)_Beauty_Book-page-005.jpg', '2014', '2016-02-06 20:22:49', 0),
(327, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-001.jpg', '2014', '2016-02-06 20:23:20', 0),
(328, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-002.jpg', '2014', '2016-02-06 20:23:47', 0),
(329, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-003.jpg', '2014', '2016-02-06 20:24:06', 0),
(330, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-004.jpg', '2014', '2016-02-06 20:24:24', 0),
(331, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-005.jpg', '2014', '2016-02-06 20:24:43', 0),
(332, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-006.jpg', '2014', '2016-02-06 20:25:27', 0),
(333, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-007.jpg', '2014', '2016-02-06 20:25:47', 0),
(334, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-008.jpg', '2014', '2016-02-06 20:26:04', 0),
(335, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-009.jpg', '2014', '2016-02-06 20:26:20', 0),
(336, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-010.jpg', '2014', '2016-02-06 20:26:39', 0),
(337, 'Healthy Dunia', '16_-_16:01:2014_(web)_Healthy_dunia-page-011.jpg', '2014', '2016-02-06 20:26:55', 0),
(338, 'Femina (India)', '51_-_June_Issue_(India)_Femina-page-001.jpg', '2014', '2016-02-06 20:27:27', 0),
(339, 'Femina (India)', '51_-_June_Issue_(India)_Femina-page-002.jpg', '2014', '2016-02-06 20:27:52', 0),
(340, 'Jagran Sakhi (India)', '52_-_June_Issue_(India)_Jagran_Sakhi-page-001.jpg', '2014', '2016-02-06 20:28:19', 0),
(341, 'Jagran Sakhi (India)', '52_-_June_Issue_(India)_Jagran_Sakhi-page-002.jpg', '2014', '2016-02-06 20:28:51', 0),
(342, 'Jagran Sakhi (India)', '52_-_June_Issue_(India)_Jagran_Sakhi-page-003.jpg', '2014', '2016-02-06 20:29:14', 0),
(343, 'Bombay Times (Mumbai)', '53_-_01.07_.14_(Mumbai)_Bombay_Times-page-001_.jpg', '2014', '2016-02-06 20:29:39', 0),
(344, 'Bombay Times (Mumbai)', '54_-_29.09_.14_(Mumbai)_Bombay_Times-page-001_.jpg', '2014', '2016-02-06 20:30:04', 0),
(345, 'Vogue (India)', '55_-_October_Issue_(India)_Vogue-page-001.jpg', '2014', '2016-02-06 20:30:30', 0),
(346, 'Vogue (India)', '55_-_October_Issue_(India)_Vogue-page-002.jpg', '2014', '2016-02-06 20:30:51', 0),
(347, 'Vogue (India)', '55_-_October_Issue_(India)_Vogue-page-003.jpg', '2014', '2016-02-06 20:31:15', 0),
(348, 'Vogue (India)', '55_-_October_Issue_(India)_Vogue-page-004.jpg', '2014', '2016-02-06 20:31:42', 0),
(349, 'Marwar (India)', '56_-_October_Issue_(India)_Marwar-page-001.jpg', '2014', '2016-02-06 20:32:14', 0),
(350, 'Marwar (India)', '56_-_October_Issue_(India)_Marwar-page-002.jpg', '2014', '2016-02-06 20:32:39', 0),
(351, 'Marwar (India)', '56_-_October_Issue_(India)_Marwar-page-003.jpg', '2014', '2016-02-06 20:33:05', 0),
(352, 'Marwar (India)', '56_-_October_Issue_(India)_Marwar-page-004.jpg', '2014', '2016-02-06 20:33:29', 0),
(353, 'Marwar (India)', '56_-_October_Issue_(India)_Marwar-page-005.jpg', '2014', '2016-02-06 20:33:57', 0),
(354, 'Marwar (India)', '56_-_October_Issue_(India)_Marwar-page-006.jpg', '2014', '2016-02-06 20:34:22', 0),
(355, 'Femina (India)', '57-_October_Issue_(India)_Femina-page-001.jpg', '2014', '2016-02-06 20:34:58', 0),
(356, 'Femina (India)', '57-_October_Issue_(India)_Femina-page-002.jpg', '2014', '2016-02-06 20:35:21', 0),
(357, 'Femina (India)', '57-_October_Issue_(India)_Femina-page-003.jpg', '2014', '2016-02-06 20:35:45', 0),
(358, 'Femina (India)', '57-_October_Issue_(India)_Femina-page-004.jpg', '2014', '2016-02-06 20:36:09', 0),
(359, 'Femina (India)', '57-_October_Issue_(India)_Femina-page-005.jpg', '2014', '2016-02-06 20:36:35', 0),
(360, 'Femina (India)', '58_-_November_Issue_(India)_Femina-page-001.jpg', '2014', '2016-02-06 20:37:04', 0),
(361, 'Femina (India)', '58_-_November_Issue_(India)_Femina-page-002.jpg', '2014', '2016-02-06 20:37:21', 0),
(362, 'New Woman (India)', '59_-_December_Issue_(India)_New_Woman-page-001.jpg', '2014', '2016-02-06 20:37:51', 0),
(363, 'New Woman (India)', '59_-_December_Issue_(India)_New_Woman-page-002.jpg', '2014', '2016-02-06 20:38:12', 0),
(364, 'New Woman (India)', '59_-_December_Issue_(India)_New_Woman-page-003.jpg', '2014', '2016-02-06 20:38:35', 0),
(365, 'New Woman (India)', '59_-_December_Issue_(India)_New_Woman-page-004.jpg', '2014', '2016-02-06 20:38:54', 0),
(366, 'New Woman (India)', '59_-_December_Issue_(India)_New_Woman-page-005.jpg', '2014', '2016-02-06 20:39:44', 0),
(367, 'Mumbai Mirror (Mumbai)', '61_-_29.01_.14_(Mumbai)_Mumbai_Mirror-page-001_.jpg', '2014', '2016-02-06 20:41:01', 0),
(368, 'Metro India (Delhi)', '6-11.03_.2015-(Delhi)_Metro_India_000001_.jpg', '2015', '2016-02-06 20:47:25', 0);

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
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price_in_INR` varchar(255) NOT NULL,
  `price_in_dollars` varchar(255) NOT NULL,
  `packageid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan`, `title`, `description`, `price_in_INR`, `price_in_dollars`, `packageid`) VALUES
(5, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '6500', '103', 5),
(6, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '9900', '160', 5),
(7, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '18500', '285', 5),
(8, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '25000', '400', 5),
(9, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '9900', '160', 6),
(10, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '17900', '290', 6),
(11, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '29500', '465', 6),
(12, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '40000', '625', 6),
(13, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '17900', '290', 7),
(14, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '29900', '480', 7),
(15, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 7),
(16, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '75000', '1170', 7),
(17, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '5900', '95', 8),
(18, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '8900', '150', 8),
(19, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '17500', '225', 8),
(20, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '22000', '350', 8),
(21, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '9900', '165', 9),
(22, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '14900', '240', 9),
(23, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '28500', '440', 9),
(24, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '38000', '600', 9),
(25, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '14900', '245', 10),
(26, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '22900', '370', 10),
(27, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '39500', '610', 10),
(28, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '55000', '850', 10),
(29, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '26900', '435', 11),
(30, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '39900', '640', 11),
(31, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '69500', '1080', 11),
(32, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '90000', '1400', 11),
(33, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '17900', '300', 12),
(34, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '28900', '465', 12),
(35, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 12),
(36, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '65000', '1000', 12),
(37, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '5900', '95', 13),
(38, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '8900', '150', 13),
(39, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '17500', '225', 13),
(40, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '22000', '350', 13),
(41, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '9900', '165', 14),
(42, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '14900', '240', 14),
(43, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '28500', '440', 14),
(44, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '38000', '600', 14),
(45, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '14900', '245', 15),
(46, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '22900', '370', 15),
(47, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '39500', '610', 15),
(48, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '55000', '850', 15),
(49, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '17900', '300', 17),
(50, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '28900', '465', 17),
(51, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 17),
(52, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '65000', '1000', 17),
(53, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '26900', '435', 18),
(54, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '39900', '640', 18),
(55, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '69500', '1080', 18),
(56, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '90000', '1400', 18),
(57, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '5900', '95', 19),
(58, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '8900', '150', 19),
(59, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '17500', '225', 19);
INSERT INTO `plans` (`id`, `plan`, `title`, `description`, `price_in_INR`, `price_in_dollars`, `packageid`) VALUES
(60, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '22000', '350', 19),
(61, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '9900', '165', 20),
(62, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '14900', '240', 20),
(63, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '28500', '440', 20),
(64, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '38000', '600', 20),
(65, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '14900', '245', 21),
(66, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '22900', '370', 21),
(67, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '39500', '610', 21),
(68, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '55000', '850', 21),
(69, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '17900', '300', 22),
(70, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '28900', '465', 22),
(71, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 22),
(72, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '65000', '1000', 22),
(73, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '26900', '435', 23),
(74, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '39900', '640', 23),
(75, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '69500', '1080', 23),
(76, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '90000', '1400', 23),
(77, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '5900', '95', 24),
(78, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '8900', '150', 24),
(79, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '17500', '225', 24),
(80, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '22000', '350', 24),
(81, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '9900', '165', 25),
(82, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '14900', '240', 25),
(83, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '28500', '440', 25),
(84, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '38000', '600', 25),
(85, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '14900', '245', 26),
(86, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '22900', '370', 26),
(87, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '39500', '610', 26),
(88, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '55000', '850', 26),
(89, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '17900', '300', 27),
(90, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '28900', '465', 27),
(91, 3, 'SPECIAL ADDITIONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 27),
(92, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '65000', '1000', 27),
(93, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '26900', '435', 28),
(94, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '39900', '640', 28),
(95, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '69500', '1080', 28),
(96, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '90000', '1400', 28),
(97, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '5900', '95', 29),
(98, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '8900', '150', 29),
(100, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '17500', '225', 29),
(101, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '22000', '350', 29),
(102, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '9900', '165', 30),
(103, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '14900', '240', 30),
(104, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '28500', '440', 30),
(105, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '38000', '600', 30),
(106, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '14900', '245', 31),
(107, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '22900', '370', 31),
(108, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '39500', '610', 31),
(109, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '55000', '850', 31),
(110, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '17900', '300', 32),
(111, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '28900', '465', 32),
(112, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 32),
(113, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '65000', '1000', 32),
(114, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '26900', '435', 33),
(115, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '39900', '640', 33);
INSERT INTO `plans` (`id`, `plan`, `title`, `description`, `price_in_INR`, `price_in_dollars`, `packageid`) VALUES
(116, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '69500', '1080', 33),
(117, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '90000', '1400', 33),
(118, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '6500', '103', 34),
(119, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '9900', '160', 34),
(120, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '18500', '285', 34),
(121, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '25000', '400', 34),
(122, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '9900', '160', 35),
(123, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '17900', '290', 35),
(124, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '29500', '465', 35),
(125, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '40000', '625', 35),
(126, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '17900', '290', 36),
(127, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '29900', '480', 36),
(128, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 36),
(129, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '75000', '1170', 36),
(130, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '6500', '103', 37),
(131, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '9900', '160', 37),
(132, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '18500', '285', 37),
(133, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '25000', '400', 37),
(134, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '9900', '160', 38),
(135, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '17900', '290', 38),
(136, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '29500', '465', 38),
(137, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '40000', '625', 38),
(138, 1, 'SPECIAL ADDITIONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '17900', '290', 39),
(139, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '29900', '480', 39),
(140, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 39),
(141, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '75000', '1170', 39),
(142, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '6500', '103', 40),
(143, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '9900', '160', 40),
(144, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '18500', '285', 40),
(145, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '25000', '400', 40),
(146, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n<li>Silver plan rates are only applicable for online consultation.</li>\n</ul>', '9900', '160', 41),
(147, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '17900', '290', 41),
(148, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '29500', '465', 41),
(149, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '40000', '625', 41),
(150, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '17900', '290', 42),
(151, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '29900', '480', 42),
(152, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 42),
(153, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '75000', '1170', 42),
(154, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '6500', '103', 43),
(155, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '9900', '160', 43),
(156, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '1850', '285', 43),
(157, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '25000', '400', 43),
(158, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '9900', '160', 44),
(159, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '17900', '290', 44),
(160, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '29500', '465', 44),
(161, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '40000', '625', 44),
(162, 1, 'SPECIAL ADDONS', '<ul>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Silver plan rates are only applicable for online consultation.</p>', '17900', '290', 45),
(163, 2, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required</li>\n</ul>', '29900', '480', 45),
(164, 3, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance as often as possible.</li>\n<li>If you not reach your goals in the stipulated time then you will be given an extension.</li>\n<li>We will try to attend you as soon as you arrive.</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '49500', '770', 45),
(165, 4, 'SPECIAL ADDONS', '<ul>\n<li>Suman Madam&rsquo;s one to one consultation along with nutritionist for the first visit when the diet is created.</li>\n<li>Suman Madam&rsquo;s one to one guidance every week there after</li>\n<li>Extra motivational support</li>\n<li>We generally like to keep a consulting room empty for you, if you inform us 5 minutes before your arrival</li>\n<li>Separate WhatsApp group support for queries in between the week</li>\n<li>One consultation with our Grooming expert</li>\n<li>One consultation with your cook to guide about portions and serving size</li>\n<li>If you do not reach your goals in the stipulated time then you will be given an extension</li>\n<li>WhatsApp / Message support with your nutritionist.</li>\n<li>A folder, Diet Dairy and Measurement Card.</li>\n<li>10 Pillars of Health Design and Fruit Exchange List.</li>\n<li>Personalized exercise regime.</li>\n<li>Vitamin Check.</li>\n<li>Blood Report Analysis.</li>\n<li>Dietary support for ailments, if required.</li>\n<li>Invaluable tips on health, hair and skin care.</li>\n<li>Holiday survival guide &amp; Travel tips.</li>\n<li>Balanced dining out options for numerous cuisines.</li>\n<li>Medical guidance, if required.</li>\n</ul>', '75000', '1170', 45);

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE IF NOT EXISTS `productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `subcategory` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`id`, `product`, `subcategory`) VALUES
(1, 1, 1),
(4, 3, 1),
(6, 2, 1),
(7, 4, 1),
(8, 5, 1),
(9, 6, 1),
(10, 7, 2),
(11, 8, 2),
(12, 9, 4),
(13, 51, 3),
(14, 81, 2),
(15, 82, 3),
(16, 10, 8),
(17, 49, 4),
(18, 16, 5),
(19, 15, 5),
(20, 14, 6),
(23, 17, 6),
(24, 22, 6),
(25, 19, 6),
(26, 18, 6),
(27, 13, 6),
(28, 20, 7),
(29, 12, 8),
(30, 53, 8),
(31, 83, 8),
(32, 30, 9),
(33, 23, 9),
(34, 84, 9),
(35, 26, 10),
(36, 86, 10),
(37, 42, 32),
(38, 11, 32),
(39, 31, 11),
(40, 32, 11),
(41, 29, 12),
(42, 34, 12),
(43, 87, 12),
(44, 88, 12),
(45, 37, 13),
(46, 27, 14),
(47, 61, 15),
(48, 89, 16),
(49, 24, 16),
(50, 90, 17),
(51, 35, 17),
(52, 66, 15),
(53, 71, 39),
(54, 40, 19),
(55, 38, 20),
(56, 68, 11),
(57, 62, 16),
(58, 91, 16),
(59, 39, 17),
(60, 54, 21),
(61, 92, 21),
(62, 69, 21),
(63, 93, 22),
(65, 94, 22),
(66, 28, 22),
(67, 95, 22),
(68, 65, 23),
(69, 36, 23),
(70, 64, 23),
(71, 96, 24),
(72, 97, 24),
(73, 63, 24),
(74, 98, 24),
(75, 25, 24),
(76, 100, 25),
(77, 70, 17),
(78, 101, 17),
(79, 33, 17),
(80, 52, 16),
(81, 41, 25),
(82, 102, 25),
(83, 77, 26),
(84, 78, 26),
(85, 79, 0),
(86, 47, 27),
(87, 46, 27),
(88, 45, 27),
(89, 48, 28),
(90, 67, 29),
(91, 44, 30),
(92, 43, 30),
(93, 55, 30),
(94, 103, 31),
(95, 73, 31),
(96, 74, 31),
(97, 57, 31),
(98, 58, 31),
(99, 59, 31),
(100, 76, 31);

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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(555) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `ingredients` longtext NOT NULL,
  `method` longtext NOT NULL,
  `valueperserve` longtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
-- Table structure for table `selftables_blog`
--

DROP TABLE IF EXISTS `selftables_blog`;
CREATE TABLE IF NOT EXISTS `selftables_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `posted_by` varchar(255) NOT NULL,
  `dateofposting` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `selftables_blog`
--

INSERT INTO `selftables_blog` (`id`, `name`, `image`, `description`, `posted_by`, `dateofposting`, `views`) VALUES
(4, 'Apple Rabdi', '61.png', '<p class="p1"><em><strong><span class="s1">A nutritious delicacy made from&nbsp;</span>apple and reduced milk flavoured with cinnamon.</strong></em></p>\n<p class="p1">&nbsp;</p>\n<p class="p1"><strong>Makes 3 cups</strong></p>\n<p><strong>Serving Size: 3/4 cup</strong></p>\n<p>&nbsp;</p>\n<p><strong>Ingredients</strong></p>\n<p class="p1"><em>2 medium-sized apples&nbsp;</em><em>(300 gm, finely chopped) or</em></p>\n<p class="p1"><em>11/2 cups apple (peeled and&nbsp;</em><em>grated)</em></p>\n<p class="p1"><em>2 cups slim milk</em></p>\n<p class="p1"><em>2 tbsp powdered sugar</em></p>\n<p class="p1"><em>1/2 tsp cinnamon powder</em></p>\n<p class="p1">&nbsp;</p>\n<p class="p1">&nbsp;</p>\n<p class="p1"><strong>Method</strong></p>\n<p class="p1"><span class="s1">1. </span>Pour the milk in a heavy bottomed pan and bring to a boil.</p>\n<p class="p1"><span class="s1">2. </span>Continue boiling for 10-12 minutes till the milk reduces to around 11/2 cups.</p>\n<p class="p1"><span class="s1">3. </span>Switch off the gas and stir in the sugar and cinnamon powder.</p>\n<p class="p1"><span class="s1">4. </span>When it reaches room temperature, add the grated apple and refrigerate.</p>\n<p class="p1"><span class="s1">5. </span>Serve chilled.</p>\n<p class="p1"><span class="s1">6. </span>Garnish with chopped walnuts before serving (optional).</p>\n<p class="p1">&nbsp;</p>\n<p class="p1">&nbsp;</p>\n<p class="p1"><strong>Value per serving</strong></p>\n<p>Calories 109&nbsp;kcal</p>\n<p>Protein 3.6&nbsp;gms</p>\n<p>Fat 0.5&nbsp;gms</p>\n<p>Carbs 22 gms</p>\n<p>Calcium 157&nbsp;mgs</p>\n<p>Iron 0.5&nbsp;gm</p>\n<p>Fibre 0.7 gm</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p class="p1"><em><strong>Variation</strong></em>: Instead of apple and cinnamon, you can use fresh chopped strawberries&nbsp;to make a strawberry rabdi.</p>', 'SelfCare by Suman', '2016-02-09 05:08:23', 2),
(6, 'How to deal with a Hangover', '31.png', '<p><strong>Don&rsquo;t let your &lsquo;sinful&rsquo; ways play party pooper this festive season. Presenting a few simple tips guaranteed to help you combat the usual downsides.</strong></p>\n<p>&nbsp;</p>\n<p><strong>How to keep off those unwanted bulges&hellip;</strong></p>\n<ul>\n<li>Pay for your party. Yup, you heard right! If you know you are going to be gorging on some high-fat foods at the party, do a good workout both in the morning as well as the evening to ensure the fats won&rsquo;t end up on your hips or belly.</li>\n<li>Before you head for your fun night, drink a glass of buttermilk or skimmed milk at home. If it promises to be an all-nighter, have your main meal at home too. This will ensure you don&rsquo;t stuff yourself with high-calorie starters.</li>\n<li>Avoid any form of carbohydrate at the party. Instead, opt for saut&eacute;ed vegetables, chicken, fish etc.</li>\n<li>Opt for red wine as it contains resveratrol, an anti-fungal compound found in grape skin, which increases HDL (the good cholesterol) and inhibits LDL Oxidation (the bad cholesterol). But if you are prone to migraine or acidity, avoid having wine.</li>\n</ul>\n<p><strong>&nbsp; &nbsp;</strong></p>\n<p><strong><strong>How to avoid a hangover&hellip;</strong></strong></p>\n<ul>\n<li>Drinking on an empty stomach is never a good idea. Have a glass of buttermilk or a small snack before heading to the party. This way, you&rsquo;ll slow down the absorption of the alcohol and also reduce its effects.</li>\n<li>It is also a good idea to eat a little while you are drinking. Munch on freshly cut salads or a fistful of nuts. If you are on a weight check, then preferably have high protein snacks like chicken tikka, tandoori chicken, hara bhara kabab or moong dal vadas.</li>\n<li>Have a bowl of yogurt at the end of your evening. The yoghurt will line your stomach and slow the alcohol from entering the bloodstream.</li>\n<li>Avoid sweet drinks (and sugary foods) while you drink. The forced metabolism of sugar and alcohol by your body will accelerate the depletion of B vitamins and make the hangover worse.</li>\n<li>Alternate your hard drinks with a fresh lime soda (salted) or a fruit juice or any non-alcoholic drink or a glass of water to avoid getting dehydrated.&nbsp;</li>\n<li>If it&rsquo;s a long evening, space out your drinks to one drink an hour. One drink would be a large peg of 60 ml vodka/whisky/wine/rum or a one pint of beer.</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>How to deal with a hangover&hellip;</strong></p>\n<ul>\n<li>Drink at least 250 ml to 500 ml of water before going to sleep.</li>\n<li>Drink plenty of water as soon as you get up in the morning.</li>\n<li>Have a high-carb drink like lime water with sugar and salt or a sports drink like Gatorade.</li>\n<li>Drink coconut water to replace the lost fluids and potassium.</li>\n<li>Have a glass of freshly squeezed orange juice or have a bowl of papaya.</li>\n<li>Bananas will help give you the energy you&rsquo;ll need and make up for the loss of potassium.</li>\n<li>Avoid caffeine, as it will only dehydrate you more.</li>\n<li>If you have had a heavy meal the previous night, have some fresh fruits and yogurt for the lunch. However, DO NOT skip breakfast.</li>\n</ul>\n<p>&nbsp;</p>\n<p>BOX:</p>\n<p><strong>Calories that count</strong>&hellip;</p>\n<p><strong>Alcoholic beverages (approximate values)</strong></p>\n<p>Wine (200 ml)- 88 k cal</p>\n<p>Beer (300 m)- 150 k cal</p>\n<p>Spirits like Gin, Rum, Vodka, Whiskey, Scotch (60 ml) -133 k cal</p>\n<p>&nbsp;</p>\n<p><strong>Popular Cocktails &ndash; Calories per 200 ml (approximate values)</strong></p>\n<p>Cosmopolitan &ndash; 151 k cal</p>\n<p>Margarita &ndash; 413 k cal</p>\n<p>Bloody Mary &ndash; 164 k cal</p>\n<p>Mojito &ndash; 136 k cal</p>\n<p>Long Island Ice tea &ndash; 457 k cal</p>', 'SelfCare by Suman', '2016-02-09 05:27:58', 5),
(8, 'Eating Out Guide', '17.png', '<h2><strong>Executive Menus :</strong></h2>\n<p><strong>(The restaurant meal doesn&rsquo;t necessarily spell disaster for a healthy diet)</strong></p>\n<p>&nbsp;</p>\n<p><strong>Following are the points to remember while ordering from restaurants:-</strong></p>\n<ul>\n<li>Importance of a <strong>COMPLETE PLATE </strong>is that it signifies a balanced meal that consist of <strong>Protein + Dairy + Fibre + Carbs.</strong></li>\n<li>Make sure that you do not skip the protein group (i.e. milk/curd/dal/sprouts/ chicken/ fish) when ordering your meal.</li>\n<li>Always order for freshly cut salad or a clear soup for starters. Return the bread basket, papad, chips and peanuts if served along with them</li>\n<li>Fresh lime soda or iced tea with separate sugar syrups is a good option as a drink</li>\n<li>Non Vegetarians should give first preference&nbsp;to fish and then go for chicken in non fried preparations.</li>\n<li>Refrain from ordering dessert or else opt for a fruit platter to fulfil your sweet craving.</li>\n<li>Avoid over indulging in caffeinated and alcoholic beverages. Always ask for bottled water or for sparkling water with pieces of lime or lemon.</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>What to eat and avoid</strong></p>\n<p>Following is a list of menu terms divided on two categories- those should avoid and those you should embrace. Let these be your guide:</p>\n<p>&nbsp;</p>\n<table>\n<tbody>\n<tr>\n<td width="213"><strong>AVOID</strong></td>\n<td width="213"><strong>ADD</strong></td>\n</tr>\n<tr>\n<td width="213">Butter or buttered</td>\n<td width="213">Stir fried (less oil)</td>\n</tr>\n<tr>\n<td width="213">Basted (melted fat on meat)</td>\n<td width="213">Steamed</td>\n</tr>\n<tr>\n<td width="213">Creamed, in gravy</td>\n<td width="213">Garden fresh</td>\n</tr>\n<tr>\n<td width="213">Fried, French fired, crispy</td>\n<td width="213">Poached</td>\n</tr>\n<tr>\n<td width="213">Rich</td>\n<td width="213">Au Jus (with its own juices)</td>\n</tr>\n<tr>\n<td width="213">Au gratin or in cheese sauce</td>\n<td width="213">Raw</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'SelfCare by Suman', '2016-02-09 05:46:22', 2),
(9, 'The Art of Snacking', '21.png', '<p>Every evening a hunger alarm rings in our stomach and brain. In addition to uncontrolled eating we put all high calorie foods in our mouth. At that hour we don&rsquo;t care whether it is a healthy option or a junk. To avoid this, we must learn the art of mid- evening snacking.</p>\n<p>&nbsp;&nbsp;</p>\n<p>There are certain factors which one need to keep a note of to snack right!</p>\n<ol>\n<li>The time of hunger pang</li>\n<li>Is it thirst or hunger?</li>\n<li>What have been your meal gaps between your major meals?</li>\n<li>Are you missing your proteins in your meal?</li>\n</ol>\n<p>&nbsp;</p>\n<p>Once you handle these 4 questions, you are halfway through in learning the art of snacking. One must understand the time at which the body asks for food. If the food is not had at that time, the body faces starvation and triggers uncontrollable hunger. One must keep themselves well hydrated throughout the day to make sure that dehydration can ring the false hunger alarm. A good protein balance in 3 major meals Breakfast, Lunch and Dinner will help to prevent excessive eating during mid evening. One must take their Breakfast, lunch, snack and dinner at a gap of 3 &frac12; to 4 hours time, and add filler like tea, coffee, fruit or nuts as a filler to curb the hunger.</p>\n<p>&nbsp;</p>\n<p>Let us explore the healthier options that we can have for our mid evening snacks. It is a tricky situation where you don&rsquo;t want to indulge nor avoid. Here are a few snacks that will help you to stay satiated and keep indulgence at bay.</p>\n<ol>\n<li>A bowl of vegetable soup</li>\n<li>A cup of stir-fried vegetables</li>\n<li>A fruit or half a cup of freshly cut fruits</li>\n<li>A glass of buttermilk</li>\n<li>1 cup of yoghurt</li>\n<li>3-4 low fat crackers with tea or coffee</li>\n<li>Handful nuts with some green tea</li>\n<li>1 cup of kurmura with handful chana</li>\n</ol>\n<p>&nbsp;</p>\n<p>Cakes, Muffins, <em>Farsans,</em> wafers can be very tempting to snack on but are ladened with empty calories and will not be helpful for the body in long run.These mid evening options can help you to satiate and keep you away from starvation or excessive eating.</p>', 'SelfCare by Suman', '2016-02-09 06:15:14', 0),
(10, 'Artificial Sweetener – A Sweet Trap', '51.png', '<p>Just how a blockbuster movie has mixed reviews after its release, similarly invention of artificial sweeteners had mixed reviews. Artificial sweeteners are boon for some and bane for some. Are you trying to reduce calories in your diet by cutting down on your sugar intake and are shifting to artificial sweeteners? Or using other sugar substitutes to satisfy your sweet tooth? With increase in awareness and many advertisements promoting usage of sweeteners, sugar substitutes may seem to be the perfect answer to fight the bulges as it has &ldquo;ZERO&rdquo; calories. But does that mean that you are on the right track? Let us find out.</p>\n<p>There are various types of artificial sweeteners available in the market such as aspartame, sucralose etc. A new study shows that it actually promotes weight gain, and is linked to a higher risk of diabetes, headaches, vision problems, high blood pressure, and heart disease. Regular sugar free soda consumption may increase aggressive behavior in young children. Aspartame has found to cause greater weight gain and insulin sensitivity than sugar as it has an effect on our hunger and satiety-regulating hormone.</p>\n<p>A diabetic person needs to use a sweetener as he does not have a choice. But he/she must choose the right sweetener which is safe to consume and do not have any side effects. Artificial sweeteners should be taken in suggested doses without abusing its use. As long as one&rsquo;s body utilizes sugar they should not switch to artificial sweeteners. Many people chose to avoid an artificial sweetener as it has an after taste.</p>\n<p>One must learn to control the intake of sugar as well as sugar substitute. But if one must use any sweeteners, our preference would be <strong>stevia</strong><strong>, </strong>natural sweetener. Stevia is safe, non-caloric, FDA approved and does not raise blood sugar.</p>', 'SelfCare by Suman', '2016-02-09 06:59:21', 1),
(11, 'Frozen Yogurt: How Healthy Is It?', '41.png', '<p>The Middle East and India have been making yogurt at home for hundreds of years, hence yogurt is usually associated with phrases such as &ldquo;home made&rdquo; and &ldquo;healthy&rdquo;. Only in the recent past, flavoured yogurts and frozen yogurts have entered the market.&nbsp;</p>\n<p>Every Mumbai-ite probably knows that frozen yogurt has hit it big in the culinary scene.</p>\n<p>Cocoberry&trade;, Fro Yo&trade;, Yogurtbay&trade;, and the latest contestant of frozen yogurt parlors Pinkberry&trade;, have sprung up all over Mumbai. With the increasing popularity of these establishments, the question is &ndash; Are these &ldquo;desserts&rdquo; a truly healthy option, as they claim to be?&nbsp;</p>\n<p>To answer this question, lets first examine what is frozen yogurt exactly? How it is different from plain yogurt and ice cream?</p>\n<p>Frozen yogurt is a dessert that is similar to ice cream but is made with yogurt rather than cream. By definition, yogurt is a dairy product produced by the bacterial fermentation of milk. The bacteria used to make yogurt are known as &ldquo;cultures&rdquo;. Some of these live cultures are known as probiotics, which when consumed, enter the body and help other beneficial bacteria that are present in the body, beneficial in the improving the immune system and digestive tract. Thus, consumers choose it as a healthier alternative to ice-cream, but what they do not realize is that a great deal of sugar is usually added, as in ice cream, which is a major reason why frozen yogurt is not nearly as healthy as regular yogurt. Frozen yogurt is pasteurized before freezing so it generally does not contain live, active cultures or probiotics like many unfrozen yogurts. Although manufacturers have now started to synthetically add these probiotics in the frozen yogurt to increase health benefits.<br />Before going into any further detail, let us compare the nutritional facts of frozen yogurt, plain yogurt, and ice cream which were scientifically obtained by testing samples of the above in the laboratory at Ramkrishna Bajaj Testing Centre at SNDT University, Mumbai.</p>\n<p>&nbsp;</p>\n<p><strong>Nutritional Facts of 1 Regular Size Cup (180 grams):&nbsp;</strong></p>\n<table width="695">\n<tbody>\n<tr>\n<td width="75">&nbsp;\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n</td>\n<td width="110">\n<p><strong>Frozen Yogurt (Low Fat)</strong></p>\n</td>\n<td width="106">\n<p><strong>Plain Yogurt</strong></p>\n</td>\n<td width="105">\n<p><strong>Ice Cream</strong></p>\n</td>\n</tr>\n<tr>\n<td width="75">\n<p><strong>Calories</strong></p>\n</td>\n<td width="110"><strong>234.0</strong></td>\n<td width="106">126.0</td>\n<td width="105">400.0</td>\n</tr>\n<tr>\n<td width="75">\n<p><strong>Fat (g)</strong></p>\n</td>\n<td width="110"><strong>3.6</strong></td>\n<td width="106">5.5</td>\n<td width="105">19.8</td>\n</tr>\n<tr>\n<td width="75"><strong>Sugar (g)</strong></td>\n<td width="110"><strong>37.0</strong></td>\n<td width="106">10.3</td>\n<td width="105">\n<p>38.3</p>\n</td>\n</tr>\n<tr>\n<td width="75"><strong>Carbs (g)</strong></td>\n<td width="110"><strong>45.0</strong></td>\n<td width="106">11.0</td>\n<td width="105">\n<p>42.5</p>\n</td>\n</tr>\n<tr>\n<td width="75"><strong>Protein (g)</strong></td>\n<td width="110"><strong>6.0</strong></td>\n<td width="106">8.0</td>\n<td width="105">\n<p>6.3</p>\n</td>\n</tr>\n</tbody>\n</table>', 'SelfCare by Suman', '2016-02-09 07:29:38', 2);

-- --------------------------------------------------------

--
-- Table structure for table `selftables_comment`
--

DROP TABLE IF EXISTS `selftables_comment`;
CREATE TABLE IF NOT EXISTS `selftables_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `blog` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `selftables_comment`
--

INSERT INTO `selftables_comment` (`id`, `name`, `email`, `website`, `comment`, `blog`, `timestamp`) VALUES
(2, 'asd', 'asd@asd.com', 'website', 'testing comment for xyz blog', 4, '2016-02-01 11:03:18'),
(3, '', '', '', '', 0, '2016-02-09 11:55:34'),
(4, '', '', '', '', 0, '2016-02-09 11:55:37'),
(5, '', '', '', '', 0, '2016-02-09 13:32:44'),
(6, '', '', '', '', 0, '2016-02-09 13:32:46'),
(7, '', '', '', '', 0, '2016-02-09 13:33:08'),
(8, '', '', '', '', 0, '2016-02-09 13:33:09'),
(9, '', '', '', '', 0, '2016-02-09 13:33:28'),
(10, '', '', '', '', 0, '2016-02-09 13:33:32'),
(11, '', '', '', '', 0, '2016-02-09 13:33:43'),
(12, '', '', '', '', 0, '2016-02-09 13:34:04'),
(13, '', '', '', '', 0, '2016-02-09 13:34:40'),
(14, '', '', '', '', 0, '2016-02-09 13:36:11'),
(15, '', '', '', '', 0, '2016-02-09 13:41:48'),
(16, '', '', '', '', 0, '2016-02-09 13:44:31'),
(17, '', '', '', '', 0, '2016-02-09 13:44:32'),
(18, '', '', '', '', 0, '2016-02-10 09:24:27'),
(19, '', '', '', '', 0, '2016-02-10 09:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `selftables_healthpackages`
--

DROP TABLE IF EXISTS `selftables_healthpackages`;
CREATE TABLE IF NOT EXISTS `selftables_healthpackages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `months` varchar(255) NOT NULL,
  `consults` int(11) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `price_in_INR` int(11) NOT NULL,
  `price_in_dollars` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtype` int(11) NOT NULL,
  PRIMARY KEY (`id`,`price_in_dollars`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `selftables_healthpackages`
--

INSERT INTO `selftables_healthpackages` (`id`, `type`, `months`, `consults`, `plan`, `price_in_INR`, `price_in_dollars`, `description`, `title`, `subtype`) VALUES
(5, 'Health Management', '2', 4, '0', 0, 0, '0', '0', 8),
(6, 'Health Management', '3-4', 8, '0', 0, 0, '0', '0', 8),
(7, 'Health Management', '6-7', 16, '0', 0, 0, '0', '0', 8),
(8, 'Health Management', '1', 4, '0', 0, 0, '0', '0', 1),
(9, 'Health Management', '2', 8, '0', 0, 0, '0', '0', 1),
(10, 'Health Management', '3', 13, '0', 0, 0, '0', '0', 1),
(11, 'Health Management', '6', 26, '0', 0, 0, '0', '0', 1),
(12, 'Health Management', '4', 17, '0', 0, 0, '0', '0', 1),
(13, 'Health Management', '1', 4, '0', 0, 0, '0', '0', 2),
(14, 'Health Management', '2', 8, '0', 0, 0, '0', '0', 2),
(15, 'Health Management', '3', 13, '0', 0, 0, '0', '0', 2),
(17, 'Health Management', '4', 17, '0', 0, 0, '0', '0', 2),
(18, 'Health Management', '6', 26, '0', 0, 0, '0', '0', 2),
(19, 'Health Management', '1', 4, '0', 0, 0, '0', '0', 3),
(20, 'Health Management', '2', 8, '0', 0, 0, '0', '0', 3),
(21, 'Health Management', '3', 13, '0', 0, 0, '0', '0', 3),
(22, 'Health Management', '4', 17, '0', 0, 0, '0', '0', 3),
(23, 'Health Management', '6', 26, '0', 0, 0, '0', '0', 3),
(24, 'Health Management', '1', 4, '0', 0, 0, '0', '0', 4),
(25, 'Health Management', '2', 8, '0', 0, 0, '0', '0', 4),
(26, 'Health Management', '3', 13, '0', 0, 0, '0', '0', 4),
(27, 'Health Management', '4', 17, '0', 0, 0, '0', '0', 4),
(28, 'Health Management', '6', 26, '0', 0, 0, '0', '0', 4),
(29, 'Health Management', '1', 4, '0', 0, 0, '0', '0', 5),
(30, 'Health Management', '2', 8, '0', 0, 0, '0', '0', 5),
(31, 'Health Management', '3', 13, '0', 0, 0, '0', '0', 5),
(32, 'Health Management', '4', 17, '0', 0, 0, '0', '0', 5),
(33, 'Health Management', '6', 26, '0', 0, 0, '0', '0', 5),
(34, 'Health Management', '2', 4, '0', 0, 0, '0', '0', 6),
(35, 'Health Management', '3-4', 8, '0', 0, 0, '0', '0', 6),
(36, 'Health Management', '6-7', 16, '0', 0, 0, '0', '0', 6),
(37, 'Health Management', '2', 4, '0', 0, 0, '0', '0', 7),
(38, 'Health Management', '3-4', 8, '0', 0, 0, '0', '0', 7),
(39, 'Health Management', '6-7', 16, '0', 0, 0, '0', '0', 7),
(40, 'Health Management', '2', 4, '0', 0, 0, '0', '0', 9),
(41, 'Health Management', '3-4', 8, '0', 0, 0, '0', '0', 9),
(42, 'Health Management', '6-7', 16, '0', 0, 0, '0', '0', 9),
(43, 'Health Management', '2', 4, '0', 0, 0, '0', '0', 10),
(44, 'Health Management', '3-4', 8, '0', 0, 0, '0', '0', 10),
(45, 'Health Management', '6-7', 16, '0', 0, 0, '0', '0', 10);

-- --------------------------------------------------------

--
-- Table structure for table `selftables_realtedblog`
--

DROP TABLE IF EXISTS `selftables_realtedblog`;
CREATE TABLE IF NOT EXISTS `selftables_realtedblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog` int(255) NOT NULL,
  `relatedblog` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `selftables_realtedblog`
--

INSERT INTO `selftables_realtedblog` (`id`, `blog`, `relatedblog`) VALUES
(5, 4, 1),
(14, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `selftables_subtype`
--

DROP TABLE IF EXISTS `selftables_subtype`;
CREATE TABLE IF NOT EXISTS `selftables_subtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `selftables_subtype`
--

INSERT INTO `selftables_subtype` (`id`, `name`, `description`, `image`, `order`, `status`) VALUES
(1, 'Wealth Loss for Kids', '<p style="text-align: justify;">In our present times, with our stressful and hectic routines, health and the foods we eat have come to&nbsp;occupy a central place in our lives. It&rsquo;s no longer like the olden days when children ate whatever their&nbsp;mothers gave them, and everything the mothers cooked was healthy and organic. At Selfacare we&nbsp;explore the struggles that parents face to provide the right nutrition to their school- and college-going&nbsp;kids. I have therefore included healthy twist for children so that they are always excited about meal&nbsp;times!</p>', 'Weight-loss-for-kids.jpg', 0, '0'),
(2, 'Weight Loss With HealthGain', '<p style="text-align: justify;">There is a myth that eating fried and sweets can increase weight. At Selfcare we strike the right ratio of&nbsp;carbohydrate rich and protein rich foods to gain muscle mass, improve good fat in the body and help&nbsp;you gaining weight with perfect combination of exercise.</p>', 'Weight-loss-with-healthgain.jpg', 1, '0'),
(3, 'Post Pregnancy Weight Loss With Lacation', '<p style="text-align: justify;">This is a happy but a hectic and phase in woman&rsquo;s life. She is juggling between&nbsp;taking care of her young one and herself. We offer personalized diet chart for&nbsp;lactation that takes care of your nutritional requirements during this phase and&nbsp;also help you shed those extra kilos in the right way.</p>', 'Post-pregnancy-weight-loss.jpg', 2, '0'),
(4, 'Weight Loss PCOs and Insulin Resistence', '', 'PCOS.jpg', 3, '0'),
(5, 'Health Aging', '<p style="text-align: justify;">The skin is window to our health. But a legion of forces, including the environment and age, interfere&nbsp;with regenerating process of skin. We provide you with the right food choices and certain lifestyle&nbsp;alterations along with introduction new age vitamins and minerals into your diet. Anti-aging doesn''t not&nbsp;only mean infusion of good food and vitamins, we also suggest the right fitness program and sleep cycle&nbsp;to help your body remain stronger.</p>', 'Healthy-Aging.jpg', 4, '0'),
(6, 'Pregnancy', '', 'Pregnancy.jpg', 5, '0'),
(7, 'Weight Gain', '<p style="text-align: justify;">There is a myth that eating fried and sweets can increase weight. At Selfcare we strike the right ratio of&nbsp;carbohydrate rich and protein rich foods to gain muscle mass, improve good fat in the body and help&nbsp;you gaining weight with perfect combination of exercise.</p>', 'Weight-Gain.jpg', 6, '0'),
(8, 'Ailment Control', '<p style="text-align: justify;">Many ailments and health complaints can be rectified and reversed with a simple and nutritious diet.&nbsp;The right health management plan can contribute significantly to recovery from lifestyle, hormonal and&nbsp;genetics-related disorders. We provide tailor-made diet plans to overcome a range of health and well-being complaints (see list below) after examining stipulated blood tests to see if you are genetically pre-disposed to any health complaints. Along with nutritional advice, we recommend vitamins to help keep&nbsp;future disorders at bay.</p>', 'Ailment-Control.jpg', 7, '0'),
(9, 'Cancer Support', '<p style="text-align: justify;">Cancer is the uncontrolled growth of abnormal cells in the body. Cancerous cells are also called&nbsp;malignant cells. During the disease there many medical treatments that can cause general weakness,&nbsp;hair loss, loss of appetite etc. Post cancer diet is devised keeping in mind the right balance of&nbsp;carbohydrate, protein and fat requirement by the body. We also believe that right support of vitamins&nbsp;play an important role to improve one&rsquo;s immunity post cancer.</p>', 'Cancer-Support.jpg', 8, '0'),
(10, 'Marathon/Sports Nutrition', '', 'Sport-Nutricion.jpg', 9, '0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `timestamp`) VALUES
(1, 'wohlig@wohlig.com', '2016-01-30 11:44:48'),
(2, 'qwerty@gmail.com', '2016-02-08 05:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(2, 'Acidity'),
(3, 'Health'),
(4, 'Bread'),
(5, 'Exercise'),
(6, 'Food'),
(7, 'Fitness'),
(8, 'Apple'),
(9, 'Juices'),
(10, 'Milk'),
(11, 'Protein'),
(12, 'Weight'),
(13, 'Dessert'),
(14, 'Sweet'),
(15, 'Nutritious'),
(16, 'Rabdi'),
(17, 'Festival'),
(18, 'Diwali'),
(19, 'Delicious'),
(20, 'Vegetarian'),
(21, 'Eggless'),
(22, 'Hangover'),
(23, 'Drinks'),
(24, 'Party'),
(25, 'Healthy'),
(26, 'Bulges'),
(27, 'Cure'),
(28, 'Deal'),
(29, 'Banana'),
(30, 'Yogurt'),
(31, 'Safe'),
(32, 'Weight Gain'),
(33, 'Avoid'),
(34, 'Cocktail'),
(35, 'Calories'),
(36, 'Appetiesers'),
(37, 'Eating Out'),
(38, 'Healthcare'),
(39, 'Food'),
(40, 'Foodie'),
(41, 'Ordering'),
(42, 'Lunch'),
(43, 'Dinner'),
(44, 'Starters'),
(45, 'Guide'),
(46, 'Menu'),
(47, 'Platter'),
(48, 'Restaurant'),
(49, 'Meal'),
(50, 'Cake'),
(51, 'Health Tips'),
(52, 'Hunger'),
(53, 'Muffins'),
(54, 'Snacking'),
(55, 'Snacks'),
(56, 'Mid Evening Snacks'),
(57, 'Hunger Pangs'),
(58, 'Wafers'),
(59, 'Eating'),
(60, 'Artificial Sweeteners'),
(61, 'Myth'),
(62, 'Sweeth Tooth'),
(63, 'Stevia'),
(64, 'Sugar'),
(65, 'Diabetes'),
(66, 'Safe'),
(67, 'Sweet Trap'),
(68, 'Tags'),
(69, 'Frozen Yogurt'),
(70, 'Ice Cream'),
(71, 'Nutritional Facts'),
(72, 'Nutrition'),
(73, 'Flavoured'),
(74, 'Facts'),
(75, 'Comfort Food'),
(76, 'Emotional');

-- --------------------------------------------------------

--
-- Table structure for table `tagsblog`
--

DROP TABLE IF EXISTS `tagsblog`;
CREATE TABLE IF NOT EXISTS `tagsblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  `blog` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `tagsblog`
--

INSERT INTO `tagsblog` (`id`, `tag`, `blog`) VALUES
(1, 1, 1),
(2, 8, 2),
(3, 8, 3),
(4, 10, 3),
(5, 13, 3),
(6, 14, 3),
(7, 15, 3),
(8, 16, 3),
(9, 17, 3),
(10, 18, 3),
(11, 19, 3),
(12, 20, 3),
(13, 21, 3),
(14, 3, 4),
(15, 8, 4),
(16, 10, 4),
(17, 13, 4),
(18, 14, 4),
(19, 15, 4),
(20, 16, 4),
(21, 17, 4),
(22, 18, 4),
(23, 19, 4),
(24, 20, 4),
(25, 21, 4),
(26, 3, 6),
(27, 12, 6),
(28, 22, 6),
(29, 23, 6),
(30, 24, 6),
(31, 26, 6),
(32, 27, 6),
(33, 28, 6),
(34, 29, 6),
(35, 30, 6),
(36, 31, 6),
(37, 32, 6),
(38, 33, 6),
(39, 34, 6),
(40, 35, 6),
(41, 3, 8),
(42, 6, 8),
(43, 11, 8),
(44, 25, 8),
(45, 33, 8),
(46, 36, 8),
(47, 37, 8),
(48, 38, 8),
(49, 39, 8),
(50, 40, 8),
(51, 41, 8),
(52, 42, 8),
(53, 43, 8),
(54, 44, 8),
(55, 45, 8),
(56, 46, 8),
(57, 47, 8),
(58, 48, 8),
(59, 49, 8),
(60, 3, 9),
(61, 11, 9),
(62, 38, 9),
(63, 50, 9),
(64, 51, 9),
(65, 52, 9),
(66, 53, 9),
(67, 54, 9),
(68, 55, 9),
(69, 56, 9),
(70, 57, 9),
(71, 58, 9),
(72, 59, 9),
(73, 35, 10),
(74, 60, 10),
(75, 61, 10),
(76, 62, 10),
(77, 63, 10),
(78, 64, 10),
(79, 65, 10),
(80, 66, 10),
(81, 67, 10),
(82, 3, 11),
(83, 30, 11),
(84, 51, 11),
(85, 61, 11),
(86, 68, 11),
(87, 69, 11),
(88, 70, 11),
(89, 71, 11),
(90, 72, 11),
(91, 73, 11),
(92, 74, 11);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`) VALUES
(1, 'wohlig', 'a63526467438df9566c508027d9cb06b', 'wohlig@wohlig.com', 1, '0000-00-00 00:00:00', 2, 'images_(2)1.jpg', '', '', 'Facebook', '0', 'amit', 'verma', '', '', 'thane', 'maharashtra', 'India', '', '421201', '', 'thane', 'India', 'maharashtra', '421201', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'varadvinayak soc', 'kjhk', 'kjhkj', 'varadvinayak soc', 'kjhk', 'kjhkj'),
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
(35, NULL, '3677b23baa08f74c28aba07f0cb6554e', 'jagruti@wohlig.com', 3, '2016-01-30 10:20:03', 2, NULL, '', '', '', '', 'Jagruti', 'patil', '', '', 'thane', 'maharashtra', 'India', '', '421201', '', 'thane', 'India', 'maharashtra', '421201', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'B 808 Sambhavnath Towers, Sudha Park', 'khkj', 'kjhkj', 'B 808 Sambhavnath Towers, Sudha Park', 'khkj', 'kjhkj'),
(36, NULL, 'a63526467438df9566c508027d9cb06b', 'rohangada17@gmail.com', 3, '2016-02-02 05:49:21', 2, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, 'adacf1e73072e0f2c086d94b9f091fe4', 'manan@tingworks.in', 3, '2016-02-05 14:51:08', 2, NULL, '', '', '', '', 'Manan', 'Vora', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Harshit', 'adacf1e73072e0f2c086d94b9f091fe4', 'harshit@tingmail.in', 1, '2016-02-06 07:48:17', 1, '', '', '', '', '0', 'Harshit', 'Shah', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(39, NULL, '0192023a7bbd73250516f069df18b500', 'wohlig@wohlig.com', 3, '2016-02-08 05:04:49', 2, NULL, '', '', '', '', 'Amit', 'verma', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, '99b6ea6eb4695c552e17be02c30ce07e', 'amitverma951994@gmail.com', 3, '2016-02-08 05:15:28', 2, NULL, '', '', '', '', 'amit', 'verma', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Wohlig Bot', '', '', 3, '2016-02-08 05:57:37', 1, 'https://graph.facebook.com/212463699104609/picture?width=150&height=150', '', '212463699104609', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '212463699104609', '', '', '', ',', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'wohligtest', '', '', 3, '2016-02-08 06:01:40', 1, 'http://pbs.twimg.com/profile_images/643380248814358528/lcpfIQqB_normal.jpg', '', '3559530614', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '3559530614', '', ',Mumbai, Maharashtra', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Pooja Thakare', '', 'pooja.wohlig@gmail.com', 3, '2016-02-08 06:23:20', 1, 'https://lh5.googleusercontent.com/-5B1PwZZrwdI/AAAAAAAAAAI/AAAAAAAAABw/J3Hf871N8IE/photo.jpg', '', '103402210128529539675', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '103402210128529539675', '', '', ',', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Jagruti Patil', '', 'jagruti@wohlig.com', 3, '2016-02-08 07:23:18', 1, 'https://lh4.googleusercontent.com/-4CwQtZIpAOA/AAAAAAAAAAI/AAAAAAAAACE/MtYl0fUkHqU/photo.jpg', '', '114607895078261661460', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '114607895078261661460', '', '', ',', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Jagruti Patil', '', '', 3, '2016-02-08 07:24:10', 1, 'https://graph.facebook.com/1069157863147105/picture?width=150&height=150', '', '1069157863147105', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '1069157863147105', '', '', '', ',', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, '99b6ea6eb4695c552e17be02c30ce07e', 'amit.jaz99@gmail.com', 3, '2016-02-08 10:15:09', 2, NULL, '', '', '', '', 'amit', 'verma', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Manan Vora', '', '', 3, '2016-02-09 13:30:18', 1, 'https://graph.facebook.com/10156528415110008/picture?width=150&height=150', '', '10156528415110008', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10156528415110008', '', '', '', ',', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `name`, `link`, `status`) VALUES
(2, 'Busting The Myths About Diet | Nutrition By Suman Agarwal', '_eU-UdgINos', 0),
(3, 'Glowing Skin Juice Recipe With Suman Agarwal', 'UT4sN3pqRWo', 0),
(4, 'Fitness expert - why you are not losing weight !', 'XyTnOgwZNDY', 0),
(5, 'How To Make Healthy Lebanese Salad - Healthy Salad Recipes', 'P2pHiMCKx0w&list=PLDn0RqHU2n_4Ymvr6d57K6awI7J4_KcGX', 0),
(6, 'Unjunked With Suman Agarwal', 'UC0lLmOWGILtcSuerLEXJ0Kw', 0),
(7, 'Foods To Avoid For Acne | Nutrition With Suman Agarwal', 'VGXF33IIzIY', 0),
(8, 'Foods To Eat For Glowing Skin With Suman Agarwal', '6HlX-mCG4HA', 0),
(9, 'Pre-Wedding Weight Loss Guide For Brides-To-Be | Nutrition Tips With Suman Agarwal', 'J0_7CcYiiUE', 0),
(10, 'Star News Interview with Suman Agarwal', '2o21aE6uczQ', 0),
(11, 'How To Make Sev Puri Detoxed || Healthy Recipes', 'QQnRebdLRWs', 0),
(12, 'Food Myths || Brown Bread is Healthier Than White Bread', 'IS7fddQf7O0', 0),
(13, 'Food Myths || Salad Is Considered To Be The Main Course', 'iYEptaCDFBk', 0),
(14, 'Food Myths | Artificial Sweetners Are Healthier Than Regular Sugar', '2Zrks0ab1ac', 0),
(15, 'Food Myth || Olive Oil Is Always Healthy', 'xDfNiK78ltY', 0),
(16, 'Food Myth || Frozen Yoghurt Is Low In Calories', 'OirKxxWLAHQ', 0),
(17, 'Unjunked Of Health, Nutrition & More', 'HATRbH_UfbY', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
