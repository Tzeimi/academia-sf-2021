@RestResource(URLMapping='/boleto')
global class LoteriaRest {
    
    @HTTPPost
    global static String boletoComprado(wrapBoleto boleto){
        Integer numeroMes = System.Today().month();
        Integer numeroanio = System.Today().year();
        Integer numberOfDays = Date.daysInMonth(numeroAnio, numeroMes);
        Date FechaDeSorteo = Date.newInstance(numeroAnio, numeroMes, numberOfDays);
        
        Account acc = new Account();
        acc.Name = boleto.nombre;
        acc.Phone = boleto.telefono;
        acc.BillingCountry = boleto.direccion;
        
        insert acc;
        
        Opportunity opp = new Opportunity(AccountId =  acc.Id);
        opp.Name = 'BL-'+ boleto.numeroBoleto;
        opp.CloseDate = FechaDeSorteo;
        opp.StageName = 'Prospecting';     
        insert opp;
        
        return 'ok';     
    }

    global static void JSONParam(){
        String folioGanador;
        String FechaGanador;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            wrapNumeroGanadorDeserializado NumeroGanador = (wrapNumeroGanadorDeserializado) JSON.deserializeStrict(response.getBody(),wrapNumeroGanadorDeserializado.class);
            folioGanador = NumeroGanador.NumeroGandor.folio;
            fechaGanador = NumeroGanador.NumeroGandor.fecha;
        }     
        Opportunity[] opps = [SELECT ID,Name From Opportunity];       
        if(opps.size() > 0){
            for(Opportunity opp : opps){
                if(opp.Name == folioGanador ){
                    opp.StageName = 'Closed Won';
                    update opp;
                }
            }
        }
    }
}

/*
{
    "boleto":{
        "nombre":"Usuario2",
        "direccion":"Calle 123",
        "telefono":"12334567890",
        "numeroBoleto":"12344"

    }
} 
*/