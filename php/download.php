<?php
include './../config.php';
    $info = $connect->query("CALL proc_all_info()");
    $str = "";
    while ($r = $info->fetch(PDO::FETCH_OBJ)){
        $str .= "Заказ №".$r->id."\nПассажир: ".$r->person."\nВодитель: ".$r->driver.
        "\nМашина: ".$r->car."\nОткуда: ".$r->address_from."\nКуда: ".$r->address_to.
        "\nДата поездки: ".$r->order_date."\nСтоимость: ".$r->cost."\nДополнительные услуги: ".
        $r->services."\nСтатус поездки: ".$r->description."\n\n";
    }
    $handler = fopen("../txt/taxi_orders.txt", "w");
    fwrite($handler, $str);
    fclose($handler);
    $file = '../txt/taxi_orders.txt';
    $filename = 'taxi_orders.txt';
 
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: public");
header("Content-Description: File Transfer");
header("Content-Disposition: attachment; filename=\"{$filename}\"");
header("Content-Transfer-Encoding: binary");
header("Content-Length: " . $filesize);
readfile($file);
    ?>