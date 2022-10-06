<?php 
include './config.php';
require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
$zagolovok = 'О компании';
$current_page = 'index.php';
if (isset($_COOKIE['role'])){
    $role = $_COOKIE['role'];
} else {
    $role = 'user';
}
if (isset($_COOKIE['login'])){
    $has_entered = true;
    $login = $_COOKIE['login'];
} else {
    $has_entered = false;
    $login = "";
}
if (isset($_COOKIE['address_from'])){
    $order_made = true;
} else {
    $order_made = false;
}
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('current_page',$current_page);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('login', $login);
$smarty->assign('role', $role);
$smarty->assign('order_made', $order_made);
$smarty->display('main.tpl');
?>