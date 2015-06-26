-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jun 05, 2015 at 04:35 AM
-- Server version: 5.5.36
-- PHP Version: 5.5.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `dspdb`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `char_vars_ex`
-- 

CREATE TABLE `char_vars_ex` (
  `charname` varchar(16) NOT NULL,
  `varname` varchar(30) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;