public with sharing class CloudNewsHelper {


    public static void handleAfterInsert(List<Cloud_News__e> newList) {
        System.debug(LoggingLevel.INFO, 'Handling AFTER_INSERT for Cloud_News__e');
        // Implement logic for handling after insert
        List<Case> cases = new List<Case>();
        Group queue;
        if (!Schema.sObjectType.Group.isAccessible()) {
            System.debug(LoggingLevel.ERROR, 'User does not have read access to Group object.');
            return;
        }
        queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];

        for (Cloud_News__e event : newList) { // Cambiar Trigger.New por newList
            if (event.Urgent__c == true) {
                Case cs = new Case();
                cs.Priority = 'High';
                cs.Subject = 'News team dispatch to ' +
                    event.Location__c;
                cs.OwnerId = queue.Id;
                cases.add(cs);
            }
        }
        if (!Schema.sObjectType.Case.isCreateable()) {
            System.debug(LoggingLevel.ERROR, 'User does not have create access to Case object.');
            return;
        }
        insert cases;

    }
    public static void handleAfterUpdate(List<Cloud_News__e> newList, List<Cloud_News__e> oldList) {
        System.debug(LoggingLevel.INFO, 'Handling AFTER_UPDATE for Cloud_News__e');
        // Implement logic for handling after update
    }
}