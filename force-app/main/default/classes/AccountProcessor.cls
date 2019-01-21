public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> acctIds) {
        
        List<Account> accts = [Select Id from Account Where Id IN :acctIds];
        
        for (Account acct : accts) {
            Integer contacts = [select COUNT() from Contact Where AccountId = :acct.Id];
            acct.Number_of_Contacts__c = contacts;
        }
    }
}