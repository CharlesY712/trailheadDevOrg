@isTest
public class TestRestrictContactByName {
	@isTest static void TestContactWithInvalidName() {

        Contact cont = new Contact(LastName='INVALIDNAME');
        
        Test.startTest();
        	Database.SaveResult result = Database.insert(cont, false);
        	//Database.DeleteResult result = Database.delete(acct, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }

}