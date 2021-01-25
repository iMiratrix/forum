<?php
session_start();
require '../server/config.php';

if (!isset($_SESSION['id'])) {
    echo <<<HTML
<head>
<title>Регистрация</title>
</head>
<body>
<form action="${site_url}/server/reg.php" method="post">
<input type="email" name="email" placeholder="email">
<input type="text" name="name" placeholder="Имя">
<input type="text" name="surname" placeholder="Фамилия">
<input type="password" name="password" placeholder="password">
<input type="submit" name="sub" value="enter">
</form>
<a href="${site_url}/modules/auth.php">Авторизация</a>
</body>
HTML;
} else {
    header("Location:" . $site_url);
}
