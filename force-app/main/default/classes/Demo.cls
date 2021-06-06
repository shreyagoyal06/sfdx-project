public class Demo {
    public List<Opportunity> getOpp(List<Contact> lstcon){
        List<Opportunity> listOpp =new List<Opportunity>();
        Set<id> setacc=new Set<id>();
        for(Contact con:lstcon){
            if(con.accountid!=null)
            setacc.add(con.accountid);
        }
        listOpp=[select id,accountid from Opportunity where accountid in: setacc];
        System.debug('opplist ='+listOpp);
        return listOpp;
    }
        public Map<id,List<Opportunity>> method(List<Contact> lstco){
            List<Opportunity> opp1= new List<Opportunity>();
                opp1 = getOpp(lstco);
            Map<id,List<Opportunity>> mapopp=new Map<id,List<Opportunity>>();
            for(Opportunity opp2:opp1){
            if(!mapopp.containskey(opp2.accountid)){
                mapopp.put(opp2.accountid,new List<Opportunity>() );
            }
            mapopp.get(opp2.accountid).add(opp2);
            }
            System.debug(mapopp);
            return mapopp;

        }

}