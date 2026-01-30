@isTest
private class StringManipulatorTest {
    @isTest
    static void testReverseString() {
        // Test Case 1: Standard String
        String result1 = StringManipulator.reverseString('Salesforce');
        System.assertEquals('ecrofselaS', result1, 'The string should be reversed correctly.');

        // Test Case 2: Empty String
        String result2 = StringManipulator.reverseString('');
        System.assertEquals('', result2, 'An empty string should return an empty string.');

        // Test Case 3: Null Input
        String result3 = StringManipulator.reverseString(null);
        System.assertEquals(null, result3, 'A null input should return null.');

        // Test Case 4: Palindrome
        String result4 = StringManipulator.reverseString('racecar');
        System.assertEquals('racecar', result4, 'A palindrome should remain the same.');
    }
}