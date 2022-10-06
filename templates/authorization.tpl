<section id="auth">
<div class="block">
    <h1 class="on_center">{$zagolovok}</h1>
    <p class="errs on_center">{$err}</p>
        <form method="POST" class = "yellow_block">
            <p><input type="text" name="input_login" placeholder = "Логин" value="{$login}"></p>
            <p><input type="password" name="input_password" placeholder = "Пароль"></p>
            <input type="submit" name="input" value="Войти"/> 
            <p class="on_center">Еще нет аккаунта? - <a href="registration.php">Зарегистрируйся</a></p>
        </form>
</div> 
</section>