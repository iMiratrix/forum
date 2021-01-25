<?php
session_start();
require 'config.php';

if (!isset($_SESSION['id'])) {

    if (isset($_POST['sub'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];

        $sql = 'SELECT * FROM `users`  WHERE `email` = ?';
        $params = [$email];
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        if ($stmt->rowCount() > 0) {
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            if (password_verify($password, $user['password'])) {
                if ($user['permission'] != 2) {
                    $_SESSION['id'] = $user['id_user'];
                    header("Location:" . $site_url);
                } else {
                    print("Вы заблокированы<br><a href='${site_url}'>Назад</a>");
                }
            } else {
                print("Неверный логин или пароль<br><a href='${site_url}'>Назад</a>");
            }
        } else {
            print("Неверный логин или пароль<br><a href='${site_url}'>Назад</a>");
        }

    }
} else {
    header("Location:" . $site_url);
}


