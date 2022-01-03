public class VfStdcontroller 
{
	public Account acc{get;set;}
    
    public VfStdcontroller(ApexPages.StandardController controller)
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