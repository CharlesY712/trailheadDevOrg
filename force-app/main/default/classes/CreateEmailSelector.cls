public class CreateEmailSelector {

    static String parentAccountWebsite;

    public static String createEmailSelector(Contact c) {
        if (!String.isEmpty(c.AccountID)) {
            List<Account> parentAccount = [SELECT Id, Website FROM ACCOUNT WHERE Id = :c.AccountId];
            parentAccountWebsite = parentAccount[0].Website; 
        } else {
            parentAccountWebsite = null; 
        }
        return parentAccountWebsite;
    }
}