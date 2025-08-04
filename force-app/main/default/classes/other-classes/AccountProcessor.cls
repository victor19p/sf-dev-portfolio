public class AccountProcessor {
	@future
    public static void countContacts(List<Id> accountIds){
        //this list we have created to bulkified the trigger
        List<Account> accountToUpdate = new  List<Account>();
        //here we have added the account and associacted account to a list via soql
        List<Account > accounts = [SELECT id, name, (SELECT ID FROM contacts) from Account where id in :accountIds];
        
        for(Account acc : accounts){
            // contacts from the above list will be here in this list
            List<Contact> contactlist = acc.contacts; 
            //size of the list in this filed 
            acc.Number_of_Contacts__c = contactList.size();
            // added to the list = accountToUpdate 
            accountToUpdate.add(acc);
        }
        update accountToUpdate;
    }
}