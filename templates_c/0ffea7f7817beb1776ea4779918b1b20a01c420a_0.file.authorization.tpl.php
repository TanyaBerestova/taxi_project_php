<?php
/* Smarty version 3.1.33, created on 2021-05-12 18:30:45
  from '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/authorization.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609bf4a5c7f384_32205251',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0ffea7f7817beb1776ea4779918b1b20a01c420a' => 
    array (
      0 => '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/authorization.tpl',
      1 => 1620832942,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_609bf4a5c7f384_32205251 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="auth">
<div class="block">
    <h1 class="on_center"><?php echo $_smarty_tpl->tpl_vars['zagolovok']->value;?>
</h1>
    <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
        <form method="POST" class = "yellow_block">
            <p><input type="text" name="input_login" placeholder = "Логин" value="<?php echo $_smarty_tpl->tpl_vars['login']->value;?>
"></p>
            <p><input type="password" name="input_password" placeholder = "Пароль"></p>
            <input type="submit" name="input" value="Войти"/> 
            <p class="on_center">Еще нет аккаунта? - <a href="registration.php">Зарегистрируйся</a></p>
        </form>
</div> 
</section><?php }
}
