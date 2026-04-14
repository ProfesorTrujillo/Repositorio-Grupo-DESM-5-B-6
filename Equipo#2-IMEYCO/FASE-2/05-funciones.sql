DELIMITER $$

CREATE FUNCTION fn_encuesta_activa(p_survey_id INT)
RETURNS TINYINT(1)
BEGIN
  DECLARE v INT;
  SELECT COUNT(*) INTO v FROM surveys WHERE id = p_survey_id AND active = 1;
  RETURN IF(v>0,1,0);
END$$

CREATE FUNCTION fn_total_respuestas(p_survey_id INT)
RETURNS INT
BEGIN
  DECLARE v INT;
  SELECT COUNT(*) INTO v FROM responses WHERE survey_id = p_survey_id;
  RETURN v;
END$$

DELIMITER ;