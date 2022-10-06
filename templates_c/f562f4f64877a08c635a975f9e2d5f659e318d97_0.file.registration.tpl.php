<?php
/* Smarty version 3.1.33, created on 2021-05-05 13:48:57
  from 'D:\ProgrammFiles\VertrigoServ\www\taxi\templates\registration.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_6092a249e67bf6_09171162',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f562f4f64877a08c635a975f9e2d5f659e318d97' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\taxi\\templates\\registration.tpl',
      1 => 1620217905,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6092a249e67bf6_09171162 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="auth">
<div class="block">
    <h1 class="on_center"><?php echo $_smarty_tpl->tpl_vars['zagolovok']->value;?>
</h1>
    <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
<form method="GET" id = "registration">
    <p><input type="text" name="name" placeholder = "Имя" value="<?php echo $_smarty_tpl->tpl_vars['_name']->value;?>
"/></p>
    <p><input type="text" name="last_name" placeholder = "Фамилия" value="<?php echo $_smarty_tpl->tpl_vars['last_name']->value;?>
"/></p>
    <p><input type="text" name="patronymic" placeholder = "Отчество" value="<?php echo $_smarty_tpl->tpl_vars['patronymic']->value;?>
"/></p>
    <p><input type="text" name="phone" placeholder = "Телефон" value="<?php echo $_smarty_tpl->tpl_vars['phone']->value;?>
"/></p>
    <p><input type="text" name="mail" placeholder = "Почта" value="<?php echo $_smarty_tpl->tpl_vars['mail']->value;?>
"/></p>
    <p><input type="text" name="login" placeholder = "Логин" value="<?php echo $_smarty_tpl->tpl_vars['login']->value;?>
"/></p>
    <p><input type="password" name="password" placeholder = "Пароль" value="<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
"/></p>
    <p><input type="password" name="password_repeat" placeholder = "Повторите пароль" value="<?php echo $_smarty_tpl->tpl_vars['password_repeat']->value;?>
"></p>
    <input type="submit" name="check_in" value="Зарегистрироваться"/> 
    <p class="on_center">Уже есть аккаунт? - <a href="authorization.php">Войдите</a></p>
</form>
</div> 
</section>

<?php }
}
