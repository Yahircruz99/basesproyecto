SELECT a.*
FROM Articulo a
JOIN ArticuloCaracteristica ac ON a.sku = ac.sku
JOIN Caracteristica c ON ac.id_caracteristica = c.id_caracteristica
WHERE c.tipo = 'RAM' AND ac.valor = '8GB'
AND EXISTS (
    SELECT 1
    FROM ArticuloCaracteristica ac2
    JOIN Caracteristica c2 ON ac2.id_caracteristica = c2.id_caracteristica
    WHERE ac2.sku = a.sku AND c2.tipo = 'Procesador' AND ac2.valor = 'Ryzen 5'
);
