-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.20-MariaDB

--
-- Table structure for table `char_fellow`
--

DROP TABLE IF EXISTS `char_fellow`;
CREATE TABLE `char_fellow` (
  `charId` int(10) unsigned NOT NULL,
  `fellowNameId` smallint(3) unsigned NOT NULL DEFAULT '0',
  `optionsMask` int(11) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `exp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `bond` smallint(5) unsigned NOT NULL DEFAULT '0',
  -- face+race+equip can prolly just be stored as a single "look" mask -- they don't get stats from any of it.
  -- `look` binary(20) NOT NULL,
  `face` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `race` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `size` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `head` smallint(4) unsigned NOT NULL DEFAULT '0',
  `body` smallint(4) unsigned NOT NULL DEFAULT '8',
  `hands` smallint(4) unsigned NOT NULL DEFAULT '8',
  `legs` smallint(4) unsigned NOT NULL DEFAULT '8',
  `feet` smallint(4) unsigned NOT NULL DEFAULT '8',
  `main` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sub` smallint(4) unsigned NOT NULL DEFAULT '0',
  -- `ranged` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_fellow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dump completed on 2017-12-05  4:18:43
