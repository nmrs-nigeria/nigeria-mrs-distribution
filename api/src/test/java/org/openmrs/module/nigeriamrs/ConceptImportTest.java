package org.openmrs.module.nigeriamrs;

import org.junit.Test;
import org.openmrs.api.context.Context;
import org.openmrs.module.dataexchange.DataImporter;
import org.openmrs.test.BaseModuleContextSensitiveTest;

public class ConceptImportTest extends BaseModuleContextSensitiveTest {
	
	protected static final String CONCEPT_DATASET_XML = "metadata/concept_dictonary.xml";
	
	@Test
	public void shouldImportWithOutAnyError() {
		DataImporter dataImporter = Context.getRegisteredComponent("dataImporter", DataImporter.class);
		dataImporter.importData(CONCEPT_DATASET_XML);
	}
}
