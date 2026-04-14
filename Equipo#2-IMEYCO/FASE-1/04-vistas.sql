CREATE VIEW vw_encuestas_activas AS
SELECT id, title, description
FROM surveys
WHERE active = 1;

CREATE VIEW vw_preguntas_encuesta AS
SELECT id, survey_id, question_text, question_type, is_required
FROM questions;

CREATE VIEW vw_respuestas_encuesta AS
SELECT id, survey_id, submitted_at
FROM responses;

CREATE VIEW vw_respuestas_preguntas AS
SELECT a.id, q.question_text, a.answer_value
FROM answers a
JOIN questions q ON a.question_id = q.id;