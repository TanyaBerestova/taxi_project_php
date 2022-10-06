<section id="map_and_order">
    <div class="block" id="block_order">
        <h1 class="on_center">{$zagolovok}</h1>
        <p class="errs on_center" id="err">{$err}</p>
        <form method="GET" class = "yellow_block">
            <p><input class="bt_address" name="address_from" id="suggest1" type="text" placeholder = "Откуда" value="{$address_from}"/></p>
            <p><input class="bt_address" name="address_to" id="suggest2" type="text" placeholder = "Куда" value="{$address_to}"/></p>
            <p>{$combo1}</p>
            <div class="add_serv">Дополнительные услуги: {$checkbox1}</div>
            <input type="submit" name="order" id="bt_order" value="Заказать"/> 
        </form>
    </div> 
    <div class="col-2">
        <div id="map" class="panel-map"></div>
    </div>
</section>            