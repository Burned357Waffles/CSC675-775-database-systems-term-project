-- Script name: inserts.sql
-- Author: Brandon Watanabe
-- Purpose: Insert sample data to test the integrity of this database system

-- Use the database VideoGameInformation.
USE VideoGameInformation;

-- userregion table inserts
INSERT INTO userregion (userRegion_id, description) VALUES 
(1, 'USA'), 
(2, 'JAP'),
(3, 'KOR');

-- generaluser table inserts
INSERT INTO generaluser (generalUser_id, email, name) VALUES 
(1, '1@mail.com', 'user1'), 
(2, '2@mail.com', 'user2'), 
(3, '3@mail.com', 'user3'),
(4, '4@mail.com', 'user4');

-- admin table inserts
INSERT INTO admin (admin_id, generalUser_generalUser_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- account table inserts
INSERT INTO account (account_id, password, created, userRegion_userRegion_id, generalUser_generalUser_id) VALUES 
(1, '1234', '2023-11-11 13:23:44', 1, 1), 
(2, 'wasd', '2023-11-09 10:30:17', 2, 2),  
(3, 'eee333', '2023-11-12 15:33:33', 3, 3),
(4, 'password', '2023-11-12 21:00:00', 1, 4);

-- registereduser table inserts
INSERT INTO registereduser (registeredUser_id, generalUser_generalUser_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- account_has_admin table inserts
INSERT INTO account_has_admin (account_account_id, admin_admin_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- account_has_registereduser table inserts
INSERT INTO account_has_registereduser (account_account_id, registeredUser_registeredUser_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- action table inserts
INSERT INTO action (action_id, role) VALUES
(1, 0),
(2, 1),
(3, 1);

-- admin_has_action table inserts
INSERT INTO admin_has_action (admin_admin_id, action_action_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- awardnominations table inserts
INSERT INTO awardnominations (awardNominations_id, name, date) VALUES
(1, '2022 Game Of The Year', '2022-12-08'),
(2, '2022 Best Audio Design', '2022-12-08'),
(3, '2012 Game Of The Year', '2012-03-07'),
(4, '2012 Best Audio', '2012-03-07'),
(5, '2011 Best Debut Game', '2011-03-02'),
(6, '2011 Innovation Award', '2011-03-02');

-- awards table inserts
INSERT INTO awards (awards_id, name, date) VALUES
(1, '2022 Game Of The Year', '2022-12-08'),
(2, '2022 Best Audio Design', '2022-12-08'),
(3, '2012 Game Of The Year', '2012-03-07'),
(4, '2011 Best Debut Game', '2011-03-02'),
(5, '2011 Innovation Award', '2011-03-02');

-- cdn table inserts
INSERT INTO cdn (cdn_id, description, num_copies, userRegion_userRegion_id) VALUES
(1, 'CDN 1', 1, 1),
(2, 'CDN 2', 2, 2),
(3, 'CDN 3', 3, 3);

-- publisher table inserts
INSERT INTO publisher (publisher_id, name) VALUES
(1, 'FromSoftware Inc.'),
(2, 'Bandai Namco Entertainment'),
(3, 'Bethesda Softworks'),
(4, 'Mojang Studios'),
(5, 'Xbox Game Studios'),
(6, 'Telltale Games'),
(7, 'Sony Interactive Entertainment');

-- game table inserts
INSERT INTO game (game_id, name, price, release_date, description, crossplay) VALUES
(1, 'Elden Ring', 59.99, '2022-02-24', 'THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.', 0),
(2, 'The Elder Scrolls V: Skyrim', 39.99, '2011-11-11', 'The Elder Scrolls V: Skyrim is the fifth chapter in the highly anticipated Elder Scrolls saga. Dragons, long lost to the passages of the Elder Scrolls, have returned to Tamriel and the future of the Empire hangs in the balance. As Dragonborn, the prophesied hero born with the power of The Voice, you are the only one who can stand amongst them. Developed by Bethesda Game Studios (Oblivion, Fallout 3), Skyrim reimagines and revolutionizes the open-world fantasy epic, bringing to life a complete virtual world open for you to explore any way you choose.', 0),
(3, 'Minecraft', 29.99, '2011-11-18', 'Minecraft is a game made up of blocks, creatures, and community. Blocks can be used to reshape the world or build fantastical creations. Creatures can be battled or befriended, depending on your playstyle. Experience epic adventures solo or with friends, there’s no wrong way to play. Unless you’re digging straight down.', 1);

-- publisher_has_game table inserts
INSERT INTO publisher_has_game (publisher_publisher_id, game_game_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 3),
(7, 3);

-- composer table inserts
INSERT INTO composer (composer_id, name) VALUES
(1, 'Fromsoftware Sound Team'),
(2, 'Jeremy Soule'),
(3, 'C418');

-- content table inserts
INSERT INTO content (content_id, date, game_game_id, game_publisher_publisher_id) VALUES
(1, '2022-02-24', 1, 1),
(2, '2011-11-11', 2, 3),
(3, '2011-11-18', 3, 4);

-- developer table inserts
INSERT INTO developer (developer_id, name, director) VALUES
(1, 'FromSoftware Inc.', 'Hidetaka Miyazaki'),
(2, 'Bethesda Game Studios', 'Todd Howard'),
(3, 'Mojang Studios', 'Notch');





