SELECT * FROM skdb.TargetIDs

LEFT JOIN (

SELECT vsSheet.AthenaID, vsSheet.SystolicBP, vsSheet.DiastolicBP, vsSheet.Date
FROM vsSheet
INNER JOIN
(

SELECT vsSheet.AthenaID, MAX(vsSheet.Date) AS maxDATE
FROM vsSheet
WHERE vsSheet.SystolicBP IS NOT NULL AND vsSheet.DiastolicBP IS NOT NULL
GROUP BY vsSheet.AthenaID


) t1

ON vsSheet.Date = t1.maxDATE AND vsSheet.AthenaID = t1.AthenaID


GROUP BY vsSheet.AthenaID
)t2

ON TargetIDs.AthenaID = t2.AthenaID