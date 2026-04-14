DELIMITER $$

CREATE PROCEDURE sp_registrar_respuesta(
  IN p_survey_id INT,
  IN p_user_id INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;

  START TRANSACTION;

  INSERT INTO responses(survey_id, user_id)
  VALUES(p_survey_id, p_user_id);

  INSERT INTO audit_log(tabla, operacion, ref_id)
  VALUES('responses','INSERT', LAST_INSERT_ID());

  COMMIT;
END$$

DELIMITER ;