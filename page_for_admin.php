<?php
include './config.php';
include 'php/func_combobox.php';
require_once 'libs/Smarty.class.php';

$smarty = new Smarty();
$zagolovok = 'Действия';
$err = '';
$act_name = "";
$obj_name = "";
$selected_act = "";
$selected_employee = "";
$current_page = 'page_for_admin.php';
$has_entered = true;
$order_made = false;
if ($_COOKIE['login']){
   $login = $_COOKIE['login']; 
} else {
    header("Location: authorization.php");
}
$role = $_COOKIE['role'];
$hidden_elems = true;
$actions = array(1 => "Добавить", 2 => "Удалить");
$employee_roles = array(1 => "Оператор", 2 => "Водитель", 3 => "Машина");


$sql_brand_car = 'SELECT id, CONCAT(brand, " ", model) AS "brand" FROM car_brand ORDER BY id;';
$sql_color_car = 'SELECT id, name AS "color" FROM color ORDER BY id;';
$sql_type_car = 'SELECT id, name AS "type" FROM type_car ORDER BY id;;';
$sql_class_car = 'SELECT id, class_name FROM class_car ORDER BY id;';
$sql_add_servises = 'SELECT id, service_name FROM add_services ORDER BY id;';
$sql_get_operators = 'SELECT id, CONCAT(last_name, " ", name, " ", patronymic) AS "operator" FROM user WHERE role_id = (SELECT id FROM role WHERE name = "operator") ORDER BY id;';
$sql_get_drivers = 'SELECT id, CONCAT(last_name, " ", name, " ", patronymic) AS "driver" FROM user WHERE role_id = (SELECT id FROM role WHERE name = "driver") ORDER BY id;';
$sql_get_cars = 'SELECT c.id, CONCAT(b.brand, " ", b.model, ", VIN - ", c.VIN) AS "car" FROM car c JOIN car_brand b ON c.brand_id = b.id ORDER BY b.id';

$services_arr = get_arr('service_name', $connect, $sql_add_servises);
$combo_brand = combo('brand', $connect, $sql_brand_car);
$combo_color = combo('color', $connect, $sql_color_car);
$combo_type_car = combo('type', $connect, $sql_type_car);
$combo_class_car = combo('class_name', $connect, $sql_class_car);
$checkbox_services = checkbox('service_name', $connect, $sql_add_servises);
$combo_operators = combo('operator', $connect, $sql_get_operators);
$combo_drivers = combo('driver', $connect, $sql_get_drivers);
$combo_cars = combo('car', $connect, $sql_get_cars);

if (isset($_GET['download'])){
    header('Location: php/download.php');
}

if (isset($_COOKIE['selected_act'])){
    $selected_act = $_COOKIE['selected_act'];
} else{
    $selected_act = 1;
}
if (isset($_COOKIE['selected_employee'])){
    $selected_employee = $_COOKIE['selected_employee'];
} else{
    $selected_employee = 1;
}
if (isset($_COOKIE['act_name'])){
    $act_name = $_COOKIE['act_name'];
} else{
    $act_name = "Добавить";
}
if (isset($_COOKIE['obj_name'])){
    $obj_name = $_COOKIE['obj_name'];
} else{
    $obj_name = "оператора";
}

if (isset($_GET['choose_act'])){
    $hidden_elems = false;
    $selected_act = $_GET['act'];
    setcookie("selected_act", $selected_act);
    $selected_employee = $_GET['employee_role'];
    setcookie("selected_employee", $selected_employee);
    $act_name =  $actions[$selected_act];
    setcookie("act_name", $act_name);
    $obj_ = mb_strtolower(mb_substr($employee_roles[$selected_employee],0,-1));
    switch($selected_employee){
        case 1: $obj_name = mb_strtolower($employee_roles[$selected_employee]).'a'; break;
        case 2: $obj_name = $obj_.'я'; break;
        case 3: $obj_name = $obj_.'у'; break;
    }
    setcookie("obj_name", $obj_name);
}
if (isset($_GET['apply'])){
    if ($_COOKIE['selected_act'] == 1 && $_COOKIE['selected_employee'] == 3){
        if (empty($_GET['num']) || empty($_GET['vin'])){
            $err = "Не все поля заполнены!";
        } else {
            $services = []; 
            for ($i = 1; $i <= count($services_arr); $i++){
                if (isset($_GET['service_name'][$i])){
                    $services[$i] = $i;
                } else {
                    $services[$i] = "NULL";
                }
            }
        }
        $connect->query("CALL proc_add_car('".$_GET['num']."', '".$_GET['vin']."', ".$_GET['brand'].", ".$_GET['color'].", ".$_GET['type'].", ".$_GET['class_name'].", ".$services[1].", ".$services[2].", ".$services[3].");");
    }
    if ($_COOKIE['selected_act'] == 1 && $_COOKIE['selected_employee'] == 1){
        if (empty($_GET['name']) || empty($_GET['last_name']) || empty($_GET['patronymic']) || empty($_GET['birthdate']) || empty($_GET['phone']) || empty($_GET['mail']) || empty($_GET['passport']) || empty($_GET['login']) || empty($_GET['password'])){
            $err = "Не все поля заполнены!";
        } 
        $connect->query("CALL proc_add_employee('".$_GET['name']."', '".$_GET['last_name']."', '".$_GET['patronymic']."', '".$_GET['birthdate']."', '".$_GET['phone']."', '".$_GET['mail']."', '".$_GET['passport']."', '".$_GET['login']."', '".md5(md5(trim($_GET['password'])))."', NULL, 'operator');");
    }
    if ($_COOKIE['selected_act'] == 1 && $_COOKIE['selected_employee'] == 2){
        if (empty($_GET['name']) || empty($_GET['last_name']) || empty($_GET['patronymic']) || empty($_GET['birthdate']) || empty($_GET['phone']) || empty($_GET['mail']) || empty($_GET['passport']) || empty($_GET['num_license']) || empty($_GET['login']) || empty($_GET['password'])){
            $err = "Не все поля заполнены!";
        } 
        $connect->query("CALL proc_add_employee('".$_GET['name']."', '".$_GET['last_name']."', '".$_GET['patronymic']."', '".$_GET['birthdate']."', '".$_GET['phone']."', '".$_GET['mail']."', '".$_GET['passport']."', '".$_GET['login']."', '".md5(md5(trim($_GET['password'])))."', '".$_GET['num_license']."', 'driver');");
    }
    if ($_COOKIE['selected_act'] == 2 && $_COOKIE['selected_employee'] == 1){
        $connect->query("DELETE FROM user WHERE id =".$_GET['operator']);
        header("Location: page_for_admin.php"); exit();
    }
    if ($_COOKIE['selected_act'] == 2 && $_COOKIE['selected_employee'] == 2){
        $connect->query("DELETE FROM user WHERE id =".$_GET['driver']);
        header("Location: page_for_admin.php"); exit();
    }
    if ($_COOKIE['selected_act'] == 2 && $_COOKIE['selected_employee'] == 3){
        $connect->query("DELETE FROM car WHERE id =".$_GET['car']);
        header("Location: page_for_admin.php"); exit();
    }
}

$combo_act = combo('act', '', '', $selected_act, $actions);
$combo_empl = combo('employee_role', '', '', $selected_employee, $employee_roles);
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('err',$err);
$smarty->assign('login', $login);
$smarty->assign('current_page',$current_page);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('role', $role);
$smarty->assign('combo_act', $combo_act);
$smarty->assign('combo_empl', $combo_empl);
$smarty->assign('combo_brand', $combo_brand);
$smarty->assign('combo_color', $combo_color);
$smarty->assign('combo_type_car', $combo_type_car);
$smarty->assign('combo_class_car', $combo_class_car);
$smarty->assign('checkbox_services', $checkbox_services);
$smarty->assign('combo_operators', $combo_operators);
$smarty->assign('combo_drivers', $combo_drivers);
$smarty->assign('combo_cars', $combo_cars);
$smarty->assign('act', $selected_act);
$smarty->assign('act_name', $act_name);
$smarty->assign('obj_name', $obj_name);
$smarty->assign('object', $selected_employee);
$smarty->assign('order_made', $order_made);
$smarty->assign('hidden_elems', $hidden_elems);
$smarty->display('main.tpl');
?>

