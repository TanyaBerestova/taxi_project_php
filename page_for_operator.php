<?php
include './config.php';
include 'php/func_combobox.php';
require_once 'libs/Smarty.class.php';
require 'phpmailer/PHPMailerAutoload.php';
$smarty = new Smarty();
$zagolovok = 'Действия';
$err = '';
$current_page = 'page_for_operator.php';
$has_entered = true;
$order_made = false;
if ($_COOKIE['login']){
   $login = $_COOKIE['login']; 
} else {
    header("Location: authorization.php");
}
$role = $_COOKIE['role'];
$sql_num_order = "SELECT id, id AS 'num_order' FROM user_order WHERE status_id = (SELECT id
                                                            FROM status
                                                            WHERE (description = 'Зарегистрирован'))";
$combo_num_orders = combo_choose('num_order', $connect, $sql_num_order, 'funcs()');   
$table_orders = "";
$view_orders = $connect->query('SELECT * FROM view_user_orders');

while ($r = $view_orders->fetch(PDO::FETCH_OBJ)){
    $num = $r->id;
    $nums[$num] = $num;
    $time = $r->time;
    $address_from = $r->address_from;
    $address_to = $r->address_to;
    $services = $r->services;
    $table_orders .= "<tr><td>$num</td><td>$time</td><td>$address_from</td><td>$address_to</td><td>$services</td></tr>";
} 
if (isset($_GET['apply'])){
    if (!empty($_GET['num_order']) && !empty($_GET['time_wait']) && !empty($_GET['cost'])){
        $connect->query("INSERT INTO operator_order SET user_order_id =".$_GET['num_order'].", driver_car_id = ".$_GET['combo_cars'].", time_wait =".$_GET['time_wait'].", cost =".$_GET['cost']);
    $status = $connect->query("SELECT status_id FROM user_order WHERE id =".$_GET['num_order']);
    if ($status == 1){
    $connect->query("UPDATE user_order SET status_id = (SELECT id FROM status WHERE description ='Назначен водитель') WHERE id =".$_GET['num_order']);
    $info = $connect->query("CALL proc_info_to_mail(".$_GET['num_order'].")")->fetch(PDO::FETCH_OBJ);
    $wait = $info->time_wait." минут";
    $name_order = $info->name;
    switch($wait){
        case 1: $wait .= 'у'; break;
        case 2:
        case 3:
        case 4: $wait .= 'ы'; break;
    }
    $message_mail = "<p>".$name_order.", Ваша машина <b>".mb_strtolower($info->car)."</b> будет у Вас через <b>".$wait."</b>. Стоимость поездки - <b>"
        .$info->cost." руб</b></p><p><i>Вы заказали такси: </i></p><p><b>Откуда: </b>".$info->from."</p><p><b>Куда: </b>".$info->to
        ."</p><p><b>Дополнительные услуги: </b>".mb_strtolower($info->services)."</p><p><b>Класс машины: </b>".mb_strtolower($info->class_car)."</p>";
    $mail = new PHPMailer;
    $mail->isSMTP();
    $mail->Host = 'smtp.mail.ru';
    $mail->SMTPAuth = true;
    $mail->Username = 'berestova_tanya-28@mail.ru';
    $mail->Password = 'asived21352135'; 
    $mail->SMTPSecure = 'ssl';
    $mail->Port = '465';
    $mail->CharSet = 'UTF-8';
    $mail->From = 'berestova_tanya-28@mail.ru';
    $mail->FromName = 'Берестова Татьяна';
    $mail->addAddress($info->mail, $name_order); 
    $mail->isHTML(true);
    $mail->Subject = 'Такси';
    $mail->Body = '<p>Такси <b>уже едет</b> к Вам!</p>'. $message_mail;

    $mail->send();
    }   
        header('Location: page_for_operator.php'); exit();
    } else {
        $err = "Не все поля заполнены!";
    }
}

$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('err',$err);
$smarty->assign('login', $login);
$smarty->assign('current_page',$current_page);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('role', $role);
$smarty->assign('view_orders', $table_orders );
$smarty->assign('order_made', $order_made);
$smarty->assign('combo_num_orders', $combo_num_orders);;
$smarty->display('main.tpl');
?>