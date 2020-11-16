REPLACE INTO `relationship_type` VALUES
(1,'Doctor','Patient',0,0,'Relationship from a primary care provider to the patient',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d919b58-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),
(2,'Sibling','Sibling',0,0,'Relationship between brother/sister, brother/brother, and sister/sister',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d91a01c-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),
(3,'Parent','Child',0,0,'Relationship from a mother/father to the child',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d91a210-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),
(4,'Aunt/Uncle','Niece/Nephew',0,0,'Relationship from a parent''s sibling to a child of that parent',1,'2007-05-04 00:00:00',0,NULL,NULL,NULL,'8d91a3dc-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),
(5,'Supervisor','Supervisee',0,0,'Provider supervisor to provider supervisee relationship',1,'2018-04-04 12:48:00',0,NULL,NULL,NULL,'2a5f4ff4-a179-4b8a-aa4c-40f71956ebbc',NULL,NULL),
(6,'Husband','Wife',0,0,'Relationship between husband and wife',1,'2019-09-16 20:26:17',0,NULL,NULL,NULL,'98345f10-bf52-451a-943d-0571740ade6b',NULL,NULL)/0xd
SET FOREIGN_KEY_CHECKS=1/0xd