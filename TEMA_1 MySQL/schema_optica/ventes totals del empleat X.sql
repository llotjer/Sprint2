SELECT COUNT(id_ventes) AS 'ventes totals', e.nom AS 'del empleat'
FROM ventes v
JOIN empleats e
ON e.id_empleats = v.empleat_id
WHERE id_empleats = 1