-- Reporte de cantidad de tickets generados por cada usuario
SELECT u.nombre, u.email, COUNT(t.id_ticket) as total_tickets
FROM usuarios u
LEFT JOIN tickets t ON u.id_usuario = t.id_usuario
GROUP BY u.id_usuario;