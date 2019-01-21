public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts) {
        for (Account acct : accts) {
            acct.ShippingState = acct.BillingState;
        }
    }
}