-- phpMyAdmin SQL Dump
-- version 4.0.10.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 18, 2016 at 07:12 AM
-- Server version: 5.6.21
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wohligco_fynx`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesslevel`
--

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
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `telephone`, `comment`, `timestamp`) VALUES
(1, 'Wohlig', 'wohlig@wohlig.com', '02227691245', 'Very Good', '2015-12-01 09:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_cart`
--

CREATE TABLE IF NOT EXISTS `fynx_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(255) NOT NULL,
  `json` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `fynx_cart`
--

INSERT INTO `fynx_cart` (`id`, `user`, `quantity`, `product`, `timestamp`, `design`, `json`) VALUES
(4, 7, 1, '3', '2015-12-12 07:14:36', '', ''),
(6, 1, 2, '8', '2016-01-05 11:28:02', '4', ''),
(7, 1, 4, '14', '2016-01-02 08:05:33', '4', ''),
(8, 1, 5, '5', '2016-01-14 14:51:42', '4', ''),
(9, 13, 5, '8', '2015-12-31 12:43:18', '4', ''),
(10, 14, 1, '4', '2015-12-31 11:59:48', '', '{"type":"1","color":"1","size":"xl","price":"","css":{"font-family":"Advent Pro","font-size":19,"letter-spacing":10,"-webkit-transform":"rotate(0deg)","text-align":"center","color":"black","text-shadow":"7px 4px 10px cyan","-webkit-text-stroke-width":2.1,"-webkit-text-stroke-color":"FireBrick "},"image":{"image":""},"distance":1,"angle":1,"id":"4","text":"Wohlig   \nTechnology","font":"Advent Pro","quantity":"1"}'),
(14, 13, 2, '5', '2016-01-15 11:54:03', '4', ''),
(15, 1, 1, '4', '2015-12-31 13:26:57', '', '{"type":"1","color":"","size":"xl","price":"","css":{"font-family":"Advent Pro","font-size":58,"color":"Chocolate ","-webkit-text-stroke-color":"cyan","-webkit-text-stroke-width":1.8,"text-shadow":"22px -12px 10px cyan"},"image":{"image":"Wohlig_logo.jpg"},"distance":1,"angle":1,"id":"4","text":"Hello\n\nHello","font":"Advent Pro","quantity":"1","designname":"Chirag"}'),
(17, 1, 4, '16', '2016-01-02 08:05:00', '4', ''),
(18, 1, 1, '4', '2016-01-02 14:09:14', '', '{"type":"1","color":"","size":"M","price":"","css":{"font-size":100,"letter-spacing":20,"-webkit-transform":"rotate(0deg)","-webkit-text-stroke-width":2,"-webkit-text-stroke-color":"blue","text-shadow":"20px 0px 10px FireBrick "},"image":{"image":""},"distance":1,"angle":1,"id":"4","text":"dsfsd","quantity":"1"}'),
(19, 10, 1, '4', '2016-01-06 10:26:57', '', '{"type":"1","color":"","size":"M","price":"","css":{"font-family":"Advent Pro","font-size":69,"letter-spacing":20,"-webkit-transform":"rotate(201deg)","color":"Chocolate ","-webkit-text-stroke-color":"LawnGreen ","-webkit-text-stroke-width":0.6,"text-shadow":"20px 0px 10px Crimson"},"image":{"image":""},"distance":1,"angle":1,"id":"4","text":"A","font":"Advent Pro","quantity":"1"}'),
(20, 10, 8, '8', '2016-01-11 08:30:21', '4', ''),
(21, 15, 1, '8', '2016-01-11 05:56:30', '6', ''),
(22, 15, 8, '5', '2016-01-15 10:32:52', '4', ''),
(23, 15, 18, '5', '2016-01-15 10:07:06', '6', ''),
(24, 10, 1, '6', '2016-01-18 06:56:23', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_category`
--

CREATE TABLE IF NOT EXISTS `fynx_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fynx_category`
--

INSERT INTO `fynx_category` (`id`, `order`, `name`, `parent`, `status`, `image1`, `image2`) VALUES
(1, 0, 'Men', '', '2', '', ''),
(2, 0, 'Women', '', '2', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_color`
--

CREATE TABLE IF NOT EXISTS `fynx_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fynx_color`
--

INSERT INTO `fynx_color` (`id`, `name`, `status`, `timestamp`) VALUES
(1, 'Black', '2', '2015-12-11 06:44:44'),
(2, 'Blue', '2', '2015-12-11 06:44:45'),
(3, 'White', '2', '2016-01-16 12:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_config`
--

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
(1, 'kartik0072@gmail.com', 2, 'Kart1', 'Niko', '57876', '15%'),
(2, 'jagruti@wohlig.com', 2, 'J12', 'Jagruti Patil', '79798', '10');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_designs`
--

CREATE TABLE IF NOT EXISTS `fynx_designs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designer` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `fynx_designs`
--

INSERT INTO `fynx_designs` (`id`, `designer`, `image`, `status`, `timestamp`, `name`) VALUES
(4, 2, '3Q9Q53316.JPG', '2', '2015-12-02 05:31:50', 'Iron Man'),
(6, 1, 'schools-rugby_1417187c1.jpg', '1', '2015-12-02 14:21:15', 'Spiderman'),
(7, 2, '', '1', '2016-01-16 07:25:13', 'Batman');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_homeslide`
--

CREATE TABLE IF NOT EXISTS `fynx_homeslide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `centeralign` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fynx_newsletter`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `fynx_order`
--

INSERT INTO `fynx_order` (`id`, `user`, `firstname`, `lastname`, `email`, `billingaddress`, `billingcontact`, `billingcity`, `billingstate`, `billingpincode`, `billingcountry`, `shippingcity`, `shippingaddress`, `shippingname`, `shippingcountry`, `shippingcontact`, `shippingstate`, `shippingpincode`, `trackingcode`, `defaultcurrency`, `shippingmethod`, `orderstatus`, `timestamp`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`, `transactionid`, `paymentmode`) VALUES
(1, 1, 'Sachin', 'Patil', 'poojathakare55@gmail.com', 'huh', 'yugh', 'u', 'h', 'hu', 'yh', 'y', 'h', 'uh', 'u', 'yu', 'u', 'h', 'yu', 'u', 'u', '1', '2015-12-02 14:19:04', '', '', '', '', '', '', '', NULL),
(2, 1, 'Ramesh', 'Pal', 'wohlig@wohlig.com', 'arioli', '987987', 'navimumbai', 'maharashtra', '400708', 'india', 'navimumbai', 'arioli', 'puja', 'india', '987987', 'maharashtra', '400709', '789', '987', 'road', '1', '2015-12-02 14:20:06', '', '', '', '', '', '', '', NULL),
(20, 1, 'puja', 'thakare', 'puja@wohlig.com', '', '9870969411', 'bcity', 'bstate', 'bpincode', 'bcountry', 'scity', '', '', 'scountry', '9870969411', 'sstate', 'spincode', '', '', '', '1', '2015-12-22 12:44:03', 'b1', 'b2', 'b3', 's1', 's2', 's3', '', NULL),
(21, 0, '', '', 'chirag.9966@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2015-12-31 12:15:20', '', '', '', '', '', '', '', ''),
(22, 0, '', '', 'chirag.9966@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2015-12-31 12:16:22', '', '', '', '', '', '', '', '4'),
(23, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2015-12-31 13:00:38', '', '', '', '', '', '', '', ''),
(24, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2015-12-31 13:00:38', 'jhkjh', 'kjhkj', 'kjhkj', 'jhkjh', 'kjhkj', 'jhkjh', '', ''),
(25, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2015-12-31 13:13:10', 'kjhjh', 'kjhkj', 'kjhkj', 'kjhjh', 'kjhkj', 'jhgjhg', '', ''),
(26, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2015-12-31 13:13:56', 'jhgj', 'jhgjh', 'jhgjh', 'jhgj', 'jhgjh', 'gjhg', '', ''),
(27, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2015-12-31 13:20:09', 'kjh', 'kjhk', 'kjhkj', 'kjh', 'kjhk', 'popi', '', ''),
(28, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2015-12-31 13:21:14', 'yiuy', 'nbb', 'hkj', 'yiuy', 'nbb', 'hgj', '', ''),
(29, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 10:28:46', 'kjhkjh', 'uytut', 'jhgjh', 'kjhkjh', 'uytut', 'kjhkjh', '', ''),
(30, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 11:47:49', 'hkjh', 'kjhkj', 'kjhk', 'hkjh', 'kjhkj', 'kjhk', '', ''),
(31, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 11:49:13', 'gjhg', 'jhgjh', 'jhgj', 'gjhg', 'jhgjh', 'gjhg', '', ''),
(32, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 11:56:02', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', '', ''),
(33, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 11:56:41', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', '', ''),
(34, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-02 12:28:52', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', '123427869', ''),
(35, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 12:31:34', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', '', ''),
(36, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 12:40:46', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', '', ''),
(37, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-02 12:43:21', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', '123433880', ''),
(38, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-02 12:51:42', 'kjhk', 'khkj', 'hgfh', 'kjhk', 'khkj', 'ghjj', '123435376', ''),
(39, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-08 07:40:00', 'jh', 'jhgjh', 'jhgj', 'jh', 'jhgjh', 'kjhk', '124199154', ''),
(40, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-02 14:10:04', '', '', '', '', '', '', '', ''),
(41, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:10:04', 'hgjh', 'jhgj', 'jhgj', 'hgjh', 'jhgj', 'fsdf', '', ''),
(42, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:19:34', 'jhkjh', 'jhkj', 'kjhkj', 'jhkjh', 'jhkj', 'kjhkj', '', ''),
(43, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:20:22', 'jhkj', 'kjhkj', 'kjh', 'jhkj', 'kjhkj', 'kjh', '', ''),
(44, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:23:27', 'jhgjh', 'jhgj', 'jhgj', 'jhgjh', 'jhgj', 'jhgj', '', ''),
(45, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:27:20', 'gjhg', 'gjh', 'jhgjh', 'gjhg', 'gjh', 'jhgjh', '', ''),
(46, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:33:51', 'kjkjh', 'jkhkjh', 'tyuyt', 'kjkjh', 'jkhkjh', 'tyuyt', '', ''),
(47, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:38:06', 'jhgjhg', 'jhgjh', 'jhg', 'jhgjhg', 'jhgjh', 'jhg', '', ''),
(48, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:40:29', 'jhkjhkj', 'gj', 'jhgj', 'gjh', 'gj', 'jhgj', '', '2'),
(49, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:45:37', 'hgjg', 'jhgj', 'jhg', 'hgjg', 'jhgj', 'jhg', '', ''),
(50, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:47:47', 'gjhg', 'jhg', 'jhg', 'gjhg', 'jhg', 'jhg', '', ''),
(51, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-02 14:56:36', 'jhgkjh', 'jhgjghj', 'jhgjh', 'jhgkjh', 'jhgjghj', 'jhgjh', '', ''),
(52, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-04 09:54:37', '', '', '', '', '', '', '', ''),
(53, 0, 'cdsc', 'DCsc', 'cdscds@gmail.com', '', '', 'dsc', 'cdsc', 'dcdscsdcds', 'IND', 'dsc', '', '', 'IND', '', 'cdsc', 'dcdscsdcds', '', '', '', '1', '2016-01-04 09:55:43', 'dcdsc', 'dcds', 'cdscc', 'dcdsc', 'dcds', 'cdscc', '', '1'),
(54, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-04 09:57:45', 'gjhg', 'tyuyt', 'gjhgj', 'gjhg', 'tyuyt', 'gjhgj', '', ''),
(55, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-04 10:07:38', '', '', '', '', '', '', '', ''),
(56, 0, 'Chirag', 'Shah', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400014', '', '', '', '1', '2016-01-04 10:07:38', 'sDDSD', 'fsfs', 'fdsfsd', 'sDDSD', 'fsfs', 'fdsfsd', '', '1'),
(57, 0, 'Chirag', 'Shah', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'JPN', 'Mumbai', '', '', 'JPN', '', 'Maharashtra', '400014', '', '', '', '1', '2016-01-04 10:08:27', 'ghg', 'hgj', 'gjhg', 'ghg', 'hgj', 'gjhg', '', ''),
(58, 0, 'Chirag', 'Shah', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400014', '', '', '', '1', '2016-01-04 10:09:13', 'jhgjhg', 'jhg', 'jhgj', 'jhgjhg', 'jhg', 'jhgj', '', ''),
(59, 0, 'Chirag', 'Shah', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400014', '', '', '', '1', '2016-01-04 12:02:55', 'fdevef', 'evfev', 'vfrvrf', 'fdevef', 'evfev', 'vfrvrf', '', '1'),
(60, 0, 'saxsx', 'xsaxsa', 'xsax@gamil.comx', '', '', 'dsvdsvds', 'dvsdsv', 'vdsvsdv', 'IND', 'dsvdsvds', '', '', 'IND', '', 'dvsdsv', 'vdsvsdv', '', '', '', '1', '2016-01-04 12:04:16', 'xsax', 'xssc', 'vfdsvsv', 'xsax', 'xssc', 'vfdsvsv', '', '1'),
(61, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-06 10:35:51', '', '', '', '', '', '', '', ''),
(62, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-06 10:35:51', 'kjhgu', 'jhgj', 'jhg', 'kjhgu', 'jhgj', 'jhg', '', ''),
(63, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-08 05:43:38', '', '', '', '', '', '', '', ''),
(64, 0, 'Parin', 'Visariya', 'parin@gmail.com', '', '', 'Ahmedabad', 'Gujarat', '380009', 'IND', 'Ahmedabad', '', '', 'IND', '', 'Gujarat', '380009', '', '', '', '1', '2016-01-08 05:43:38', 'demo', 'emo', 'demo', 'demo', 'emo', 'demo', '', '3'),
(65, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-08 06:53:31', 'hkjh', 'kjhk', 'kjhkj', 'hkjh', 'kjhk', 'kjhkj', '', ''),
(66, 0, 'jagruti', 'jagruti', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-08 07:11:15', 'kjkh', 'hgfhgf', 'uytuy', 'kjkh', 'hgfhgf', 'uytuy', '124195962', ''),
(67, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-08 07:50:33', 'uytu', 'nbvnb', 'poipo', 'uytu', 'nbvnb', 'poipo', '124202410', ''),
(68, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-08 07:55:28', '', '', '', '', '', '', '', ''),
(69, 0, 'gaga', 'agag', 'email@gmail.com', '', '', 'efewfew', 'fewfew', 'fefewf', 'IND', 'efewfew', '', '', 'IND', '', 'fewfew', 'fefewf', '', '', '', '1', '2016-01-08 07:55:28', 'fewfeff', 'efefewf', 'fewfwe', 'fewfeff', 'efefewf', 'fewfwe', '', '1'),
(70, 0, 'sfef', 'fewfw', 'ewfwe@gmail.com', '', '', 'fwfwef', 'rwrfrw', 'fw', 'IND', 'fwfwef', '', '', 'IND', '', 'rwrfrw', 'fw', '', '', '', '2', '2016-01-08 08:01:48', 'ascwefewf', 'vfvwf', 'fvwfw', 'ascwefewf', 'vfvwf', 'fvwfw', '124203898', '1'),
(71, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-08 08:14:41', 'uyiuy', 'hgfhg', 'gfh', 'uyiuy', 'hgfhg', 'gfh', '124205844', ''),
(72, 0, 'Rohan', 'Gada', 'gadarohan17@gmail.com', '', '', 'Mumbai', 'Maharashtra', '400062', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400062', '', '', '', '1', '2016-01-11 06:09:13', 'dfnmdshfoh', 'uhnydmhcoyh', 'ygmyugfsoyh', 'dfnmdshfoh', 'uhnydmhcoyh', 'ygmyugfsoyh', '', ''),
(73, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-11 06:16:05', '', '', '', '', '', '', '', ''),
(74, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-11 09:41:06', 'jhkj', 'jhgjhjhg', 'hgfhg', 'jhkj', 'jhgjhjhg', 'hgfhg', '', ''),
(75, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-11 09:43:23', 'jhkjhkj', 'jhgjhg', 'hjhgj', 'jhkjhkj', 'jhgjhg', 'hjhgj', '', '4'),
(76, 0, 'AAA', 'dff', 'abcd@gmail.com', '', '', 'sdf', 'gdfg', '400087', 'IND', 'sdf', '', '', 'IND', '', 'gdfg', '400087', '', '', '', '2', '2016-01-11 09:47:07', 'dfdfqdfg', 'fgfdg', 'fgdg', 'dfdfqdfg', 'fgfdg', 'fgdg', '124603842', '1'),
(77, 0, 'jagruti', 'patil', 'jagruti@wohlig.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-11 09:44:06', 'kjhk', 'ghfhf', 'gfh', 'kjhk', 'ghfhf', 'gfh', '', '1'),
(78, 0, 'fdsf', 'dfdsf', 'abcd@gmail.com', '', '', 'df', 'sfdf', '400087', 'IND', 'df', '', '', 'IND', '', 'sfdf', '400087', '', '', '', '2', '2016-01-11 09:51:07', 'fsdf', 'dfdsf', 'dfdsf', 'fsdf', 'dfdsf', 'dfdsf', '124604482', '1'),
(79, 0, 'dfdsf', 'dfdsf', 'abcd@gmail.com', '', '', 'dfsdf', 'ffd', '400087', 'IND', 'dfsdf', '', '', 'IND', '', 'ffd', '400087', '', '', '', '2', '2016-01-11 09:56:07', 'dfsf', 'sff', 'fdsf', 'dfsf', 'sff', 'fdsf', '124605135', '1'),
(80, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-13 12:54:29', 'jhjg', 'utu', 'fhgf', 'jhjg', 'utu', 'fhgf', '', ''),
(81, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-14 05:14:44', 'jhkjh', 'jhkj', 'gjhkjh', 'jhkjh', 'jhkj', 'gjhkjh', '', ''),
(82, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-14 05:38:48', 'gkjhg', 'tiuyt', 'bvnbvn', 'gkjhg', 'tiuyt', 'bvnbvn', '', ''),
(83, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-14 05:44:17', 'kjhjk', 'lkjh', 'lkjhlkj', 'kjhjk', 'lkjh', 'lkjhlkj', '', ''),
(84, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-14 06:26:20', 'gkhg', 'vvn', 'btiuyt', 'gkhg', 'vvn', 'btiuyt', '', ''),
(85, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-14 06:56:40', 'ui', 'yiuyu', 'jhbkjh', 'ui', 'yiuyu', 'jhbkjh', '', ''),
(86, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-14 07:00:52', 'gkjhg', 'iuyt', 'vnbvn', 'gkjhg', 'iuyt', 'vnbvn', '', ''),
(87, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-15 05:16:18', 'iutu', 'jhgjhg', 'nvmnbv', 'iutu', 'jhgjhg', 'nvmnbv', '', ''),
(88, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-15 05:17:01', 'jh', 'ituy', 'hvv', 'jh', 'ituy', 'hvv', '', ''),
(89, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '1', '2016-01-15 05:26:27', 'ytuyt', 'jhgjhg', 'nbn', 'ytuyt', 'jhgjhg', 'nbn', '', ''),
(90, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '5', '2016-01-15 05:51:31', 'hg', 'jgjh', 'jhgj', 'hg', 'jgjh', 'jhgj', '125076667', ''),
(91, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '5', '2016-01-15 06:13:59', 'uyiu', 'jhj', 'mnbmn', 'uyiu', 'jhj', 'mnbmn', '125078167', ''),
(92, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '5', '2016-01-15 06:29:13', 'iuyt', 'jhgjh', 'bmnb', 'iuyt', 'jhgjh', 'bmnb', '125078449', ''),
(93, 0, 'jagruti', 'patil', 'patiljagruti181@gmail.com', '', '', 'thane', 'maharashtra', '421201', 'IND', 'thane', '', '', 'IND', '', 'maharashtra', '421201', '', '', '', '2', '2016-01-15 07:05:05', 'yiuy', 'kjhkj', 'mbm', 'yiuy', 'kjhkj', 'mbm', '125081689', ''),
(94, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2016-01-15 09:39:44', '', '', '', '', '', '', '', ''),
(95, 0, 'cwecew', 'hbhjjh', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400014', '', '', '', '1', '2016-01-15 09:39:44', 'bnvv', 'hjvhjv', 'vvv', 'bnvv', 'hjvhjv', 'vvv', '', '1'),
(96, 0, 'Chirag', 'Shah', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400014', '', '', '', '1', '2016-01-15 09:43:28', 'bhjghj', 'bbh', 'hhjg', 'bhjghj', 'bbh', 'hhjg', '', '1'),
(97, 0, 'Chirag', 'Shah', 'chirag@wohlig.com', '', '', 'Mumbai', 'Maharashtra', '400014', 'IND', 'Mumbai', '', '', 'IND', '', 'Maharashtra', '400014', '', '', '', '2', '2016-01-15 09:47:22', 'jbhjb', 'hbhjhj', 'hbhvjhv', 'jbhjb', 'hbhjhj', 'hbhvjhv', '125099119', '1'),
(98, 0, 'AAAA', 'dfsdf', 'abcd@gmail.com', '', '', 'dfsdf', 'dfsdf', '400087', 'IND', 'dfsdf', '', '', 'IND', '', 'dfsdf', '400087', '', '', '', '1', '2016-01-18 06:35:21', 'dcfdsf', 'dfsfd', 'sdfsdf', 'dcfdsf', 'dfsfd', 'sdfsdf', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_orderitem`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `fynx_orderitem`
--

INSERT INTO `fynx_orderitem` (`id`, `discount`, `order`, `product`, `quantity`, `price`, `finalprice`, `design`) VALUES
(25, 0, 20, 1, 1, 800, 800, 6),
(26, 0, 28, 4, 1, 850, 850, 6),
(27, 0, 29, 8, 1, 1025, 1025, 4),
(28, 0, 30, 8, 1, 1025, 1025, 4),
(29, 0, 31, 8, 1, 1025, 1025, 4),
(30, 0, 32, 8, 1, 1025, 1025, 4),
(31, 0, 33, 8, 1, 1025, 1025, 4),
(32, 0, 34, 8, 1, 1025, 1025, 4),
(33, 0, 35, 8, 1, 1025, 1025, 4),
(34, 0, 36, 8, 1, 1025, 1025, 4),
(35, 0, 37, 8, 1, 1025, 1025, 4),
(36, 0, 38, 8, 1, 1025, 1025, 4),
(37, 0, 39, 8, 1, 1025, 1025, 4),
(38, 0, 39, 4, 1, 850, 850, 0),
(39, 0, 41, 8, 1, 1025, 0, 4),
(40, 0, 41, 14, 4, 799, 0, 4),
(41, 0, 41, 5, 1, 485, 0, 4),
(42, 0, 41, 4, 1, 850, 0, 0),
(43, 0, 41, 16, 4, 799, 0, 4),
(44, 0, 41, 4, 1, 850, 0, 0),
(45, 0, 42, 8, 1, 1025, 1025, 4),
(46, 0, 42, 4, 1, 850, 850, 0),
(47, 0, 43, 8, 1, 1025, 1025, 4),
(48, 0, 43, 4, 1, 850, 850, 0),
(49, 0, 44, 8, 1, 1025, 1025, 4),
(50, 0, 44, 4, 1, 850, 850, 0),
(51, 0, 45, 8, 1, 1025, 1025, 4),
(52, 0, 45, 4, 1, 850, 850, 0),
(53, 0, 46, 8, 1, 1025, 1025, 4),
(54, 0, 46, 4, 1, 850, 850, 0),
(55, 0, 47, 8, 1, 1025, 1025, 4),
(56, 0, 48, 8, 1, 1025, 1025, 4),
(57, 0, 49, 8, 1, 1025, 1025, 4),
(58, 0, 50, 8, 1, 1025, 1025, 4),
(59, 0, 51, 8, 1, 1025, 1025, 4),
(60, 0, 53, 8, 1, 1025, 1025, 4),
(61, 0, 54, 8, 1, 1025, 1025, 4),
(62, 0, 56, 8, 1, 1025, 1025, 4),
(63, 0, 57, 8, 1, 1025, 1025, 4),
(64, 0, 58, 8, 1, 1025, 1025, 4),
(65, 0, 59, 8, 1, 1025, 1025, 4),
(66, 0, 60, 8, 1, 1025, 1025, 4),
(67, 0, 62, 4, 1, 850, 0, 0),
(68, 0, 62, 8, 2, 1025, 0, 4),
(69, 0, 64, 8, 1, 1025, 1025, 4),
(70, 0, 65, 8, 1, 1025, 1025, 4),
(71, 0, 66, 8, 1, 1025, 1025, 4),
(72, 0, 67, 8, 1, 1025, 1025, 4),
(73, 0, 69, 8, 1, 1025, 1025, 4),
(74, 0, 70, 8, 1, 1025, 1025, 4),
(75, 0, 71, 8, 1, 1025, 1025, 4),
(76, 0, 72, 8, 1, 1025, 0, 6),
(77, 0, 74, 4, 1, 850, 0, 0),
(78, 0, 74, 8, 8, 1025, 0, 4),
(79, 0, 75, 4, 1, 850, 0, 0),
(80, 0, 75, 8, 8, 1025, 0, 4),
(81, 0, 76, 8, 1, 1025, 1025, 4),
(82, 0, 77, 4, 1, 850, 0, 0),
(83, 0, 77, 8, 8, 1025, 0, 4),
(84, 0, 78, 8, 1, 1025, 1025, 4),
(85, 0, 79, 8, 1, 1025, 1025, 6),
(86, 0, 80, 8, 1, 1025, 1025, 4),
(87, 0, 81, 8, 1, 1025, 1025, 4),
(88, 0, 82, 8, 1, 1025, 1025, 4),
(89, 0, 83, 8, 1, 1025, 1025, 4),
(90, 0, 84, 8, 1, 1025, 1025, 4),
(91, 0, 85, 8, 1, 1025, 1025, 4),
(92, 0, 86, 8, 1, 1025, 1025, 4),
(93, 0, 87, 5, 10, 485, 4850, 4),
(94, 0, 87, 5, 10, 485, 4850, 4),
(95, 0, 88, 5, 10, 485, 4850, 4),
(96, 0, 88, 5, 10, 485, 4850, 4),
(97, 0, 89, 5, 10, 485, 4850, 4),
(98, 0, 89, 5, 10, 485, 4850, 4),
(99, 0, 90, 5, 10, 485, 4850, 4),
(100, 0, 90, 5, 10, 485, 4850, 4),
(101, 0, 91, 5, 1, 485, 485, 4),
(102, 0, 91, 5, 1, 485, 485, 4),
(103, 0, 92, 5, 1, 485, 485, 4),
(104, 0, 92, 5, 1, 485, 485, 4),
(105, 0, 93, 5, 1, 485, 485, 4),
(106, 0, 95, 5, 1, 485, 485, 4),
(107, 0, 96, 5, 1, 485, 485, 4),
(108, 0, 97, 5, 1, 485, 485, 4),
(109, 0, 98, 5, 1, 485, 485, 4);

-- --------------------------------------------------------

--
-- Table structure for table `fynx_product`
--

CREATE TABLE IF NOT EXISTS `fynx_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `relatedproduct` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `sizechart` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL,
  `image4` varchar(255) NOT NULL,
  `image5` varchar(255) NOT NULL,
  `baseproduct` varchar(255) NOT NULL,
  `discountprice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `fynx_product`
--

INSERT INTO `fynx_product` (`id`, `subcategory`, `quantity`, `name`, `type`, `description`, `visibility`, `price`, `relatedproduct`, `category`, `color`, `size`, `sizechart`, `status`, `sku`, `image1`, `image2`, `image3`, `image4`, `image5`, `baseproduct`, `discountprice`) VALUES
(4, 1, '10', 'T1', '1', '<p>we are mad</p>', '1', '850', '', '1', '1', '3', '1', '2', 'FT1', 'white-front.jpg', 'white-back.jpg', 'download1.jpg', 't32.jpg', 't62.jpg', '', ''),
(5, 1, '5', 'T2', '1', '<p>An everyday essential, this simple round-neck <em>t</em>-<em>shirt</em> is cut from pima cotton with an extra-soft feel.</p>', '1', '485', '', '1', '2', '1', '1', '2', 'FT2', 'tshirt.jpg', 'whitetshirt.png', 'tshirt1.jpg', 'white-t-shirts-f6ei4qiht.jpg', '21.jpg', '', '400'),
(6, 1, '10', 'T3', '1', '<p>An everyday essential, this simple round-neck <em>t</em>-<em>shirt</em> is cut from pima cotton with an extra-soft feel.</p>', '1', '940', '', '1', '2', '2', '1', '2', 'FT3', 'whitetshirt1.png', 'tshirt3.jpg', 'whitetshirt2.png', 'peacocks.jpg', 'white-t-shirts-f6ei4qiht1.jpg', '', ''),
(7, 1, '10', 'T4', '1', '<p>An everyday essential, this simple round-neck <em>t</em>-<em>shirt</em> is cut from pima cotton with an extra-soft feel.</p>', '1', '689', '', '1', '2', '1', '1', '2', 'FT4', 't63.jpg', 't42.jpg', 't24.jpg', 't64.jpg', 'tee3.jpg', '', ''),
(8, 1, '10', 'T5', '1', '<p>An everyday essential, this simple round-neck <em>t</em>-<em>shirt</em> is cut from pima cotton with an extra-soft feel.</p>', '1', '1025', '', '1', '1', '2', '1', '2', 'FT5', 't53.jpg', 't22.jpg', 't23.jpg', 't32.jpg', 't62.jpg', '', ''),
(9, 1, '10', 'T6', '1', '<p>An everyday essential, this simple round-neck <em>t</em>-<em>shirt</em> is cut from pima cotton with an extra-soft feel.</p>', '1', '785', '', '1', '1', '2', '1', '2', 'FT6', 't53.jpg', 't22.jpg', 't23.jpg', 't32.jpg', 't62.jpg', '', ''),
(18, 1, '10', 'd', '1', '', '1', '500', '', '1', '1', '3', '1', '2', 'T1', 'Pilot_#Art_#2e-015.jpg', 'Pilot_#Art_#6a-011.jpg', '', '', '', '', '20%'),
(19, 5, '10', 's', '1', '', '1', '1000', '', '1', '1', '4', '2', '2', 'T1', 'Pilot_#Art_#2e-016.jpg', 'Pilot_#Art_#5c-01.jpg', 'Pilot_#Art_#9_[Bright]-01.jpg', '', '', '', '10%'),
(20, 1, '10', 'Manak', '1', '', '1', '600', '', '1', '1', '4', '2', '2', 'T2', 'download_(1).jpg', 'download_(2).jpg', 'Samurai_B.jpg', 'Banana_Shot_1.jpg', '', '', '15%');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_productimage`
--

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

CREATE TABLE IF NOT EXISTS `fynx_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `fynx_size`
--

INSERT INTO `fynx_size` (`id`, `status`, `name`) VALUES
(1, 0, 'S'),
(2, 0, 'M'),
(3, 0, 'L'),
(4, 0, 'XL'),
(5, 0, 'XXL'),
(6, 0, 'XXXL');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_sizechart`
--

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

CREATE TABLE IF NOT EXISTS `fynx_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `fynx_subcategory`
--

INSERT INTO `fynx_subcategory` (`id`, `category`, `name`, `order`, `status`, `image1`, `image2`) VALUES
(1, 1, 'T-shirt', '', '2', '', ''),
(5, 2, 'Tank Tops', '', '2', '', ''),
(6, 2, 'Crop Tops', '', '2', '', ''),
(7, 2, 'T shirt', '', '1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fynx_type`
--

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

CREATE TABLE IF NOT EXISTS `fynx_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `design` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `fynx_wishlist`
--

INSERT INTO `fynx_wishlist` (`id`, `user`, `product`, `timestamp`, `design`) VALUES
(7, 7, '3', '2015-12-12 07:32:15', '1'),
(8, 0, '8', '2015-12-29 13:07:43', '4'),
(9, 10, '8', '2016-01-11 08:24:42', '4'),
(10, 0, '', '2016-01-15 12:12:53', ''),
(11, 15, '5', '2016-01-15 12:12:54', '4');

-- --------------------------------------------------------

--
-- Table structure for table `logintype`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `keyword`, `url`, `linktype`, `parent`, `isactive`, `order`, `icon`) VALUES
(1, 'Users', '', '', 'site/viewusers', 1, 0, 1, 1, 'icon-user'),
(2, 'Dashboard', '', '', 'site/index', 1, 0, 1, 0, 'icon-dashboard'),
(3, 'Product', '', '', 'site/viewproduct', 1, 0, 1, 2, 'icon-dashboard'),
(4, 'Designer\n', '', '', 'site/viewdesigner\n', 1, 0, 1, 3, 'icon-dashboard'),
(5, 'Homeslide\n\n', '', '', 'site/viewhomeslide\n', 1, 0, 1, 4, 'icon-dashboard'),
(6, 'Sub Category\r\n\r\n', '', '', 'site/viewsubcategory\r\n\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(7, 'Type\n', '', '', 'site/viewtype\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(8, 'Category\n', '', '', 'site/viewcategory \r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(9, 'Color\n', '', '', 'site/viewcolor\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(10, 'Offer\n', '', '', 'site/viewoffer\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(11, 'Order\n', '', '', 'site/vieworder\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(12, 'Newsletter', '', '', 'site/viewnewsletter\r\n\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(14, 'Size\r\n', '', '', 'site/viewsize\r\n\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(15, 'Size Chart\r\n\r\n', '', '', 'site/viewsizechart\r\n\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(16, 'Config\r\n\r\n', '', '', 'site/viewconfig\r\n\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(17, 'Contact us\n\n', '', '', 'site/viewcontact\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard'),
(18, 'Subscribe\r\n', '', '', 'site/viewsubscribe\r\n\r\n', 1, 0, 1, 4, 'icon-dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `menuaccess`
--

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

CREATE TABLE IF NOT EXISTS `productdesignimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `design` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `productdesignimage`
--

INSERT INTO `productdesignimage` (`id`, `product`, `design`, `image`) VALUES
(1, 5, 6, 'tshirt2.jpg'),
(2, 3, 6, 'Apparels_banners.jpg'),
(3, 3, 4, 'b11.jpg'),
(6, 4, 6, 'spiderman.jpg'),
(7, 4, 0, 'images_(2).jpg'),
(8, 4, 6, 'images1.jpg'),
(9, 4, 7, 'white-t-shirts-f6ei4qiht2.jpg'),
(10, 4, 4, 'red1.jpg'),
(11, 5, 4, '22.jpg'),
(12, 5, 6, 'images_(2)1.jpg'),
(13, 5, 6, 'sunspel-charcoal-melange-short-sleeve-crew-neck-tshirt-product-1-14847455-2593875271.jpeg'),
(14, 5, 7, 'images_(1)2.jpg'),
(15, 7, 4, 'images_(1)3.jpg'),
(16, 7, 6, 'sunspel-charcoal-melange-short-sleeve-crew-neck-tshirt-product-1-14847455-2593875272.jpeg'),
(17, 7, 4, 'images2.jpg'),
(18, 7, 6, 'red2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `relatedproduct`
--

CREATE TABLE IF NOT EXISTS `relatedproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `relatedproduct` int(11) NOT NULL,
  `design` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

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

CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `timestamp`) VALUES
(1, 'nikhilnand@hotmail.com', '2015-12-17 11:13:35'),
(2, 'manan@ting.in', '2015-12-17 11:25:39'),
(3, 'prachi27094@gmail.com', '2015-12-18 07:44:06'),
(4, 'rahulstubbornrajput@gmail.com', '2015-12-18 07:45:16'),
(5, 'aroraindu5555@gmail.c', '2015-12-18 08:26:43'),
(6, 'kartik0072@gmail.com', '2015-12-18 09:47:30'),
(7, 'niko_coco29@hotmail.com', '2015-12-18 12:41:38'),
(8, 'undefined', '2015-12-18 14:52:15'),
(9, 'ghadge.jeevan@gmail.com', '2015-12-19 08:59:11'),
(10, 'vinay.vijaykumar@gmail.com', '2015-12-19 16:29:06'),
(11, 'loveena.chopra@gmail.com', '2015-12-22 23:43:04'),
(12, 'rockinsimixoxo@gmail.com', '2015-12-25 09:29:37'),
(13, 'sujaykadrekar@gmail.com', '2015-12-26 08:51:34'),
(14, 'kruthikasoma04@gmail.com', '2015-12-29 06:18:29'),
(15, 'sksaion6@gmail.com', '2015-12-31 07:24:47'),
(16, 'vsmehta1@hotmail.com', '2015-12-31 15:01:22'),
(17, 'mkmimpex@hotmail.com', '2016-01-02 08:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

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
  `billingline1` varchar(255) NOT NULL,
  `billingline2` varchar(255) NOT NULL,
  `billingline3` varchar(255) NOT NULL,
  `shippingline1` varchar(255) NOT NULL,
  `shippingline2` varchar(255) NOT NULL,
  `shippingline3` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `accesslevel`, `timestamp`, `status`, `image`, `username`, `socialid`, `logintype`, `json`, `firstname`, `lastname`, `phone`, `billingaddress`, `billingcity`, `billingstate`, `billingcountry`, `billingcontact`, `billingpincode`, `shippingaddress`, `shippingcity`, `shippingcountry`, `shippingstate`, `shippingpincode`, `shippingname`, `shippingcontact`, `currency`, `credit`, `companyname`, `registrationno`, `vatnumber`, `country`, `fax`, `gender`, `facebook`, `google`, `twitter`, `street`, `address`, `pincode`, `state`, `dob`, `city`, `billingline1`, `billingline2`, `billingline3`, `shippingline1`, `shippingline2`, `shippingline3`) VALUES
(1, 'wohlig', 'a63526467438df9566c508027d9cb06b', 'wohlig@wohlig.com', 1, '0000-00-00 00:00:00', 1, 'images_(2)1.jpg', '', '', 'Facebook', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(6, 'Pooja Thakare', '', 'pooja.wohlig@gmail.com', 3, '2015-12-09 06:02:37', 1, 'https://lh5.googleusercontent.com/-5B1PwZZrwdI/AAAAAAAAAAI/AAAAAAAAABw/J3Hf871N8IE/photo.jpg', '', '103402210128529539675', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '103402210128529539675', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(7, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, '2015-12-16 06:23:23', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(8, NULL, '81dc9bdb52d04dc20036dbd8313ed055', 'tushar@gmail.com', NULL, '2015-12-16 06:23:23', NULL, NULL, '', '', '', '', 'Tushar', 'Sachde', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(9, NULL, 'c96d1a174e9bdb6d4c9da3a7fdc1701c', 'jagrtui@wohlig.com', NULL, '2015-12-18 04:56:21', NULL, NULL, '', '', '', '', 'jagruti', 'patil', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(10, 'jagruti patil', '3677b23baa08f74c28aba07f0cb6554e', 'jagruti@wohlig.com', NULL, '2015-12-18 05:07:59', NULL, NULL, '', '', '', '', 'jagruti', 'patil', '09898989890', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', 'demooo', 'eoj', 'sdfa', '', '', ''),
(11, 'Wohlig Bot', '', '', 3, '2015-12-30 06:17:02', 1, 'https://graph.facebook.com/191260781224901/picture?width=150&height=150', '', '191260781224901', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '191260781224901', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(12, 'wohligtest', '', '', 3, '2015-12-30 06:17:23', 1, 'http://pbs.twimg.com/profile_images/643380248814358528/lcpfIQqB_normal.jpg', '', '3559530614', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '3559530614', '', ',Mumbai, Maharashtra', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(13, 'Jagruti Patil', '', '', 3, '2015-12-31 10:21:39', 1, 'https://graph.facebook.com/1048086168587608/picture?width=150&height=150', '', '1048086168587608', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '1048086168587608', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(14, 'Chirag Shah', '', 'chirag.9966@gmail.com', 3, '2015-12-31 11:54:09', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', '', '103948995510194166724', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '103948995510194166724', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(15, NULL, 'dc06698f0e2e75751545455899adccc3', 'gadarohan17@gmail.com', NULL, '2016-01-11 05:56:01', NULL, NULL, '', '', '', '', 'Rohan', 'Gada', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(16, 'Jay Visariya', '', '', 3, '2016-01-15 09:58:46', 1, 'https://graph.facebook.com/10206696756469911/picture?width=150&height=150', '', '10206696756469911', 'Facebook', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '10206696756469911', '', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(17, 'jayvisariya93', '', '', 3, '2016-01-15 10:01:27', 1, 'http://pbs.twimg.com/profile_images/378800000832845718/4e27a11c9d717e578be1923224ec933e_normal.jpeg', '', '143455919', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '143455919', '', ',Mumbai', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(18, 'Jay Visariya', '', 'Jay@wohlig.com', 3, '2016-01-15 10:13:12', 1, 'https://lh3.googleusercontent.com/-SwF8Bwq0u1I/AAAAAAAAAAI/AAAAAAAAAAA/PRNEpOQwkio/photo.jpg', '', '118313183524893739637', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '118313183524893739637', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(19, 'sony181', '', '', 3, '2016-01-15 11:57:40', 1, 'http://pbs.twimg.com/profile_images/625994292280999936/uWjnMHKJ_normal.jpg', '', '170283202', 'Twitter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '170283202', '', ',Kalyan Dombivali, Maharashtra', '', '', '0000-00-00', '', '', '', '', '', '', ''),
(20, 'Chaitalee Patil', '', 'chaitaleelp10@gmail.com', 3, '2016-01-15 12:04:06', 1, 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg', '', '112796126515900181077', 'Google', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '112796126515900181077', '', '', ',', '', '', '0000-00-00', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

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
