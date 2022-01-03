@isTest
private class LeadProcessorTest 
{
	@testSetup
    static void testSetup()
    {
        List<Lead> leads = new List<Lead>();
        for(Integer i=1; i<=200; i++)
        {
            String str = String.valueOf(i);
            leads.add(new Lead(FirstName='lead ', LastName=str, Company='Farmers Coop. of Florida', Status='Dreamforce', LeadSource='Dreamforce'));
        }
        insert leads;
    }
    @isTest
    static void test()
    {
        List<Lead> leadList= [Select Id,LeadSource From Lead];
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        for(Lead lead : leadList)
        {
            System.debug('LeadSource: '+lead.LeadSource);
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}