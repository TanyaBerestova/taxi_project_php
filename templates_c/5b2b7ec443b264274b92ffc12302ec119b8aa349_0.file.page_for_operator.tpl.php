<?php
/* Smarty version 3.1.33, created on 2021-05-17 11:15:14
  from '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/page_for_operator.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_60a22612214d34_27582712',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5b2b7ec443b264274b92ffc12302ec119b8aa349' => 
    array (
      0 => '/home/d/d90587kw/d90587kw.beget.tech/public_html/templates/page_for_operator.tpl',
      1 => 1621239277,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60a22612214d34_27582712 (Smarty_Internal_Template $_smarty_tpl) {
?><section id="section1"> 
    <div class="block_2">
        <h2 class="on_center"></h2>
        <div class = "yellow_block">
            <table>
                <tr>
                    <th>Номер заявки</th>
                    <th>Время заявки</th>
                    <th>Откуда</th>
                    <th>Куда</th>
                    <th>Доп услуги</th>
                </tr>
            <?php echo $_smarty_tpl->tpl_vars['view_orders']->value;?>

            </table>
        </div>
    </div> 
    <div class="block_4" paddin-left="30">
        <h2 class="on_center"></h2>
        <p class="errs on_center"><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</p>
        <div class = "yellow_block">
            <form class="bt_on_center">
                <p>Номер заказа:</p>
                <p><?php echo $_smarty_tpl->tpl_vars['combo_num_orders']->value;?>
</p>   
                <p>Машина:</p>
                <p><select name='combo_cars' class='combobox'></select></p>
                <p><input type='textarea' name='time_wait' placeholder='Время ожидания'/></p>
                <p><input type='textarea' name='cost' placeholder='Стоимость поездки'/></p>
                <input type="submit" name="apply" value="Назначить"/>
            </form>
        </div>
    </div> 
</section>  <?php }
}
