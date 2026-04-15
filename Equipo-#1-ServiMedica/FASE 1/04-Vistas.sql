-- Vista para el panel de administración: Solo tickets que requieren atención
CREATE OR REPLACE VIEW v_tickets_pendientes AS
SELECT t.id_ticket, u.nombre, u.email, t.mensaje, t.fecha_creacion
FROM tickets t
JOIN usuarios u ON t.id_usuario = u.id_usuario
WHERE t.estado = 'Pendiente';