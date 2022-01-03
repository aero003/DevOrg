public class RetrieveDeletedAccounts {
    
    public void RetrieveDeletedAccountsMethod(){
        
        List<Account> deletedAccounts = [select Id, name from Account WHERE isdeleted=true ALL ROWS];
        undelete deletedAccounts;
        
    }

}