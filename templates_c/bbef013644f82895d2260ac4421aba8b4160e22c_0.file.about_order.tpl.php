<?php
/* Smarty version 3.1.33, created on 2021-05-13 00:36:56
  from '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/about_order.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609c4a78445a85_66014276',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bbef013644f82895d2260ac4421aba8b4160e22c' => 
    array (
      0 => '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/about_order.tpl',
      1 => 1620855409,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_609c4a78445a85_66014276 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="auth">
    <div class="block_1">
        <h1 class="on_center"><?php echo $_smarty_tpl->tpl_vars['zagolovok']->value;?>
</h1>
        <div class="info_about_order">
            <p id="address_from"><b>Откуда:</b> <?php echo $_smarty_tpl->tpl_vars['address_from']->value;?>
</p>
            <p id="address_to"><b>Куда:</b> <?php echo $_smarty_tpl->tpl_vars['address_to']->value;?>
</p>
            <p><b>Класс:</b> <?php echo $_smarty_tpl->tpl_vars['class_car']->value;?>
</p>
            <p><b>Дополнительные услуги:</b> <?php echo $_smarty_tpl->tpl_vars['add_services']->value;?>
</p>
            <p><b>Статус заказа:</b> <?php echo $_smarty_tpl->tpl_vars['status']->value;?>
</p>
        </div>
        <form method="GET" class ="yellow_block">
            <input type="submit" name="cancel_order" value="Отменить"/> 
        </form>
    </div> 
</section>

<?php }
}
