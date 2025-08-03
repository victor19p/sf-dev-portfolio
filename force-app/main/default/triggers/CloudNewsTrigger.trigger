trigger CloudNewsTrigger on Cloud_News__e (after insert) {
    CloudNewsTriggerHandler.handlerTrigger(Trigger.newMap, Trigger.oldMap, Trigger.operationType);
}