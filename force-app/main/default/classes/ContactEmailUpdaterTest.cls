@isTest
public class ContactEmailUpdaterTest {

    @isTest
    static void testUpdateEmails() {

        // 1️⃣ Create test contacts
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            contacts.add(new Contact(
                FirstName = 'Test',
                LastName = 'User' + i,
                Email = 'old@email.com'
            ));
        }
        insert contacts;

        // 2️⃣ Call method under test
        Test.startTest();
        ContactEmailUpdater.updateEmails(contacts, 'new@email.com');
        Test.stopTest();

        // 3️⃣ Verify results
        List<Contact> updatedContacts = [
            SELECT Email FROM Contact WHERE Id IN :contacts
        ];

        for (Contact c : updatedContacts) {
            System.assertEquals(
                'new@email.com',
                c.Email,
                'Email should be updated'
            );
        }
    }
}
