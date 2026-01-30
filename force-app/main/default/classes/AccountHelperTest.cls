@isTest
private class AccountHelperTest {
    @isTest
    static void testGetContactCount() {
        // 1. Create the Account
        Account acc = new Account(Name = 'Test Logic Corp');
        insert acc;

        // 2. Check if your Org automation already created a contact (e.g., a Flow)
        Integer existingContacts = [SELECT count() FROM Contact WHERE AccountId = :acc.Id];

        // 3. Insert 3 manual Contacts
        List<Contact> contactsToInsert = new List<Contact>();
        for(Integer i=0; i<3; i++) {
            contactsToInsert.add(new Contact(
                LastName = 'TestContact' + i, 
                AccountId = acc.Id
            ));
        }
        insert contactsToInsert;

        // 4. Act: Call your method
        Test.startTest();
        Integer totalCount = AccountHelper.getContactCount(acc.Id);
        Test.stopTest();

        // 5. Assert: The total should be (Automation Contacts + Your 3 Contacts)
        System.assertEquals(existingContacts + 3, totalCount, 'The count should include auto-generated and manual contacts.');
    }
}