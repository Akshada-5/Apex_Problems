public with sharing class OpportunityReminder implements Schedulable {
    
    public void execute(SchedulableContext sc) {
        sendReminders();
    }

    public void sendReminders() {
        // 1. Calculate the date 7 days from now
        Date targetDate = Date.today().addDays(7);
        
        // 2. Query open Opportunities with Close Date in exactly 7 days
        // We include Account.Name via relationship query
        List<Opportunity> opps = [SELECT Name, CloseDate, Account.Name, Owner.Email 
                                  FROM Opportunity 
                                  WHERE IsClosed = false 
                                  AND CloseDate = :targetDate];

        if (opps.isEmpty()) return;

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Opportunity opp : opps) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            // Send to the Opportunity Owner
            mail.setToAddresses(new String[] { opp.Owner.Email });
            mail.setSubject('Reminder: Opportunity Closing Soon - ' + opp.Name);
            
            String body = 'This is a reminder for the following Opportunity:\n\n' +
                          'Opportunity Name: ' + opp.Name + '\n' +
                          'Account Name: ' + (opp.Account != null ? opp.Account.Name : 'N/A') + '\n' +
                          'Close Date: ' + opp.CloseDate.format() + '\n\n' +
                          'Please ensure all tasks are completed before the deadline.';
            
            mail.setPlainTextBody(body);
            emails.add(mail);
        }

        // 3. Send all emails at once (bulkified)
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}