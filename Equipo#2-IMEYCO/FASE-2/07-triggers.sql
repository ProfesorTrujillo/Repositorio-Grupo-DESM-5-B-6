-- Auditoría
CREATE TRIGGER trg_update_surveys
AFTER UPDATE ON surveys
FOR EACH ROW
INSERT INTO audit_log(tabla, operacion, ref_id)
VALUES('surveys','UPDATE', OLD.id);

-- Historial antes de borrar
CREATE TABLE responses_historico LIKE responses;

CREATE TRIGGER trg_delete_response
BEFORE DELETE ON responses
FOR EACH ROW
INSERT INTO responses_historico
SELECT * FROM responses WHERE id = OLD.id;