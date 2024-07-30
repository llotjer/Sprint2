SELECT COUNT(id_ventes) AS 'total compres', c.nom AS 'del client'
FROM ventes v
JOIN clients c
ON c.id_clients = v.client_id
WHERE c.id_clients = 1