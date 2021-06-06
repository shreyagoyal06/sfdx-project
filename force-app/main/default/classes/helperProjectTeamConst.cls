public class helperProjectTeamConst {
    public static void helpermethod(List<Project_Team__c> lstcont){
        List<id> lst=new List<id>();
        for(Project_Team__c proteam: lstcont){
            lst.add(proteam.Consultant__c);
        }
        map<String,Integer> mapPT=new map<String ,Integer>();
        
        for(AggregateResult proT: [select consultant__c con, COUNT(project__c) noOfProject from Project_Team__c 
                                       where consultant__c in : lst
                                       group by consultant__c])
        {
            mapPT.put(String.valueOf(prot.get('con')),Integer.valueOf(prot.get('noOfProject')));
        }
        for(Project_team__c pro: lstcont){
            if(mapPT.containsKey(pro.consultant__c) && mapPT.get(pro.consultant__c)>=2)
            {
                pro.addError('Selected consultant is already assigned to two projects');
            }
        }
       
    }
    
    public static void allocationhrs(List<Project_Team__c> newLst,Map<id,Project_team__c> oldmap)
    {
		List<id> lstPT=new List<id>();
        for(Project_team__c proteam: newLst)
        {
            if(oldmap==null || (oldmap.get(proteam.Id).allocation_hours__c!=proteam.allocation_hours__c))
            {
                lstPT.add(proteam.Project__c);
            }
        }
        Map<id,Integer> mapDaysLeft=new  Map<id,Integer>(); 
	for(Project_team__c pro:[select Project__r.start_date__c,Project__r.end_date__c from Project_Team__c where project__c in : lstPT])
    {
        mapDaysLeft.put(pro.id,pro.Project__r.Start_Date__c.daysBetween(pro.Project__r.End_Date__c));
    }
     for(Project_team__c pro:newLst)
     {
         if(((pro.Allocation_hours__c*7)/mapDaysLeft.get(pro.Id))>40)
         {
             pro.addError('Allocation hours cannot be more than 40 hours a week');
         }
     }
        
    }

}