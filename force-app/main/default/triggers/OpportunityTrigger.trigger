trigger OpportunityTrigger on Opportunity (before update) {
    for (Opportunity opp : Trigger.new) {
        // Access the 'old' version of the record to check if the stage changed
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
        
        // Condition: Stage changed AND it is now "Closed Won"
        if (opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') {
            // Update Close Date to 1 month from today
            opp.CloseDate = Date.today().addMonths(1);
        }
    }
}