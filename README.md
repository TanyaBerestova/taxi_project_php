<h1>Проект "Такси" на php</h1>

<h2>Запуск проекта</h2>
<p>Необходимо распаковать папку sysplagins в папке libs.</p>
<p>Для работы проекта необходимо скачать библиотеки jpgraph и phpmailer и поместить их в корневую папку.</p>
<p>В файле config задайте параметры подключения к базе данных (полную резервную копию бд с готовыми функциями, представлениями и процедурами можно найти в папке "BD_taxi").</p>

<h2>Разделение ролей</h2>
<p>При авторизации ваша роль определяется как обычный пользователь, который может заказать такси.</p>

<p>Операторов, водителей и машины в автопарк может добавлять только пользователь с ролью "админ".</p>

<p>Пользователи с ролью "водитель" в начале каждого дня выбирают машину из таксопарка, на которой будет работать, а затем ожидают назначение заказов.</p>

<p>Пользователи с ролью "оператор" видит таблицу заказов такси с временем заявки, местом отправления и местом прибытия, а также дополнительными услугами, которые запрашивает пассажир. Оператор назначает каждому заказу машину, указывая стоимость поездки и время ожидания.</p>

