trigger OrderEventTrigger on Order_Event__e (after insert) {
    new OrderEventTriggerHandler().run();
}