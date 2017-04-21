--
-- Database: `linked_people`
--
CREATE DATABASE IF NOT EXISTS `linked_people` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `linked_people`;

-- --------------------------------------------------------

--
-- Table structure for table `create_action`
--

CREATE TABLE IF NOT EXISTS `create_action` (
  `create_id` int(6) NOT NULL AUTO_INCREMENT,
  `object` varchar(255) DEFAULT NULL COMMENT 'expertise label',
  `object_uri` varchar(255) DEFAULT NULL COMMENT 'expertise linked data URI',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`create_id`),
  FULLTEXT KEY `create_index` (`object`,`object_uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Table structure for table `create_action_match`
--

CREATE TABLE IF NOT EXISTS `create_action_match` (
  `person_id` int(8) NOT NULL DEFAULT '0',
  `create_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`create_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interact_action`
--

CREATE TABLE IF NOT EXISTS `interact_action` (
  `interact_id` int(6) NOT NULL AUTO_INCREMENT,
  `object` varchar(255) DEFAULT NULL COMMENT 'liaison role label',
  `object_uri` varchar(255) DEFAULT NULL COMMENT 'liaison role linked data URI',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`interact_id`),
  FULLTEXT KEY `interact_index` (`object`,`object_uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `interact_action_match`
--

CREATE TABLE IF NOT EXISTS `interact_action_match` (
  `person_id` int(8) NOT NULL DEFAULT '0',
  `interact_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`interact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(6) NOT NULL AUTO_INCREMENT,
  `person_libcal_id` varchar(6) NOT NULL COMMENT 'person ID for external libguides system',
  `familyName` varchar(150) DEFAULT NULL,
  `givenName` varchar(75) DEFAULT NULL,
  `memberOf` varchar(255) DEFAULT NULL COMMENT 'department of person',
  `workLocation` varchar(140) DEFAULT 'unassigned' COMMENT 'room or work address for person',
  `jobTitle` text,
  `telephone` varchar(20) DEFAULT NULL,
  `faxNumber` varchar(20) DEFAULT 'unassigned',
  `email` varchar(80) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT 'website of person',
  `person_vita` varchar(255) DEFAULT NULL COMMENT 'vita or resume of person',
  `person_libguides_link` varchar(255) NOT NULL COMMENT 'link to libguides page for person',
  `person_category` varchar(125) DEFAULT NULL COMMENT 'faculty, staff, student, etc.',
  `potentialAction` varchar(50) DEFAULT 'unassigned' COMMENT 'role(s) within organization',
  `makesOffer` varchar(125) DEFAULT NULL COMMENT 'primary liaison',
  `makesOffer_secondary` varchar(125) DEFAULT NULL COMMENT 'secondary liaison',
  `affiliation` varchar(255) DEFAULT 'Montana State University (MSU)' COMMENT 'parent organization',
  `worksFor` varchar(255) DEFAULT 'Montana State University (MSU) Library' COMMENT 'primary organization',
  `identifier` varchar(255) DEFAULT NULL COMMENT 'primary ID for disambiguation',
  `sameAs` varchar(255) DEFAULT NULL COMMENT 'external resource establishing equivalent relationship',
  `additionalType` varchar(255) DEFAULT NULL COMMENT 'additional external vocabulary link and value',
  `image` varchar(255) DEFAULT NULL COMMENT 'profile image for person',
  `description` text COMMENT 'description of the person',
  `person_privacy` varchar(10) DEFAULT 'n' COMMENT 'admin flag for rule on privacy/visibility on web',
  `person_status` varchar(10) NOT NULL DEFAULT 'a' COMMENT 'admin flag for whether record is live or hidden',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`),
  FULLTEXT KEY `full_index` (`givenName`,`familyName`,`jobTitle`,`memberOf`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

