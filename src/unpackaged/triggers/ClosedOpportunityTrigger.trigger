trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) 
{
	List<Task> taskList = new List<Task>();
    for(Opportunity opp : Trigger.new)
    {
        if(opp.StageName=='Closed Won')
        {
            Task tk = new Task(Subject = 'Follow Up Test Task', WhatId=opp.Id);
            taskList.add(tk);
        }
       
    }
    if(taskList.size()>0)
    {
        insert taskList;
    }
}