START TRANSACTION;

INSERT INTO surveys(title, description)
VALUES('Encuesta Demo','Test');

SET @id = LAST_INSERT_ID();

INSERT INTO questions(survey_id, question_text, question_type)
VALUES(@id,'¿Te gusta el sistema?','text');

COMMIT;