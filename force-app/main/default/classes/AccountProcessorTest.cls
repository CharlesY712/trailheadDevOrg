@IsTest
public class AccountProcessorTest {
	
    @IsTest
    private static void testCountContacts() {
		
        Account acct = new Account(Name= 'Test Account');
        insert acct;
        
        List<Id> acctIds = new List<Id>();
        acctIds.add(acct.Id);
        
        List<Contact> contacts = new List<Contact>();
        for (Integer i=0; i < 5; i++) {
            Contact contact = new Contact(LastName = 'Test #' +i, AccountId = acct.Id);
            contacts.add(contact);
        }
        
        insert contacts;
        
        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();
        
        Integer verifyContacts = [select count() from Contact where AccountId = :acct.Id];
        System.assertEquals(5, verifyContacts);
    } 
}