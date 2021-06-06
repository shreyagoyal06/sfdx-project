public class OpportunityCustomContr {
   List<Opportunity> opp;
    public OpportunityCustomContr(){
        opp=[select name,CloseDate from Opportunity];
           
    }
    public List<Opportunity> getOpportunities(){
        return opp;
    }
   

}