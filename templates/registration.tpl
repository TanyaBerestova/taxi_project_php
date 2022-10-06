<section id="auth">
<div class="block">
    <h1 class="on_center">{$zagolovok}</h1>
    <p class="errs on_center">{$err}</p>
<form method="GET" class = "yellow_block">
    <p><input type="text" name="name" placeholder = "Имя" value="{$_name}"/></p>
    <p><input type="text" name="last_name" placeholder = "Фамилия" value="{$last_name}"/></p>
    <p><input type="text" name="patronymic" placeholder = "Отчество" value="{$patronymic}"/></p>
    <p><input type="text" name="phone" placeholder = "Телефон" value="{$phone}"/></p>
    <p><input type="text" name="mail" placeholder = "Почта" value="{$mail}"/></p>
    <p><input type="text" name="login" placeholder = "Логин" value="{$login}"/></p>
    <p><input type="password" name="password" placeholder = "Пароль" value="{$password}"/></p>
    <p><input type="password" name="password_repeat" placeholder = "Повторите пароль" value="{$password_repeat}"></p>
    <input type="submit" name="check_in" value="Зарегистрироваться"/> 
    <p class="on_center">Уже есть аккаунт? - <a href="authorization.php">Войдите</a></p>
</form>
</div> 
</section>

