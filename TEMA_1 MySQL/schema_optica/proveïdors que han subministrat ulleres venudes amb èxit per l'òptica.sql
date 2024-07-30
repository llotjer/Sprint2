SELECT p.nom AS proveidor
FROM ventes v
JOIN ulleres u
ON u.id_ulleres = v.ulleres_id
JOIN proveidor p
ON p.id_proveidor = u.proveidor_id
WHERE v.id_ventes IS NOT NULL