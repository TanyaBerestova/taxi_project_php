<section id="section1"> 
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
            {$view_orders}
            </table>
        </div>
    </div> 
    <div class="block_4" paddin-left="30">
        <h2 class="on_center"></h2>
        <p class="errs on_center">{$err}</p>
        <div class = "yellow_block">
            <form class="bt_on_center">
                <p>Номер заказа:</p>
                <p>{$combo_num_orders}</p>   
                <p>Машина:</p>
                <p><select name='combo_cars' class='combobox'></select></p>
                <p><input type='textarea' name='time_wait' placeholder='Время ожидания'/></p>
                <p><input type='textarea' name='cost' placeholder='Стоимость поездки'/></p>
                <input type="submit" name="apply" value="Назначить"/>
            </form>
        </div>
    </div> 
</section>  