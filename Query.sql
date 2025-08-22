SELECT m.title,
       s.show_date,
       s.start_time,
       s.end_time,
       a.name AS screen,
       t.name AS theatre
FROM showtime s
JOIN movie m       ON s.movie_id = m.movie_id
JOIN auditorium a  ON s.auditorium_id = a.auditorium_id
JOIN theatre t     ON a.theatre_id = t.theatre_id
WHERE s.show_date = '2023-04-25'
  AND t.name = 'PVR Nexus Forum'
ORDER BY s.start_time;
