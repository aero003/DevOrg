public class AccountProcessor 
{
	@future
	public static void countContacts(List<Id> accIds)
    {
        //Integer count = 0;
        List<Account> accList = [Select id, Name, (Select id From Contacts)From Account Where Id = :accIds];
        for(Account acc : accList)
        {
            acc.Number_of_Contacts__c = acc.Contacts.size(); 
            //count = acc.Contacts.size(); 
            System.debug('ID: '+acc.Id);
        }
        update accList;
        //System.debug('Count: '+count); output
       
	}
}