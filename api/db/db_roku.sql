-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 12, 2020 at 08:27 AM
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
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`ID`, `fname`, `lname`, `username`, `pass`, `email`, `date`, `ip`) VALUES
(1, 'Admin', 'Istrator', 'admin', 'admin', 'admin@sportchek.com', '2020-04-06 03:34:00', '::1'),
(3, 'Walter', 'Carrera', 'c_walter', 'admin', 'walter@sportchek.com', '2020-04-06 03:42:29', 'no');

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
(48, 'Richard', 'Haydn'),
(49, 'Robert', 'De Niro'),
(50, 'Jodie', 'Foster'),
(51, 'Peter', 'Boyle'),
(52, 'Albert', 'Brooks'),
(53, 'Harvey', 'Keitel'),
(54, 'David', 'Proval'),
(55, 'Amy', 'Robinson'),
(56, 'Kris', 'Kristofferson'),
(57, 'Ellen', 'Burstyn'),
(58, 'Jack', 'Nicholson'),
(59, 'Karen', 'Black'),
(60, 'Billy', 'Bush'),
(61, 'Fannie', 'Flagg'),
(62, 'Cary', 'Elwes'),
(63, 'Mandy', 'Patinkin'),
(64, 'Chris', 'Sarandon'),
(65, 'Christopher', 'Guest'),
(66, 'Cathy', 'Moriarty'),
(67, 'Joe', 'Pesci'),
(68, 'Frank', 'Vincent'),
(69, 'Dee', 'Wallace'),
(70, 'Henry', 'Thomas'),
(71, 'Peter', 'Coyote'),
(72, 'Drew', 'Barrymore'),
(73, 'Harrison', 'Ford'),
(74, 'Karen', 'Allen'),
(75, 'Paul', 'Freeman'),
(76, 'Ronald', 'Lacey'),
(77, 'Murray', 'Abraham'),
(78, 'Tom', 'Hulce'),
(79, 'Elizabeth', 'Berridge'),
(80, 'Roy', 'Dotrice'),
(81, 'Charlie', 'Sheen'),
(82, 'Tom', 'Berenger'),
(83, 'Willem', 'Dafoe'),
(84, 'Forest', 'Whitaker'),
(85, 'Macaulay', 'Culkin'),
(86, 'Daniel', 'Stern'),
(87, 'John', 'Heard'),
(88, 'Tim', 'Robbins'),
(89, 'Elizabeth', 'Peña'),
(90, 'Danny', 'Aiello'),
(91, 'Matt', 'Craven'),
(92, 'Gabriel', 'Bryne'),
(93, 'Marcia', 'Harden'),
(94, 'John', 'Turturro'),
(95, 'Jon', 'Polito'),
(96, 'Christopher', 'Walken'),
(97, 'David', 'Caruso'),
(98, 'Laurence', 'Fishburne'),
(99, 'Victor', 'Argo'),
(100, 'Ray', 'Liotta'),
(101, 'Lorraine', 'Bracco'),
(102, 'Johnny', 'Depp'),
(103, 'Winona', 'Ryder'),
(104, 'Dianne', 'West'),
(105, 'Kathy', 'Baker'),
(106, 'Randy', 'Quaid'),
(107, 'Otis', 'Young'),
(108, 'Clifton', 'James'),
(109, 'Walter', 'Matthau'),
(110, 'Tatum', 'O\'Neal'),
(111, 'Vic', 'Morrow'),
(112, 'Joyce', 'Van Patten');

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
(11, 'Robert', 'Wise'),
(12, 'Martin', 'Scorsese'),
(13, 'Bob', 'Rafelson'),
(14, 'Rob', 'Reiner'),
(15, 'Steven', 'Spielberg'),
(16, 'Milos', 'Forman'),
(17, 'Oliver', 'Stone'),
(18, 'Chris', 'Columbus'),
(19, 'Adrian', 'Lyne'),
(20, 'Joel', 'Coen'),
(21, 'Abel', 'Ferrera'),
(22, 'Tim', 'Burton'),
(23, 'Hal', 'Ashby'),
(24, 'Michael', 'Ritchie');

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
  `movie_trailer` varchar(300) NOT NULL DEFAULT 'trailer.mp4',
  `movie_release` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movie_id`, `movie_cover`, `movie_title`, `movie_year`, `movie_runtime`, `movie_synopsis`, `movie_trailer`, `movie_release`) VALUES
(1, 'asphalt_jungle.jpg', 'The Asphalt Jungle', '1950', '1h 52min', 'A major heist goes off as planned until bad luck and double crosses cause everything to unravel.', 'https://www.youtube.com/embed/IXrP6Uo4nUI', 'June 1, 1950'),
(2, 'gunfighter.jpg', 'The Gunfighter', '1950', '1h 25min', 'Notorious gunfighter Jimmy Ringo rides into town to find his true love, who doesn\'t want to see him. He hasn\'t come looking for trouble, but trouble finds him around every corner.', 'https://www.youtube.com/embed/yFqQAK6l6QE', 'June 23, 1950'),
(3, 'sound_fury.jpg', 'The Sound of Fury', '1950', '1hr 31min', 'A man who is down on his luck falls in with a criminal.', 'https://www.youtube.com/embed/3_XEzLVRs7Y', 'May 5, 1951'),
(4, 'sunset_blvd.jpg', 'Sunset Boulevard', '1950', '1h 50min', 'A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.', 'https://www.youtube.com/embed/USv1hJTlbhg', 'August 10, 1950'),
(5, 'damned_cry.jpg', 'The Damned Don\'t Cry', '1950', '1h 43min', 'A New York socialite climbs the ladder of success man by man until a life among rich gangsters gives her what she thought she always wanted.', 'https://www.youtube.com/embed/m13O9Toi27U', 'May 13, 1950'),
(6, 'treasure_island.jpg', 'Treasure Island', '1950', '1h 36min', 'The treasure-seeking adventures of young Jim Hawkins and pirate captain Long John Silver.', 'https://www.youtube.com/embed/ez7_3UviUMs', 'July 19, 1950'),
(7, '2001_odyssey.jpg', '2001: A Space Odyssey', '1968', '2h 29min', 'After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.', 'https://www.youtube.com/embed/N6ywMnbef6Y', 'April 3, 1968'),
(8, 'psycho.jpg', 'Psycho', '1960', '1h 49min', 'A Phoenix secretary embezzles forty thousand dollars from her employer\'s client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.', 'https://www.youtube.com/embed/Wz719b9QUqY', 'June 22, 1960'),
(9, 'good_ugly.jpg', 'The Good, the Bad and the Ugly', '1966', '2h 28min', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 'https://www.youtube.com/embed/WCN5JJY_wiA', 'December 29, 1967'),
(10, 'lawrence_arabia.jpg', 'Lawrence of Arabia', '1962', '3h 48min', 'The story of T.E. Lawrence, the English officer who successfully united and led the diverse, often warring, Arab tribes during World War I in order to fight the Turks.', 'https://www.youtube.com/embed/vOlRhGEhG7k', 'December 16, 1962'),
(11, 'once_west.jpg', 'Once Upon a Time in the West', '1968', '2h 45min', 'A mysterious stranger with a harmonica joins forces with a notorious desperado to protect a beautiful widow from a ruthless assassin working for the railroad.', 'https://www.youtube.com/embed/Yw-Av9BpC-w', 'July 4, 1969'),
(12, 'sound_music.jpg', 'The Sound of Music', '1965', '2h 52min', 'A woman leaves an Austrian convent to become a governess to the children of a Naval officer widower.', 'https://www.youtube.com/embed/g7sJD0u7AFE', 'March 2, 1965'),
(13, 'taxi_driver.jpg', 'Taxi Driver', '1976', '1h 54min', 'A mentally unstable veteran works as a nighttime taxi driver in New York City, where the perceived decadence and sleaze fuels his urge for violent action by attempting to liberate a presidential campaign worker and an underage prostitute.', 'https://www.youtube.com/embed/cujiHDeqnHY', 'February 8, 1976'),
(14, 'mean_streets.jpg', 'Mean Streets', '1973', '1h 52min', 'A small-time hood aspires to work his way up the ranks of a local mob.', 'https://www.youtube.com/embed/g9xHpS10CZ0', 'October 2, 1973'),
(15, 'alice_anymore.jpg', 'Alice Doesn\'t Live Here Anymore', '1974', '1h 52min', 'A recently widowed woman is on the road with her precocious young son, determined to make a new life for herself as a singer.', 'https://www.youtube.com/embed/2jFhv9mPqk4', 'December 9, 1974'),
(16, 'five_pieces.jpg', 'Five Easy Pieces', '1970', '1h 38min', 'A dropout from upper-class America picks up work along the way on oil rigs when his life isn\'t spent in a squalid succession of bars, motels, and other points of interest.', 'https://www.youtube.com/embed/inIRtrZIvwU', 'September 11, 1970'),
(17, 'princess_bride.jpg', 'The Princess Bride', '1987', '1hr 38min', 'While home sick in bed, a young boy\'s grandfather reads him the story of a farmboy-turned-pirate who encounters numerous obstacles, enemies and allies in his quest to be reunited with his true love.', 'https://www.youtube.com/embed/WNNUcHRiPS8', 'October 9, 1987'),
(18, 'raging_bull.jpg', 'Raging Bull', '1980', '2hr 9min', 'The life of boxer Jake LaMotta, whose violence and temper that led him to the top in the ring destroyed his life outside of it.', 'https://www.youtube.com/embed/yUp6d79WRVI', 'November 14, 1980'),
(19, 'e_t.jpg', 'E.T. the Extra-Terrestrial', '1982', '1hr 55min', 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.', 'https://www.youtube.com/embed/qYAETtIIClk', 'June 11, 1982'),
(20, 'raiders_ark.jpg', 'Raiders of the Lost Ark', '1981', '1hr 55min', 'In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before Adolf Hitler\'s Nazis can obtain its awesome powers.', 'https://www.youtube.com/embed/XkkzKHCx154', 'June 12, 1981'),
(21, 'amadeus.jpg', 'Amadeus', '1984', '2hr 40min', 'The life, success and troubles of Wolfgang Amadeus Mozart, as told by Antonio Salieri, the contemporaneous composer who was insanely jealous of Mozart\'s talent and claimed to have murdered him.', 'https://www.youtube.com/embed/r7kWQj9FCGY', 'September 19, 1984'),
(22, 'platoon.jpg', 'Platoon', '1986', '2hr', 'A young soldier in Vietnam faces a moral crisis when confronted with the horrors of war and the duality of man.', 'https://www.youtube.com/embed/KztP7SKe0uk', 'February 6, 1987'),
(23, 'home_alone.jpg', 'Home Alone', '1990', '1hr 43min', 'An eight-year-old troublemaker must protect his house from a pair of burglars when he is accidentally left home alone by his family during Christmas vacation.', 'https://www.youtube.com/embed/owU3lMxd6jI', 'November 10, 1990'),
(24, 'jacobs_ladder.jpg', 'Jacob\'s Ladder', '1990', '1hr 53min', 'Mourning his dead child, a haunted Vietnam War veteran attempts to uncover his past while suffering from a severe case of dissociation. To do so, he must decipher reality and life from his own dreams, delusions, and perceptions of death.', 'https://www.youtube.com/embed/vUQ77c9OS7E', 'November 2, 1990'),
(25, 'millers_crossing.jpg', 'Miller\'s Crossing', '1990', '1hr 55min', 'Tom Reagan, an advisor to a Prohibition-era crime boss, tries to keep the peace between warring mobs but gets caught in divided loyalties.', 'https://www.youtube.com/embed/hkJIcFMN_pc', 'September 22, 1990'),
(26, 'king_york.jpg', 'King of New York', '1990', '1hr 43min', 'A drug kingpin is released from prison and seeks to take total control of the criminal underworld in order to give back to the community.', 'https://www.youtube.com/embed/z4bprq-BYi0', 'September 28, 1990'),
(27, 'goodfellas.jpg', 'Goodfellas', '1990', '2hr 26min', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 'https://www.youtube.com/embed/qo5jJpHtI1Y', 'September 18, 1990'),
(28, 'edward_scissorhands.jpg', 'Edward Scissorhands', '1990', '1hr 45min', 'An artificial man, who was incompletely constructed and has scissors for hands, leads a solitary life. Then one day, a suburban lady meets him and introduces him to her world.', 'https://www.youtube.com/embed/TBHIO60whNw', 'December 14, 1990'),
(29, 'last_detail.jpg', 'The Last Detail', '1973', '1hr 44min', 'Two Navy men are ordered to bring a young offender to prison, but decide to show him one last good time along the way.', 'https://www.youtube.com/embed/QxwKQ5Ob9Qo', 'February 15, 1974'),
(30, 'bad_bears.jpg', 'The Bad News Bears', '1976', '1hr 42min', 'An aging, down-on-his-luck ex-minor leaguer coaches a team of misfits in an ultra-competitive California little league.', 'https://www.youtube.com/embed/sF6De-XP7x4', 'April 7, 1976');

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
(12, 1),
(13, 4),
(14, 4),
(15, 3),
(16, 3),
(17, 2),
(18, 4),
(19, 2),
(20, 2),
(21, 2),
(22, 3),
(23, 2),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 2),
(29, 4),
(30, 3);

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
(12, 48, 'Max Detweiler'),
(13, 49, 'Travis Buckle'),
(13, 50, 'Iris'),
(13, 51, 'Wizard'),
(13, 52, 'Tom'),
(14, 49, 'Johnny Boy'),
(14, 53, 'Charlie'),
(14, 54, 'Tony'),
(14, 55, 'Teresa'),
(15, 56, 'David'),
(15, 57, 'Alice Hyatt'),
(16, 58, 'Robert Eroica Dupea'),
(16, 59, 'Rayette Dipesto'),
(16, 60, 'Elton'),
(16, 61, 'Stoney'),
(17, 62, 'Westley'),
(17, 63, 'Inigo Montoya'),
(17, 64, 'Prince Humperdinck'),
(17, 65, 'Count Rugen'),
(18, 66, 'Vickie La Motta'),
(18, 67, 'Joey'),
(18, 68, 'Salvy'),
(19, 69, 'Mary'),
(19, 70, 'Elliott'),
(19, 71, 'Keys'),
(19, 72, 'Gertie'),
(20, 73, 'Indy'),
(20, 74, 'Marion'),
(20, 75, 'Belloq'),
(20, 76, 'Toht'),
(21, 77, 'Antonio Salieri'),
(21, 78, 'Wolfgang Amadeus Mozart'),
(21, 79, 'Constanze Mozart'),
(21, 80, 'Leopold Mozart'),
(22, 81, 'Chris'),
(22, 82, 'Sgt. Barnes'),
(22, 83, 'Sgt. Elias'),
(22, 84, 'King'),
(23, 85, 'Kevin'),
(23, 86, 'Marv'),
(23, 87, 'Peter'),
(24, 88, 'Jacob'),
(24, 89, 'Jezzie'),
(24, 90, 'Louis'),
(24, 91, 'Michael'),
(25, 92, 'Tom Reagan'),
(25, 93, 'Verna'),
(25, 94, 'Bernie Bernbaum'),
(25, 95, 'Johnny Caspar'),
(26, 96, 'Frank White'),
(26, 97, 'Dennis Gilley'),
(26, 98, 'Jimmy Jump'),
(26, 99, 'Roy Bishop'),
(27, 100, 'Henry Hill'),
(27, 101, 'Karen Hill'),
(28, 102, 'Edward Scissorhands'),
(28, 103, 'Kim'),
(28, 104, 'Peg'),
(28, 105, 'Joyce'),
(29, 106, 'Mulhall'),
(29, 107, 'Meadows'),
(29, 108, 'M.A.A.'),
(30, 109, 'Coach Morris Buttermaker'),
(30, 110, 'Amanda Whurlitzer'),
(30, 111, 'Roy Turner'),
(30, 112, 'Cleveland');

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
(12, 11),
(13, 12),
(16, 13),
(17, 14),
(19, 15),
(21, 16),
(22, 17),
(23, 18),
(24, 19),
(25, 20),
(26, 21),
(28, 22),
(29, 23),
(30, 24);

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
(12, 19),
(13, 4),
(13, 5),
(14, 4),
(14, 5),
(14, 18),
(15, 5),
(15, 15),
(16, 5),
(17, 2),
(17, 13),
(17, 14),
(18, 5),
(18, 19),
(19, 9),
(19, 13),
(20, 1),
(20, 2),
(21, 5),
(21, 6),
(21, 19),
(22, 5),
(22, 10),
(23, 3),
(23, 13),
(24, 5),
(24, 7),
(24, 17),
(25, 4),
(25, 5),
(25, 18),
(26, 4),
(26, 18),
(27, 4),
(27, 5),
(27, 19),
(28, 5),
(28, 14),
(28, 15),
(29, 3),
(29, 5),
(30, 3),
(30, 5),
(30, 13);

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
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `ID` int(11) NOT NULL,
  `fname` varchar(50) COLLATE utf8_bin NOT NULL,
  `lname` varchar(50) COLLATE utf8_bin NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `pass` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `isChild` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `fname`, `lname`, `username`, `pass`, `email`, `date`, `ip`, `isChild`) VALUES
(1, 'Walter', 'Carrera', 'walterseba', 'password', 'w_carrera@fanshawec.ca', '2020-04-12 07:25:08', '127.0.0.1', 0),
(2, 'Cassy', 'Cat', 'CassCat', 'testing', 'casscat@gmail.com', '2020-04-12 07:31:42', '127.0.0.1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_arating`
--
ALTER TABLE `tbl_arating`
  MODIFY `arating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cast`
--
ALTER TABLE `tbl_cast`
  MODIFY `cast_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_genres`
--
ALTER TABLE `tbl_genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
