//BRISEIDY TORRES
public class OpportunityHandlerSorteo {
    public static void crearContacto(Opportunity[] oppLst){
        List<Contact> contactLst = new List<Contact>();
        for(Opportunity op:oppLst){
           	
           Account acc = [select id,name from account where id=:op.AccountId]; 
         
            
            Contact c = new Contact(LastName = acc.Name, AccountId = acc.Id, Email = 'julio.medellin@softtek.com');
            contactLst.add(c);
 
        }
        Database.insert(contactLst);
        
        for(Contact c:contactLst){
             Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(c.id);
                
                mail.setTemplateId('00X5e000001028uEAA');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
       
      }
}