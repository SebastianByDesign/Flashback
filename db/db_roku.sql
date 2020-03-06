-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 06, 2020 at 02:44 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_roku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arating`
--

CREATE TABLE `tbl_arating` (
  `arating_id` int(11) NOT NULL,
  `arating_name` varchar(125) NOT NULL,
  `arating_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_arating`
--

INSERT INTO `tbl_arating` (`arating_id`, `arating_name`, `arating_description`) VALUES
(1, 'G', 'General Audiences\nAll ages admitted. Nothing that would offend parents for viewing by children.'),
(2, 'PG', 'Parental Guidance Suggested \nSome material may not be suitable for children. Parents urged to give parental guidance.'),
(3, 'PG-13', 'Parents Strongly Cautioned\nSome material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.'),
(4, 'R', 'Restricted\nUnder 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them.'),
(5, 'NC-17', 'Adults Only\nNo One 17 and Under Admitted. Clearly adult. Children are not admitted.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cast`
--

CREATE TABLE `tbl_cast` (
  `cast_id` int(11) NOT NULL,
  `cast_fname` varchar(50) NOT NULL DEFAULT 'John',
  `cast_lname` varchar(50) NOT NULL DEFAULT 'Doe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cast`
--

INSERT INTO `tbl_cast` (`cast_id`, `cast_fname`, `cast_lname`) VALUES
(1, 'Sterling', 'Hayden'),
(2, 'Louis', 'Calhern'),
(3, 'Jean', 'Hagen'),
(4, 'James', 'Whitmore'),
(5, 'Gregory', 'Peck'),
(6, 'Helen', 'Westcott'),
(7, 'Millard', 'Mitchell'),
(8, 'Jean', 'Parker');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_directors`
--

CREATE TABLE `tbl_directors` (
  `director_id` int(11) NOT NULL,
  `director_fname` varchar(50) NOT NULL,
  `director_lname` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_directors`
--

INSERT INTO `tbl_directors` (`director_id`, `director_fname`, `director_lname`) VALUES
(1, 'John', 'Huston'),
(2, 'Henry', 'King');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genres`
--

CREATE TABLE `tbl_genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genres`
--

INSERT INTO `tbl_genres` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Crime'),
(5, 'Drama'),
(6, 'Historical'),
(7, 'Horror'),
(8, 'Musical'),
(9, 'Sci-Fi'),
(10, 'War'),
(11, 'Western'),
(12, 'Animation'),
(13, 'Family'),
(14, 'Fantasy'),
(15, 'Romance'),
(16, 'Film-Noir');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movie_id` int(11) NOT NULL,
  `movie_cover` varchar(75) NOT NULL DEFAULT 'cover.jpg',
  `movie_title` varchar(125) NOT NULL,
  `movie_year` varchar(5) NOT NULL,
  `movie_runtime` varchar(25) NOT NULL,
  `movie_synopsis` text NOT NULL,
  `movie_trailer` varchar(75) NOT NULL DEFAULT 'trailer.mp4',
  `movie_release` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movie_id`, `movie_cover`, `movie_title`, `movie_year`, `movie_runtime`, `movie_synopsis`, `movie_trailer`, `movie_release`) VALUES
(1, 'asphalt_jungle.jpg', 'The Asphalt Jungle', '1950', '1h 52min', 'A major heist goes off as planned until bad luck and double crosses cause everything to unravel.', 'asphalt_jungle.mp4', 'June 1, 1950'),
(2, 'gunfighter.jpg', 'The Gunfighter', '1950', '1h 25min', 'Notorious gunfighter Jimmy Ringo rides into town to find his true love, who doesn\'t want to see him. He hasn\'t come looking for trouble, but trouble finds him around every corner.', 'gunfighter.mp4', 'June 23, 1950');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_arating`
--

CREATE TABLE `tbl_mov_arating` (
  `movie_id` int(11) NOT NULL,
  `arating_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_arating`
--

INSERT INTO `tbl_mov_arating` (`movie_id`, `arating_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_cast`
--

CREATE TABLE `tbl_mov_cast` (
  `movie_id` int(11) NOT NULL,
  `cast_id` int(11) NOT NULL,
  `cast_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_cast`
--

INSERT INTO `tbl_mov_cast` (`movie_id`, `cast_id`, `cast_role`) VALUES
(1, 1, 'Dix Handley'),
(1, 2, 'Alonzo D. Emmerich'),
(1, 3, 'Doll Conovan'),
(1, 4, 'Gus Minissi'),
(2, 5, 'Jimmy Ringo'),
(2, 6, 'Peggy Walsh'),
(2, 7, 'Marshal Mark Strett'),
(2, 8, 'Molly');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_director`
--

CREATE TABLE `tbl_mov_director` (
  `movie_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_director`
--

INSERT INTO `tbl_mov_director` (`movie_id`, `director_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mov_genre`
--

CREATE TABLE `tbl_mov_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mov_genre`
--

INSERT INTO `tbl_mov_genre` (`movie_id`, `genre_id`) VALUES
(1, 4),
(1, 5),
(1, 16),
(2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_urating`
--

CREATE TABLE `tbl_urating` (
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_stars` int(11) NOT NULL,
  `num_uratings` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(50) NOT NULL,
  `user_lname` varchar(50) NOT NULL,
  `user_uname` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_arating`
--
ALTER TABLE `tbl_arating`
  ADD PRIMARY KEY (`arating_id`);

--
-- Indexes for table `tbl_cast`
--
ALTER TABLE `tbl_cast`
  ADD PRIMARY KEY (`cast_id`);

--
-- Indexes for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `tbl_genres`
--
ALTER TABLE `tbl_genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_arating`
--
ALTER TABLE `tbl_arating`
  MODIFY `arating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cast`
--
ALTER TABLE `tbl_cast`
  MODIFY `cast_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_genres`
--
ALTER TABLE `tbl_genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
