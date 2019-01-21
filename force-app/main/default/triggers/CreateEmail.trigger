trigger CreateEmail on Contact (before insert) {
    
    if (Trigger.isBefore){
        
        if (Trigger.isInsert) {
            
            for (Contact c : Trigger.New) {

                //If it has an email already, operation not necessary, bail. 
                if (String.isNotBlank(c.Email)) {
                    System.debug('Contact already has an email.');
                    return;
                }        

                //Find contact's parent account's website
                String parentAccountWebsite;
                
                if (!String.isEmpty(c.AccountID)) {
                    List<Account> parentAccount = [SELECT Id, Website FROM ACCOUNT WHERE Id = :c.AccountId];
                    parentAccountWebsite = parentAccount[0].Website; 
                } else {
                    parentAccountWebsite = null; 
                }
                

                // Determine the available information then respond appropriately          
                if (String.isEmpty(c.FirstName) || String.isEmpty(c.AccountId) || String.isEmpty(parentAccountWebsite)) {
                    if (String.isEmpty(c.FirstName)) {
                        System.debug('First name required to create an email address for ' + c.LastName);
                        return;
                    }

                    if (String.isEmpty(c.AccountId)) {
                        System.debug('Account required to create an email address for ' + c.LastName);
                        return;
                    }

                    if (String.isEmpty(parentAccountWebsite)) {
                        System.debug('Account website required to create an email address for ' + c.LastName);
                        return;
                    }
                }
                
                // Define new variable for company name
                String companyName;
                
                // Remove Prefix Method
                if (parentAccountWebsite.startsWith('www.')) {
                    companyName = parentAccountWebsite.removeStart('www.');
                }
                
                if (parentAccountWebsite.startsWith('http://')) {
                    companyName = parentAccountWebsite.removeStart('http://');
                }
                if (parentAccountWebsite.startsWith('https://')) {
                    companyName = parentAccountWebsite.removeStart('https://');
                }
                
                //Create email
                String newEmail = c.FirstName + '.' + c.LastName + '@' + companyName;
                
                System.debug(newEmail);
                
                c.Email = newEmail;
                
                System.debug(c);
            }
        }
    }
}