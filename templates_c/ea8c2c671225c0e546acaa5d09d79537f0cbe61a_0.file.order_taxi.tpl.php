<?php
/* Smarty version 3.1.33, created on 2021-05-10 14:22:04
  from 'D:\ProgrammFiles\VertrigoServ\www\taxi\templates\order_taxi.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_6099418c90c1f1_99615781',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ea8c2c671225c0e546acaa5d09d79537f0cbe61a' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\taxi\\templates\\order_taxi.tpl',
      1 => 1620656410,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6099418c90c1f1_99615781 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="map_and_order">
    <div class="block" id="block_order">
        <h1 class="on_center"><?php echo $_smarty_tpl->tpl_vars['zagolovok']->value;?>
</h1>
        <p class="errs on_center" id="err"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
        <form method="GET" class = "yellow_block">
            <p><input class="bt_address" name="address_from" id="suggest1" type="text" placeholder = "Откуда" value="<?php echo $_smarty_tpl->tpl_vars['address_from']->value;?>
"/></p>
            <p><input class="bt_address" name="address_to" id="suggest2" type="text" placeholder = "Куда" value="<?php echo $_smarty_tpl->tpl_vars['address_to']->value;?>
"/></p>
            <p><?php echo $_smarty_tpl->tpl_vars['combo1']->value;?>
</p>
            <div class="add_serv">Дополнительные услуги: <?php echo $_smarty_tpl->tpl_vars['checkbox1']->value;?>
</div>
            <input type="submit" name="order" id="bt_order" value="Заказать"/> 
        </form>
    </div> 
    <div class="col-2">
        <div id="map" class="panel-map"></div>
    </div>
</section>            <?php }
}