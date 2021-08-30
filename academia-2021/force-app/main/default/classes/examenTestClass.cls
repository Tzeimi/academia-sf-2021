@istest 
private class examenTestClass {
    public testMethod static void Boleto(){
        wrapperloteria testWrapper = new wrapperloteria();
        testWrapper.Nombre = 'Test1';
        testWrapper.Direccion = 'Sant Street 2th';
        testWrapper.Telefono = '3333454449';
        testWrapper.NombreBL = 'Test Opportunity Name';
        testWrapper.FechaSorteo = System.today();
        testWrapper.Status = 'Prospecting';

        LoteriaCreateAccount.createAccount(testWrapper);
    }
    
    public testMethod static void prueba(){
        string body ='{"NumeroGandor":{"folio":"BL-12345","Fecha":"29-08-21"}}';
        Test.setMock(HttpCalloutMock.class, new LlamadaAMock(body));
        BoletoGanador restTest = new BoletoGanador();
            
        restTest.callWebService();
    }
    
    public testMethod static void eliminarBoletos(){
        Test.startTest();
        Opportunity opps = new Opportunity(
        Name = 'Test Delete Opp',
        CloseDate = System.today().addDays(-2),
        StageName = 'Closed Lost');
        Insert opps;
        BorradoBoletos boletos = new BorradoBoletos();
        String jobId = System.schedule('Borrado boletos', '0 0 23 * * ?', boletos);
        Test.stopTest();
    }
}