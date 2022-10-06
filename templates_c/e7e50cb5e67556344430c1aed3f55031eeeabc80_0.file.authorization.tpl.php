<?php
/* Smarty version 3.1.33, created on 2021-05-10 14:22:10
  from 'D:\ProgrammFiles\VertrigoServ\www\taxi\templates\authorization.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_60994192a93ef8_17200112',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e7e50cb5e67556344430c1aed3f55031eeeabc80' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\taxi\\templates\\authorization.tpl',
      1 => 1620656313,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60994192a93ef8_17200112 (Smarty_Internal_Template $_smarty_tpl) {
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
