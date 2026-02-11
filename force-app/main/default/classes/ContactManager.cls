public with sharing class ContactManager {
   
    @AuraEnabled(cacheable=true)
    public static list<Contact> fetchAllContacts(){
        List<Contact> conlist = [SELECT Id,NAME,Phone,Email,Account.Name FROM Contact ];
        return conList;
    }
}