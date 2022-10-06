<?php
/* Smarty version 3.1.33, created on 2021-05-11 18:50:58
  from 'D:\ProgrammFiles\VertrigoServ\www\taxi\templates\main.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609ad212510d52_65606446',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '248788df3516774669a71e5c4df4f8c698432ace' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\taxi\\templates\\main.tpl',
      1 => 1620759054,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:authorization.tpl' => 1,
    'file:registration.tpl' => 1,
    'file:about_us.tpl' => 1,
    'file:order_taxi.tpl' => 1,
    'file:about_order.tpl' => 1,
    'file:page_for_admin.tpl' => 1,
    'file:page_for_driver.tpl' => 1,
    'file:page_for_operator.tpl' => 1,
  ),
),false)) {
function content_609ad212510d52_65606446 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="//www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<?php echo '<script'; ?>
 src="https://api-maps.yandex.ru/2.1/?apikey=7192a72a-c1dd-4805-b44d-db101bdf56f2&lang=ru_RU" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="https://yandex.st/jquery/2.2.3/jquery.min.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php if ($_smarty_tpl->tpl_vars['current_page']->value == 'order_taxi.php') {?>
    <?php echo '<script'; ?>
 src="js/script.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php } elseif ($_smarty_tpl->tpl_vars['current_page']->value == 'about_order.php') {?>
    <?php echo '<script'; ?>
 src="js/get_address.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php } elseif ($_smarty_tpl->tpl_vars['current_page']->value == 'page_for_admin.php') {?>
    <?php echo '<script'; ?>
 src="js/funcs.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php }?>
</head>
<body>
    <div id="main">
        <header>
            <img src='img/taxi_label.png' width="135" height="135" id="label"/>
            <h3><?php echo $_smarty_tpl->tpl_vars['current_page']->value;?>
</h3>
            <?php if ($_smarty_tpl->tpl_vars['has_entered']->value) {?>
                <ul class="account_login menu">
                <li><?php echo $_smarty_tpl->tpl_vars['login']->value;?>

                    <ul class="submenu">
                        <li><a href=#>Личный кабинет</a></li>
                        <li><a href="authorization.php">Выйти</a></li>
                    </ul>
                </li>
            </ul>
            <?php } else { ?>
                <input class="account_login" type="button" onclick="document.location='authorization.php'" value="Войти"/>
            <?php }?>        
        </header>
        <nav>
            <?php if ($_smarty_tpl->tpl_vars['role']->value == 'user') {?>
                <a href="index.php">Главная</a>
                <?php if ($_smarty_tpl->tpl_vars['has_entered']->value) {?>
                    <a href="order_taxi.php">Заказать такси</a>  
                <?php }?>
            <?php } else { ?>
            <?php }?>
        </nav>
            
            <?php if ($_smarty_tpl->tpl_vars['current_page']->value == 'authorization.php') {?>
                <?php $_smarty_tpl->_subTemplateRender('file:authorization.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['current_page']->value == 'registration.php') {?>                
                <?php $_smarty_tpl->_subTemplateRender('file:registration.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['current_page']->value == 'index.php') {?>
                <?php $_smarty_tpl->_subTemplateRender('file:about_us.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['current_page']->value == 'order_taxi.php') {?>
                <?php $_smarty_tpl->_subTemplateRender('file:order_taxi.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['current_page']->value == 'about_order.php') {?>
                <?php $_smarty_tpl->_subTemplateRender('file:about_order.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php }?>
            <?php if ($_smarty_tpl->tpl_vars['role']->value == "admin") {?>
                <?php $_smarty_tpl->_subTemplateRender('file:page_for_admin.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['role']->value == "driver") {?>
                <?php $_smarty_tpl->_subTemplateRender('file:page_for_driver.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['role']->value == "operator") {?>
                <?php $_smarty_tpl->_subTemplateRender('file:page_for_operator.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php }?>
        <footer>
            <p>&copy; Ваше такси, 2021</p>
            <div><img src='img/phone.png' width='25' height="25" class='leftimg'/><p>+7 (999) 999 99 99</p></div>
        </footer>
    </div>
</body>
</html><?php }
}
