<?php
/* Smarty version 3.1.33, created on 2021-05-17 17:31:57
  from 'D:\ProgrammFiles\VertrigoServ\www\berestova_project_taxi\templates\add_people.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_60a2a88df0b789_82241268',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f162eed82ae617f0b7457c08e33d9e115d4911ab' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\berestova_project_taxi\\templates\\add_people.tpl',
      1 => 1620832942,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60a2a88df0b789_82241268 (Smarty_Internal_Template $_smarty_tpl) {
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
