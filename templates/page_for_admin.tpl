<section id="two_columns">
    <div class="block">
        <h2 class="on_center">{$zagolovok}</h2>
        <p></p>
        <form method="GET" class = "bt_on_center">
            <p class = "bt_on_center">{$combo_act}</p>
            <p class = "bt_on_center">{$combo_empl}</p>
            <input type="submit" name="choose_act" value="OK""/>
            <image src="php/round_diagram.php" height="500"/>
            <input type="submit" name="download" value="Загрузить отчет поездок за неделю">
        </form>
        
    </div> 
    {if !$hidden_elems}
    <div class="block_2" id="appear_info">
        <h2 class="on_center">{$act_name} {$obj_name}</h2>
        <p class="errs on_center">{$err}</p>
        <form method="GET" class = "yellow_block">
            {if $act == 1 && ($object == 1 || $object == 2)}
                 {include file='add_people.tpl'}
            {else if $act == 1 && $object == 3}
                <p><input type="text" name="num" placeholder = "Номер машины"/></p>
                <p><input type="text" name="vin" placeholder = "VIN"/></p>
                <p>{$combo_brand}</p>
                <p>{$combo_color}</p>
                <p>{$combo_type_car}</p>
                <p>{$combo_class_car}</p>
                <div class="add_serv">Дополнительные услуги: {$checkbox_services}</div>
            {else if $act == 2 && $object == 1}
                <p>Выберите сотрудника: {$combo_operators}</p>
            {else if $act == 2 && $object == 2}
                <p>Выберите сотрудника: {$combo_drivers}</p>
            {else if $act == 2 && $object == 3}
                <p>Выберите машину: {$combo_cars}</p>
            {else if $act == 3 && $object == 1}
            {else if $act == 3 && $object == 2}
            {else if $act == 3 && $object == 3}
            {/if}
            <div class="bt_on_center">
                <input type="submit" name="apply" value="{$act_name}"/>
            </div>
        </form>
    </div> 
    {/if}
</section>    
