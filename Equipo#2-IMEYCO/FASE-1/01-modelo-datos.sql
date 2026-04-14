-- ============================================================
-- CREACIÓN DE BASE DE DATOS
-- ============================================================
CREATE DATABASE IF NOT EXISTS imeyco_db;
USE imeyco_db;

-- ============================================================
-- TABLA: surveys
-- ============================================================
CREATE TABLE surveys (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  active TINYINT(1) DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLA: questions
-- ============================================================
CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,
  question_text TEXT NOT NULL,
  question_type ENUM('text','multiple','checkbox') NOT NULL,
  is_required TINYINT(1) DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (survey_id) REFERENCES surveys(id)
);

-- ============================================================
-- TABLA: question_options
-- ============================================================
CREATE TABLE question_options (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question_id INT NOT NULL,
  option_text VARCHAR(255) NOT NULL,
  option_order INT DEFAULT 0,
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- ============================================================
-- TABLA: responses
-- ============================================================
CREATE TABLE responses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  survey_id INT NOT NULL,
  user_id INT,
  submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (survey_id) REFERENCES surveys(id)
);

-- ============================================================
-- TABLA: answers
-- ============================================================
CREATE TABLE answers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  response_id INT NOT NULL,
  question_id INT NOT NULL,
  answer_value TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (response_id) REFERENCES responses(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- ============================================================
-- TABLA: audit_log (para FASE 2)
-- ============================================================
CREATE TABLE audit_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tabla VARCHAR(50),
  operacion VARCHAR(50),
  ref_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);