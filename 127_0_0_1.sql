-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 12:39 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `20fa-p1-clayton`
--
CREATE DATABASE IF NOT EXISTS `20fa-p1-clayton` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `20fa-p1-clayton`;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservationID` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `partySize` int(11) NOT NULL,
  `time` varchar(6) NOT NULL,
  `allergies` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservationID`, `firstName`, `lastName`, `partySize`, `time`, `allergies`) VALUES
(5, 'Amber', 'Giddings', 3, '11', 'Array'),
(6, 'Clayton', 'Clapton', 5, '12', 'PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `claytest`
--
CREATE DATABASE IF NOT EXISTS `claytest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `claytest`;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movieID` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `director` varchar(128) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieID`, `title`, `director`, `year`) VALUES
(1, 'Predator', 'Dutch Danger', 1980),
(2, 'Tim and Eric\'s Billion Dollar Movie', 'Tim and Eric', 2012),
(3, 'Predator', 'Dutch Danger', 1980),
(4, 'Tim and Eric\'s Billion Dollar Movie', 'Tim and Eric', 2012);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `text` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewID`, `userID`, `movieID`, `rating`, `text`) VALUES
(1, 4, 1, 10, 'Alien sucks'),
(2, 1, 2, 1, 'What did I just watch?'),
(3, 4, 1, 10, 'Alien sucks'),
(4, 1, 2, 1, 'What did I just watch?');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `email`) VALUES
(1, 'clayfighter0', 'clayfighter0@gmail.com'),
(4, 'clayfighter', 'clay@hotmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movieID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `userNames` (`userID`),
  ADD KEY `movieIDs` (`movieID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userNameU` (`userName`),
  ADD UNIQUE KEY `emailU` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `movieIDs` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userNames` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `drills`
--
CREATE DATABASE IF NOT EXISTS `drills` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `drills`;

-- --------------------------------------------------------

--
-- Table structure for table `additiondrills`
--

CREATE TABLE `additiondrills` (
  `drillID` int(11) NOT NULL,
  `skillLevel` varchar(25) NOT NULL,
  `numberOfQuestions` int(11) NOT NULL,
  `equation` varchar(65) NOT NULL,
  `solution` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additiondrills`
--

INSERT INTO `additiondrills` (`drillID`, `skillLevel`, `numberOfQuestions`, `equation`, `solution`) VALUES
(0, 'Beginner', 4, '1. 5 + 5 = ?\r\n2. 1 + 1 = ?\r\n3. 8 + 7 = ?\r\n4. 10 + 10 = ?\r\n', '1. 10\r\n2. 2\r\n3. 15\r\n4. 20'),
(1, 'Intermediate', 2, '1. 1 + 1 + (5 + 5) = ?\r\n2. 2 + 2 + (1 + 1) = ?\r\n', '1. 12\r\n2. 6'),
(2, 'Expert', 3, '1. 64 + a = 83, a = ?\r\n2. x + x = ?\r\n3. 42 + 75 (43 + 14) = ?', '1. 19\r\n2. 2x\r\n3. 174');

-- --------------------------------------------------------

--
-- Table structure for table `customdrills`
--

CREATE TABLE `customdrills` (
  `drillID` int(11) NOT NULL,
  `skillLevel` varchar(25) NOT NULL,
  `numberOfProblems` int(11) NOT NULL,
  `solution` varchar(65) NOT NULL,
  `equation` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `divisiondrills`
--

CREATE TABLE `divisiondrills` (
  `drillID` int(11) NOT NULL,
  `skillLevel` varchar(25) NOT NULL,
  `numberOfQuestions` int(11) NOT NULL,
  `equation` varchar(65) NOT NULL,
  `solution` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `divisiondrills`
--

INSERT INTO `divisiondrills` (`drillID`, `skillLevel`, `numberOfQuestions`, `equation`, `solution`) VALUES
(0, 'Beginner', 5, '1. 1/1=?\r\n2. 4/2=?\r\n3. 6/3=?\r\n4. 8/4=?\r\n5. 10/5=?', '1. 1\r\n2. 2\r\n3. 2\r\n4. 2\r\n5. 2'),
(1, 'Intermediate', 4, '1. 40/20 = ?\r\n2. 20/10 = ?\r\n3. 85/5 = ?\r\n4. 16/16 = ?\r\n', '1. 2\r\n2. 2\r\n3. 17\r\n4. 1\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `multiplicationdrills`
--

CREATE TABLE `multiplicationdrills` (
  `drillID` int(11) NOT NULL,
  `numberOfQuestions` int(11) NOT NULL,
  `skillLevel` varchar(25) NOT NULL,
  `equation` varchar(65) NOT NULL,
  `solution` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `multiplicationdrills`
--

INSERT INTO `multiplicationdrills` (`drillID`, `numberOfQuestions`, `skillLevel`, `equation`, `solution`) VALUES
(0, 4, 'Beginner', '1. 1 * 0 = ?\r\n2. 2 * 1 = ?\r\n3. 3 * 2 = ?\r\n4. 4 * 4 = ?\r\n', '1. 0\r\n2. 2\r\n3. 6\r\n4. 16');

-- --------------------------------------------------------

--
-- Table structure for table `subtractiondrills`
--

CREATE TABLE `subtractiondrills` (
  `drillID` int(11) NOT NULL,
  `skillLevel` varchar(25) NOT NULL,
  `numberOfQuestions` int(11) NOT NULL,
  `equation` varchar(65) NOT NULL,
  `solution` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subtractiondrills`
--

INSERT INTO `subtractiondrills` (`drillID`, `skillLevel`, `numberOfQuestions`, `equation`, `solution`) VALUES
(0, 'Beginning', 4, '1. 1 - 1 = ?\r\n2. 2 - 4 = ?\r\n3. 3 - 6 = ?\r\n4. 6 - 3 = ?\r\n', '1. 0\r\n2. -2\r\n3. -3\r\n4. 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additiondrills`
--
ALTER TABLE `additiondrills`
  ADD PRIMARY KEY (`drillID`);

--
-- Indexes for table `customdrills`
--
ALTER TABLE `customdrills`
  ADD PRIMARY KEY (`drillID`);

--
-- Indexes for table `divisiondrills`
--
ALTER TABLE `divisiondrills`
  ADD PRIMARY KEY (`drillID`);

--
-- Indexes for table `multiplicationdrills`
--
ALTER TABLE `multiplicationdrills`
  ADD PRIMARY KEY (`drillID`);

--
-- Indexes for table `subtractiondrills`
--
ALTER TABLE `subtractiondrills`
  ADD PRIMARY KEY (`drillID`);
--
-- Database: `movie_reviews`
--
CREATE DATABASE IF NOT EXISTS `movie_reviews` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `movie_reviews`;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `director` varchar(128) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`ID`, `title`, `year`, `director`, `rating`) VALUES
(1, 'The Big Lebowski', 1998, 'Coen', 10),
(3, 'Miller\'s Crossing', 1990, 'Coen', 10),
(5, 'Blue Velvet', 1986, 'Lynch', 8),
(6, 'Dune', 1984, 'Lynch', 6),
(9, 'Eraserhead', 1977, 'Lynch', 9),
(12, 'Mad Max: Fury Road', 2015, 'Miller', 10),
(14, 'Corky Romano', 2001, 'Pritts', 0),
(17, 'Only God Forgives', 2013, 'Refn', 1),
(19, 'Troll 2', 2017, 'Fragasso', 5),
(20, 'Mandy', 2018, 'Cosmatos', 9),
(21, 'C.H.U.D.', 1984, 'Cheek', 4),
(22, 'C.H.U.D. II: Bud the C.H.U.D.', 1989, 'Irving', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Database: `nintendo`
--
CREATE DATABASE IF NOT EXISTS `nintendo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nintendo`;

-- --------------------------------------------------------

--
-- Table structure for table `consoles`
--

CREATE TABLE `consoles` (
  `consoleID` int(11) NOT NULL,
  `consoleName` varchar(50) NOT NULL,
  `releaseYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consoles`
--

INSERT INTO `consoles` (`consoleID`, `consoleName`, `releaseYear`) VALUES
(1, 'Nintendo Entertainment System', 1983),
(2, 'Super Nintendo Entertainment System', 1990),
(3, 'Nintendo 64', 1996),
(4, 'Nintendo Gamecube', 2001),
(5, 'Nintendo Wii', 2006),
(6, 'Nintendo WiiU', 2012),
(7, 'Nintendo Switch', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `gameID` int(11) NOT NULL,
  `gameTitle` varchar(50) NOT NULL,
  `releaseConsole` varchar(50) NOT NULL,
  `releaseDate` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`gameID`, `gameTitle`, `releaseConsole`, `releaseDate`, `description`) VALUES
(1, 'Super Mario Bros', 'Nintendo Entertainment System', '1985-09-13', 'A plumber named Mario must save Mushroom Kingdom and its Princess, Peach, from the clutches of Bowser.'),
(2, 'Legend of Zelda', 'Nintendo Entertainment System', '1986-02-21', 'A knight named Link must go on an adventure to reunite the Triforce in order to restore power and balance to the kingdom of Hyrule. The dark lord Ganon won\'t make it easy on you as he has captured Princess Zelda as collateral. '),
(3, 'Super Mario World', 'Super Nintendo Entertainment System', '1990-11-21', 'Play as Mario and Yoshi in this action platformer that helped bring Nintendo back in to video game greatness.\r\n\r\nOnce again you must stop the evil Bowser from marrying Princess Peach and therefore making him a king of Mushroom Kingdom.'),
(4, 'Legend of Zelda: a Link to the Past', 'Super Nintendo Entertainment System', '1990-11-21', 'Released the same day as Super Mario World, Link would have to once again save Hyrule from the clutches of Ganon. Two worlds exist in this revolutionary action adventure title. It\'s up to you to travel between them in order to restore the Triforce to power.'),
(5, 'Earthbound/Mother 2', 'Super Nintendo Entertainment System', '1995-06-05', 'A quirky game that helped shape a generation of RPG\'s like it. \r\n\r\nPlay as Ness and locate 3 other friends that are destined to help you from stopping the evil known as Giygas. \r\n\r\nPacked with humor and interesting enemies and combat this game was surely a cult favorite among this console.'),
(6, 'Super Mario 64', 'Nintendo 64', '1996-06-23', 'A massive achievement in graphical improvement over the NES and SNES the Nintendo 64 brought 64 bit color and 3D platforming to the table. \r\n\r\nOnce again you play as Mario, who\'s trying to reunite stars to bring power back to Mushroom kingdom castle so he can advance through the doors that Bowser has put in place. '),
(7, 'Legend of Zelda: Ocarina of TIme', 'Nintendo 64', '1998-11-23', 'A 3D action adventure game! What else could you want as a kid. This game helped inspire Zelda games and Nintendo\'s vision of Legend of Zelda for the next 18 years.\r\n\r\nSave Hyrule by traveling through time in this amazing 3D action adventure game. Once again the dark lord Ganon has found a host named Ganondorf a male born Gerudo. Do you have the courage to face this evil alone?'),
(8, '007 Goldeneye', 'Nintendo 64', '1997-08-25', 'In a new dimension of video gaming of course we had to have a first person shooter that was an amazingly groundbreaking game for its\' time. \r\n\r\nTake on the role of 007, or Bond, James Bond as he refers to himself, in this action adventure shooter series. \r\n\r\nPlay with your friends in multiplayer chaos that is slapping good time.'),
(9, 'Super Smash Brothers Melee', 'Nintendo Gamecube', '2001-11-21', 'Play as your favorite Nintendo character in this one of a kind unique fighting game experience. \r\n\r\nTry to knock your opponent off the screen so that you gain points or take a life depending on how you choose to play.\r\n\r\nThis game is still being played today at the highest level of gaming events. It has been a staple in the Nintendo line.'),
(10, 'Legend of Zelda: Windwaker', 'Nintendo Gamecube', '2003-03-24', 'Play as Link in this open ocean action adventure game. Save your precious island and the world from a growing power named Gandondorf. \r\n\r\nSail the oceans and find treasure in this cell-shaded game. As well as explore dungeons to earn items that will help you solve puzzles in the game. '),
(11, 'Metroid Prime', 'Nintendo Gamecube', '2002-11-17', 'Another Nintendo shooter! Take on the role of the badass female bounty hunter named Samus Aran. \r\n\r\nYou must investigate space stations scattered across the stars as you unravel the mystery of what happened to them.\r\n\r\nLaunch missiles and energy shots in this game that helped bring love to an already thriving console. \r\n'),
(12, 'Legend of Zelda: Twilight Princess', 'Nintendo Wii', '2006-11-19', 'A console that introduced motion control gameplay.\r\n\r\nThis game released alongside the Gamecube and Wii on its release day. That being said it really helped user in how the console would be used.\r\n\r\nPlay as Link in this gritty real action adventure game as he once again tries to save Hyrule from being swallowed by the twilight. '),
(13, 'Wii Sports', 'Nintendo Wii', '2006-11-19', 'Released as a free game that came with the Wii, this highly addictive game had living rooms actively putting remotes through there TV\'s just to get that strike in Bowling. \r\n\r\nOr perhaps Boxing, or Tennis appeal to you more. Either way people loved this game as it was very fun and came free with the console to really introduce the motion controls and what they offered over the traditional controller.  '),
(14, 'Legend of Zelda: Skyward Sword', 'Nintendo Wii', '2011-11-18', 'Released as part of an enhanced motion game over Twilight Princess, this game used motion control+ which was a more powerful motion controller that helped dictate your motion even more fluently than before. \r\n\r\nThis game came out near the end of the Wii\'s long life (Surprisingly games are still being made for this console) But with it brought some much needed improvement on how specific motion controls could get. '),
(15, 'Super Mario 3D Land', 'Nintendo Wii U', '2013-11-03', 'Released to help introduce the gamepad to Mario games and was a very fun multiplayer experience. '),
(16, 'Bayonetta 2', 'Nintendo Wii U', '2014-10-24', 'A stylish combo beat\'em up fighter, that will have your pulse racing. \r\n\r\nPlay as Bayonetta a witch who uses her hair as a weapon to defeat angels and demons to complete her own selfish goals. '),
(17, 'Pikmin 3', 'Nintendo Wii U', '2013-07-13', 'A real-time strategy game at heart, this loving game used the gamepad and the TV to its full potential like only the Nintendo WiiU could. \r\n\r\nPlay as 3 space travelers as you crash land on a foreign planet and you must harvest parts in order to repair your ship to leave the planet. \r\n\r\nUsing the helpful and colorful plant based species named Pikmin you have to get off this planet before you run out of food. '),
(18, 'Legend of Zelda: Breath of the Wild', 'Nintendo Switch', '2017-03-03', 'Released on the WiiU as well this game was a title launch for the Switch and helped user in a new generation of gaming as well as helped create a new convention for the Zelda series that hadn\'t been done since Ocarina of Time.\r\n\r\nPlay as link in this truly open world game as you scale mountain sides and water to get to Hyrule castle where you must face down the ultimate evil known as Calamity Ganon. '),
(19, 'Mario Odyssey ', 'Nintendo Switch', '2017-10-27', 'A 3D action platformer unlike any other. Play as Mario and Cappy as you try to stop the weddding once again between Bowser and Princess Peach. '),
(20, 'Pokemon: Sword and Shield ', 'Nintendo Switch', '2019-11-15', 'What else needs to be said about this game other than it is the first Pokemon entry to be on a home console that is canon to the handheld Nintendo products line of Pokemon games.\r\n\r\nPlay as a unnamed aspiring trainer in this Pokemon game as you unravel the true mystery surrounding the region of Galar.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `admin` varchar(1) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `favoriteConsole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `admin`, `firstName`, `lastName`, `userName`, `email`, `pass`, `favoriteConsole`) VALUES
(1, 'Y', 'Clayton', 'Friedeman', '', 'clayfighter0@gmail.com', '', 'Switch'),
(2, 'N', 'Jake', 'Jambor', '', 'jjambor@gmail.com', '', 'Super Nintendo Entertainment System');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consoles`
--
ALTER TABLE `consoles`
  ADD PRIMARY KEY (`consoleID`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`gameID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consoles`
--
ALTER TABLE `consoles`
  MODIFY `consoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `gameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"drills\",\"table\":\"subtractiondrills\"},{\"db\":\"drills\",\"table\":\"multiplicationdrills\"},{\"db\":\"drills\",\"table\":\"divisiondrills\"},{\"db\":\"drills\",\"table\":\"customdrills\"},{\"db\":\"drills\",\"table\":\"additiondrills\"},{\"db\":\"drills\",\"table\":\"customDrills\"},{\"db\":\"drills\",\"table\":\"additionDrills\"},{\"db\":\"nintendo\",\"table\":\"consoles\"},{\"db\":\"drills\",\"table\":\"addition\"},{\"db\":\"drills\",\"table\":\"division\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('claytest', 'reviews', 'text'),
('nintendo', 'games', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-03-21 22:55:13', '{\"Console\\/Mode\":\"show\",\"NavigationWidth\":262,\"ThemeDefault\":\"pmahomme\",\"Console\\/Height\":25.971000000000004}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

