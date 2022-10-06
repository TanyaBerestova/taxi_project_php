<?php
include './config.php';
include 'php/func_combobox.php';
require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
$zagolovok = 'Действия';
$err = '';
$current_page = 'page_for_driver.php';
$has_entered = true;
$order_made = false;
if ($_COOKIE['login']){
   $login = $_COOKIE['login']; 
} else {
    header("Location: authorization.php");
}
$role = $_COOKIE['role'];
$is_ride_begin = false;
$is_choosen = $connect->query("SELECT func_driver_has_car(".$_COOKIE['user_id'].") AS 'id'")->fetch(PDO::FETCH_OBJ)->id;
$your_car = $connect->query("SELECT CONCAT(b.brand, ' ', b.model, ', VIN - ', c.VIN) AS 'car' 
FROM car c JOIN car_brand b ON c.brand_id = b.id JOIN driver_car dc ON c.id = dc.car_id
WHERE dc.data_work = CURRENT_DATE() AND dc.driver_id = (SELECT e.id
                                                        FROM user u JOIN employee e ON u.id = e.user_id
                                                        WHERE u.id =".$_COOKIE['user_id'].")")->fetch(PDO::FETCH_OBJ)->car;
$sql_get_cars = 'SELECT c.id, CONCAT(b.brand, " ", b.model, ", VIN - ", c.VIN) AS "car" 
FROM car c JOIN car_brand b ON c.brand_id = b.id LEFT JOIN driver_car dc ON c.id = dc.car_id
WHERE c.id NOT IN(SELECT c.id
                  FROM car c LEFT JOIN driver_car dc ON c.id = dc.car_id
                  WHERE dc.data_work = CURRENT_DATE())';
$combo_cars = combo('car', $connect, $sql_get_cars);
$order_info = $connect->query("CALL proc_order_for_driver(".$_COOKIE['user_id'].")")->fetch(PDO::FETCH_OBJ);
if (empty($order_info)){
    $is_order_exist = false;
    $order_id ="";
    $order_time = "";
    $from = "";
    $to = "";
    $services = "";
} else {
    $is_order_exist = true;
    $order_id = $order_info->id;
    $order_time = $order_info->order_time;
    $from = $order_info->from;
    $to = $order_info->to;
    $services = $order_info->services;
    setcookie('order_id', $order_id, time()+3600, "/");
}
if (isset($_GET['wait_user'])){
    $connect->query("UPDATE operator_order SET time_start_ride = CURRENT_TIME() WHERE user_order_id =".$_COOKIE['order_id']);
    $is_ride_begin = true;
}
if (isset($_GET['end_ride'])){
    $connect->query("UPDATE operator_order SET time_end_ride = CURRENT_TIME() WHERE user_order_id =".$_COOKIE['order_id']);
    $connect->query("UPDATE user_order SET status_id = (SELECT id FROM status WHERE description='Выполнен') WHERE id =".$_COOKIE['order_id']);
    header("Location: page_for_driver.php");
}
if (isset($_GET['choose'])){
    $connect->query("INSERT INTO driver_car SET car_id =".$_GET['car'].", data_work = CURRENT_DATE(), driver_id=(SELECT e.id
                                                                                FROM user u JOIN employee e ON u.id = e.user_id
                                                                                WHERE e.user_id =".$_COOKIE['user_id'].")");
    header("Location: page_for_driver.php");
}
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('err',$err);
$smarty->assign('role', $role);
$smarty->assign('login', $login);
$smarty->assign('current_page',$current_page);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('order_made', $order_made);
$smarty->assign('is_choosen', $is_choosen);
$smarty->assign('combo_free_cars', $combo_cars);
$smarty->assign('your_car', $your_car);
$smarty->assign('order_id', $order_id);
$smarty->assign('order_time', $order_time);
$smarty->assign('from', $from);
$smarty->assign('to', $to);
$smarty->assign('services', $services);
$smarty->assign('is_order_exist', $is_order_exist);
$smarty->assign('is_ride_begin', $is_ride_begin);
$smarty->display('main.tpl');
?>