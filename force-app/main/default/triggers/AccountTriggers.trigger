trigger AccountTriggers on Account (before insert, before update, after insert, after update, before delete) 
{
    if(Trigger.isInsert)
    {
        if(Trigger.isBefore)
        {
            AccountEventHandler.accountAddressTrigger(Trigger.new);
            AccountEventHandler.accountDuplication(Trigger.new);
        }
        else if(Trigger.isAfter)
        {
            AccountEventHandler.addRelatedRecord(Trigger.new);
            AccountEventHandler.createContact(Trigger.new);
        }
    }
    else if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
            AccountEventHandler.accountAddressTrigger(Trigger.new);
        }
        else if(Trigger.isAfter)
        {
            AccountEventHandler.addRelatedRecord(Trigger.new);
            AccountEventHandler.updateContact(Trigger.old, Trigger.new);
        }   
    }
    else if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
            AccountEventHandler.accountDeletion(Trigger.old, Trigger.oldMap);
        } 
    }
}