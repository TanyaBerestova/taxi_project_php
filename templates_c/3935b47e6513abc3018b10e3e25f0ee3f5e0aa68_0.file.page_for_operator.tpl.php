<?php
/* Smarty version 3.1.33, created on 2021-05-11 20:22:31
  from 'D:\ProgrammFiles\VertrigoServ\www\taxi\templates\page_for_operator.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_609ae787df7199_28237179',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3935b47e6513abc3018b10e3e25f0ee3f5e0aa68' => 
    array (
      0 => 'D:\\ProgrammFiles\\VertrigoServ\\www\\taxi\\templates\\page_for_operator.tpl',
      1 => 1620764547,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_609ae787df7199_28237179 (Smarty_Internal_Template $_smarty_tpl) {
?><section> 
    <div class="block_3">
        <h2 class="on_center"></h2>
        <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
        <form method="GET" class = "yellow_block">
            <table>
                        <tr>
                            <th>Время заявки</th>
                            <th>Откуда</th>
                            <th>Куда</th>
                            <th>Доп услуги</th>
                        </tr>
            <?php echo $_smarty_tpl->tpl_vars['view_orders']->value;?>

            </table>
            <div class="bt_on_center" padding-top="30">
                <input type="submit" name="apply" value=" Выбрать"/>
            </div>
        </form>
    </div> 
</section>  <?php }
}
