--
-- Sample dataset containing a number of Hotels in various Cities across the world.
--

-- =================================================================================================
-- AUSTRALIA

-- Brisbane
insert into city(country, name, state, map) values ('Australia', 'Brisbane', 'Queensland', '-27.470933, 153.023502')
insert into hotel(city_id, name, address, zip) values (1, 'Conrad Treasury Place', 'William & George Streets', '4001')

-- Melbourne
insert into city(country, name, state, map) values ('Australia', 'Melbourne', 'Victoria', '-37.813187, 144.96298')
insert into hotel(city_id, name, address, zip) values (2, 'The Langham', '1 Southgate Ave, Southbank', '3006')

-- Sydney
insert into city(country, name, state, map) values ('Australia', 'Sydney', 'New South Wales', '-33.868901, 151.207091')
insert into hotel(city_id, name, address, zip) values (3, 'Swissotel', '68 Market Street', '2000')


-- =================================================================================================
-- CANADA

-- Montreal
insert into city(country, name, state, map) values ('Canada', 'Montreal', 'Quebec', '45.508889, -73.554167')
insert into hotel(city_id, name, address, zip) values (4, 'Ritz Carlton', '1228 Sherbrooke St', 'H3G1H6')


-- =================================================================================================
-- ISRAEL

-- Tel Aviv
insert into city(country, name, state, map) values ('Israel', 'Tel Aviv', '', '32.066157, 34.777821')
insert into hotel(city_id, name, address, zip) values (5, 'Hilton Tel Aviv', 'Independence Park', '63405')


-- =================================================================================================
-- JAPAN

-- Tokyo
insert into city(country, name, state, map) values ('Japan', 'Tokyo', '', '35.689488, 139.691706')
insert into hotel(city_id, name, address, zip) values (6, 'InterContinental Tokyo Bay', 'Takeshiba Pier', '105')


-- =================================================================================================
-- SPAIN

-- Barcelona
insert into city(country, name, state, map) values ('Spain', 'Barcelona', 'Catalunya', '41.387917, 2.169919')
insert into hotel(city_id, name, address, zip) values (7, 'Hilton Diagonal Mar', 'Passeig del Taulat 262-264', '08019')

-- =================================================================================================
-- SWITZERLAND

-- Neuchatel
insert into city(country, name, state, map) values ('Switzerland', 'Neuchatel', '', '46.992979, 6.931933')
insert into hotel(city_id, name, address, zip) values (8, 'Hotel Beaulac', ' Esplanade Leopold-Robert 2', '2000')


-- =================================================================================================
-- UNITED KINGDOM

-- Bath
insert into city(country, name, state, map) values ('UK', 'Bath', 'Somerset', '51.381428, -2.357454')
insert into hotel(city_id, name, address, zip) values (9, 'The Bath Priory Hotel', 'Weston Road', 'BA1 2XT')
insert into hotel(city_id, name, address, zip) values (9, 'Bath Travelodge', 'Rossiter Road, Widcombe Basin', 'BA2 4JP')

-- London
insert into city(country, name, state, map) values ('UK', 'London', '', '51.500152, -0.126236')
insert into hotel(city_id, name, address, zip) values (10, 'Melia White House', 'Albany Street', 'NW1 3UP')

-- Southampton
insert into city(country, name, state, map) values ('UK', 'Southampton', 'Hampshire', '50.902571, -1.397238')
insert into hotel(city_id, name, address, zip) values (11, 'Chilworth Manor', 'The Cottage, Southampton Business Park', 'SO16 7JF')


-- =================================================================================================
-- USA

-- Atlanta
insert into city(country, name, state, map) values ('USA', 'Atlanta', 'GA', '33.748995, -84.387982')
insert into hotel(city_id, name, address, zip) values (12, 'Marriott Courtyard', 'Tower Place, Buckhead', '30305')
insert into hotel(city_id, name, address, zip) values (12, 'Ritz Carlton', 'Peachtree Rd, Buckhead', '30326')
insert into hotel(city_id, name, address, zip) values (12, 'Doubletree', 'Tower Place, Buckhead', '30305')

-- Chicago
insert into city(country, name, state, map) values ('USA', 'Chicago', 'IL', '41.878114, -87.629798')
insert into hotel(city_id, name, address, zip) values (13, 'Hotel Allegro', '171 West Randolph Street', '60601')

-- Eau Claire
insert into city(country, name, state, map) values ('USA', 'Eau Claire', 'WI', '44.811349, -91.498494')
insert into hotel(city_id, name, address, zip) values (14, 'Sea Horse Inn', '2106 N Clairemont Ave', '54703')
insert into hotel(city_id, name, address, zip) values (14, 'Super 8 Eau Claire Campus Area', '1151 W Macarthur Ave', '54701')

-- Hollywood
insert into city(country, name, state, map) values ('USA', 'Hollywood', 'FL', '26.011201, -80.14949')
insert into hotel(city_id, name, address, zip) values (15, 'Westin Diplomat', '3555 S. Ocean Drive', '33019')

-- Miami
insert into city(country, name, state, map) values ('USA', 'Miami', 'FL', '25.788969, -80.226439')
insert into hotel(city_id, name, address, zip) values (16, 'Conrad Miami', '1395 Brickell Ave', '33131')

-- Melbourne
insert into city(country, name, state, map) values ('USA', 'Melbourne', 'FL', '28.083627, -80.608109')
insert into hotel(city_id, name, address, zip) values (17, 'Radisson Suite Hotel Oceanfront', '3101 North Hwy', '32903')

-- New York
insert into city(country, name, state, map) values ('USA', 'New York', 'NY', '40.714353, -74.005973')
insert into hotel(city_id, name, address, zip) values (18, 'W Union Hotel', 'Union Square, Manhattan', '10011')
insert into hotel(city_id, name, address, zip) values (18, 'W Lexington Hotel', 'Lexington Ave, Manhattan', '10011')
insert into hotel(city_id, name, address, zip) values (18, '70 Park Avenue Hotel', '70 Park Avenue', '10011')

-- Palm Bay
insert into city(country, name, state, map) values ('USA', 'Palm Bay', 'FL', '28.034462, -80.588665')
insert into hotel(city_id, name, address, zip) values (19, 'Jameson Inn', '890 Palm Bay Rd NE', '32905')

-- San Francisco
insert into city(country, name, state, map) values ('USA', 'San Francisco', 'CA', '37.77493, -122.419415')
insert into hotel(city_id, name, address, zip) values (20, 'Marriot Downtown', '55 Fourth Street', '94103')

-- Washington
insert into city(country, name, state, map) values ('USA', 'Washington', 'DC', '38.895112, -77.036366')
insert into hotel(city_id, name, address, zip) values (21, 'Hotel Rouge', '1315 16th Street NW', '20036')

-- Account data
insert into account (NUMBER, NAME) values ('123456789', 'Keri Lee');
insert into account (NUMBER, NAME) values ('123456001', 'Dollie R. Schnidt');
insert into account (NUMBER, NAME) values ('123456002', 'Cornelia J. LeClerc');
insert into account (NUMBER, NAME) values ('123456003', 'Cynthia Rau');
insert into account (NUMBER, NAME) values ('123456004', 'Douglas R. Cobbs');
insert into account (NUMBER, NAME) values ('123456005', 'Michael Patel');
insert into account (NUMBER, NAME) values ('123456006', 'Suzanne Wong');
insert into account (NUMBER, NAME) values ('123456007', 'Ivan C. Jaya');
insert into account (NUMBER, NAME) values ('123456008', 'Ida Ketterer');
insert into account (NUMBER, NAME) values ('123456009', 'Laina Ochoa Lucero');
insert into account (NUMBER, NAME) values ('123456010', 'Wesley M. Montana');
insert into account (NUMBER, NAME) values ('123456011', 'Leslie F. McCleary');
insert into account (NUMBER, NAME) values ('123456012', 'Sayeed D. Mudra');
insert into account (NUMBER, NAME) values ('123456013', 'Pietronella J. Domingo');
insert into account (NUMBER, NAME) values ('123456014', 'John S. O''Leary');
insert into account (NUMBER, NAME) values ('123456015', 'Gladys D. Smith');
insert into account (NUMBER, NAME) values ('123456016', 'Sally O. Thygesen');
insert into account (NUMBER, NAME) values ('123456017', 'Rachel Vogt');
insert into account (NUMBER, NAME) values ('123456018', 'Julia DeLong');
insert into account (NUMBER, NAME) values ('123456019', 'Mark T. Rizzoli');
insert into account (NUMBER, NAME) values ('123456020', 'Maria J. Angelo');
