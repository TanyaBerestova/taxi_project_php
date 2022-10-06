<?php
include './../config.php';
require_once '../jpgraph/src/jpgraph.php';
require_once '../jpgraph/src/jpgraph_pie.php';
$sql = "SELECT cc.class_name AS 'car', COUNT(u.id) AS 'count' FROM user_order u RIGHT JOIN class_car cc ON u.class_car=cc.id GROUP BY cc.id";
    $query = $connect->query($sql);
    $arr = [];
     while($r = $query->fetch(PDO::FETCH_OBJ)){
        $arr[$r->car] = $r->count;
    }
    $data = array_values($arr);
    $lbl = array_keys($arr);

$graph = new PieGraph(400,400);

$graph->title->Set("Выбор пользователей");
$graph->legend->SetFillColor('#fefbf4');
$p1 = new PiePlot($data);
$p1->SetSize(0.35);
$p1->SetLegends($lbl);
$p1->SetCenter(0.4);
$p1->SetLabelPos(0.6);
$p1->SetLabelType (PIE_VALUE_ADJPERCENTAGE);

$graph->Add($p1);
$graph->SetMargin(1,1,40,1);
$graph->SetMarginColor('#fefbf4');
$graph->SetShadow(false);

$p1->ShowBorder();
$p1->SetColor('black');
$p1->SetSliceColors(array('#fbc605','#e66327','#ba69b9','#11a4cd','#91be1c', '#009687'));
$graph->Stroke();
?>