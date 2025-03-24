-- Case #001: The Vanishing Briefcase

-- Relevant information - Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge. A witness reported that a man in a trench coat was seen fleeing the scene. Investigate the crime scene, review the list of suspects, and examine interview transcripts to reveal the culprit.

-- Objective 1 - Retrieve the correct crime scene details to gather the key clue.

-- SQL Query:
SELECT
	date, description
FROM
	crime_scene
WHERE
	location = 'Blue Note Lounge'
;

-- Output:
-- date		description
-- 19851120	A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.

-- Objective 2 - Identify the suspect whose profile matches the witness description.

-- SQL Query:
SELECT
	id, name
FROM
	suspects
WHERE
	attire = 'trench coat' AND scar = 'left cheek'
;

-- Output:
-- id	name
-- 3	Frankie Lombardi
-- 183	Vincent Malone


-- Objective 3 - Verify the suspect using their interview transcript.

-- SQL Query:
SELECT
	s.id, s.name, i.transcript
FROM
	suspects s
INNER JOIN
	interviews i ON i.suspect_id = s.id
WHERE
	s.id IN ('3', '183')
;

-- Output:
-- suspect_id	transcript
-- 3		NULL
-- 183		I wasn’t going to steal it, but I did.

-- Final Answer: Vincent Malone

-- Case #002: The Stolen Sound

-- Relevant information - In the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and bring them to justice.

-- Objective 1 - Retrieve the crime scene report for the record theft using the known date and location.

-- SQL Query:
SELECT
	id,
	date,
	description
FROM
	crime_scene
WHERE
	location = 'West Hollywood Records'
;

-- Output:
-- id	date		description
-- 65	19830715	A prized vinyl record was stolen from the store during a busy evening.

-- Objective 2 - Retrieve witness records linked to that crime scene to obtain their clues.

-- SQL Query:
SELECT
	clue,
FROM
	witnesses
WHERE
	crime_scene_id = '65'
;

-- Output:
-- clue
-- I saw a man wearing a red bandana rushing out of the store.
-- The main thing I remember is that he had a distinctive gold watch on his wrist.

-- Objective 3 - Use the clues from the witnesses to find the suspect in the suspects table.

-- SQL Query:
SELECT
	id, name
FROM
	suspects
WHERE
	bandana_color = 'red'
AND
	accessory = 'gold watch'
;

-- Output:
-- id	name
-- 35	Tony Ramirez
-- 44	Mickey Rivera
-- 97	Rico Delgado

-- Objective 4 - Retrieve the suspect's interview transcript to confirm the confession.

-- SQL Query:
SELECT 
    s.name,
    i.transcript
FROM 
    suspects s
INNER JOIN 
    interviews i ON s.id = i.suspect_id
WHERE 
    s.id IN (35, 44, 97);

-- Output:
-- name			transcript
-- Tony Ramirez		I wasn't anywhere near West Hollywood Records that night.
-- Mickey Rivera	I was busy with my music career; I have nothing to do with this theft.
-- Rico Delgado		I couldn't help it. I snapped and took the record.

-- Final Answer: Rico Delgado
