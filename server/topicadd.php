<?php
session_start();
require 'config.php';
if (isset($_SESSION['id'])) {
    if (isset($_POST['sub'])) {
        $title = ucfirst($_POST['title']);
        $text = $_POST['text'];
        $id_section = $_POST['id'];
        $user_id = $_SESSION['id'];
        $today = date("Y-m-d H:i:s");
        if (!empty($title) & !empty($text)) {
            $stmt = $pdo->prepare("INSERT INTO `themes` (`id_user`,`id_section`,`title`,`text`,`date`,`status`) VALUES (?, ?, ?, ?, ?, 0)");
            $stmt->execute([$user_id, $id_section, $title, $text, $today]);
            if ($stmt) {
                header("Location:" . $site_url . "/modules/themeadd.php?done=done&id=$id_section");
            } else {
                header("Location:" . $site_url . "/modules/themeadd.php?errors=true&id=$id_section");
            }
        } else {
            header("Location:" . $site_url . "/modules/themeadd.php?errors=true&id=$id_section");
        }
    } else {
        header("Location:" . $site_url);
    }
} else {
    header("Location:" . $site_url);
}