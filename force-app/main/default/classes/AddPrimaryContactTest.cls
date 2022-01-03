@isTest
private class AddPrimaryContactTest 
{
    @testSetup
    static void testSetup()
    {
        List<Account> accounts = new List<Account>();
    	for(Integer i=1; i<=50; i++)
    	{
        	accounts.add(new Account(Name='Queueable Account '+i, BillingState='NY'));
    	}
        for(Integer i=1; i<=50; i++)
    	{
        	accounts.add(new Account(Name='Queueable Accnt '+i, BillingState='CA'));
    	}
        insert accounts;
    }
    static testMethod void testPrimaryContact()
    {
        Contact conatct = new Contact();
        AddPrimaryContact apc = new AddPrimaryContact(conatct, 'CA');
        
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
        System.assertEquals(50, [select count() from Account where BillingState =: 'CA']);
    }  
}