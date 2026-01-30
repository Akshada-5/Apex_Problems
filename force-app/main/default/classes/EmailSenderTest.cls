@isTest
public class EmailSenderTest {

    @isTest
    static void testSendEmail() {
        // 1. Setup
        String recipient = 'test@example.com';
        String subject = 'Hello';
        String body = 'Test Body';

        // 2. Action
        Test.startTest();
        EmailSender.sendEmail(recipient, subject, body);
        Integer emailInvocations = Limits.getEmailInvocations();
        Test.stopTest();

        // 3. Verify
        System.assertEquals(1, emailInvocations, 'Email should have been sent once');
    }
}