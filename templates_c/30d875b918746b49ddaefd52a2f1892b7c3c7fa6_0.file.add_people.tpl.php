<?php
/* Smarty version 3.1.33, created on 2021-05-13 01:52:22
  from '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/add_people.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609c5c264e9ca4_93912711',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '30d875b918746b49ddaefd52a2f1892b7c3c7fa6' => 
    array (
      0 => '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/add_people.tpl',
      1 => 1620832942,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_609c5c264e9ca4_93912711 (Smarty_Internal_Template $_smarty_tpl) {
?><p><input type="text" name="name" placeholder = "Имя"/></p>
<p><input type="text" name="last_name" placeholder = "Фамилия"/></p>
<p><input type="text" name="patronymic" placeholder = "Отчество"/></p>
<p><input type="date" name="birthdate" placeholder="Дата рождения"/></p>
<p><input type="text" name="phone" placeholder = "Телефон"/></p>
<p><input type="text" name="mail" placeholder = "Почта"/></p>
<p><input type="text" name="passport" placeholder="Серия и номер паспорта"/></p>
<?php if ($_smarty_tpl->tpl_vars['object']->value == 2) {?>
<p><input type="text" name="num_license" placeholder="Номер водительского удостоверения"/></p>
<?php }?>
<p><input type="text" name="login" placeholder = "Логин""/></p>
<p><input type="password" name="password" placeholder = "Пароль"/></p><?php }
}
