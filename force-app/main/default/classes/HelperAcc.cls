public class HelperAcc {
    public static void method(List<Account> newLst,Map<id,Account> oldmap)
    {
        List<id> lstacc=new List<id>();
        for(Account acc:newLst){
            if(acc.suspicious__c==true && oldmap.get(acc.id).suspicious__c!=acc.suspicious__c)
            {
                lstacc.add(acc.id);
            }
        }
        List<Contact> lstcon=new List<Contact>();
        for(Contact con: [select accountid from contact where accountid in : lstacc]){
            if(con.Suspicious__c!=true){
                lstcon.add(con);
            }
        }
        
    }

}