@isTest
private class AccountTriggerTest {
    @isTest static void TestCreateNewAccountInBulk() {
        
        List<Account> accts = new List<Account>();
        
        for (Integer i=0; i < 200; i++) {
            Account acct = new Account(Name= 'Test Account' + i);
            accts.add(acct);
        }
        
        Test.startTest();
        insert accts;
        Test.stopTest();
        
        List<Account> verifyAccts = [select Id from Account];
        System.assertEquals(200, verifyAccts.size());
    }
}