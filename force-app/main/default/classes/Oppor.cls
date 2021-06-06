public class Oppor {
    public void method(List<Opportunity> listOpp){
        List<quote> listquot = new List<quote>();
       
        List<Opportunity> listOpp1=new  List<Opportunity>();
        for(Opportunity opp: listOpp){
            
            if(opp.StageName=='Closed Won'){
                
               listOpp1.add(opp);
               
            }
        }
        Set<id> setid=new set<id>();
        for(Quote q:[select OpportunityId from quote where OpportunityId in :listOpp1]){
            setid.add(q.OpportunityId);
            
        }
        for(Opportunity O:listOpp1){
            if(!setid.contains(O.Id)){
                 Quote q=new Quote();
                q.Name='Quote '+O.Name;
                q.OpportunityId=O.Id;
                listquot.add(q);
            }
        }
      insert listquot;
    }
    
}