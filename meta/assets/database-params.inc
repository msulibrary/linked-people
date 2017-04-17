<?php
//purpose: hold specific login data and make database connections for read-only actions
//security: the directory where this file lives must have .htaccess file allowing only calls from php files to have read access to it.

$connectLibstaff = new mysqli('localhost','ADD-DB-USER','ADD-DB-PASSWORD', 'libstaff');
$connectLibstaff->set_charset('utf8');

if ($connectLibstaff->connect_errno) {
  die('Unable to connect to libstaff database [' . $connectLibstaff->connect_error . ']');
}

?>
