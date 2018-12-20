trigger CreateEmail on Contact (before insert) {
    
    if (Trigger.isBefore){
        if (Trigger.isInsert) {
            for (Contact c : Trigger.New) {
                
                // Determine available information
                
                if (String.isNotBlank(c.Email)) {
                    System.debug('Contact already has an email.');
                    return;
                }                     
                if (String.isEmpty(c.FirstName) || String.isEmpty(c.AccountId) || String.isEmpty(c.Account.Website)) {
                    if (String.isEmpty(c.FirstName)) {
                        System.debug('First name required to create an email address.');
                        return;
                    }
                    if (String.isEmpty(c.AccountId)) {
                        System.debug('Account required to create an email address.');
                        return;
                    }
                    
                    
                    //SOQL Query on Account Id to find Website
                    if (String.isEmpty(c.Account.Website)) {
                        System.debug('Account website required to create an email address.');
                        return;
                    }
                }
                
                String companyName = c.Account.Website;
                
                // Remove Prefix Method
                
                if (companyName.startsWith('www.')) {
                    companyName = companyName.removeStart('www.');
                }
                
                if (companyName.startsWith('http://')) {
                    companyName = companyName.removeStart('http://');
                }
                if (companyName.startsWith('https://')) {
                    companyName = companyName.removeStart('https://');
                }
                
                
                //Create email
                
                String newEmail = c.FirstName + '.' + c.LastName + '@' + companyName;
                
                System.debug(newEmail);
                
                //insert newEmail into email field
            }
        }
    }
}