/*
* Name: Briseidy Torres Velez
*/
public class DataFactorySorteo {
    
    public static void crearOpps( ){
       
       
        Account acc = new Account(Name = 'Account Test');
        insert acc;
        Opportunity o = new Opportunity(Name = 'BL-12345', CloseDate= system.today(), StageName='Prospecting',AccountId = acc.Id);
            insert o;
   
    }
    public static void crearoppsBatchSorteo(){
        
        Account acc = new Account(Name = 'Account Test');
        insert acc; 
        Opportunity o = new Opportunity(Name = 'BL-12345', CloseDate= Date.parse('29/08/2021'), StageName='Closed Lost',AccountId = acc.Id);
            insert o;
    }
     public static List<Opportunity>crearOppsLst(integer numOpps ){
       
         Opportunity[] oppLst = new Opportunity[]{};
        Account acc = new Account(Name = 'Account Test');
        insert acc;
         for(integer i = 0; i<numOpps; i++){
              Opportunity o = new Opportunity(Name = 'BL-1234', CloseDate= system.today(), StageName='Prospecting',AccountId = acc.Id);
            	oppLst.add(o);
         }
         insert oppLst;
         return oppLst;
        
   
    }
    
}