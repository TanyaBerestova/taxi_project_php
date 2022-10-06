<?php 
include './config.php';
include 'php/func_combobox.php';
require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
if ($_COOKIE['login']){
   $login = $_COOKIE['login']; 
} else {
    header("Location: authorization.php");
}

$zagolovok = 'Заказ такси';
$has_entered = true;
$current_page = 'order_taxi.php';
$sql_class_car = 'SELECT id, class_name FROM class_car ORDER BY id;';
$sql_add_servises = 'SELECT id, service_name FROM add_services ORDER BY id;';
$services_arr = get_arr('service_name', $connect, $sql_add_servises);
$cars_arr = get_arr('class_name', $connect, $sql_class_car);
$err = '';
$selected_class_car = "";
$selected_services = [];
$from = "";
$to = "";
$role=$_COOKIE['role'];

$order_made = $connect->query("SELECT id FROM user_order WHERE user_id =".$_COOKIE['user_id']." AND status_id NOT IN (SELECT id FROM status WHERE description='Отменен' || description='Выполнен')")->fetch(PDO::FETCH_OBJ)->id;
if ($order_made){
    header('Location: about_order.php');
} else {
    $order_made = false;
}

if (isset($_GET['order'])){
    if (empty($_GET['address_from']) || empty($_GET['address_to'])){
        $err = "Не все поля заполнены!";
        $from = empty($_GET['address_from'])== true ? '' : $_GET['address_from'];
        $to = empty($_GET['address_to']) == true ? '' : $_GET['address_to'];
        $selected_class_car = $_GET['class_name'];
        for ($i = 1; $i <= count($services_arr); $i++){
            if (isset($_GET['service_name'][$i])){
                $selected_services[$i] = $services_arr[$i];
            } else {
                $selected_services[$i] = "";
            }
        } 
    } else {
        setcookie("address_from", $_GET['address_from'], time()+60*60, "/");
        setcookie("address_to", $_GET['address_to'], time()+60*60, "/");
        setcookie("class_name", $cars_arr[$_GET['class_name']], time()+60*60, "/");
        for ($i = 1; $i <= count($services_arr); $i++){
            if (isset($_GET['service_name'][$i])){
                setcookie("add_service".$i, $services_arr[$i], time()+60*60, "/");
            } else {
                setcookie("add_service".$i, " ", time()-60*60, "/");
            }
        } 
        header("Location: about_order.php"); exit();
    }
}
$combobox = combo('class_name', $connect, $sql_class_car, $selected_class_car);
$checkbox = checkbox('service_name', $connect, $sql_add_servises, $selected_services);
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('login',$login);;
$smarty->assign('has_entered',$has_entered);
$smarty->assign('current_page',$current_page);
$smarty->assign('combo1', $combobox);
$smarty->assign('checkbox1', $checkbox);
$smarty->assign('address_from', $from);
$smarty->assign('address_to', $to);
$smarty->assign('err', $err);
$smarty->assign('role', $role);
$smarty->assign('order_made', $order_made);
$smarty->display('main.tpl');
?>
