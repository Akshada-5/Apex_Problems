@isTest
private class BookHandlerTest {
    
    @isTest
    static void testAveragePrice() {
        // Create sample data
        insert new List<Book__c>{
            new Book__c(Title__c = 'Book A', Price__c = 10.00),
            new Book__c(Title__c = 'Book B', Price__c = 20.00)
        };

        Test.startTest();
        Decimal avg = BookHandler.calculateAveragePrice();
        Test.stopTest();

        System.assertEquals(15.00, avg, 'Average should be 15.00');
    }

    @isTest
    static void testInvalidAndEdgeValues() {
        // 1. Testing Null and Zero values
        // Note: AVG() in SOQL ignores nulls. 
        // If we have 10, 20, and null, the average is (10+20)/2 = 15.
        insert new List<Book__c>{
            new Book__c(Title__c = 'Null Price Book', Price__c = null),
            new Book__c(Title__c = 'Zero Price Book', Price__c = 0.00),
            new Book__c(Title__c = 'Normal Book', Price__c = 30.00)
        };

        Test.startTest();
        Decimal avg = BookHandler.calculateAveragePrice();
        Test.stopTest();

        // Calculation: (0 + 30) / 2 = 15.00
        // The null record is ignored by the AVG function.
        System.assertEquals(15.00, avg, 'Average should be 15 (ignoring null, including zero)');
    }
}