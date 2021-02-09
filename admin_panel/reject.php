<?php
session_start();
require '../server/config.php';

if (isset($_SESSION['id'])) {
    print "<a href='$site_url/modules/themes.php'>Главная</a><br>";
    print "<a href='$site_url/server/logout.php'>Выйти из записи</a><br>
<a href='$site_url/admin_panel/admin.php'>Ожидает модерацию</a><br>
<a href='$site_url/admin_panel/accept.php'>Одобрено</a><br>
<a href='$site_url/admin_panel/users.php'>Пользователи</a>";
    $stmt = $pdo->prepare("SELECT * FROM users INNER JOIN themes ON users.id_user = themes.id_user AND themes.status = ?");
    $stmt->execute([2]);
    if ($stmt->rowCount() > 0) {
        print "<h1>Отклонённые темы:</h1>";
        while ($data = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo <<<HTML
<head>
<title>Тема</title>
</head>
<body>
<h1>${data['title']}</h1>
<p>${data['text']}</p>
<p>Создал: ${data['name']} ${data['surname']} ${data['date']}</p>
<p>id=${data['id_theme']}</p>

HTML;

        }

    } else {
        print"<p>Нет тем</p>";
    }
} else {
    header("Location:" . $site_url);
}
