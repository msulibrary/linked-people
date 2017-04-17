<?php
//global functions and utilities for people application - JAC 2007-12-07
/* ---------------------------------------------------------------------------------
function to formatEmailLink
	@args = (email, name?);
	returns javascript to create mailto link, hide from spam harvesters
*/
function formatEmailLink() {

	// If they supplied no e-mail address, return nothing.
	if(func_num_args() == 0) { return ""; }
	
	// Get the e-mail address.
	$staff_email = func_get_arg(0);

	// Bounce back if the e-mail address is missing the @ sign.
	if(!preg_match("/@/", $staff_email)) { return $staff_email; }
	
	// Break the address into two pieces, removing any single quotes.
	$piece = explode("@", preg_replace("/'/", "\\'", $staff_email));
	
	// If they supplied a name get that too.
	if(func_num_args() == 2) { 
		$name = func_get_arg(1);
		$name = preg_replace("/'/", "\\'", $name);
	} else {
		$name = "' + a + '@' + b + '";
	}
	
	// Assemble the javascript
	$javaScript = '<script type="text/javascript">' . "
		a = '" . $piece[0] . "';
		b = '" . $piece[1] . "';
		document.write('<a href=\"mailto:' + a + '@' + b + '\">" . $name . "</a>');
		</script>";

	return $javaScript;
}

//function to record previous url
function refererURI() {
  if (isset($_SERVER['HTTP_REFERER'])) {
    return $_SERVER['HTTP_REFERER'];
  }
}

//function converts rfc 822 date into unix timestamp
function dateConvert($rssDate)
{
$rawdate=strtotime($rssDate);
if ($rawdate == -1) {
		$convertedDate = 'conversion failed';
    } else {
		$convertedDate = date('Y-m-d h:i:s',$rawdate);
		return $convertedDate;
    }
}
//end dateConvert

//function converts timestamp into rfc 822 date
function dateConvertTimestamp($timestamp)
{
$rawdate=strtotime($timestamp);
if ($rawdate == -1) {
		$convertedDate = 'conversion failed';
    } else {
		$convertedDate = date('D, d M Y h:i:s T',$rawdate);
		return $convertedDate;
    }
}
//end dateConvertTimestamp

//function validates the user's search term(s) to make sure that they contain only valid characters. A list of valid characters is given in the validChar string below.
function validation($keyword, $team, $sort)
{
  
  $localKeyword = $keyword;
  $localKeyword = strtolower($localKeyword);    
  
  $localTeam = $team;
  $localTeam = strtolower($localTeam);

  $localSort = $sort;
  $localSort = strtolower($localSort);

  $validChar = "abcdefghijklmnopqrstuvwxyz\"',.?&:;-()/\ 1234567890&amp;";
  
  $length = strlen($localKeyword);
  for($i = 0; $i < $length; $i++)
  {
	 if(!strstr($validChar, $localKeyword[$i]))
	 {
		echo "<h2><strong>Your search contains invalid characters</strong></h2>\n";        
		echo "<hr />\n";
		echo "<h3>The Keyword search string \"$localKeyword\" contains an invalid character(s)!!<br /><br />
			  Please use your browser's <strong>BACK</strong> button and fix the error. Then resubmit your request.</h3>\n";

		return false;
	 }    

  }
  
  $length = strlen($localTeam);
  for($i = 0; $i < $length; $i++)
  {
	 if(!strstr($validChar, $localTeam[$i]))
	 {
		echo "<h2><strong>Your search contains invalid characters</strong></h2>\n";
		echo "<hr />\n";
		echo "<h3>The Team search string \"$localTeam\" contains an invalid character(s)!!<br /><br /> 
			  Please use your browser's <strong>BACK</strong> button and fix the error. Then resubmit your request.</h3>\n";

		return false;
	 } 
  }
  
  $length = strlen($localSort);
  for($i = 0; $i < $length; $i++)
  {
	 if(!strstr($validChar, $localSort[$i]))
	 {
		echo "<h2><strong>Your search contains invalid characters</strong></h2>\n";
		echo "<hr />\n";
		echo "<h3>The Sort search string \"$localSort\" contains an invalid character(s)!!<br /><br /> 
			  Please use your browser's <strong>BACK</strong> button and fix the error. Then resubmit your request.</h3>\n";

		return false;
	 } 
  }

  return true;
}//end validation()

//this function formats the string into a search term
function format($txt) 
{
  $fArray = explode(" ", $txt);
		   
  $formatted = "";  //reset the formatted string to an empty string
  $x = count($fArray); //get the number of words in the $txt string
  if($x  > 1)
  {
	 $y = 0; 
	 foreach($fArray as $var)
	 {
		$var = trim($var);
		if($y < $x-1)
		{
		   $formatted .= $var;
		   $formatted .= "+";
		}
		else
		{
		   $formatted .= $var;
		}   
		$y++;
	 }
	 return $formatted;
  }
  else      
  {
	 return $txt;
  }
}//end format($txt)

//function displays a message to user if search resulted in no matching items.
function noMatches()
{
  echo "<h3 class=\"warn\">Your search did not match any documents.</h3>\n";
  echo "<ul>\n";
  echo "<li><strong>Suggestions:</strong></li>\n";
  echo "<li>Select a different value from the dropdown menus.</li>\n";
  echo "<li>Make sure all words are spelled correctly.</li>\n";
  echo "<li>Try different keywords OR more general keywords.</li>\n";
  echo "</ul>\n";
  echo "<p><strong><a href=\"./\">Return to Manage Staff Home</a></strong></p>\n"; 
}//end noMatches()

?>