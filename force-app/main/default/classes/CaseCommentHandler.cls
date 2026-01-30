public with sharing class CaseCommentHandler {
    /**
     * Counts comments for each Case.
     * @return Map<Id, Integer> A map where Key is CaseId and Value is the count of comments
     */
    public static Map<Id, Integer> countCaseComments() {
        Map<Id, Integer> caseCommentMap = new Map<Id, Integer>();

        // We use AggregateResult to group by ParentId (which is the Case Id)
        // and count the IDs of the comments.
        AggregateResult[] groupedResults = [SELECT ParentId, COUNT(Id) commentCount 
                                            FROM CaseComment 
                                            GROUP BY ParentId];

        for (AggregateResult ar : groupedResults) {
            Id caseId = (Id)ar.get('ParentId');
            Integer count = (Integer)ar.get('commentCount');
            caseCommentMap.put(caseId, count);
        }

        return caseCommentMap;
    }
}