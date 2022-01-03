global class DailyLeadProcessor implements Schedulable
{
	global void execute(SchedulableContext ctx) 
    {
        List<Lead> leadList = new List<Lead>();
        List<Lead> leads = [Select Id, Name From Lead where LeadSource =: '' Limit 200];
        for(Lead Lead : leads)
        {
            lead.LeadSource = 'Dreamforce';
            leadList.add(lead);
        }
        update leads;
	}
}