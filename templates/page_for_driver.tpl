<section id="auth"> 
    <div class="block_2">
        <h2 class="on_center"></h2>
        <p class="errs on_center">{$err}</p>
        <form method="GET" class = "yellow_block">
            {if $is_choosen}
            <div class="bt_on_center">
                <p>Ваша машина - {$your_car}</p>
                {if $is_order_exist}
                <p><b>Номер заявки:</b> {$order_id}<p>
                <p><b>Время заявки:</b> {$order_time}<p>
                <p><b>Откуда:</b> {$from}<p>
                <p><b>Куда:</b> {$to}<p>
                <p><b>Доп услуги:</b> {$services}<p>
                {if !$is_ride_begin}
                <p>Нажмите на кнопку, когда приедите к месту назначения</p>
                <input type="submit" name="wait_user" value="Я приехал"/>
                {else}
                    <p>Нажмите на кнопку, когда закончите поездку</p>
                    <input type="submit" name="end_ride" value="Заказ выполнен"/>
                {/if}
            </div>     
                {else}
                <p>Ожидайте заказы...</p>
                {/if}
            {else}
                <p>Выберите машину, на которой сегодня работаете: {$combo_free_cars}</p>
		<div class="bt_on_center">
                <input type="submit" name="choose" value="Выбрать"/>
                </div>
            {/if}
        </form>
    </div> 
</section>  