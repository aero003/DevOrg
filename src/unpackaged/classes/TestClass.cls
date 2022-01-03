public class TestClass 
{
    public List<Account> acc{get;set;}
	public TestClass()
    {
        acc = [Select Id,Name,Industry,Phone From Account where Industry!=null order by name desc];
    }
}