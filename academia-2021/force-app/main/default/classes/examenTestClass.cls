@istest 
private class examenTestClass {
    
    public testMethod static void Boleto(){
			Loteria testWrapper = new Loteria();
                testWrapper.Nombre = 'Test1';
                testWrapper.Direccion = 'Sant Street 2th';
                testWrapper.Telefono = '3333454449';
                       testWrapper.NombreBoleto = 'Test Opportunity Name';
                       testWrapper.FechaSorteo = System.today();
                       testWrapper.Status = 'Prospecting';

        crearCuentaLoteria.createAccount(testWrapper);
   
    }
         public testMethod static void prueba(){
        
    string body ='{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
        Test.setMock(HttpCalloutMock.class, new LlamadaAMock(body));
        GanadorBoleto restTest = new GanadorBoleto();
        restTest.callWebService();   
    }
    
    public testMethod static void BorrarBoletos(){
        Test.startTest();
        Opportunity opps = new Opportunity(
            Name = 'Test Delete Opp',
            CloseDate = System.today().addDays(-2),
            StageName = 'Closed Lost');
        Insert opps;
        BorrarBoletos boletos = new BorrarBoletos();
        String jobId = System.schedule('Borrado boletos', '0 0 23 * * ?', boletos);
        Test.stopTest();
    }
}