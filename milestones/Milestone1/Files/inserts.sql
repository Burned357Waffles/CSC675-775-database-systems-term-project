-- Script name: inserts.sql
-- Author: Brandon Watanabe
-- Purpose: Insert sample data to test the integrity of this database system

-- Use the database VideoGameInformation.
USE VideoGameInformation;

-- userregion table inserts
INSERT INTO userRegion (userRegion_id, description) VALUES 
(1, 'USA'), 
(2, 'JAP'),
(3, 'KOR');

-- generaluser table inserts
INSERT INTO generalUser (generalUser_id, email, name) VALUES 
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
INSERT INTO registeredUser (registeredUser_id, generalUser_generalUser_id) VALUES
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
INSERT INTO account_has_registeredUser (account_account_id, registeredUser_registeredUser_id) VALUES
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
INSERT INTO awardNominations (awardNominations_id, name, date) VALUES
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
(3, 'Minecraft Java Edition', 29.99, '2011-11-18', 'Minecraft is a game made up of blocks, creatures, and community. Blocks can be used to reshape the world or build fantastical creations. Creatures can be battled or befriended, depending on your playstyle. Experience epic adventures solo or with friends, there’s no wrong way to play. Unless you’re digging straight down.', 1);

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
(3, '2011-11-18', 3, 4),
(4, '2022-02-24', 1, 1),
(5, '2011-11-11', 2, 3),
(6, '2011-11-18', 3, 4);

-- developer table inserts
INSERT INTO developer (developer_id, name, director) VALUES
(1, 'FromSoftware Inc.', 'Hidetaka Miyazaki'),
(2, 'Bethesda Game Studios', 'Todd Howard'),
(3, 'Mojang Studios', 'Notch');

-- device table inserts
INSERT INTO device (device_id, ip_address, name, time_connected) VALUES
(1, '7.36.216.189', 'iPhone 12', '2023-11-11 13:23:44'),
(2, '0.40.252.132', 'MyComputer', '2023-11-09 10:30:17'),
(3, '53.252.114.18', 'EEEEEEEEEEEE', '2023-11-12 15:33:33'),
(4, '30.210.98.208', 'happy laptop', '2023-11-12 21:00:00');

-- registeredUser_has_device table inserts
INSERT INTO registeredUser_has_device (device_device_id, registeredUser_registeredUser_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- ESRB table inserts
INSERT INTO ESRB (ESRB_id, ESRB_rating, reasons, game_game_id, game_publisher_publisher_id) VALUES
(1, 'M', 'Blood and Gore, Language, Suggestive Themes, Violence', 1, 1),
(2, 'M', 'Blood and Gore, Intense Violence, Sexual Themes, Use of Alcohol ', 2, 3),
(3, 'E10+', 'Fantasy Violence', 3, 4);

-- franchise table inserts
INSERT INTO franchise (franchise_id, name) VALUES
(1, 'Bandai Namco Entertainment'),
(2, 'The Elder Scrolls'),
(3, 'Minecraft');

-- gamePlatform table inserts
INSERT INTO gamePlatform (platform_id, name, company) VALUES
(1, 'Windows', 'Microsoft'),
(2, 'Playstation 5', 'Sony'),
(3, 'Playstation 4', 'Sony'),
(4, 'Playstation 3', 'Sony'),
(5, 'Xbox Series X/S', 'Microsoft'),
(6, 'Xbox One', 'Microsoft'),
(7, 'Xbox 360', 'Microsoft');

-- gameRegion table inserts
INSERT INTO gameRegion (game_region_id, name, region_code) VALUES 
(1, 'The Americas', "NTSC-U/C"),
(2, 'Japan, South Korea, Taiwan, Hong Kong, Macau, Southeast Asia', 'NTSC-J'),
(3, 'mainland China', 'NTSC-C'),
(4, 'Europe, Australia, New Zealand, India, South Africa', 'PAL');

-- genre table inserts
INSERT INTO genre (genre_id, name) VALUES 
(1, 'Action'),
(2, 'Adventure'),
(3, 'RPG'),
(4, 'Survival Game'),
(5, 'Souls-like');

-- supportedLanguage table inserts
INSERT INTO supportedLanguage (supported_language_id, language, interface, audio, subtitiles) VALUES 
(1, 'English', 1, 1, 1),
(2, 'Spanish', 1, 0, 1),
(3, 'French', 1, 1, 0);

-- investor table inserts
INSERT INTO investor (investor_id, name) VALUES 
(1, 'Investor 1'),
(2, 'Investor 2'),
(3, 'Investor 3');

-- reviewPlatform table inserts
INSERT INTO reviewPlatform (reviewPlatform_id, name) VALUES 
(1, 'Windows'),
(2, 'Playstation 5'),
(3, 'Playstation 4'),
(4, 'Playstation 3'),
(5, 'Xbox Series X/S'),
(9, 'Xbox One'),
(7, 'Xbox 360');

-- site table inserts
INSERT INTO site (site_id, name) VALUES 
(1, 'Steam'),
(2, 'Metacritic'),
(3, 'IGN');

-- review table inserts
INSERT INTO review (review_id, date, rating, total, description, game_game_id, reviewPlatform_reviewPlatform_id, site_site_id) VALUES
(1, '2023-11-22', 2, 2, 'Elden Ring, experienced in its entirety, is the most beautiful art I have ever seen', 1, 1, 1),
(2, '2012-02-05', 100, 100, "This epic role-playing game might be Bethesda's best game yet, and offers an unique and spectacular world filled with fun. The freedom ensures a great experience for both the casual and hardcore gamer, as you're free to play the game how you like.", 2, 7, 2),
(3, '2011-11-23', 9, 10, 'No other video game has unleashed my creativity like Minecraft.', 3, 1, 3),
(4, '2022-12-05', 2, 2, 'Makes me want to cry . . . but still fun!!!!!!!!!!', 1, 1, 1),
(5, '2022-12-05', 10, 10, "Beautiful, challenging to the perfect degree, story could be clearer but fromsoftware have always been gameplay driven. I wasn't expecting their open world entry to be as good as it was.", 1, 2, 2);

-- photo table inserts
INSERT INTO photo (photo_id, date, data, content_content_id, content_game_game_id, content_game_publisher_publisher_id) VALUES
(1, '2022-02-24', 'PATH/TO/IMAGE1.png', 1, 1, 1),
(2, '2011-11-11', 'PATH/TO/IMAGE2.png', 2, 2, 3),
(3, '2011-11-18', 'PATH/TO/IMAGE3.png', 3, 3, 4);

-- video table inserts
INSERT INTO video (video_id, date, data, content_content_id, content_game_game_id, content_game_publisher_publisher_id) VALUES
(1, '2022-02-24', 'PATH/TO/VIDEO1.mp4', 4, 1, 1),
(2, '2011-11-11', 'PATH/TO/VIDEO2.mp4', 5, 2, 3),
(3, '2011-11-18', 'PATH/TO/VIDEO3.mp4', 6, 3, 4);

-- session table inserts
INSERT INTO session (session_id, account_account_id, device_device_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- updateLog table inserts
INSERT INTO updateLog (updateLog_id, last_update_date, game_game_id, game_publisher_publisher_id) VALUES
(1, '2022-03-07 02:31:00', 1, 1),
(2, '2012-02-17 09:26:00', 2, 3),
(3, '2011-12-23 18:54:00',  3, 4);

-- updateEntry table inserts
INSERT INTO updateEntry (updateEntry_id, description, updateLog_updateLog_id, updateLog_game_game_id, updateLog_game_publisher_publisher_id) VALUES
(1, "Improved player controls, Addition and adjustment of BGM, Text adjustments, Balance adjustments, NPC event fixes and adjustments, Fixed frame rate drops under certain conditions, Fixed text bug in some languages", 1, 1, 1),
(2, "Fixed a problem preventing some doors in Rielle from opening properly. Fixed an issue where Russian and Polish notes were not displaying text properly. Fixed an issue where German and French players were given incorrect menu text when leveling up. Fixed an issue where players were experiencing a “black screen” and upon launching", 2, 2, 3),
(3, "Holiday Mash-Up Pack!, The End & everything that comes with The End!, In-game changelogs, 256 world height!", 3, 3, 4),
(4, "Added a function to record an icon and the name of an NPC on the map when you encounter that NPC, Added NPC Jar-Bairn, Added new quest phases for the following NPCs: Diallos/ Nepheli Loux/ Kenneth Haight/ Gatekeeper Gostoc, Added some summonable NPCs in multiple situation, Increased the number of patterns of objects player can imitate when using Mimic’s Veil, Added night background music for some open field area", 1, 1, 1);

-- systemRequirements table inserts
INSERT INTO systemRequirements (systemRequirements_id, os, processor, memory, disk_space, graphics_card, sound_card, game_game_id, game_publisher_publisher_id) VALUES
(1, 'Windows 10', 'INTEL CORE I5-8400 or AMD RYZEN 3 3300X', '12 GB', '60 GB', 'NVIDIA GEFORCE GTX 1060 3 GB or AMD RADEON RX 580 4 GB', 'Windows Compatible Audio Device', 1, 1),
(2, 'Windows XP, Vista or Windows 7', 'Core 2 Duo 2.0 GHz or Althon X2 2.0 GHz', '2 GB', '7GB', 'Direct X 9 compliant video card with 512 MB of RAM', 'DirectX 9 Compatible', 2, 3),
(3, 'Windows 7 and up, Any 64-bit OS X using 10.9 Maverick or newer, Any modern 64-bit distributions from 2014 onwards', 'ntel Core i3-3210 3.2 GHz / AMD A8-7600 APU 3.1 GHz or equivalent', '4GB', 'At least 1GB for game core, maps, and other files', 'Intel HD Graphics 4000 (Ivy Bridge) or AMD Radeon R5 series (Kaveri line) with OpenGL 4.4* or Nvidia GeForce 400 Series or AMD Radeon HD 7000 series with OpenGL 4.4', '', 3, 4);

-- cdn_has_game table inserts
INSERT INTO cdn_has_game (cdn_cdn_id, game_game_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1);

-- publisher_has_investor table inserts
INSERT INTO publisher_has_investor (publisher_publisher_id, investor_investor_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 3),
(4, 2),
(4, 3),
(5, 1),
(6, 2),
(6, 3),
(7, 2);

-- regiseredUser_has_action
INSERT INTO registeredUser_has_action (registeredUser_registeredUser_id, action_action_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- game_has_awardNominations table inserts
INSERT INTO game_has_awardNominations (game_game_id, awardNominations_awardNominations_id) VALUES
(1, 1),
(1, 2),
(2, 3), 
(2, 4),
(3, 5),
(3, 6);

-- game_has_awards table inserts
INSERT INTO game_has_awards (game_game_id, awards_awards_id) VALUES
(1, 1),
(1, 2),
(2, 3), 
(3, 4),
(3, 5);

-- game_has_composer table inserts
INSERT INTO game_has_composer (game_game_id, composer_composer_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- game_has_developer table inserts
INSERT INTO game_has_developer (game_game_id, developer_developer_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- game_has_franchise table inserts
INSERT INTO game_has_franchise (game_game_id, franchise_franchise_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- game_has_gamePlatform
INSERT INTO game_has_gamePlatform (game_game_id, gamePlatform_platform_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(1, 6),
(2, 1),
(2, 4),
(2, 7),
(3, 1);

-- game_has_gameRegion table inserts
INSERT INTO game_has_gameRegion (game_game_id, gameRegion_game_region_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

-- game_has_genre table inserts
INSERT INTO game_has_genre (game_game_id, genre_genre_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(3, 2),
(3, 3),
(3, 4);

-- game_has_supportedLanguage
INSERT INTO game_has_supportedLanguage (game_game_id, supportedLanguage_supported_language_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1);



