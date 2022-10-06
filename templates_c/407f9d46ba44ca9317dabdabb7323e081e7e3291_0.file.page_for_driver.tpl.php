<?php
/* Smarty version 3.1.33, created on 2021-05-17 18:15:31
  from 'D:\ProgrammFiles\VertrigoServ\www\berestova_project_taxi\templates\page_for_driver.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_60a2b2c3cb1da0_96310578',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '407f9d46ba44ca9317dabdabb7323e081e7e3291' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\berestova_project_taxi\\templates\\page_for_driver.tpl',
      1 => 1621275328,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60a2b2c3cb1da0_96310578 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="auth"> 
    <div class="block_2">
        <h2 class="on_center"></h2>
        <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
        <form method="GET" class = "yellow_block">
            <?php if ($_smarty_tpl->tpl_vars['is_choosen']->value) {?>
            <div class="bt_on_center">
                <p>Ваша машина - <?php echo $_smarty_tpl->tpl_vars['your_car']->value;?>
</p>
                <?php if ($_smarty_tpl->tpl_vars['is_order_exist']->value) {?>
                <p><b>Номер заявки:</b> <?php echo $_smarty_tpl->tpl_vars['order_id']->value;?>
<p>
                <p><b>Время заявки:</b> <?php echo $_smarty_tpl->tpl_vars['order_time']->value;?>
<p>
                <p><b>Откуда:</b> <?php echo $_smarty_tpl->tpl_vars['from']->value;?>
<p>
                <p><b>Куда:</b> <?php echo $_smarty_tpl->tpl_vars['to']->value;?>
<p>
                <p><b>Доп услуги:</b> <?php echo $_smarty_tpl->tpl_vars['services']->value;?>
<p>
                <?php if (!$_smarty_tpl->tpl_vars['is_ride_begin']->value) {?>
                <p>Нажмите на кнопку, когда приедите к месту назначения</p>
                <input type="submit" name="wait_user" value="Я приехал"/>
                <?php } else { ?>
                    <p>Нажмите на кнопку, когда закончите поездку</p>
                    <input type="submit" name="end_ride" value="Заказ выполнен"/>
                <?php }?>
            </div>     
                <?php } else { ?>
                <p>Ожидайте заказы...</p>
                <?php }?>
            <?php } else { ?>
                <p>Выберите машину, на которой сегодня работаете: <?php echo $_smarty_tpl->tpl_vars['combo_free_cars']->value;?>
</p>
		<div class="bt_on_center">
                <input type="submit" name="choose" value="Выбрать"/>
                </div>
            <?php }?>
        </form>
    </div> 
</section>  <?php }
}
