@RESTResource(URLMapping='/Venta')
global class VentaRest {    
    @HTTPPost
    global static void JSONParam(WrapperVenta venta){
        
        Account acc = new Account(name=venta.Nombre,Phone=venta.Telefono); 
        acc.BillingStreet = venta.Direccion;       
        insert acc;       
        
        Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
        opp.Name = venta.NombreOportunidad;
        opp.CloseDate= venta.FechaSorteo;
        opp.StageName=venta.Status   ;    
        insert opp;        
    }
    
    @future(callout=true)
    public static void consultarGanador(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
       
           WrapperBoletoGanador boletoGanador = (WrapperBoletoGanador) JSON.deserializeStrict(response.getBody(), WrapperBoletoGanador.class);
           Opportunity oportunidad = [SELECT id,name FROM Opportunity WHERE Name= :boletoGanador.NumeroGandor.folio AND StageName<>'Closed Won' LIMIT 1];
           
            oportunidad.StageName = 'Closed Won';
            System.debug('CAMBIO BIEN EL ESTADO DE LA OPORTUNIDAD');
            update oportunidad;           
        }
        
    }
    
}