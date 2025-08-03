public with sharing class OrderEventTriggerHandler extends TriggerHandler {
    private Map<Id, Order_Event__e> newOrderEventsMap;

    public OrderEventTriggerHandler() {
        this.setMaxLoopCount(1);
        this.newOrderEventsMap = (Map<Id, Order_Event__e>) Trigger.newMap;
    }

    public override void afterUpdate() {
        List<Task> tasks = new List<Task>();
        String userId = UserInfo.getUserId();

        for (Order_Event__e event : newOrderEventsMap.values()) {
            if (event.Has_Shipped__c == true) {
                tasks.add(new Task(
                    Priority = 'Medium',
                    Subject = 'Follow up on shipped order ' + event.Order_Number__c,
                    OwnerId = userId
                ));
            }
        }
        if (!Schema.sObjectType.Task.isCreateable()) {
            // Optionally, handle the lack of permission (e.g., log, throw exception)
            // System.debug('User does not have create access to Task.');
            return;
        }
        insert tasks;
    }
}