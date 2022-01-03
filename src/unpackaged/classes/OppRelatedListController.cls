public class OppRelatedListController 
{
	public static List<Opportunity> oppList;
    //public Account account; 
    public Opportunity opp;

    //Constructor 
    public OppRelatedListController(ApexPages.StandardController controller) 
    { 
    	opp = (Opportunity)controller.getRecord();      
        //account = [SELECT id FROM account WHERE id =: acc.id LIMIT 1]; 
        oppList = [SELECT id, Name, Testing_Field__c FROM Opportunity WHERE Id =: opp.id];              
	}
    
    public static pageReference newOpp()
    {  
        pageReference pageRef = new pageReference('https://minus2-dev-ed.my.salesforce.com/a0q/e?nooverride=1&id={!SBQQ__Quote__c.Id}');  
        return pageRef;
    }
    
    public static void getOpp()
    {
        for(Opportunity op : oppList)
        {
			if(op.Testing_Field__c == true)
           	{
				op.adderror('Not Valid');
			}
			else
           	{
				newOpp();
			}
		}
    }
    
    public void FileDownload()
    {
    }
     
}