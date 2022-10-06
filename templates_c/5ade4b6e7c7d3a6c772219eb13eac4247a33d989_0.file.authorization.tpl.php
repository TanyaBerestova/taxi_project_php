<?php
/* Smarty version 3.1.33, created on 2021-05-17 16:49:20
  from 'D:\ProgrammFiles\VertrigoServ\www\berestova_project_taxi\templates\authorization.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_60a29e90d69775_35331234',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5ade4b6e7c7d3a6c772219eb13eac4247a33d989' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\berestova_project_taxi\\templates\\authorization.tpl',
      1 => 1621269999,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60a29e90d69775_35331234 (Smarty_Internal_Template $_smarty_tpl) {
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
