<?php
 
$user_name = "root";
$password = "panjisula";
$database = "dbperpus";
$host_name = "localhost";
 
$connect_db=mysql_connect($host_name, $user_name, $password);
 
$find_db=mysql_select_db($database);
 
if ($find_db) {
 
 echo "Database Ada";
 
 mysql_close($connect_db);
 
}
else {
 
 echo "Database Tidak Ada";
 
 mysql_close($connect_db);
 
}
 
?>
