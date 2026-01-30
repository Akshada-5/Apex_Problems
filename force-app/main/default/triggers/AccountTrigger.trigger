trigger AccountTrigger on Account (after update) {
    Set<Id> accountIds = new Set<Id>();
    
    // 1. Collect IDs of Accounts that were updated
    for (Account acc : Trigger.new) {
        accountIds.add(acc.Id);
    }
    
    if (!accountIds.isEmpty()) {
        // 2. Query related contacts
        List<Contact> contactsToUpdate = [SELECT Id FROM Contact WHERE AccountId IN :accountIds];
        
        if (!contactsToUpdate.isEmpty()) {
            // 3. Update the contacts
            // Note: Simply calling 'update' refreshes the LastModifiedDate automatically
            update contactsToUpdate;
        }
    }
}