<?php
include './config.php';
include 'php/func_combobox.php';
require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
$zagolovok = 'Регистрация';
$first_err = '';
$role = 'user';
$current_page = 'registration.php';
$has_entered = false;
$order_made = false;
if (isset($_GET['name'])){
    $name = $_GET['name'];
}else {
    $name = "";
}
if (isset($_GET['last_name'])){
    $last_name = $_GET['last_name'];
}else {
    $last_name = "";
}
if (isset($_GET['patronymic'])){
    $patronymic = $_GET['patronymic'];
}else {
    $patronymic = "";
}
if (isset($_GET['phone'])){
    $phone = $_GET['phone'];
}else {
    $phone = "";
}
if (isset($_GET['mail'])){
    setcookie('mail', $_GET['mail']);
    $mail = $_GET['mail'];
}else {
    $mail = "";
}
if (isset($_GET['login'])){
    $login = $_GET['login'];
}else {
    $login = "";
}
if (isset($_GET['password'])){
    $password = $_GET['password'];
}else {
    $password = "";
}
if (isset($_GET['password_repeat'])){
    $password_repeat = $_GET['password_repeat'];
}else {
    $password_repeat = "";
}

if(isset($_GET['check_in']))
{
    $err = [];
    if (empty($_GET['name']) || empty($_GET['last_name']) || empty($_GET['last_name']) ||
        empty($_GET['patronymic']) || empty($_GET['phone']) || empty($_GET['mail']) ||
        empty($_GET['login']) || empty($_GET['password']) || empty($_GET['password_repeat']))
    {
        $err[] = "Не все поля заполнены!";
    }
    // проверям логин
    if(!preg_match("/^[a-zA-Z0-9]+$/",$_GET['login']))
    {
        $err[] = "Логин может состоять только из букв английского алфавита и цифр";
    }

    if(strlen($_GET['login']) < 3 or strlen($_GET['login']) > 30)
    {
        $err[] = "Логин должен быть не меньше 3-х символов и не больше 30";
    }

    // проверяем, не сущестует ли пользователя с таким именем
    $query_arr = get_arr('id', $connect, "SELECT id FROM user WHERE login='".$_GET['login']."'");

    if(count($query_arr) > 0)
    {
        $err[] = "Пользователь с таким логином уже существует!";
    }
    
    if ($_GET['password'] != $_GET['password_repeat'])
    {
        $err[] = "Пароли не совпадают!";
    }
    // Если нет ошибок, то добавляем в БД нового пользователя
    if(count($err) == 0)
    {
        // Убераем лишние пробелы и делаем двойное хеширование
        $password = md5(md5(trim($_GET['password'])));

        $connect->query("call proc_new_user('".$name."', '".$last_name."', '".$patronymic."', '".$login."', '".$password."', '".$phone."', '".$mail."');");
        header("Location: authorization.php"); exit();
    }
    else
    {
        $first_err = $err[0];
    }
}
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('_name',$name);
$smarty->assign('last_name',$last_name);
$smarty->assign('patronymic',$patronymic);
$smarty->assign('phone',$phone);
$smarty->assign('mail',$mail);
$smarty->assign('login',$login);
$smarty->assign('password',$password);
$smarty->assign('password_repeat',$password_repeat);
$smarty->assign('current_page',$current_page);
$smarty->assign('err', $first_err);
$smarty->assign('role', $role);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('order_made', $order_made);
$smarty->display('main.tpl');
?>
