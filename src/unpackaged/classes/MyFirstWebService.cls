global class MyFirstWebService
{
    webservice static String createAccount(String name, String description)
    {
        Account acc = new Account();
        acc.name = name;
        acc.description= description;
        insert acc;
        System.debug('Success '+acc.id);
        return 'Success '+acc.id;
    }
}