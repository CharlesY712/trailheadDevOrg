public class AccountHandler {
    public static Account insertNewAccount(String AccountName) {
        try {
            Account acct = new Account(Name=AccountName);
            insert acct;
            
            return acct;
        } catch (DmlException e) {
            return null;
        }
    }
}