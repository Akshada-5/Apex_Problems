public with sharing class AccountHelper {
    /**
     * Counts the number of Contacts associated with a specific Account.
     * @param accId The ID of the Account
     * @return Integer total number of related Contacts
     */
    public static Integer getContactCount(Id accId) {
        if (accId == null) {
            return 0;
        }

        // We query the Contacts where the AccountId matches the parameter
        List<Contact> relatedContacts = [SELECT Id FROM Contact WHERE AccountId = :accId];
        
        return relatedContacts.size();
    }
}