public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingCode) {
        List<Contact> cts = [SELECT Id,LastName FROM Contact
                        WHERE (LastName = :lastName AND MailingPostalCode = :mailingCode)];
		return cts;
    }
}