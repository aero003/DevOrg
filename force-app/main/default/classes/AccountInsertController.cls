public class AccountInsertController 
{
	
   	public Account acc{get;set;}
   
   	public AccountInsertController()
   	{
       	acc = new Account();
   	}
    
   	public AccountInsertController(ApexPages.StandardController controller)
    {
    	acc = new Account();   
    }
  
    public PageReference save()
    {
            acc.Name = 'Custom '+acc.Name;
    	    Insert acc;
        	return new PageReference('/'+acc.id);
    }
}