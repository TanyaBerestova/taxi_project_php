ymaps.ready(init);

function init() {
    var geolocation = ymaps.geolocation,
        myMap = new ymaps.Map('map', {
            center: [55, 34],
            zoom: 10
        }, {
            searchControlProvider: 'yandex#search'
        });

    // Сравним положение, вычисленное по ip пользователя и
    // положение, вычисленное средствами браузера.
//    geolocation.get({
//        provider: 'yandex',
//        mapStateAutoApply: true
//    }).then(function (result) {
//        // Красным цветом пометим положение, вычисленное через ip.
//        result.geoObjects.options.set('preset', 'islands#redCircleIcon');
//        result.geoObjects.get(0).properties.set({
//            balloonContentBody: 'Мое местоположение'
//        });
//        //myMap.geoObjects.add(result.geoObjects);
//    });

    geolocation.get({
        provider: 'browser',
        mapStateAutoApply: true
    }).then(function (result) {
        // Синим цветом пометим положение, полученное через браузер.
        // Если браузер не поддерживает эту функциональность, метка не будет добавлена на карту.
        result.geoObjects.options.set('preset', 'islands#blueCircleIcon');
        result.geoObjects.get(0).properties.set({
            balloonContentBody: 'Мое местоположение'
        });
        myMap.geoObjects.add(result.geoObjects);
    });
    
    // Подключаем поисковые подсказки к полю ввода.
    var suggestView1 = new ymaps.SuggestView('suggest1', { provider: {
        suggest:(function(request, options){
            return ymaps.suggest("Россия, " + request);
        })
    }}), map, placemark;
    var suggestView2 = new ymaps.SuggestView('suggest2', { provider: {
        suggest:(function(request, options){
            return ymaps.suggest("Россия, " + request);
        })
    }}), map, placemark;
        geocode();

    function geocode() {
        // Забираем запрос из поля ввода.
        var request1 = $('#suggest1').val();
        var request2 = $('#suggest2').val();

        // Геокодируем введённые данные.
        ymaps.geocode(request1).then(function (res) {
            var obj = res.geoObjects.get(0);
            if(obj.properties.get('metaDataProperty.GeocoderMetaData.kind') != "house"){
                err.innerHTML = "Неполный адрес, необходимо указать номер дома!";
            }
            res.geoObjects.options.set('preset', 'islands#greenCircleIcon');
            obj.properties.set({
                balloonContentBody: 'Откуда'
            });
            myMap.geoObjects.add(res.geoObjects);
        });
        ymaps.geocode(request2).then(function (res) {
            var obj = res.geoObjects.get(0);
            if(obj.properties.get('metaDataProperty.GeocoderMetaData.kind') != "house"){
                err = document.getElementById("err");
                err.innerHTML = "Неполный адрес, необходимо указать номер дома!";
            }
            res.geoObjects.options.set('preset', 'islands#redCircleIcon');
            obj.properties.set({
                balloonContentBody: 'Куда'
            });
            myMap.geoObjects.add(res.geoObjects);
        });
    }
}

