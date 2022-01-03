@isTest
private class AccountManagerTest 
{
	@isTest
    static void testGetAccount()
    {
    	Account acc = new Account(Name = 'WebserviceAccount');
        insert acc;
        Contact con = new Contact(AccountId = acc.id, FirstName = 'Web', LastName = 'Testing');
        insert con;
         
        RestRequest request = new RestRequest();
        request.requestUri = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' +acc.id+ '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account myAccnt = AccountManager.getAccount();
        System.assert(myAccnt!=null);
        System.assertEquals('WebserviceAccount', myAccnt.Name);
            
    }
}