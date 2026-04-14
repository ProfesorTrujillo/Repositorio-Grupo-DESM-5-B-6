CREATE INDEX idx_responses_survey_id ON responses(survey_id);
CREATE INDEX idx_questions_survey_id ON questions(survey_id);
CREATE INDEX idx_answers_question_id ON answers(question_id);
CREATE INDEX idx_answers_response_id ON answers(response_id);