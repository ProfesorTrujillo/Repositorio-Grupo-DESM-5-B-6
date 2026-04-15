-- Mejora del rendimiento en búsquedas por estado y ciudad
CREATE INDEX idx_estado_ticket ON tickets(estado);
CREATE INDEX idx_ciudad_usuario ON usuarios(ciudad);