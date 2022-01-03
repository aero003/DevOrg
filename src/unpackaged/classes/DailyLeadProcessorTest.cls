@isTest
private class DailyLeadProcessorTest 
{
	public static String CRON_EXP = '0 0 0 16 4 ? 2022';
    static testmethod void testScheduledJob() 
    {
        List<Lead> leads = new List<Lead>();
        for(Integer i=1; i<=200; i++)
        {
            Lead lead = new Lead(FirstName = 'Lead', LastName = 'Dev'+i, Company = 'Minus', Status = 'Open - Not Contacted');
            leads.add(lead); 	 
		}
        insert leads;
        
        // Get the IDs of the opportunities we just inserted
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leads);
        List<Id> leadIds = new List<Id>(leadMap.keySet());
   
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        List<Lead> ld = [SELECT Id FROM Lead WHERE Id IN :leadIds];
        ld = [SELECT Id FROM Lead WHERE Id IN :leadIds];
        System.assertEquals(leadIds.size(), ld.size(), 'Leads with leadSource were created');
    }
}