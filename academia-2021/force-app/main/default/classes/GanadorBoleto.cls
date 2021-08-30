public class GanadorBoleto {
    public void callWebService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        
        if(response.getStatusCode() == 200) {
            Loteria ganador = (Loteria) JSON.deserializeStrict(response.getBody(),Loteria.class);
            List<Opportunity> opp = [SELECT Name FROM Opportunity Where Name = :ganador.NumeroGandor.folio];
            for(Opportunity op : opp){
                op.StageName = 'Closed Won';
                   update opp;
            }

        }else{
            System.debug(response.getStatus());
        }
    }
}