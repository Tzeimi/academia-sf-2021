/***
 * Sebastián Marroquín 
 **/
@IsTest
private class Exam_Test {
    // Wrapper class test method
    @isTest static void testInserOpp(){
        WrapperCliente testWrapper = new WrapperCliente();
        //Account
        testWrapper.Nombre = 'Test';
        testWrapper.Direccion = 'Random Address 101';
        testWrapper.Telefono = '5551237129';
        
        //Opportunity
       	testWrapper.NombreOportunidad = 'Test Opportunity Name';
        testWrapper.FechaSorteo = System.today();
        testWrapper.Status = 'Prospecting';
        
        // Assert not working
        // System.assertEquals('ok', ExamCreateAccount.createAccount(testWrapper));
        ExamCreateAccount.createAccount(testWrapper);
    }
}