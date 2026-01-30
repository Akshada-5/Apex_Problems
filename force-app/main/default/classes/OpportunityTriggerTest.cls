@isTest
private class OpportunityTriggerTest {
    @isTest
    static void testClosedWonCloseDate() {
        // 1. Setup: Create an Opportunity in a different stage
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today()
        );
        insert opp;

        // 2. Act: Change stage to "Closed Won"
        Test.startTest();
        opp.StageName = 'Closed Won';
        update opp;
        Test.stopTest();

        // 3. Verify: Check if CloseDate updated to 1 month from today
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity WHERE Id = :opp.Id];
        Date expectedDate = Date.today().addMonths(1);
        
        System.assertEquals(expectedDate, updatedOpp.CloseDate, 
            'The Close Date should have been updated to one month ahead.');
    }
}