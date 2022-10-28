@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager 
{
	@HttpGet
    global static Account getAccount()
    {
	    //hello
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        //System.debug('Id '+accountId);
        Account result = [Select ID, Name, (Select Id, FirstName, LastName From Contacts) From Account where Id = :accountId];
        //System.debug('Acc '+result);
        return result;
	}
}
