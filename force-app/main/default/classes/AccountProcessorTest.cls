@isTest
public class AccountProcessorTest {
    @isTest
    private static void testContactCount(){
        Account newAccount = new Account(Name = 'Test account');
        insert newAccount;

        Contact newContact = new Contact();
        newContact.FirstName    = 'Rahul';
        newContact.LastName     =  'Soni';
        newContact.Description  =  'Salesforce challanges';
        newContact.AccountId    =  newAccount.id;
        insert newContact;
        
        Contact newContact2 = new Contact();
        newContact2.FirstName    = 'Gagan';
        newContact2.LastName     =  'Soni';
        newContact2.Description  =  'Salesforce challanges';
        newContact2.AccountId    =  newAccount.id;
        insert newContact2;

        List<Id> accountids = new List<Id>();
        accountids.add(newAccount.Id);
        Test.startTest();
        AccountProcessor.countContacts(accountids);
        Test.stopTest();
    }
}