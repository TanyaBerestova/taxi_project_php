<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script src="https://api-maps.yandex.ru/2.1/?apikey=7192a72a-c1dd-4805-b44d-db101bdf56f2&lang=ru_RU" type="text/javascript"></script>
<script src="https://yandex.st/jquery/2.2.3/jquery.min.js" type="text/javascript"></script>
{if $current_page == 'order_taxi.php'}
    <script src="js/script.js" type="text/javascript"></script>
{else if $current_page == 'about_order.php'}
    <script src="js/get_address.js" type="text/javascript"></script>
{else if $current_page == 'page_for_operator.php'}
    <script src="js/funcs.js" type="text/javascript"></script>
{/if}
</head>
<body>
    <div id="main">
        <header>
            <img src='img/taxi_label.png' width="135" height="135" id="label"/>
            {if $has_entered}
                <ul class="account_login menu">
                <li>{$login}
                    <ul class="submenu">
                        <li><a href="authorization.php">Выйти</a></li>
                    </ul>
                </li>
            </ul>
            {else}
                <input class="account_login" type="button" onclick="document.location='authorization.php'" value="Войти"/>
            {/if}        
        </header>
        <nav>
            {if $role == 'user'}
                <a href="index.php">Главная</a>
                {if $has_entered && !$order_made}
                    <a href="order_taxi.php">Заказать такси</a>  
                {else if $order_made}
                    <a href="about_order.php">Информация о заказе</a>  
                {/if}
            {else if $role == 'admin'}
                <a href="page_for_admin.php">Редактировать базу</a>
            {else if $role == 'driver'}
                <a href="page_for_driver.php">Получить заказы</a>
                {else if $role == 'operator'}
                <a href="page_for_operator.php">Назначить заказы</a>
            {/if}
        </nav>
            
            {if $current_page == 'authorization.php'}
                {include file='authorization.tpl'}
            {else if $current_page == 'registration.php'}                
                {include file='registration.tpl'}
            {else if $current_page == 'index.php'}
                {include file='about_us.tpl'}
            {else if $current_page == 'order_taxi.php'}
                {include file='order_taxi.tpl'}
            {else if $current_page == 'about_order.php'}
                {include file='about_order.tpl'}
            {/if}
            {if $role == "admin"}
                {include file='page_for_admin.tpl'}
            {else if $role == "driver"}
                {include file='page_for_driver.tpl'}
            {else if $role == "operator"}
                {include file='page_for_operator.tpl'}
            {/if}
        <footer>
            <p>&copy; Ваше такси, 2021</p>
            <div><img src='img/phone.png' width='25' height="25" class='leftimg'/><p>+7 (999) 999 99 99</p></div>
        </footer>
    </div>
</body>
</html>
