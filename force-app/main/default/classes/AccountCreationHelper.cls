public class AccountCreationHelper {
       
     public static List<Contact> contactCreation(List<Account> acc)
    {
        List<Contact> conlist=new List<Contact>();
        for(Account ac:acc)
        {
            Contact c=new Contact();
            c.AccountId=ac.id;
            c.LastName=ac.name;
            c.Phone=ac.phone;
            conlist.add(c);
        }
        insert conlist;
        return conlist;
    }
     public static void contactUpdate(List<Account> acc)
    {
        
        List<Contact> cc=new List<Contact>();
        cc=contactCreation(acc);
    }
}