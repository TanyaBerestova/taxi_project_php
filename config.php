<?php
header('Content-Type: text/html; charset=utf-8');

$user = 'YourUser';
$password = 'YourPassword';

//PDO
$dsn = 'mysql:host=localhost;dbname=taxi;charset=utf8;';
$connect = new PDO($dsn, $user, $password);

//if (!$connect){
    //echo '<br>Невозможно присоединиться к серверу: '.mysql_error($connect);
   //exit;
//} else {
    //echo '<br>успешно';
//}
?>
