REPLACE INTO global_property (`property`,`property_value`,`description`,`uuid`,`datatype`,`datatype_config`,`preferred_handler`,`handler_config`,`date_changed`,`changed_by`)
VALUES
('visits.allowOverlappingVisits','true','true/false whether or not to allow visits of a given patient to overlap','c81a6a9c-b474-4197-b19a-8e14ba148366','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL),
('visits.assignmentHandler','org.openmrs.api.handler.ExistingOrNewVisitAssignmentHandler',NULL,'b8d60365-38a7-4977-af12-6ae718a78a3a',NULL,NULL,NULL,NULL,NULL,NULL),
('visits.autoCloseVisitType','Facility Visit','comma-separated list of the visit type(s) to automatically close','2d325135-8931-47c5-87e0-12eb2ab0941a',NULL,NULL,NULL,NULL,NULL,NULL),
('visits.enabled','true',NULL,'26a73d37-c1f8-4cc6-9e05-6ead5a66e714','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL,NULL,NULL);