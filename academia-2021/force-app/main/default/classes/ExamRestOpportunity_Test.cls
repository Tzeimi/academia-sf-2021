/***
 * Sebastián Marroquín 
 **/
@IsTest
private class ExamRestOpportunity_Test {
    // Mock Service
    @isTest static void testMockService(){
        // Pass instance of the Mock
        String body = '{';
    		body += ' "NumeroGandor": { ';
        	body += ' "folio": "BL-12345", ';
        	body += ' "Fecha": "12-12-21", ';
    		body += ' }';
		body += '}';
        Test.setMock(HttpCalloutMock.class, new CallMockService(body));
        ExamRestOpportunity restTest = new ExamRestOpportunity();
        restTest.callWebService();
    }
}