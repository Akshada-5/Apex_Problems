trigger OpportunityExpectedRevenueTrigger on Opportunity (before insert, before update) {

    for (Opportunity opp : Trigger.new) {

        if (opp.Amount != null) {

            // On insert OR when Amount changes
            if (Trigger.isInsert ||
               (Trigger.isUpdate &&
                opp.Amount != Trigger.oldMap.get(opp.Id).Amount)) {

                opp.Probability = 75;
            }
        }
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    