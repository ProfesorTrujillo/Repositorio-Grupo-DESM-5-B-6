-- 1. Total de respuestas por encuesta
SELECT s.title, COUNT(r.id) AS total_respuestas
FROM surveys s
LEFT JOIN responses r ON s.id = r.survey_id
GROUP BY s.id;

-- 2. Preguntas más respondidas
SELECT q.question_text, COUNT(a.id) AS total_respuestas
FROM questions q
JOIN answers a ON q.id = a.question_id
GROUP BY q.id
ORDER BY total_respuestas DESC;

-- 3. Encuestas exitosas
SELECT title
FROM surveys
WHERE id IN (
  SELECT survey_id
  FROM responses
  GROUP BY survey_id
  HAVING COUNT(*) > 5
);

-- 4. Promedio de respuestas
SELECT AVG(total) AS promedio
FROM (
  SELECT COUNT(*) AS total
  FROM responses
  GROUP BY survey_id
) AS sub;