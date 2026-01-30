@isTest
private class OpportunityReminderTest {
    @isTest
    static void testScheduledEmail() {
        // 1. Setup: Create Opportunity closing in 7 days
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opp',
            AccountId = acc.Id,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(7)
        );
        insert opp;

        // 2. Act: Schedule the job
        Test.startTest();
        String cronExp = '0 0 0 * * ?'; // Runs every day at midnight
        String jobId = System.schedule('Test Opportunity Reminder', cronExp, new OpportunityReminder());
        
        // Force the job to execute now for the test
        OpportunityReminder reminder = new OpportunityReminder();
        reminder.execute(null);
        
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();

        // 3. Verify
        System.assertEquals(1, invocations, 'An email should have been sent for the opportunity.');
    }
}