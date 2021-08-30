@isTest
public class dataFactory {
    
    
    public static List<opportunity> accConOpp(Integer cantidad) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<cantidad;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<cantidad;j++) {
            Account acct = accts[j];
           
            for (Integer k=0;k<cantidad;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        
        insert opps;
        
        return opps;
    }
    public static void crearOportunidad(){
     account acc = new account(Name = 'account prueba');
     insert acc;
                
        
      Opportunity opp = new Opportunity(Name = 'BL-12345', CloseDate= Date.parse('29/08/2021'), StageName='Closed Lost',AccountId = acc.Id);
        insert opp;
        
        
        
        
    }  
}