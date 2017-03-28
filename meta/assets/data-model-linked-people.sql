--
-- Database: `people`
--

-- --------------------------------------------------------

--
-- Table structure for table `create_action`
--

CREATE TABLE IF NOT EXISTS `create_action` (
  `action_id` int(6) NOT NULL AUTO_INCREMENT,
  `object` varchar(255) DEFAULT NULL COMMENT 'expertise label',
  `object_uri` varchar(255) DEFAULT NULL COMMENT 'expertise linked data URI',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`action_id`),
  FULLTEXT KEY `create_index` (`object`,`object_uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Table structure for table `create_action_match`
--

CREATE TABLE IF NOT EXISTS `create_action_match` (
  `person_id` int(8) NOT NULL DEFAULT '0',
  `action_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interact_action`
--

CREATE TABLE IF NOT EXISTS `interact_action` (
  `action_id` int(6) NOT NULL AUTO_INCREMENT,
  `object` varchar(255) DEFAULT NULL COMMENT 'liaison role label',
  `object_uri` varchar(255) DEFAULT NULL COMMENT 'liaison role linked data URI',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`action_id`),
  FULLTEXT KEY `interact_index` (`object`,`object_uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interact_action_match`
--

CREATE TABLE IF NOT EXISTS `interact_action_match` (
  `person_id` int(8) NOT NULL DEFAULT '0',
  `action_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(6) NOT NULL AUTO_INCREMENT,
  `person_libcal_id` varchar(6) NOT NULL,
  `familyName` varchar(150) DEFAULT NULL,
  `givenName` varchar(75) DEFAULT NULL,
  `person_dept` varchar(255) DEFAULT NULL,
  `person_room` varchar(10) DEFAULT 'unassigned',
  `jobTitle` text,
  `person_phone` varchar(20) DEFAULT NULL,
  `person_fax` varchar(20) DEFAULT 'unassigned',
  `person_email` varchar(80) DEFAULT NULL,
  `person_im` varchar(40) DEFAULT NULL,
  `person_web` varchar(255) DEFAULT NULL,
  `person_vita` varchar(255) DEFAULT NULL,
  `person_category` varchar(125) DEFAULT NULL COMMENT 'faculty, staff, or student',
  `person_role` varchar(50) DEFAULT 'unassigned',
  `person_primary_liaison` varchar(125) DEFAULT NULL,
  `person_secondary_liaison` varchar(125) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT 'Montana State University (MSU)',
  `sameAs` varchar(255) DEFAULT NULL,
  `sameAs2` varchar(255) DEFAULT NULL,
  `person_image` varchar(255) DEFAULT NULL,
  `person_description` text,
  `person_password` varchar(16) DEFAULT NULL,
  `person_privacy` varchar(10) DEFAULT 'n',
  `person_status` varchar(10) NOT NULL DEFAULT 'a',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`),
  FULLTEXT KEY `full_index` (`givenName`,`familyName`,`jobTitle`,`person_dept`,`person_description`),
  FULLTEXT KEY `person_primary_liaison` (`person_primary_liaison`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

