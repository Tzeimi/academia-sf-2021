
public class HandlerOpportunity{
    
    
    public static void venta(Opportunity[] opps){
		double aumento=0;
        //List <Opportunity> opps= [SELECT Amount, Country__c From Opportunity];
        //system.debug(opps);
        for(Opportunity opp:opps){
        if(opp.Country__c == 'Delhi'){
            opp.Amount = opp.Amount + (opp.Amount * 0.5);
            
            
        }
        
    }
    }
}