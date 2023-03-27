SELECT targetTable.encountersAthenaID, targetTable.encounterDate, vhc.vs_per_enc.EncounterID, vhc.vs_per_enc.BloodPressure, vhc.vs_per_enc.BMI

FROM vhc.vs_per_enc 

RIGHT JOIN (
	SELECT * FROM skdb.TargetIDs
	
	LEFT JOIN (
	
	SELECT vhc.encounters.AthenaID AS encountersAthenaID, vhc.encounters.EncounterID, vhc.encounters.Date AS encounterDate
	FROM vhc.encounters
	
	) encountersTable
	
	ON skdb.TargetIDs.AthenaID = encountersTable.encountersAthenaID
	
	ORDER BY skdb.TargetIDs.AthenaID
	) targetTable
	
ON vhc.vs_per_enc.EncounterID = targetTable.EncounterID
ORDER BY targetTable.encountersAthenaID
