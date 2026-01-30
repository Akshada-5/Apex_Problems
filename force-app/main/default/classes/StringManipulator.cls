public with sharing class StringManipulator {
    /**
     * Reverses a given string.
     * @param input The string to be reversed
     * @return The reversed string, or null if input is null
     */
    public static String reverseString(String input) {
        // Handle null input to prevent NullPointerException
        if (input == null) {
            return null;
        }
        
        // Use the reverse() method from the String class for efficiency
        return input.reverse();
    }
}