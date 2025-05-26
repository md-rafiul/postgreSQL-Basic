CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) 
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id) ON DELETE CASCADE,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);



-- Assignment

-- Q1
INSERT INTO rangers (ranger_id, name, region) 
VALUES (4, 'Derek Fox', 'Coastal Plains');

SELECT * FROM rangers;

-- Q2
SELECT * FROM sightings;

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- Q3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

-- Q4
SELECT * FROM rangers;
SELECT * FROM sightings;

SELECT rangers.name, COUNT(sightings.sighting_id) AS total_sightings
FROM rangers
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name 
ORDER BY rangers.name ;

-- Q5
SELECT * FROM species;
SELECT * FROM sightings;

SELECT s.common_name
FROM species AS s
LEFT JOIN sightings AS si ON s.species_id = si.species_id
WHERE si.sighting_id IS NULL;

-- Q6
SELECT * FROM sightings;
SELECT * FROM species;
SELECT * FROM rangers;

SELECT sp.common_name, si.sighting_time, r.name
FROM sightings si
JOIN species sp ON si.species_id = sp.species_id
JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;

--q7

SELECT * FROM species;

UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

SELECT * FROM species;

--q9
SELECT * FROM rangers;
SELECT * FROM sightings;

DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);

SELECT * FROM rangers;

-- q8
