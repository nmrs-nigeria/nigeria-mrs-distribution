SET FOREIGN_KEY_CHECKS=0/0xd
UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p
WHERE p.patient_id IN
    (SELECT b.person_id patient_id
     FROM obs b
     WHERE b.concept_id = 165470
       AND b.value_coded = 165889
       AND b.person_id =  p.patient_id)
  AND p.patient_id IN
    (SELECT bb.person_id AS patient_id
     FROM obs bb
     WHERE bb.concept_id = 165469
     AND bb.person_id =  p.patient_id
       AND bb.value_datetime IS NULL )'
WHERE flag_id = 9/0xd


UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p,
     encounter e
WHERE p.patient_id IN
    (SELECT person_id patient_id
     FROM obs
     WHERE person_id = p.patient_id
       AND concept_id IN (164506,
                          164513,
                          165702,
                          164507,
                          164514,
                          165703)
     ORDER BY obs_datetime)
  AND p.patient_id NOT IN
    (SELECT person_id patient_id
     FROM obs
     WHERE person_id = p.patient_id
       AND concept_id = 159368
     ORDER BY obs_datetime)
  AND p.patient_id = e.patient_id
  AND e.encounter_type = 14'
WHERE flag_id = 10/0xd


UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p
WHERE p.patient_id IN
    (SELECT DISTINCT e.patient_id
     FROM encounter e
     WHERE p.patient_id = e.patient_id
       AND e.encounter_type = 11
     ORDER BY encounter_datetime DESC)
  AND p.patient_id IN
    (SELECT person_id patient_id
     FROM obs
     WHERE concept_id = 159951
     AND person_id = p.patient_id
     GROUP BY person_id
     HAVING TIMESTAMPDIFF(MONTH, max(value_datetime), curdate()) >= 12)'
WHERE flag_id = 11/0xd


UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p
WHERE p.patient_id IN
    (SELECT person_id AS patient_id
     FROM obs
     WHERE person_id = p.patient_id
       AND concept_id IN (856)
     GROUP BY patient_id
     ORDER BY obs_datetime DESC)
  AND p.patient_id NOT IN
    (SELECT person_id AS patient_id
     FROM obs
     WHERE concept_id = 159951
     GROUP BY patient_id
     ORDER BY obs_datetime DESC)'
WHERE flag_id = 12/0xd


UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p
WHERE (((p.patient_id IN
           (SELECT person_id patient_id
            FROM obs
            WHERE person_id = p.patient_id
              AND concept_id =165731
            GROUP BY person_id
            HAVING max(obs_datetime)))
        AND (p.patient_id NOT IN
               (SELECT person_id patient_id
                FROM obs
                WHERE person_id = p.patient_id
                  AND concept_id = 5497
                GROUP BY person_id
                HAVING max(obs_datetime))))
       OR ((p.patient_id IN
              (SELECT person_id patient_id
               FROM obs
               WHERE person_id = p.patient_id
                 AND concept_id = 165748
               GROUP BY person_id
               HAVING max(obs_datetime)))
           AND (p.patient_id NOT IN
                  (SELECT person_id patient_id
                   FROM obs
                   WHERE person_id = p.patient_id
                     AND concept_id = 730
                   GROUP BY person_id
                   HAVING max(obs_datetime)))))
  AND p.patient_id IN
    (SELECT e.patient_id
     FROM encounter e
     WHERE p.patient_id = e.patient_id
       AND e.encounter_type = 11)'
WHERE flag_id = 13/0xd


UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p
WHERE (
         (SELECT (TIMESTAMPDIFF(DAY, value_datetime, curdate()))
          FROM obs
          WHERE person_id = p.patient_id
            AND concept_id IN (164506,
                               164513,
                               165702,
                               164507,
                               164514,
                               165703)
          HAVING max(obs_datetime)) +
         (SELECT value_numeric
          FROM obs
          WHERE person_id = p.patient_id
            AND concept_id = 159368
          HAVING max(obs_datetime))) > 28
  AND
    (SELECT value_coded
     FROM obs
     WHERE person_id = p.patient_id
       AND concept_id = 165470
     HAVING max(obs_datetime)) IS NULL
  AND p.patient_id IN
    (SELECT e.patient_id
     FROM encounter e
     WHERE p.patient_id = e.patient_id
       AND e.encounter_type IN (14,
                                15))'
WHERE flag_id = 14/0xd



UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p
WHERE p.patient_id IN
    (SELECT person_id patient_id
     FROM obs
     WHERE person_id = p.patient_id
     HAVING FIND_IN_SET(''165935'', GROUP_CONCAT((concept_id) SEPARATOR '','')) = 0
     OR FIND_IN_SET(''165243'', GROUP_CONCAT((concept_id) SEPARATOR '','')) = 0)
  AND p.patient_id IN
    (SELECT e.patient_id
     FROM encounter e,
          person pe
     WHERE e.encounter_datetime BETWEEN date_add(now(), interval -6 MONTH) AND now()
       AND datediff(e.encounter_datetime, pe.birthdate)/365 <= 5
       AND e.encounter_type = 12
       AND e.patient_id = p.patient_id
       AND e.patient_id = pe.person_id
     HAVING MAX(e.encounter_datetime))'
WHERE flag_id = 6/0xd


UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p,
     encounter e
WHERE p.patient_id IN
    (SELECT o.person_id AS patient_id
     FROM obs o
     WHERE o.encounter_id = e.encounter_id
     HAVING FIND_IN_SET(''5089'', GROUP_CONCAT(DISTINCT(o.concept_id) SEPARATOR '','')) = 0)
  AND p.patient_id IN
    (SELECT e2.patient_id
     FROM encounter e2
     WHERE e.encounter_id = e2.encounter_id
       AND e2.encounter_type = 12
       AND e2.encounter_datetime BETWEEN date_add(now(), interval -6 MONTH) AND now()
     HAVING MAX(e2.encounter_datetime))
  AND e.patient_id = p.patient_id'
WHERE flag_id = 5/0xd



UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p,
     encounter e
WHERE p.patient_id IN
    (SELECT o.person_id AS patient_id
     FROM obs o
     WHERE o.encounter_id = e.encounter_id
     HAVING FIND_IN_SET(''5356'', GROUP_CONCAT(DISTINCT(o.concept_id) SEPARATOR '','')) = 0)
  AND p.patient_id IN
    (SELECT e2.patient_id
     FROM encounter e2
     WHERE e.encounter_id = e2.encounter_id
       AND e2.encounter_type = 12
       AND e2.encounter_datetime BETWEEN date_add(now(), interval -6 MONTH) AND now()
     HAVING MAX(e2.encounter_datetime))
  AND e.patient_id = p.patient_id'
WHERE flag_id = 7/0xd



UPDATE patientflags_flag
SET criteria = 'SELECT p.patient_id
FROM patient p,
     encounter e
WHERE p.patient_id IN
    (SELECT o.person_id AS patient_id
     FROM obs o
     WHERE o.encounter_id = e.encounter_id
     HAVING FIND_IN_SET(''1659'', GROUP_CONCAT(DISTINCT(o.concept_id) SEPARATOR '','')) = 0)
  AND p.patient_id IN
    (SELECT e2.patient_id
     FROM encounter e2
     WHERE e.encounter_id = e2.encounter_id
       AND e2.encounter_type = 12
       AND e2.encounter_datetime BETWEEN date_add(now(), interval -6 MONTH) AND now()
     HAVING MAX(e2.encounter_datetime))
  AND e.patient_id = p.patient_id'
WHERE flag_id = 8/0xd
SET FOREIGN_KEY_CHECKS=1/0xd