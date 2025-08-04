public with sharing class CaseService {
    public static void closeCases(Set<Id> caseIds, String reason) {
        if (caseIds == null || caseIds.isEmpty()) {
            throw new IllegalArgumentException('Case IDs cannot be null or empty.');
        }
        if (!Schema.sObjectType.Case.isAccessible()) {
            throw new System.SecurityException('User does not have read access to Case object.');
        }
        if (!Schema.sObjectType.Case.isUpdateable()) {
            throw new System.SecurityException('User does not have update access to Case object.');
        }
        List<Case> casesToUpdate = [SELECT Status, Reason FROM Case WHERE Id in :caseIds];
        
        for (Case c : casesToUpdate) {
            c.Status = 'Closed';
            c.Reason = reason;
        }
        
        update casesToUpdate ;
    }
}