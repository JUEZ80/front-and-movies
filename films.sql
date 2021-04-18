-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2021 a las 04:13:30
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `films`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gender`
--

INSERT INTO `gender` (`gender_id`, `name`) VALUES
(1, 'Acción'),
(2, 'Aventura'),
(3, 'Comedia'),
(4, 'Terror'),
(5, 'Animado'),
(6, 'Suspenso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `create_at` datetime NOT NULL,
  `release_date` date DEFAULT NULL,
  `actors` varchar(500) DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`movie_id`, `name`, `description`, `image`, `create_at`, `release_date`, `actors`, `gender_id`, `rating`) VALUES
(7, 'La Liga de la Justicia de Zack Snyder', 'La versión definitiva de Zack Snyder de la Liga de la Justicia. ', 'https://cuevana2espanol.com/wp-content/uploads/2021/03/pI25ennflmJ1R9q7ZTI681f0WBb-185x278.jpg', '2021-04-17 20:51:41', '2021-03-18', 'Ben Affleck, Gal Gadot, Henry Cavill, Jason Momoa, Ray Fisher', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`profile_id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `create_at` datetime NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `create_at`, `profile_id`) VALUES
(1, 'Julio Estrada', 'julio.estrada@est.iudigital.edu.co', '555555', '2021-03-10 21:38:35', 1),
(2, 'Adriana Aguilar', 'adriana.a@iudigital.edu.co', '123456', '2021-03-10 21:39:50', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indices de la tabla `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `profile_id` (`profile_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
