trigger OpportunityByRegion on Opportunity (before insert) {

   
     ClaseShanghai.OpportunityByRegionShanghai(trigger.new);
    
    
}