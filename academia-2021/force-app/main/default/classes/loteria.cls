@RestResource(URLMapping='/boleto')
global class loteria {
    @HTTPPost
    global static String venta(Boleto boleto){
        Integer mes = System.Today().month();
        Integer anio = System.Today().year();
        Integer day = Date.daysInMonth(anio, mes);
        //Date fecha = Date.newInstance():
        Date dateOf = Date.newInstance(anio, mes, day);
        
        //parceamos los datos con los de la cuenta
        Account acc = new Account();
        acc.Name = boleto.nombre;
        acc.Phone = boleto.telefono;
        acc.BillingCountry = boleto.direccion;
        
        insert acc;
        
        String stage = 'Prospecting'; 
        Opportunity opp = new Opportunity(AccountId =  acc.Id);
        opp.Name = boleto.numeroBoleto;
        opp.CloseDate = dateOf;
        opp.StageName = stage;   
        insert opp;
        return 'Success';     
    }

    			  //Nombre:BL-Numero
                  //FechaSorteo(Utilizar CloseDate)
                  //Status(Utilizar StageName)  ;
                  //
                  //
    global static void JSONParam(){
        //https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador
        String folioGanador;
        String FechaGanador;
        String value2 = 'Closed Won';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        //Selecionaos el metodo
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            numeroGanador num = (numeroGanador) JSON.deserializeStrict(response.getBody(),numeroGanador.class);
            folioGanador = num.numeroGanador.folio;
            fechaGanador = num.numeroGanador.fecha;
        }     
        Opportunity[] opps = [select ID,Name From Opportunity];       
        if(opps.size() > 0){
            for(Opportunity opp : opps){
                if(opp.Name == folioGanador ){
                    opp.StageName = value2;
                    update opp;
                }
            }
        }
    }
	
}