//BRISEIDY TORRES
@RestResource(urlMapping='/Venta')
global with sharing class VentaRest {
	@HttpPost
    global static string doPost(wrapperAccount Cliente){
        Account ac = new Account(Name = cliente.Nombre, BillingStreet = cliente.Direccion, Phone = cliente.Telefono );
       	Database.insert(ac);
        Opportunity op= new Opportunity(Name = cliente.Oportunidad.Nombre, CloseDate = cliente.Oportunidad.FechaSorteo, StageName = cliente.Oportunidad.Status,AccountId = ac.Id);
        Database.insert(op);
        
       
    
        return 'Se ha generado correctamente el boleto';
    }
        
}