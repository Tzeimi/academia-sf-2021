public class Email {
    Public void Email(Opportunity opp){
        Contact contact  =  new Contact(
        AccountId = opp.AccountId,
        firstName = 'Julio',
        lastName ='Picazo',  
        Email = 'julio.picazo@softtek.com'
        //Email2 = 'julio.medellin@softtek.com'
        );
       
        insert contact;

	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	mail.setTargetObjectId(contact.id);
	
	EmailTemplate temp = [select id,Name from EmailTemplate where developername='SalesNewCustomerEmail'];
        // Obtener el id de esta counsulta ‘SELECT Id,Name FROM EmailTemplate LIMIT 1‘
	mail.setTemplateId(temp.id);
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	
    }
}