global class batchAccountUpdate implements Database.Batchable<sObject> 
{
 
    global Database.QueryLocator start( Database.BatchableContext BC ) 
    {
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator( query ); 
    }
   
    global void execute( Database.BatchableContext BC, List< Account > scope ) 
    {    
        
        for ( Account a : scope )
        {
            if(a.name == 'Aditya')
            {
                //System.debug('scope'+scope);
            	a.Name = a.Name + ' Updated';  
            }
        }
        update scope; 
    }   
    
    global void finish( Database.BatchableContext BC ) 
    {
        
    }
 
}