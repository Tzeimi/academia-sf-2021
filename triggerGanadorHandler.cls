public class triggerGanadorHandler {
    
    
    public static void contactoMail(opportunity[] opps){
        
        list<contact> contactos = new list<contact>();
        
        for(opportunity o : opps){
        
        account acc = [select id,name from account where id=:o.accountId]; 
        
         contact con = new contact(lastName = acc.name, accountId = acc.Id, email = 'julio.medellin@sofftek.com');
        
            contactos.add(con);
            
      
        } 
        database.insert(contactos);
    
	for(contact c: contactos){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(c.id);    
        mail.setTemplateId('00X5f000000WARrEAO'); //TemplateId de Eve
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}

    }
    
    	
    
}