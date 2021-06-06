public class Helper {
    /*public static void method1(List<Account> newlstacc,Map<id,Account> oldmapacc){
       
        Map<id,Account> mapacc=new Map<id,Account>();
        for(Account acc: newlstacc){
            if(acc.active__c=='Yes' && acc.active__c!=oldmapacc.get(acc.id).active__c)
            {
                mapacc.put(acc.id,acc);
            }
        }
        for(Contact con:[select accountid,MailingCity 
                         from contact 
                         where accountid in:mapacc.keySet() and primary__c=true])
        {
            mapacc.get(con.AccountId).BillingCity=con.mailingCity;
        }
    }*/
    
    
    public static void methodAccType(List<Account> newlstacc){
        for(Account acc: newlstacc){
            if(acc.Type=='Internal'){
                acc.Name+=+' '+acc.Type;
            }
            else
            {
                acc.Name+=' External';
            }
        }
    }
    
    public static void methodDeactive(List<Account> newlstacc,Map<id,Account> oldmapacc)
    {
        Map<id,Account> mapacc=new Map<id,account>();
        for(Account acc: newlstacc)
        {
            
            if(acc.Active__c=='No' && acc.Active__c!=oldmapacc.get(acc.Id).active__c){
                mapacc.put(acc.Id,acc);
            }
        }
        for(Contact con:[select accountid from contact where accountid in:mapacc.keySet()])
        {
            mapacc.get(con.accountid).addError('Account cannot be deactivated because there are contacts associated with this account');
        }
        
    }
    
   /* public static void methodEmail(List<Account> newlstacc,Map<id,Account> oldmapacc)
    {
        Map<id,Account> mapacc=new Map<id,account>();
        for(Account acc: newlstacc){
            if(acc.Type == 'External' && oldmapacc.get(acc.id).type=='Internal'){
                mapacc.put(acc.Id,acc);
            }
        }
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Contact con:[select Email from contact where Accountid in : mapacc.keyset()])
        {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(con.Email);
            mail.setToAddresses(sendTo);
            
            
            mail.setReplyTo(mapacc.get(con.AccountId).account_email__c);
            mail.setSubject('Account type changed to External');
            String body='Hey, Account that you are associated with has changed its type from internal to external';
            mail.setHTMLBody(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }*/
    
    public static void methodPhone(List<Account> newlstacc,Map<id,Account> oldmapacc){
        map<id,Account> mapacc=new  map<id,Account>();
        for(Account acc: newlstacc){
            if(acc.Phone!=oldmapacc.get(acc.Id).Phone){
                mapacc.put(acc.Id,acc);
            }
        }
        List<Contact> lstcon=new List<Contact>();
        for(Contact con:[select Phone,accountid from contact where accountid in : mapacc.keySet()])
        {
            con.Phone = mapacc.get(con.AccountId).phone;
            lstcon.add(con);
        }
        update lstcon;
    }
    
    public static void methodDeleteAcc(Map<id,Account> mapacc){
        Set<id> setcon=new Set<id>();
        for(Contact con:[select accountid from contact where accountid in : mapacc.keyset()]){
            setcon.add(con.id);
            if(setcon.size()>=2){
           mapacc.get(con.AccountId).addError('Account cannot be deleted because 2 or more contacts are associated with it');
                }
        }  
    }
}