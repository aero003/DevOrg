global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful
{
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
    	return Database.getQueryLocator('Select Id, BillingStreet, BillingCity, BillingState, BillingPostalCode,'+
                                       '(Select Id, MailingStreet, MailingCity, MailingState, MailingPostalCode From Contacts)'+
                                       'From Account Where BillingCountry = \'USA\'');   
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope)
    {
        // process each batch of records
        List<Contact> contacts = new List<Contact>();
        for(Account account : scope)
        {
			for(Contact contact : account.contacts)
            {
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;
                // add contact to list to be updated
                contacts.add(contact);
                // increment the instance member counter
                
                recordsProcessed = recordsProcessed+1;
            }            
		}
        if(contacts.size()>0)
        {
            update contacts;
        }
	}
    
    global void finish(Database.BatchableContext bc)
    {
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [Select Id, Status, NumberOfErrors, TotalJobItems, 
                           CreatedBy.Email From AsyncApexJob Where Id = :bc.getJobId()];
        // call some utility to send email
        EmailUtils.sendMessage(job, recordsProcessed);
    }
}