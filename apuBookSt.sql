CREATE DATABASE apuBookSt;

CREATE TABLE publisherTable
(
	Publisher_ID nvarchar(50) PRIMARY KEY,
	Publisher_Name nvarchar(255),
	Book_Number int
);

CREATE TABLE memberTable
(
	Member_ID nvarchar(50) PRIMARY KEY,
	Member_Name nvarchar(255),
	Contact_Number nvarchar(50),
	Address nvarchar(255)
);
	
CREATE TABLE bookTable
(
	Book_ID nvarchar(50) PRIMARY KEY,
	Book_Name nvarchar(255),
	Author nvarchar(255),
	Publisher_ID nvarchar(50) FOREIGN KEY REFERENCES publisherTable(Publisher_ID),
	Book_Type nvarchar(255),
	Cost_RM smallmoney,
	Book_Quantity int
);

CREATE TABLE orderTable
(
	Order_ID nvarchar(50) PRIMARY KEY,
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES bookTable(Book_ID),
	Publisher_ID nvarchar(50) FOREIGN KEY REFERENCES publisherTable(Publisher_ID),
	Order_Date date,
	Order_Quantity int
);

CREATE TABLE salesDeliveryTable
(
	Invoice_Num nvarchar(50) PRIMARY KEY,
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES memberTable(Member_ID),
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES bookTable(Book_ID),
	Purchase_Quantity int,
	Purchase_Date date,
	Delivery_Day date,
	Status_Of_Delivery nvarchar(255)
);

CREATE TABLE ratingTable
(
	Rating_ID nvarchar(50) PRIMARY KEY,
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES memberTable(Member_ID),
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES bookTable(Book_ID),
	Rating int,
	Feedback nvarchar(999)
);

INSERT INTO orderTable
Values('O01', 'B01', 'P01', '28 Feb 2017', '1'),
	  ('O02', 'B03', 'P01', '7 Apr 2017', '3'),
	  ('O03', 'B05', 'P06', '14 Nov 2017', '9'),
 	  ('O04', 'B07', 'P07', '2 Jun 2018', '15'),
 	  ('O05', 'B09', 'P09', '19 Oct 2018', '2'),
 	  ('O06', 'B11', 'P11', '27 Apr 2019', '1'),
	  ('O07', 'B13', 'P13', '1 May 2019', '1'),
	  ('O08', 'B15', 'P15', '8 Dec 2019', '1'),
	  ('O09', 'B17', 'P17', '11 Dec 2019', '2'),
	  ('O10', 'B19', 'P19', '24 Jun 2020', '3'),
	  ('O11', 'B21', 'P12', '12 Dec 2020', '3'),
	  ('O12', 'B23', 'P23', '19 Jan 2021', '4'),
	  ('O13', 'B25', 'P02', '26 Apr 2021', '18'),
	  ('O14', 'B27', 'P02', '28 Aug 2021', '5'),
	  ('O15', 'B10', 'P04', '21 May 2022', '3');

INSERT INTO publisherTable
Values('P01', 'Harper Perennial', '2'),
	  ('P02', 'Random House Audio', '3'),
	  ('P04', 'Penguin Books', '2'),
	  ('P05', 'Audible Studios', '2'),
	  ('P06', 'Crown Publishing, Inc', '1'),
	  ('P07', 'Millbrook Press ™', '1'),
	  ('P08', 'Phaidon Press', '1'),
	  ('P09', 'Penguin Classics', '2'),
	  ('P11', 'Chronicle Books', '1'),
	  ('P12', 'Vintage', '3'),
	  ('P13', 'The Church of Jesus Christ of Latter-day Saints', '1'),
	  ('P14', 'Anna Travis', '1'),
	  ('P15', 'Deseret Book Company', '1'),
	  ('P16', 'Mariner Books', '2'),
	  ('P17', 'Three Rivers Press', '1'),
	  ('P19', 'Recorded Books', '1'),
	  ('P20', 'William Morrow', '1'),
	  ('P23', 'Simon & Schuster Audio', '2'),
	  ('P24', 'the House Family', '0'),
	  ('P30', 'Endgame', '0');

INSERT INTO memberTable
Values('M01', 'Reinaldo Page', '+60 14-400 6891', '191 TAMAN KOK DOH, Kuala Lumpur, W.P. Kuala Lumpur, 51200'),
	  ('M02', 'Dominique Howe', '+60 11-8886 9181', '1 The Summit 1.13A Psn Kewajipan (Usj1) Taman Seafield Jaya, Petaling Jaya, Selangor, 47610'),
	  ('M03', 'Mary Melton', '+60 11-8886 1807', 'Seksyen U1, Hicom Glenmarie Industrial Park, Shah Alam, Selangor, 40150'),
	  ('M04', 'Marcelo Wright', '+60 14-400 0289', '6Th Floor Wisma Academy Jln 19/1 Seksyen 19, Petaling Jaya, Selangor, 46300'),
	  ('M05', 'Bill Levine', '+60 10-467 3533', 'No. 15 Jln Bangsar Kuala Lumpur, W.P. Kuala Lumpur, 59200'),
	  ('M06', 'Asa Jefferson', '+60 11-7507 4019', 'B-1656, Lorong Galing 63, Kuantan, Pahang, 25300'),
	  ('M07', 'Deandre Nicholson', '+60 18-871 2177', 'Jalan Usj10/1E Taipan Business Centre, Uep , SGR, Subang Jaya, Selangor, 47620'),
	  ('M08', 'Martha Oconnor', '+60 18-474 9692', '9K B Jln Tun Abdul Razak (Susur 4), Johor Bahru, Johor, 80000'),
	  ('M09', 'Lynn Sherman', '+60 11-7525 0356', 'Jalan Kilang Tiga, Kawasan Perindustrian Ringan Jelapang, Ipoh, Perak, 30750'),
	  ('M10', 'Amanda Cline', '+60 18-400 9662', 'L1 09 Bangunan Jotic 2 Jalan Ayer Molek, Johor Bahru, Johor, 80000'),
	  ('M11', 'Earlene Savage', '+60 11-4948 2967', '25 Jln Sri Perkasa 2/18 Taman Tampoi Utama, Johor Bahru, Johor, 81200'),
	  ('M12', 'Kirk Calderon', '+60 18-820 7867', '143 Jln Tunku Hassan, Seremban, Negeri Sembilan, 70000'),
	  ('M13', 'Darlene Fletcher', '+60 14-400 3423', '61 Jln Cheras Batu 11, Kajang, Selangor, 43000'),
	  ('M14', 'Danial Jarvis', '+60 18-874 7077', 'No. 133 Jln Kapar Batu 2 1/2, Klang, Selangor, 41400'),
	  ('M15', 'Sasha Esparza', '+60 18-874 7077', 'G 14 Jln Pjs 10/32 Taman Sri Subang, Petaling Jaya, Selangor, 46000'),
	  ('M16', 'Tony Matthews', '+60 14-400 6414', 'No. 4 Jln Kuari Kampung Cheras Baru, Kuala Lumpur, W.P Kuala Lumpur, 56100'),
	  ('M17', 'Pamela Ferrell', '+60 11-7003 4070', '701 Jalan Gunong Rapat Kampung Baru Gunong Rapat, Ipoh, Perak, 21350'),
	  ('M18', 'Hans Pacheco', '+60 10-419 5948', 'Jalan Kempas Kempas Bahru 81200, Johor Bahru, Johor, 42965');

INSERT INTO bookTable
Values('B01', 'How to Read Literature Like a Professor', 'Thomas C. Foster', 'P01', 'Online', '42', '3'),
	  ('B02', 'The Wave: In Pursuit of the Rogues, Freaks and Giants of the Ocean', 'Susan Casey', 'P02', 'Paper', '88', '5'),
	  ('B03', 'To Kill a Mockingbird (Enhanced Edition) (Harperperennial Modern Classics)', 'Harper Lee', 'P01', 'Online', '49', '10'),
	  ('B04', 'Of Mice and Men', 'John Steinbeck ', 'P04', 'Online', '47.55', '13'),
	  ('B05', 'The Great Gatsby', 'F. Scott Fitzgerald', 'P05', 'Online', '22', '100'),
	  ('B06', 'Indian Givers: How the Indians of the Americas Transformed the World', 'Jack Weatherford', 'P06', 'Online', '57.20', '15'),
	  ('B07', 'But and For, Yet and Nor: What Is a Conjunction? (Words Are CATegorical ®)', 'Brian P. Cleary', 'P07', 'Paper', '35.20', '29'),
	  ('B08', 'The Story of Art', 'E.H. Gombrich', 'P08', 'Paper', '83.65', '12'),
	  ('B09', 'The Letters of Vincent van Gogh (Penguin Classics)', 'Harper Lee', 'P09', 'Paper', '80.97', '3'),
	  ('B10', 'Ways of Seeing: Based on the BBC Television Series (Penguin Books for Art)', 'John Berger', 'P04', 'Paper', '788.04', '5'),
	  ('B11', 'Alexandria: In Which the Extraordinary Correspondence of Griffin & Sabine Unfolds', 'Nick Bantock', 'P11', 'Paper', '164.88', '19'),
	  ('B12', 'The Death and Life of Great American Cities', 'Jane Jacobs ', 'P12', 'Online', '52.79', '54'),
	  ('B13', 'LDS Hymnbook - Large - Spiral Bound', 'The Church of Jesus Christ of Latter-day Saints', 'P13', 'Paper', '260.46', '1'),
	  ('B14', 'The Pillar of Light: A Christian Fantasy Adventure: The Milana Legends, Book 1', 'Anna Travis', 'P14', 'Online', '21.97', '0'),
	  ('B15', 'The Peacegiver: How Christ Offers to Heal Our Hearts and Homes', 'James L. Ferrell', 'P15', 'Online', '57.19', '2'),
	  ('B16', 'Fun Home: A Family Tragicomic', ' Alison Bechdel', 'P16', 'Paper', '55.21', '34'),
	  ('B17', 'Look Me in the Eye: My Life with Asperger''s', 'John Elder Robison', 'P17', 'Paper', '51.47', '10'),
	  ('B18', 'Prozac Nation: Young and Depressed in America', 'Elizabeth Wurtzel', 'P16', 'Online', '35.18', '1'),
	  ('B19', 'Infidel', 'Ayaan Hirsi Ali', 'P19', 'Online', '61.59', '0'),
	  ('B20', 'Marley & Me: Life and Love with the World''s'' Worst Dog', 'John Grogan', 'P20', 'Online', '31.35', '19'),
	  ('B21', 'Wild: From Lost to Found on the Pacific Crest Trail', 'Cheryl Strayed', 'P12', 'Online', '57.19', '14'),
	  ('B22', 'Testament of Youth (Penguin Classics)', 'Vera Brittain', 'P09', 'Paper', '78.98', '2'),
	  ('B23', 'Angela''s'' Ashes', 'Frank McCourt', 'P23', 'Online', '61.59', '23'),
	  ('B24', 'Such Unfortunates', 'Andrew Mann', 'P24', 'Online', '0', '0'),
	  ('B25', 'Becoming', 'Michelle Obama', 'P02', 'Online', '57.19', '67'),
	  ('B26', 'The Woman Warrior: Memoirs of a Girlhood Among Ghosts', 'Maxine Hong Kingston', 'P05', 'Online', '52.79', '11'),
	  ('B27', 'The Life and Times of the Thunderbolt Kid: A Memoir', 'Bill Bryson', 'P02', 'Online', '43.98', '89'),
	  ('B28', 'A Moveable Feast', 'Ernest Hemingway', 'P23', 'Online', '17.57', '1'),
	  ('B29', 'The Diving Bell and the Butterfly: A Memoir of Life in Death', 'Jean-Dominique Bauby', 'P12', 'Paper', '48.39', '22'),
	  ('B30', 'The End: There Is No End (Director''s'' Edition)', 'Godson Holy', 'P30', 'Paper', '4,398.30', '0');

INSERT INTO salesDeliveryTable
Values('I01', 'M02', 'B03', '2', '6 March 2020', '15 March 2020', 'Delivered'),
	  ('I02', 'M03', 'B04', '3', '17 March 2020', '1 April 2020', 'Delivered'),
	  ('I03', 'M04', 'B05', '10', '21 Apr 2020', '4 May 2020', 'Delivered'),
	  ('I04', 'M05', 'B06', '1', '8 May 2020', '29 May 2020', 'Delivered'),
	  ('I05', 'M06', 'B07', '5', '23 July 2020', '30 July 2020', 'Delivered'),
	  ('I06', 'M07', 'B08', '3', '19 Sep 2020', '8 October 2020', 'Delivered'),
	  ('I07', 'M08', 'B09', '1', '15 Dec 2020', '2 January 2021', 'Delivered'),
	  ('I08', 'M09', 'B10', '2', '22 Feb 2021', '3 March 2021', 'Delivered'),
	  ('I09', 'M01', 'B03', '6', '25 Apr 2021', '10 May 2021', 'Delivered'),
	  ('I10', 'M14', 'B01', '2', '16 Aug 2021', '20 Sep 2021', 'Delivered'),
	  ('I11', 'M18', 'B02', '1', '11 Oct 2021', '2 Dec 2021', 'Delivered'),
	  ('I12', 'M15', 'B28', '1', '21 Jan 2022', '4 Jan 2022', 'Delivered'),
	  ('I13', 'M02', 'B23', '2', '21 Feb 2022', '4 Mar 2022', 'Delivered'),
	  ('I14', 'M17', 'B29', '3', '7 Apr 2022', '23 May 2022', 'Not Delivered'),
	  ('I15', 'M10', 'B18', '1', '21 May 2022', '4 June 2022', 'Not Delivered'),
	  ('I16', 'M08', 'B15', '1', '22 May 2022', '4 June 2022', 'Not Delivered'),
	  ('I17', 'M08', 'B23', '3', '22 May 2022', '23 May 2022', 'Not Delivered'),
	  ('I18', 'M03', 'B07', '2', '23 May 2022', '27 May 2022', 'Not Delivered'),
	  ('I19', 'M15', 'B01', '1', '23 May 2022', '1 Jun 2022', 'Not Delivered'),
	  ('I20', 'M09', 'B09', '1', '24 May 2022', '8 Jun 2022', 'Not Delivered'),
	  ('I21', 'M17', 'B16', '4', '25 May 2022', '31 May 2022', 'Not Delivered'),
	  ('I22', 'M18', 'B03', '1', '25 May 2022', '29 June 2022', 'Not Delivered'),
	  ('I23', 'M14', 'B13', '1', '27 May 2022', '23 July 2022', 'Not Delivered'),
	  ('I24', 'M04', 'B26', '2', '28 May 2022', '11 Jun 2022', 'Not Delivered'),
	  ('I25', 'M16', 'B27', '7', '28 May 2022', '8 Jun 2022', 'Not Delivered'),
	  ('I26', 'M13', 'B08', '5', '30 May 2022', '15 Jun 2022', 'Not Delivered'),
	  ('I27', 'M17', 'B11', '6', '31 May 2022', '16 Jun 2022', 'Not Delivered');

INSERT INTO ratingTable
Values('R01', 'M01', 'B01', '10', 'How to Read Literature Like a Professor does not read like a textbook. It''s'' a fun read that definitely taught me something (or multiple somethings!). It also inspired me to read more of the classics, as Foster references many works again and again throughout the book. When I finished, I purchased an anthology of American short stories to start practicing on!'),
	  ('R02', 'M02', 'B03', '10', 'Classic story of growing up in the Deep South during the Depression and dealing with racial injustice. I had never read this book before and only seen the movie once, but when "Go Set a Watchman" came out this summer, it sparked my desire to read it. I''m'' really glad I did. I can understand why the book is so beloved and has been such a powerful influence over the decades. Harper Lee''s'' storytelling and characterizations are spellbinding, and so is the beauty of her writing. I just started reading "Go Set a Watchman" a few days ago after finishing this and I am enjoying it too. I can only imagine how it must feel for someone who has read and reread this book over the years to finally learn what happens to the characters as they grow older'),
	  ('R03', 'M03', 'B05', '2', 'I purchased the kindle edition from this page and it is unreadable... I struggled through the first few paragraphs thinking that maybe Fitzgerald had a very strange writing style.. but it became evident quickly that this Kindle edition is a mess. I have never tried to "return" a kindle purchase before.. so lets see how that goes.'),
	  ('R04', 'M05', 'B07', '8', 'My only critique is the font they use inside the book is almost hard to read. It''s'' all over the page and different sizes. The words that are conjunctions are in different colors, that helps, but I think they could have done a bit better.'),
	  ('R05', 'M06', 'B09', '4', 'Featuring a good selection of Vincent''s'' letters to Theo and a few to others such as his sister Wil and his friend Paul Gaugin, this volume offers some insightful commentary, especially in the introduction. Passages that connect the selected letters are sometimes less than helpful, as they tend to summarize the content of the missive you''re'' about to read; Vincent''s'' letters, while they show the wide scope of his interest (as well as his limits at times), are fairly straightforward and don''t'' really require that sort of treatment to be understood. Translations of terms, phrases and passages in French were very much appreciated.'),
	  ('R06', 'M07', 'B02', '4', 'I wanted to learn more about documented Wave recordings and the scientific observations. This book glosses over the science and just states matter of fact like that the IPCC says this and the IPCC says that. The author just swallows the notion that oceans are rising rapidly but provides no evidence at all. Most of the book is about her infatuation with a few surfers living in Hawii and the code by which they live. I found the book of little use, although it reads quickly and taught me more about surfing locations than I ever really wanted to know.'),
	  ('R07', 'M08', 'B04', '10', 'The best laid plans of men and mice often go awry. Such a short book, only 112 pages, but its powerful. Not an awful lot happens, the pace is slow, your strolling. Your meet George, Lennie, spend two days together and finish where you started but I''m'' sure you wont feel the same. I didnt expect much from this novella, total credit to Steinback, he has created a lot in very few words. In fact I''ve'' read much longer books that will prove to be less memorable. This is a definite cigarettes and whiskey kind of book and well worth reading.'),
	  ('R08', 'M10', 'B06', '8', ' Ahhh, the smell of old paper and anthropology, the tiny print and the dense prose, the depth of research and detail -- this is the stuff of hard thought and random naps. It only takes half a minute to dissuade a Gen Z-er from asking a follow-up to, "Hey gramps! Whatcha reading?" That of course would never happen because I don''t'' post pictures of myself napping on Facebook. '),
	  ('R09', 'M11', 'B08', '1', 'This book is the story of art for men, by men, of men, It reeks of patriarchy. 17 editions over 70 years and apart from one page, its all wall to wall men. Sooooo boring. .... I can''t'' even be bothered to start writing all the women who could have been in there .... I can''t'' put them all down here ... who would I leave out?'),
	  ('R10', 'M13', 'B10', '1', ' Goes in the trash. Wish I’d read the one- and two-star reviews before I wasted my money. Pages are card stock. Print is San serif, which as a former reading teacher made me want to scream. One prints titles in San serif, not in text. The eye needs the serif type to lead it along and not tire the eye. The message of the book is a plea for the reader to help pull down capitalism. If I wanted a book on socialism and communism I could certainly find a more readable book than this. It wasn’t even a good book on art. Much too many pictures of naked women and poorly printed, at that. I want my money back. '),
	  ('R11', 'M14', 'B12', '9', 'Jane Jacobs efforts alongside of this, her landmark effort helped finally to put a stop to Robert Moses'' '' systematic modernization of New York City''s'' highway system at the expense of old New York neighborhood communities and the destruction of such architectural greatness during the 1950-1960''s'' such as the old Penn Station. It was this work which finally led the way for the creation of the New York Landmark Society. This is a fascinating study in the numerous trade-offs we make along with the irreversible side effects, all in the name of Modernism...'),
	  ('R12', 'M15', 'B11', '10', 'These books are so innovative and just keep getting better and better. Every page is a surprise. Told in correspondence consisting of postcards and letters you can remove from their individual envelopes, this book can be read in one sitting. But you will savor each second and flip back through to read and ponder some more. Get the series of books. They’re all a real pleasure!'),
	  ('R13', 'M16', 'B28', '9', 'I love this book. I am not sure why I didn''t'' read it a long time ago, but I am glad that I finally got around to it. This book is like a mini-vacation, roaming around Paris in the 20''s'' with Earnest Hemingway and all of his starving artist friends. It is a natural companion to "The Paris Wife", which was very popular a few years back. I wish I had read this book before we visited Paris last summer. As far as I can tell, a lot of Paris is unchanged, and we stayed on the left bank where we followed in many of Hemingway''s'' footsteps. I also enjoyed reading "The Lodger," a book which Gertrude Stein recommends to Hemingway when they discuss the best books that they have been reading. It was a lot of fun, feeling like a member of the Hemingway and Gertrude Stein book club, and extended my adventure.'),
	  ('R14', 'M17', 'B20', '10', 'What a wonderful book. We had a Lab/Shepherd mix for 15 years who was the image of St Shaun, but his heart was just like Marley’s. Thirty years after his death, I still se little clones running around Lake Placid. He was a busy boy. Seeing his 3rd, 4th and 5th generation descendants make me miss him still. Marley has brought back all that love like nothing else I’ve ever read.'),
	  ('R15', 'M18', 'B24', '10', 'This is a direct no holds barred memoir by a heroin addict. Andrew''s'' thesis is that 99% of addicts ssuffered from some form of child abuse. While there are many theories about what causes addiction,I respect his theory. This book is not for the faint of heart. Nor is it by any stretch of the imagination entertaining. It''s'' a book that explores the impact of addiction on the author''s'' life. Relapse after relapse are palpable. It''s'' a wonder that he didn''t'' die. While in the end he has beaten his addiction the fact remains that lives each day walking a straight line with the love and support of his family. I pray that he successfully continues in his recovery.'),
	  ('R16', 'M12', 'B24', '1', 'This was a horrible book to get in to. One relapse after another and each chapter sounded like the last. Boring.'),
	  ('R17', 'M07', 'B01', '1', 'This was required reading for my child''s'' class. Many inappropriate references and SO hard to read. It most definitely was NOT lively or entertaining!');

--- base select
SELECT * FROM bookTable;
SELECT * FROM memberTable;
SELECT * FROM publisherTable;
SELECT * FROM orderTable;
SELECT * FROM salesDeliveryTable;
SELECT * FROM ratingTable;

--- drop function()
DROP DATABASE apuBookSt;
DROP TABLE bookTable;
DROP TABLE publisherTable;
DROP TABLE memberTable;
DROP TABLE orderTable;
DROP TABLE salesDeliveryTable;
DROP TABLE ratingTable;

--- query select
--i. List the book(s) which has the highest rating. Show book id, book name, and the rating.
SELECT bookTable.Book_Name, ratingTable.Book_ID, ratingTable.Rating 
FROM bookTable
LEFT JOIN ratingTable
ON bookTable.Book_ID = ratingTable.Book_ID
WHERE ratingTable.Rating = '10';

---ii.	Find the total number of feedback per member. Show member id, member name, and total number of feedback per member.
SELECT ratingTable.Member_ID, memberTable.Member_Name, COUNT(Feedback) as NumOfFeedbackPerMember
FROM memberTable 
INNER JOIN ratingTable 
ON memberTable.Member_ID = ratingTable.Member_ID
GROUP BY ratingTable.Member_ID, memberTable.Member_Name;

---iii.	Find the total number of book published by each publisher. Show publisher id, publisher name, and number of book published.
SELECT publisherTable.Publisher_ID, publisherTable.Publisher_Name, COUNT(publisherTable.Publisher_ID) as NumOfBookPublished
FROM bookTable 
INNER JOIN publisherTable 
ON bookTable.Publisher_ID = publisherTable.Publisher_ID
GROUP BY publisherTable.Publisher_ID, publisherTable.Publisher_Name;

---iv.	Find the total number of books ordered by store manager from each publisher.
SELECT orderTable.Publisher_ID, orderTable.Book_ID, orderTable.Order_Quantity AS NumOfBookOrdered FROM orderTable;

---v. from the book table, list the books where quantity is more than the average quantity of all books. 
SELECT Book_Name, Book_Quantity
FROM bookTable
GROUP BY Book_Name, Book_Quantity
HAVING Book_Quantity > (SELECT AVG(Book_Quantity) FROM bookTable);

---vi.	Find the bestselling book(s).
SELECT TOP 3 bookTable.Book_Name, ratingtable.Rating, salesDeliveryTable.Purchase_Quantity
FROM bookTable
INNER JOIN ratingTable 
ON bookTable.Book_ID = ratingTable.Book_ID
INNER JOIN salesDeliveryTable
ON ratingTable.Book_ID = salesDeliveryTable.Book_ID
GROUP BY bookTable.Book_Name, ratingtable.Rating, salesDeliveryTable.Purchase_Quantity
HAVING Rating >= '10' AND Purchase_Quantity > (SELECT AVG(Purchase_Quantity) FROM salesDeliveryTable) OR Purchase_Quantity >= (SELECT MAX(Purchase_Quantity) FROM salesDeliveryTable)
ORDER BY Purchase_Quantity DESC;

---vii. Show the member(s) who spent most on buying books.
SELECT memberTable.Member_Name, bookTable.Cost_RM*Purchase_Quantity AS TotalPriceTimesPurchaseQuantity
FROM memberTable
INNER JOIN salesDeliveryTable
ON memberTable.Member_ID = salesDeliveryTable.Member_ID
INNER JOIN bookTable
ON salesDeliveryTable.Book_ID = bookTable.Book_ID
GROUP BY memberTable.Member_Name, bookTable.Cost_RM, salesDeliveryTable.Purchase_Quantity
HAVING Cost_RM >= (SELECT AVG(Cost_RM) FROM bookTable);

---viii. Show the member(s) who had not make any order
SELECT memberTable.Member_Name, memberTable.Member_ID
FROM memberTable
LEFT JOIN salesDeliveryTable
ON memberTable.Member_ID = salesDeliveryTable.Member_ID
GROUP BY memberTable.Member_Name, memberTable.Member_ID
HAVING memberTable.Member_ID NOT IN (SELECT Member_ID FROM salesDeliveryTable);

---ix. A list of purchased books that have not been delivered to members. The list should show member identification number, address, contact number, book serial number, book title, quantity, date and status of delivery.
SELECT memberTable.Member_ID, memberTable.Address, memberTable.Contact_Number, salesDeliveryTable.Book_ID, bookTable.Book_Name, salesDeliveryTable.Purchase_Quantity, salesDeliveryTable.Purchase_Date, salesDeliveryTable.Status_Of_Delivery
FROM memberTable
INNER JOIN salesDeliveryTable
ON memberTable.Member_ID = salesDeliveryTable.Member_ID
INNER JOIN bookTable
ON salesDeliveryTable.Book_ID = bookTable.Book_ID
GROUP BY memberTable.Member_ID, memberTable.Address, memberTable.Contact_Number, salesDeliveryTable.Book_ID, bookTable.Book_Name, salesDeliveryTable.Purchase_Quantity, salesDeliveryTable.Purchase_Date, salesDeliveryTable.Status_Of_Delivery
HAVING Status_Of_Delivery = 'Not Delivered';

---x. Show the members who made more than 2 orders.
SELECT memberTable.Member_Name, memberTable.Member_ID, COUNT(Invoice_Num) AS NumOfInvoice
FROM memberTable
INNER JOIN salesDeliveryTable
ON memberTable.Member_ID  = salesDeliveryTable.Member_ID
GROUP BY memberTable.Member_name, memberTable.Member_ID
HAVING COUNT(Invoice_Num) > 2;
