-- PasteleriaJan | Fase 1 · 03 - Índices
-- ----------------------------------------------------------------
USE PasteleriaJan;

-- · Índices por categoría

CREATE INDEX idx_categoria_postres   ON Postres(categoria);
CREATE INDEX idx_categoria_pasteles  ON Pasteles(categoria);
CREATE INDEX idx_categoria_gelatinas ON Gelatinas(categoria);

-- · Índice por precio

CREATE INDEX idx_precio_postres ON Postres(precio);
