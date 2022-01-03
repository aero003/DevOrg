public class AccountEventHandler 
{
	/*public static void accountAddressTrigger(List<Account> listOfAccount)
    {
        for(Account acc : listOfAccount)
     	{
         	//acc.Name = acc.name+' Salesforce';
         	Boolean isChecked = acc.Match_Billing_Address__c;
         	if(isChecked)
         	{
             	acc.ShippingPostalCode = acc.BillingPostalCode;
         	}
     	}
	}*/
    
    public static void addRelatedRecord(List<Account> listOfAccount)
    {
        List<Opportunity> oppList = new List<Opportunity>();
    
    	// Get the related opportunities for the accounts in this trigger
    	Map<Id,Account> acctsWithOpps = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :listOfAccount]);
        System.debug('acctsWithOpps: '+acctsWithOpps);
    	// Add an opportunity for each account if it doesn't already have one.
    	// Iterate through each account.
    	for(Account a : listOfAccount) 
        {
        	//System.debug('Account Name: '+a.Name+'\nSize: '+Trigger.new.size());
        	//System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        	// Check if the account already has a related opportunity.
        	if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) 
            {
            // If it doesn't, add a default opportunity
            oppList.add(new Opportunity(Name=a.Name + ' Opportunity',StageName='Prospecting',CloseDate=System.today().addMonths(1),AccountId=a.Id));
        	}           
    	}
    	if (oppList.size() > 0) 
        {
        	insert oppList;
    	}
    }
    
    public static void accountDeletion(List<Account> listOfAccount, Map<Id,Account> mapAccount)
    {
        // Prevent the deletion of accounts if they have related opportunities.
    	for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :listOfAccount]) 
        {
        	mapAccount.get(a.Id).addError('Cannot delete account with related opportunities.');
    	}
    }
    
    public static void accountDuplication(List<Account> listOfAccount)
    {
        for(Account acc : listOfAccount)
        {
            List<Account> accList = [Select id, name From Account where name=:acc.name];
            if(accList.size()>0)
            {
                acc.addError('Cannot add the account because the name is already exists');
            }
		}
        
        /*List<Account> accountRecords = [Select Id,Name FROM Account];
        for(Account acc : accountRecords)
        {
            for(Account acc1 : listOfAccount)
            {
                if(acc.name == acc1.name)
                {
                      //System.debug('acc: '+acc.name+' acc1: '+acc1.name);
                      acc1.Name.addError('2 Cannot add the account because the name is already exists');
				}
			}
        }*/
	}
    
    public static void createContact(List<Account> listOfAccount)
    {
        List<Contact> conList = new List<Contact>();
        for(Account acc : listOfAccount)
        {
            if(acc.Number_of_Contacts__c > 0)
        	{
            	for(Double i=1; i<=acc.Number_of_Contacts__c; i++)
            	{
                    String lastName = String.valueOf(i);
                    conList.add(new Contact(Salutation='Mr.', FirstName=acc.Name, LastName=lastName, AccountId=acc.Id));
                }
        	}
        }
        if(conList.size()>0)
        {
            insert conList;
        }
    }
    
    public static void updateContact(List<Account> listOfOldAccount, List<Account> listOfNewAccount)
    {
        List<Contact> conList = new List<Contact>();
        List<Contact> conDelList = new List<Contact>();
        Double oldValue;
        for(Account accOld : listOfOldAccount)
        {
            oldValue = accOld.Number_of_Contacts__c;
            if(oldValue==null)
            {
                oldValue = 0.0;
			}
            System.debug('Original old: '+oldValue);
        }
        //System.debug('Outer if old: '+oldValue);
        for(Account accNew : listOfNewAccount)
        {
            if(accNew.Number_of_Contacts__c > oldValue)
            {
                //System.debug('Inner if old: '+oldValue);
                for(Double i=oldValue+1; i<=accNew.Number_of_Contacts__c; i++)
            	{              
                     String lastName = String.valueOf(i);
                     conList.add(new Contact(Salutation='Mr.',FirstName=accNew.Name, LastName=lastName, AccountId=accNew.Id));
                }
            }
            else if(accNew.Number_of_Contacts__c < oldValue)
            {
                System.debug('OLd: '+oldValue+' '+accNew.Number_of_Contacts__c);
                for(Double i=oldValue; i>accNew.Number_of_Contacts__c; i--)
            	{
                    String lastName = String.valueOf(i);
                    System.debug('name: '+accNew.name+' '+lastName);
                    conDelList.add([Select Id, Name From Contact where name = :accNew.Name+' '+lastName]);
                    
                }
			}
            System.debug('DEl List'+conDelList.size());
            System.debug('DEl List'+conDelList);
        }
        
        if(conList.size()>0) 
        {
            insert conList;
		}
        else if(conDelList.size()>0)
        {
            delete conDelList;
		}
	}
}