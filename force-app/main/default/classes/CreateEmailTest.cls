@isTest
private class CreateEmailTest {
    static testMethod void CreateEmailTest() {

        final String ACCOUNT_WEBSITE = 'www.yesSite.com';

        Contact contact = new Contact(
            FirstName = 'Testy',
            LastName = 'McTesterson',
            AccountId = '001B000000pBJSHIA4'
        );

        Test.startTest();
        insert contact;
        Test.stopTest();

        System.assertEquals(ACCOUNT_WEBSITE, contact.Account.Website, 
            'We expect the email to match.');
    }
}
