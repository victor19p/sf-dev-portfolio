/**
*@author        Victor Pineda
*@date          2025
*@description   Clase handler para cachar los eventos del trigger
*/
public with sharing class CloudNewsTriggerHandler {
    public static void handlerTrigger(Map<Id,Cloud_News__e> newMap, Map<Id,Cloud_News__e> oldMap, System.TriggerOperation triggerEvent) {
        switch on triggerEvent {
            when AFTER_INSERT {
                System.debug(LoggingLevel.INFO, 'AFTER_INSERT');
                //Create Helper
                CloudNewsHelper.handleAfterInsert(newMap.values());
            }
            when AFTER_UPDATE {
                System.debug(LoggingLevel.INFO, 'AFTER_UPDATE');
                CloudNewsHelper.handleAfterUpdate(newMap.values(), oldMap.values());
            }
            when AFTER_DELETE {
                System.debug(LoggingLevel.INFO, 'AFTER_DELETE');
            }
            when BEFORE_INSERT {
                System.debug(LoggingLevel.INFO, 'BEFORE_INSERT');
            }
            when BEFORE_UPDATE {
                System.debug(LoggingLevel.INFO, 'BEFORE_UPDATE');
            }
            when BEFORE_DELETE {
                System.debug(LoggingLevel.INFO, 'BEFORE_DELETE');
            }
        }
    }
}