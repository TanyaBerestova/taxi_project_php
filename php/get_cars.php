<?php
include './../config.php';
if (isset($_GET['svalue'])){
    $sql_param = "CALL proc_get_car_for_order(".$_GET['svalue'].")";
    $query = $connect->query($sql_param);
    $combo_cars = [];
    while($r = $query ->fetch(PDO::FETCH_OBJ)){
        $combo_cars[$r->id] = $r->car;
    }
    echo json_encode($combo_cars);
}
?>
