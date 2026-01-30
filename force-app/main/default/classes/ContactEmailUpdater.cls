public class ContactEmailUpdater {

    public static void updateEmails(List<Contact> contacts, String newEmail) {
        for (Contact c : contacts) {
            c.Email = newEmail;
        }
        update contacts;
    }
}
