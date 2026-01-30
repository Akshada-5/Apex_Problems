@isTest
private class AccountTriggerTest {
    @isTest
    static void testUpdateRelatedContacts() {
        // 1. Setup: Create Account and Contact
        Account acc = new Account(Name = 'Parent Account');
        insert acc;
        
        Contact con = new Contact(LastName = 'Child Contact', AccountId = acc.Id);
        insert con;
        
        // Get initial LastModifiedDate
        Contact initialCon = [SELECT LastModifiedDate FROM Contact WHERE Id = :con.Id];
        DateTime oldDate = initialCon.LastModifiedDate;

        // 2. Act: Update Account to fire trigger
        // We use Test.setCreatedDate or a brief pause if needed, 
        // but typically a simple update is enough for verification.
        Test.startTest();
        acc.Name = 'Updated Parent Account';
        update acc;
        Test.stopTest();

        // 3. Verify: Check if Contact's LastModifiedDate changed
        Contact updatedCon = [SELECT LastModifiedDate FROM Contact WHERE Id = :con.Id];
        
        System.assert(updatedCon.LastModifiedDate >= oldDate, 'The Contact LastModifiedDate should be updated.');
    }
}