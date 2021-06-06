public class helperOpp {
    public static void methodClose(List<Opportunity> newLst,Map<id,Opportunity> oldmap){
        List<Opportunity> lstopp=new List<Opportunity>();
        for(Opportunity opp: newLst)
        {
            if((opp.StageName=='Closed Won' || opp.StageName=='Closed Lost') && 
               opp.StageName!=oldmap.get(opp.Id).StageName)
            {
                lstopp.add(opp);
            }
        }
		List<String> lstOLI=new List<String>();
        for(OpportunityLineItem oppLI:[select opportunityid,Product2Id 
                                       from OpportunityLineItem 
                                       where opportunityid in:lstopp])
        {
            lstOLI.add(oppLI.opportunityid);
        }
		
for(Opportunity opp:lstopp){
if(!lstOLI.contains(opp.id)){
opp.addError('Opportunity cannot be '+opp.StageName+' since it does not contain any Opportunity product');
}
}

    }
    
    public static void methodEmail(List<Opportunity> newLst,Map<id,Opportunity> oldmap){
        Map<id,Opportunity> mapopp=new Map<id,Opportunity>();
        for(Opportunity opp: newLst)
        {
            if((opp.StageName=='Closed Won' || opp.StageName=='Closed Lost') && (opp.StageName!=oldmap.get(opp.Id).StageName))
            {
                mapopp.put(opp.id,opp);
            }

        }
        List<Messaging.SingleEmailMessage> mails=new List<Messaging.SingleEmailMessage>();
        for(OpportunityTeamMember u : [select user.Email,Opportunityid 
                                       from OpportunityTeamMember 
                                       where Opportunityid in : mapopp.keyset()])
        {
            Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
            List<String> sendTo=new List<String>();
            sendTo.add(u.user.Email);
        
            mail.setToAddresses(sendTo);
            mail.setReplyTo('zoegoyal95@gmail.com');
            mail.setSubject('Opportunity is closed won');
            String body='Hey, The Opportunity team that you are part of is closed won';
                mail.setHtmlBody(body);
            mails.add(mail);
            
        }
        Messaging.sendEmail(mails);
    }
    
    public static void methodOppManager(List<Opportunity> newLst,Map<id,Opportunity> oldmap){
        List<Opportunity> lstopp=new List<Opportunity>();
        for(Opportunity opp: newLst){
            if(oldmap.get(opp.id).BillToContact__c!=null && oldMap.get(opp.Id).Manager__c==null)
            {
                opp.Manager__c=opp.AccountId;
            }
        }
        
        
    }
    

}