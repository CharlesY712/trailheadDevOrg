public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfCont,String lastName) {
        List<Contact> conts = new List<Contact>();
        
        for(Integer i=0;i<numOfCont;i++) {
            Contact c = new Contact(FirstName='TestName' + i);
            conts.add(c);
        }
        
    return conts;
        
    }
    
}