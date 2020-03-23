-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 23, 2020 at 06:17 PM
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
(8, 'Jean', 'Parker'),
(9, 'Frank', 'Lovejoy'),
(10, 'Kathleen', 'Ryan'),
(11, 'Richard', 'Carlson'),
(12, 'Lloyd', 'Bridges'),
(13, 'William', 'Holden'),
(14, 'Gloria', 'Swanson'),
(15, 'Erich', 'von Stroheim'),
(16, 'Nancy', 'Olsen'),
(17, 'Joan', 'Crawford'),
(18, 'David', 'Brian'),
(19, 'Steve', 'Cochran'),
(20, 'Kent', 'Smith'),
(21, 'Bobby', 'Driscoll'),
(22, 'Robert', 'Newton'),
(23, 'Basil', 'Sydney'),
(24, 'Walter', 'Fitzgerald'),
(25, 'Keir', 'Dullea'),
(26, 'Gary', 'Lockwood'),
(27, 'William', 'Sylvester'),
(28, 'Daniel', 'Richter'),
(29, 'Anthony', 'Perkins'),
(30, 'Janet', 'Leigh'),
(31, 'Vera', 'Miles'),
(32, 'John', 'Gavin'),
(33, 'Eli', 'Wallach'),
(34, 'Clint', 'Eastwood'),
(35, 'Lee', 'Van Cleef'),
(36, 'Aldo', 'Giuffré'),
(37, 'Peter', 'O\'Toole'),
(38, 'Alec', 'Guinness'),
(39, 'Anthony', 'Quinn'),
(40, 'Jack', 'Hawkins'),
(41, 'Claudia', 'Cardinale'),
(42, 'Henry', 'Fonda'),
(43, 'Jason', 'Robards'),
(44, 'Charles', 'Bronson'),
(45, 'Julie', 'Andrews'),
(46, 'Christopher', 'Plummer'),
(47, 'Eleanor', 'Parker'),
(48, 'Richard', 'Haydn');

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
(2, 'Henry', 'King'),
(3, 'Cyril', 'Endfield'),
(4, 'Billy', 'Wilder'),
(5, 'Vincent', 'Sheman'),
(6, 'Byron', 'Haskin'),
(7, 'Stanley', 'Kubrick'),
(8, 'Alfred', 'Hitchcock'),
(9, 'Sergio', 'Leone'),
(10, 'David', 'Lean'),
(11, 'Robert', 'Wise');

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
(16, 'Film-Noir'),
(17, 'Mystery'),
(18, 'Thriller'),
(19, 'Biography');

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
(2, 'gunfighter.jpg', 'The Gunfighter', '1950', '1h 25min', 'Notorious gunfighter Jimmy Ringo rides into town to find his true love, who doesn\'t want to see him. He hasn\'t come looking for trouble, but trouble finds him around every corner.', 'gunfighter.mp4', 'June 23, 1950'),
(3, 'sound_fury.jpg', 'The Sound of Fury', '1950', '1hr 31min', 'A man who is down on his luck falls in with a criminal.', 'sound_fury.mp4', 'May 5, 1951'),
(4, 'sunset_blvd.jpg', 'Sunset Boulevard', '1950', '1h 50min', 'A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.', 'sunset_blvd.mp4', 'August 10, 1950'),
(5, 'damned_cry.jpg', 'The Damned Don\'t Cry', '1950', '1h 43min', 'A New York socialite climbs the ladder of success man by man until a life among rich gangsters gives her what she thought she always wanted.', 'damned_cry.mp4', 'May 13, 1950'),
(6, 'treasure_island.jpg', 'Treasure Island', '1950', '1h 36min', 'The treasure-seeking adventures of young Jim Hawkins and pirate captain Long John Silver.', 'treasure_island.mp4', 'July 19, 1950'),
(7, '2001_odyssey.jpg', '2001: A Space Odyssey', '1968', '2h 29min', 'After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.', '2001_odyssey.mp4', 'April 3, 1968'),
(8, 'psycho.jpg', 'Psycho', '1960', '1h 49min', 'A Phoenix secretary embezzles forty thousand dollars from her employer\'s client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.', 'psycho.mp4', 'June 22, 1960'),
(9, 'good_ugly.jpg', 'The Good, the Bad and the Ugly', '1966', '2h 28min', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 'good_ugly.mp4', 'December 29, 1967'),
(10, 'lawrence_arabia.jpg', 'Lawrence of Arabia', '1962', '3h 48min', 'The story of T.E. Lawrence, the English officer who successfully united and led the diverse, often warring, Arab tribes during World War I in order to fight the Turks.', 'lawrence_arabia.mp4', 'December 16, 1962'),
(11, 'once_west.jpg', 'Once Upon a Time in the West', '1968', '2h 45min', 'A mysterious stranger with a harmonica joins forces with a notorious desperado to protect a beautiful widow from a ruthless assassin working for the railroad.', 'once_west.mp4', 'July 4, 1969'),
(12, 'sound_music.jpg', 'The Sound of Music', '1965', '2h 52min', 'A woman leaves an Austrian convent to become a governess to the children of a Naval officer widower.', 'sound_music.mp4', 'March 2, 1965');

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
(2, 2),
(3, 2),
(4, 2),
(5, 5),
(6, 2),
(7, 2),
(8, 4),
(9, 4),
(10, 2),
(11, 3),
(12, 1);

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
(2, 8, 'Molly'),
(3, 9, 'Howard Tyler'),
(3, 10, 'Judy Tyler'),
(3, 11, 'Gil Stanton'),
(3, 12, 'Jerry Slocum'),
(4, 13, 'Joe Gills'),
(4, 14, 'Norma Desmond'),
(4, 15, 'Max Von Mayerling'),
(4, 16, 'Betty Schaefer'),
(5, 17, 'Ethel Whitehead'),
(5, 18, 'George Castleman'),
(5, 19, 'Nick Prenta'),
(5, 20, 'Martin Blackford'),
(6, 21, 'Jim Hawkins'),
(6, 22, 'Long John Silver'),
(6, 23, 'Captain Smollett'),
(6, 24, 'Squire Trelawney'),
(7, 25, 'Dr. Dave Bowman'),
(7, 26, 'Dr. Frank Poole'),
(7, 27, 'Dr. Heywood R. Floyd'),
(7, 28, 'Moon-Watcher'),
(8, 29, 'Norman Bates'),
(8, 30, 'Lila Crane'),
(8, 31, 'Sam Loomis'),
(8, 32, 'Marion Crane'),
(9, 33, 'Tuco'),
(9, 34, 'Blondie'),
(9, 35, 'Sentenza'),
(9, 36, 'Alcoholic Union Captain'),
(10, 37, 'T.E. Lawrence'),
(10, 38, 'Prince Faisal'),
(10, 39, 'Auda Abu Tayi'),
(10, 40, 'General Allenby'),
(11, 41, 'Jill McBain'),
(11, 42, 'Frank'),
(11, 43, 'Manuel \'Cheyenne\' Gutiérrez'),
(11, 44, 'Harmonica'),
(12, 45, 'Maria'),
(12, 46, 'Captain Von Trapp'),
(12, 47, 'The Baroness'),
(12, 48, 'Max Detweiler');

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
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 9),
(12, 11);

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
(2, 11),
(3, 4),
(3, 5),
(3, 16),
(4, 5),
(4, 16),
(5, 4),
(5, 5),
(5, 16),
(6, 2),
(6, 13),
(7, 2),
(7, 9),
(8, 7),
(8, 17),
(8, 18),
(9, 11),
(10, 2),
(10, 5),
(10, 19),
(11, 11),
(12, 5),
(12, 13),
(12, 19);

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
  MODIFY `cast_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_genres`
--
ALTER TABLE `tbl_genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
