<?php
/* Smarty version 3.1.33, created on 2021-05-11 12:23:19
  from 'D:\ProgrammFiles\VertrigoServ\www\taxi\templates\page_for_admin.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609a77379c0c37_65118447',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '75969c998d136024429df99acaf478ccb900fbb2' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\taxi\\templates\\page_for_admin.tpl',
      1 => 1620735744,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:add_people.tpl' => 1,
  ),
),false)) {
function content_609a77379c0c37_65118447 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="two_columns">
    <div class="block">
        <h2 class="on_center"><?php echo $_smarty_tpl->tpl_vars['zagolovok']->value;?>
</h2>
        <p></p>
        <form method="GET" class = "yellow_block">
            <p><?php echo $_smarty_tpl->tpl_vars['combo_act']->value;?>
</p>
            <p><?php echo $_smarty_tpl->tpl_vars['combo_empl']->value;?>
</p>
            <input type="submit" name="choose_act" value="OK""/>
        </form>
        <image src="img/1.png" height="250"/>
    </div> 
    <div class="block_2" id="appear_info">
        <h2 class="on_center"><?php echo $_smarty_tpl->tpl_vars['act_name']->value;?>
 <?php echo $_smarty_tpl->tpl_vars['obj_name']->value;?>
</h2>
        <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
        <form method="GET" class = "yellow_block">
            <?php if ($_smarty_tpl->tpl_vars['act']->value == 1 && ($_smarty_tpl->tpl_vars['object']->value == 1 || $_smarty_tpl->tpl_vars['object']->value == 2)) {?>
                 <?php $_smarty_tpl->_subTemplateRender('file:add_people.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 1 && $_smarty_tpl->tpl_vars['object']->value == 3) {?>
                <p><input type="text" name="num" placeholder = "Номер машины"/></p>
                <p><input type="text" name="vin" placeholder = "VIN"/></p>
                <p><?php echo $_smarty_tpl->tpl_vars['combo_brand']->value;?>
</p>
                <p><?php echo $_smarty_tpl->tpl_vars['combo_color']->value;?>
</p>
                <p><?php echo $_smarty_tpl->tpl_vars['combo_type_car']->value;?>
</p>
                <p><?php echo $_smarty_tpl->tpl_vars['combo_class_car']->value;?>
</p>
                <div class="add_serv">Дополнительные услуги: <?php echo $_smarty_tpl->tpl_vars['checkbox_services']->value;?>
</div>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 2 && $_smarty_tpl->tpl_vars['object']->value == 1) {?>
                <p>Выберите сотрудника: <?php echo $_smarty_tpl->tpl_vars['combo_operators']->value;?>
</p>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 2 && $_smarty_tpl->tpl_vars['object']->value == 2) {?>
                <p>Выберите сотрудника: <?php echo $_smarty_tpl->tpl_vars['combo_drivers']->value;?>
</p>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 2 && $_smarty_tpl->tpl_vars['object']->value == 3) {?>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 3 && $_smarty_tpl->tpl_vars['object']->value == 1) {?>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 3 && $_smarty_tpl->tpl_vars['object']->value == 2) {?>
            <?php } elseif ($_smarty_tpl->tpl_vars['act']->value == 3 && $_smarty_tpl->tpl_vars['object']->value == 3) {?>
            <?php }?>
            <div class="bt_on_center">
                <input type="submit" name="apply" value="<?php echo $_smarty_tpl->tpl_vars['act_name']->value;?>
"/>
            </div>
        </form>
    </div> 
</section>    
<?php }
}
