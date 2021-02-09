-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 09 2021 г., 09:45
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `forum`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id_theme` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id_theme`, `id_comment`, `id_user`, `comment_text`, `date`) VALUES
(36, 18, 5, 'ffff', '2021-01-28 02:16:01'),
(36, 22, 6, 'n', '2021-02-08 21:57:37'),
(39, 23, 6, 'gjgj', '2021-02-08 21:59:46'),
(41, 24, 5, 'fhfhhf', '2021-02-08 22:48:27');

-- --------------------------------------------------------

--
-- Структура таблицы `themes`
--

CREATE TABLE `themes` (
  `id_theme` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `themes`
--

INSERT INTO `themes` (`id_theme`, `id_user`, `title`, `text`, `date`, `status`) VALUES
(35, 8, '2', '2', '2021-01-28 00:48:03', 2),
(36, 8, '3', '3', '2021-01-28 00:48:06', 1),
(37, 5, '4', '4444', '2021-01-28 01:25:12', 1),
(38, 5, 'Fff', 'fffff', '2021-01-28 02:16:16', 2),
(39, 6, 'Dsgsdgsd', 'gsdgsdgsdg', '2021-02-08 21:44:31', 1),
(40, 5, 'Asfafasf', 'asf', '2021-02-08 22:16:13', 1),
(41, 5, 'Ggg', 'ggg', '2021-02-08 22:31:29', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `date_reg` datetime NOT NULL,
  `permission` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `password`, `email`, `name`, `surname`, `date_reg`, `permission`) VALUES
(5, '$2y$10$NXnV.xr9eoLlcUq29Y9F8evMO1HnbOnKIFIn6zl.vvY0lCrEa5b3.', 'admin@mail.ru', 'admin', 'admin', '2021-01-19 12:25:59', 0),
(6, '$2y$10$dFs17e75HChBtCwyRVk8t.J9szbEJeHaO.8S56Q4.n/ICnlx9epYC', '123@mail.ru', 'Саша', 'Иванов', '2021-01-25 17:24:41', 1),
(7, '$2y$10$6LvIVoYM9147jw2XC2z4/OnOmdPROGCneFDd6CP0WHxNQOo8h7q/q', 'ban@mail.ru', 'ban', 'ban', '2021-01-26 00:54:32', 2),
(8, '$2y$10$mnzndWwFnER0JCPgqLvGv.jsNwxqQLkL27ppyiWM.N8nNLXgGC2B.', 'test1@mail.ru', 'test1', 'test1', '2021-01-28 00:47:41', 2),
(9, '$2y$10$LRGG0fj6HM2Q8AW/Z8FOCesxnV0ONGeBs7gugqVjJFWWu/1S7ZRnW', '1234@mail.ru', '123', '123', '2021-02-08 19:00:19', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_theme` (`id_theme`);

--
-- Индексы таблицы `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id_theme`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `themes`
--
ALTER TABLE `themes`
  MODIFY `id_theme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_theme`) REFERENCES `themes` (`id_theme`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `themes`
--
ALTER TABLE `themes`
  ADD CONSTRAINT `themes_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
