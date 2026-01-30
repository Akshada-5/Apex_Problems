@isTest
private class CaseCommentHandlerTest {
    @isTest
    static void testCountCaseComments() {
        // 1. Setup: Create a Case and related Comments
        Case testCase = new Case(Subject = 'Test Case', Status = 'New');
        insert testCase;

        List<CaseComment> comments = new List<CaseComment>{
            new CaseComment(ParentId = testCase.Id, CommentBody = 'First comment'),
            new CaseComment(ParentId = testCase.Id, CommentBody = 'Second comment')
        };
        insert comments;

        // 2. Act
        Test.startTest();
        Map<Id, Integer> resultMap = CaseCommentHandler.countCaseComments();
        Test.stopTest();

        // 3. Assert
        System.assert(resultMap.containsKey(testCase.Id), 'The map should contain the Case Id');
        System.assertEquals(2, resultMap.get(testCase.Id), 'The count should be exactly 2');
    }
}