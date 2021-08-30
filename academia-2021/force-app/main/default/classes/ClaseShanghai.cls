public class ClaseShanghai {

    public static void OpportunityByRegionShanghai(List<Opportunity>Opps){
        
    map<id,Account> MapCuenta = new map<id,Account> ([SELECT ID, BillingCountry FROM Account]);
    
    for(Opportunity opp : Opps){
        string pais = MapCuenta.get(opp.AccountId).BillingCountry;
        if(pais == 'Shanghai' ){
            opp.Amount = opp.Amount + (opp.Amount*0.05);
        	}
    	}
    }
    
}