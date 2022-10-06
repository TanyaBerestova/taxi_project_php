<?php 
include './config.php';
require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
$zagolovok = 'Информация по заказу';
$current_page = 'about_order.php';
$has_entered = true;
$login = $_COOKIE['login'];
$role=$_COOKIE['role'];
$order_made = true;

if (isset($_GET['cancel_order'])){
    $order_id = $connect->query("SELECT MAX(id) AS 'id' FROM user_order WHERE user_id =".$_COOKIE['user_id']." AND order_date = CURRENT_DATE() 
    AND status_id NOT IN (SELECT id FROM status WHERE description='Отменен' || description='Выполнен');")->fetch(PDO::FETCH_OBJ)->id;
    $connect->query("UPDATE user_order SET status_id = (SELECT id FROM status WHERE description='Отменен') WHERE id =".$order_id);
    for ($i = 1; $i <= 3; $i++){
            if (isset($_COOKIE["add_service".$i])){
                setcookie("add_service".$i, " ", time()-60*60, "/");
            }
        } 
    setcookie("address_from", " ", time()-60*60, "/");
    setcookie("address_to", " ", time()-60*60, "/");
    setcookie("class_name", " ", time()-60*60, "/");
    header("Location: order_taxi.php"); exit();
}
$nums_services = array(1=> "NULL", 2 => "NULL", 3 => "NULL");
print_r($_COOKIE);
if (isset($_COOKIE['address_from'])){
    $from = $_COOKIE['address_from'];
    $to = $_COOKIE['address_to'];
    $class_car = $_COOKIE['class_name'];
    $add_services = [];
    $j = 1;
    for ($i = 1; $i <=3; $i++){
        if (isset($_COOKIE["add_service".$i])){
            $add_services[$i] = $_COOKIE["add_service".$i];
            $nums_services[$j] = $i;
            $j++;
        }
    }
    $services = implode(", ", $add_services);
} else {
    $order_id_ = $connect->query("SELECT MAX(id) AS 'id' FROM user_order WHERE user_id =".$_COOKIE['user_id']." AND order_date = CURRENT_DATE() 
    AND status_id NOT IN (SELECT id FROM status WHERE description='Отменен' || description='Выполнен');")->fetch(PDO::FETCH_OBJ)->id;
    $arr = $connect->query("SELECT CONCAT(a.city, ', ', a.street, ', ', a.house_num) AS 'from', CONCAT(a1.city, ', ', a1.street, ', ', a1.house_num) AS 'to', 
    CONCAT((CASE WHEN gs.service1 IS NULL THEN ' ' ELSE ads1.service_name END), (CASE WHEN gs.service2 IS NULL THEN '' ELSE CONCAT(', ', ads2.service_name) END), 
    (CASE WHEN gs.service3 IS NULL THEN '' ELSE CONCAT(', ', ads3.service_name) END)) AS 'services', cc.class_name 
    FROM user_order uo JOIN address a ON uo.id_address_from = a.id JOIN address a1 ON uo.id_address_to = a1.id
    JOIN class_car cc ON uo.class_car = cc.id LEFT JOIN group_services gs ON uo.add_services = gs.id LEFT JOIN add_services ads1
    ON gs.service1 = ads1.id LEFT JOIN add_services ads2 ON gs.service2 = ads2.id LEFT JOIN add_services ads3 ON gs.service3 = ads3.id
    WHERE uo.id =".$order_id_)->fetch(PDO::FETCH_ASSOC);
    print_r($arr);
    $from = $arr['from'];
    setcookie('address_from', $from, time()+3600, "/");
    $to = $arr['to'];
    setcookie('address_to', $from, time()+3600, "/");
    $class_car = $arr['class_name'];
    setcookie('class_name', $from, time()+3600, "/");
    $services = $arr['services'];
    setcookie('services', $from, time()+3600, "/");
}
if (isset($_GET['param'])){
    $sql1 = "CALL add_address(:adm_area, :city, :street, :house_num)";
    $res1 = $connect -> prepare($sql1);
    $param = json_decode($_GET['param']);
    $address_from = array('adm_area' => $param->administrative_area_from,'city' => $param->city_from,'street' =>$param->street_from, 'house_num' => $param->house_num_from);
    $res1->execute([':adm_area'=>$address_from['adm_area'], ':city' => $address_from['city'], ':street' => $address_from['street'], ':house_num' => $address_from['house_num']]);
    $user_id = $_COOKIE['user_id'];
    $address_to = array('adm_area' => $param->administrative_area_to,'city' => $param->city_to,'street' =>$param->street_to, 'house_num' => $param->house_num_to);
    $res1->execute([':adm_area'=>$address_to['adm_area'], ':city' => $address_to['city'], ':street' => $address_to['street'], ':house_num' => $address_to['house_num']]);
    $id_from = $connect->query("SELECT func_get_address_id('".$address_from['adm_area']."', '".$address_from['city']."', '".$address_from['street']."', '".$address_from['house_num']."') AS 'id'")->fetch(PDO::FETCH_OBJ)->id;
    $id_to = $connect->query("SELECT func_get_address_id('".$address_to['adm_area']."', '".$address_to['city']."', '".$address_to['street']."', '".$address_to['house_num']."') AS 'id'")->fetch(PDO::FETCH_OBJ)->id;
    $class_car_id = $connect->query("SELECT id FROM class_car WHERE class_name='".$class_car."'")->fetch(PDO::FETCH_OBJ)->id;
    $connect->query("CALL proc_new_user_order(".$user_id.", ".$id_from.", ".$id_to.", ".$nums_services[1].", ".$nums_services[2].", ".$nums_services[3].", ".$class_car_id.")");
 exit();
}
//ВРЕМЕНННО, НУЖНО ИЗ БД
$status = "Поиск водителя. Ожидайте письма с информацией о Вашем такси";
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('current_page',$current_page);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('login', $login);
$smarty->assign('role', $role);
$smarty->assign('address_from', $from);
$smarty->assign('address_to', $to);
$smarty->assign('class_car', $class_car);
$smarty->assign('add_services', $services); 
$smarty->assign('status', $status);
$smarty->assign('order_made', $order_made);
$smarty->display('main.tpl');
?>