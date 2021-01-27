<?php
session_start();
require "../server/config.php";

if (isset($_SESSION['id'])) {
    print "<a href='$site_url/modules/home.php'>Главная</a><br>";
    if ($_SESSION['id'] == 5) {
        print "<a href='$site_url/admin_panel/admin.php'>Админ панель<a><br>";
    } else {
        print "<a href='$site_url/modules/person.php'>Личный кабинет<a><br>";
    }
    if (isset($_GET['id']) & is_numeric($_GET['id'])) {
        print "<a href='$site_url/server/logout.php'>Выйти из записи<br></a>";
        $id = $_GET['id'];
        $stmt = $pdo->prepare("SELECT n.*, COALESCE(cnt, 0) as cmtcnt
                                       FROM themes n
                                       LEFT JOIN
                                      (SELECT id_theme, COUNT(id_comment) as cnt
                                       FROM comments
                                       GROUP BY id_theme) as ct
                                       ON n.id_theme = ct.id_theme
                                       WHERE n.status=?
                                       AND n.id_section=?");
        $stmt->execute([1, $id]);
        if ($stmt->rowCount() > 0) {
            print "<h1>Темы:</h1>";
            while ($data = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $text = mb_substr($data['text'], 0, 10);
                echo <<<HTML
<head>
<title>Темы</title>
</head>
<body>
<a href="${site_url}/modules/themeshow.php?id=${data['id_theme']}"><h2>${data['title']}</h2>${text}</a><br>
<p>Колличество комментариев: ${data['cmtcnt']}</p>
</body> 

HTML;
            }
            print "<br><a href='$site_url/modules/themeadd.php?id=$id'>Добавить</a>";
        } else {
            print "Нет тем <a href='$site_url/modules/themeadd.php?id=${_GET['id']}'>Создать</a><br>";
        }
    } else {
        header("Location:" . $site_url);
    }
} else {
    header("Location:" . $site_url);
}
