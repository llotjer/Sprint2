SELECT SUM(pc.quantitat) AS 'total begudes venudes a la localitat de BCN'
FROM productes_comanda pc
JOIN productes p
ON id_producte = pc.producte_id
JOIN comanda cm
ON cm.id_comanda = pc.comanda_id
JOIN client c
ON cm.client_id = c.id_client
WHERE p.tipus = 'beguda' AND c.localitat = 'BCN'
ORDER BY quantitat