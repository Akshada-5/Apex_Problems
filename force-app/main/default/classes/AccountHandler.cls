public class AccountHandler {

    public static Account insertNewAccount(String accountName) {
        try {
            Account acc = new Account();
            acc.Name = accountName;

            insert acc;

            return acc;
        } catch (DmlException e) {
            return null;
        }
    }
}