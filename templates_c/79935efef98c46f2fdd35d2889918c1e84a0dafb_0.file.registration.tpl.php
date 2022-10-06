<?php
/* Smarty version 3.1.33, created on 2021-05-12 18:49:07
  from '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/registration.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609bf8f33f1545_35701837',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '79935efef98c46f2fdd35d2889918c1e84a0dafb' => 
    array (
      0 => '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/registration.tpl',
      1 => 1620832942,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_609bf8f33f1545_35701837 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="auth">
<div class="block">
    <h1 class="on_center"><?php echo $_smarty_tpl->tpl_vars['zagolovok']->value;?>
</h1>
    <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
<form method="GET" class = "yellow_block">
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
