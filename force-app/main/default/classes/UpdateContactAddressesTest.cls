@isTest
private class UpdateContactAddressesTest 
{
	@testSetup
    static void setup()
    {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        //insert 10 contacts
        for(Integer i=1; i<=10; i++)
        {
            accounts.add(new Account(name = 'Account '+i, billingcity='New York', billingcountry='USA'));
        }
        insert accounts;
        // find the account just inserted. add contact for each
        for(Account account : [Select Id From account])
        {
            contacts.add(new Contact(firstName = 'first', lastName = 'last',accountId = account.id));
        }
        insert contacts; 
    }
    @isTest
    static void test()
    {
        Test.startTest();
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        //System.debug([Select count() From contact where MailingCity = 'New york']);
        System.assertEquals(10, [Select count() From contact where MailingCity = 'New york']);
    }
}