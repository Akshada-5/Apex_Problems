public class OlderAccountsUtilityCopy {

    public static void updateOlderAccounts() {
        // Query Accounts older than one year
        List<Account> accounts = [
            SELECT Id, Description
            FROM Account
            WHERE CreatedDate < LAST_N_DAYS:365
        ];

        // Update the Description field
        for (Account acc : accounts) {
            acc.Description = 'This account is old.';
        }

        // Save the changes
        update accounts;
    }
}