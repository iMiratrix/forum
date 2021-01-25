<?php
session_start();
require '../server/config.php';

if (!isset($_SESSION['id'])) {
    echo <<<HTML
<head>
<title>Авторизация</title>
</head>
<body>
<form action="${site_url}/server/auth.php" method="post">
<input type="text" name="email" placeholder="email">
<input type="password" name="password" placeholder="password">
<input type="submit" name="sub" value="enter">
</form>
</body>
<a href="${site_url}/modules/reg.php">Регистрация</a>
HTML;
} else {
    header("Location:" . $site_url);
}