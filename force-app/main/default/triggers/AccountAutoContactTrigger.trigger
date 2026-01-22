trigger AccountAutoContactTrigger on Account (after insert) {

    List<Contact> contactsToInsert = new List<Contact>();

    for (Account acc : Trigger.new) {

        Contact con = new Contact();
        con.LastName = 'AutoContact';
        con.AccountId = acc.Id;

        contactsToInsert.add(con);
    }

    if (!contactsToInsert.isEmpty()) {
        insert contactsToInsert;
    }
}
