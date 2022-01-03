public class AddPrimaryContact implements Queueable
{
    private Contact contact;
    private String state;
    public AddPrimaryContact(Contact contact, String state)
    {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context)
    {
        List<Account> accounts = [Select Id From Account where BillingState = :state];
        List<Contact> contacts = new List<Contact>();
        System.debug(' '+accounts);
        for(Account acc : accounts)
        {
            Contact contactClone = Contact.clone();
            contactClone.AccountId = acc.id;
            contactClone.LastName = 'QueueCon';
            contacts.add(contactClone);
		}
        insert contacts;
	}
}