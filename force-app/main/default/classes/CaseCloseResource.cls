@RestResource(urlMapping='/case/*/close')
/*
    Implement a POST closeCase method which accepts a String reason and calls the CaseService.closeCases 
    service method passing in the Id and close reason.
*/
global with sharing class CaseCloseResource {
    @HttpPost
    global static void closeCase(String closeReason) {
        System.debug('HTTPPOST - ' + closeReason + ' - ' + RestContext.request.requestURI);
         // Parse context
        RestRequest req = RestContext.request;
        String[] uriParts = req.requestURI.split('/');
        Id caseId = uriParts[2];
        // Call the service
        CaseService.closeCases(new Set<ID> { caseId }, closeReason);  
        
    }
}