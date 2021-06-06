public class HelperCon {
    public static void method(List<Contact> newlst,Map<id,Contact> mapcon)
    {
        List<id> lstcon=new List<id>();
        for(Contact con:newlst){
            if(con.suspicious__c==true && (con.suspicious__c!=mapcon.get(con.id).suspicious__c) || mapcon==null)
            {
                lstcon.add(con.AccountId);
            }
        }
        List<Account> lstacc=new List<Account>();
        for(Account acc:[select suspicious__c from account where id in : lstcon ])
        {
            acc.suspicious__c=true;
            lstacc.add(acc);
        }
        update lstacc;
    }
}