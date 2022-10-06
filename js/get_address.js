ymaps.ready(init);
function init() {
    geocode();
}
function geocode() {
    var request1 = document.getElementById("address_from").textContent.split(": ");
    var request2 = document.getElementById("address_to").textContent.split(": ");
    ymaps.geocode(request1).then(function (res1) {
        var obj1 = res1.geoObjects.get(0);
        var ob1 = {
            'administrative_area_from':obj1.getAdministrativeAreas()[0],
            'city_from':obj1.getLocalities()[0],
            'street_from':obj1.getThoroughfare(),
            'house_num_from':obj1.getPremiseNumber()
        }
        ymaps.geocode(request2).then(function (res2) {
            var obj2 = res2.geoObjects.get(0);
            var ob2 = {
                'administrative_area_to':obj2.getAdministrativeAreas()[0],
                'city_to':obj2.getLocalities()[0],
                'street_to':obj2.getThoroughfare(),
                'house_num_to':obj2.getPremiseNumber()
            }
            var ob = {};
            $.extend(ob, ob1, ob2);
            $.ajax({
                type:'GET',
                url:'about_order.php',
                dataType:'json',
                data:"param="+JSON.stringify(ob),
                success:function() {
                    console.log("success");
                }
            }); 
        });
    });
}