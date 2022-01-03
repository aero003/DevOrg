public with sharing class ActivityViewerController 
{
    @AuraEnabled(cacheable=true)
    public static List<Account> getActivities(String accountId) {
        String accId = '0015g00000XF7CLAA1';
        system.debug('accId >> ' + accId);
        return [SELECT Id, Name from Account where Id = :accId];    
    }
}