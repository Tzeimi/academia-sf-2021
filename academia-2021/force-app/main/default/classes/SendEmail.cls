public class SendEmail {

    public void SendEmail(Opportunity opp){
        Contact c  =  new Contact(
        AccountId = opp.AccountId,
        firstName = 'Julio',
        lastName ='MEdellin',  
        Email = 'julio.medellin@softtek.com');
        
        system.debug(c);
        insert c;

	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	mail.setTargetObjectId(c.id);
	// Obtener el id de esta counsulta ‘SELECT Id,Name FROM EmailTemplate LIMIT 1‘
	EmailTemplate et = [select id,Name from EmailTemplate where developername='SalesNewCustomerEmail'];
	mail.setTemplateId(et.id);
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}

}