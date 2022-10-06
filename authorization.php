<?php 
include './config.php';
include 'php/func_combobox.php';
//Подключаем класс смарти
require_once 'libs/Smarty.class.php';
//Создадим обьект класса смарти
$smarty = new Smarty();
//Создадим переменную для примера
$zagolovok = 'Авторизация';
if (isset($_POST['input_login'])){
    $login = $_POST['input_login'];
} else {
    $login = '';
}
$order_made = false;
$err = '';
$role = 'user';
$current_page = 'authorization.php';
$has_entered = false;
foreach($_COOKIE as $key => $value) setcookie($key, '', time() -3600, "/");

if(isset($_POST['input']))
{
    // Вытаскиваем из БД запись, у которой логин равняеться введенному
    $query = $connect->query("SELECT u.id, u.password, r.name FROM user u JOIN role r ON u.role_id = r.id WHERE u.login='".$login."'");
    $query_arr = $query ->fetch(PDO::FETCH_ASSOC);
    // Сравниваем пароли
    if (empty($query_arr)){
        $err = "Пользователя с таким логином не существует!";
    } else if($query_arr['password'] === md5(md5($_POST['input_password']))){
        // Ставим куки
        setcookie("login", $_POST['input_login'], time()+60*60, "/");
        setcookie("user_id", $query_arr['id'], time()+60*60, "/");
        setcookie('role', $query_arr['name'], time()+60*60, "/");
        if ($query_arr['name'] == 'user'){
            // Переадресовываем браузер на страницу проверки нашего скрипта
            header("Location: order_taxi.php"); exit();
        } else if ($query_arr['name'] == 'driver'){
             header("Location: page_for_driver.php"); exit();
        } else if ($query_arr['name'] == 'operator'){
            header("Location: page_for_operator.php"); exit();
        } else if ($query_arr['name'] == 'admin'){
            header("Location: page_for_admin.php"); exit();
        }
    }
    else{
        $err = "Вы ввели неправильный пароль!";
    }
}
$smarty->assign('zagolovok',$zagolovok);
$smarty->assign('err',$err);
$smarty->assign('login', $login);
$smarty->assign('role', $role);
$smarty->assign('current_page',$current_page);
$smarty->assign('has_entered',$has_entered);
$smarty->assign('order_made', $order_made);
$smarty->display('main.tpl');
?>
