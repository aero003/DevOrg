@isTest
public class batchAccountUpdateTest 
{
	@testsetup
    public static void testDataSetup()
    {
        Account acc = new Account();
        acc.Name = 'Aditya';
        insert acc;
    }
    
    @isTest
    static void testBatch()
    {
        Test.startTest();
        batchAccountUpdate batchable = new batchAccountUpdate();
		database.executeBatch(batchable);
        Test.stopTest();
        List<Account> accList = [Select ID From Account Where name = 'Aditya Updated'];
        System.debug('Account List: '+accList);
        System.assertEquals(1, accList.size());
    }
}