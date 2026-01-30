public with sharing class BookHandler {
    public static Decimal calculateAveragePrice() {
        // Use an Aggregate Query for performance
        AggregateResult[] results = [SELECT AVG(Price__c)avgPrice FROM Book__c];
        
        if (results.size() > 0 && results[0].get('avgPrice') != null) {
            return (Decimal)results[0].get('avgPrice');
        }
        
        return 0.0;
    }
}