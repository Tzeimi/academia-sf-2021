public class BoletoGanador {
    public void callWebService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // Response is Ok
        if(response.getStatusCode() == 200) {
            wrapperloteria ganador = (wrapperloteria) JSON.deserializeStrict(response.getBody(), wrapperloteria.class);
            //system.debug(ganador);
            List<Opportunity> opp = [SELECT Name FROM Opportunity Where Name = :ganador.NumeroGandor.folio];
            //system.debug(opp);
            for(Opportunity op : opp){
                op.StageName = 'Closed Won';
           		update opp;
            }
           	
        }else{
            System.debug(response.getStatus());
        }
    }
}