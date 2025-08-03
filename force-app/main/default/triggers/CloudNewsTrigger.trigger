/**
 * @author        Victor Pineda
 * @date          2025
 * @description   Trigger para eventos de Cloud News - Implementa patrón Handler/Delegator
 * @pattern       Handler Pattern, Strategy Pattern, Separation of Concerns
 */
trigger CloudNewsTrigger on Cloud_News__e (after insert) {
    CloudNewsTriggerHandler.handlerTrigger(Trigger.newMap, Trigger.oldMap, Trigger.operationType);
}