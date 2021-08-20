public class claseTokyo{

    public static void mifuncion(Opportunity[] opps){
        Account acc = [ SELECT Id,BillingCountry from Account where Id=: opps[0].AccountId];        
        for(opportunity opp: opps){         
            if(acc.BillingCountry == 'Tokyo'){
                opp.Amount = opp.Amount + (opp.Amount * 0.05);
            }  
        }
	}
}