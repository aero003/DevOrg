@isTest
private class AccountProcessorTest 
{
    @isTest
    static void accountProcessorTest()
    {
        List<Account> account = new List<Account>();
        List<Contact> contact = new List<Contact>();
		
        List<Id> idList = new List<Id>();
        for(Integer i=0; i<3; i++)
        {
            account.add(new Account(Name = 'Async Account'));
        }
        insert account;
        for(Account acc : account)
        {
            contact.add(new Contact(FirstName = acc.Name, LastName = 'Contact', AccountId = acc.Id));
            idList.add(acc.id);
        }
        insert contact;
        
		//Start the test        
        Test.startTest();
        AccountProcessor.countContacts(idList);
        Test.stopTest();
        
        
        
        //Check the results
        List<Account> accList =  [Select id, Number_of_Contacts__c From Account];         
        for(Account acc : accList)
        {
            System.assertEquals(1, acc.Number_of_Contacts__c);
        }
    }   
}