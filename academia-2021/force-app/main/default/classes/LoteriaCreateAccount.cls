@RestResource(urlMapping='/Account')
global with sharing class LoteriaCreateAccount {
    @HttpPost
    global static Id createAccount(wrapperloteria cuenta) {
        Account restAcc = new Account();
        restAcc.Name = cuenta.Nombre;
        restAcc.ShippingStreet = cuenta.Direccion;
        restAcc.Phone = cuenta.Telefono;
        
        insert restAcc;
        
        Opportunity opp = new Opportunity();
        opp.AccountId = restAcc.Id;
       
        opp.Name = cuenta.NombreBL;
        opp.StageName = cuenta.Status;
        opp.CloseDate = cuenta.FechaSorteo;
        
        insert opp;
        
        SendEmail(opp);
        
        return restAcc.Id;
    }
    public static void SendEmail(Opportunity opp){
		Contact c  =  new Contact(
		AccountId = opp.AccountId,
 		firstName = 'Julio',
 		lastName ='Medellín',
 		Email = 'julio.medellin@softtek.com');

		insert c;
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setTargetObjectId(c.id);

		// Obtener el id de esta counsulta ‘SELECT Id,Name FROM EmailTemplate LIMIT 1‘

		mail.setTemplateId('00X5e0000027qRtEAI');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

	}
}