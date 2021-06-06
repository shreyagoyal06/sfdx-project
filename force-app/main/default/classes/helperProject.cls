public class helperProject {
    public static void method1(List<Project__c> newLst)
    {
        for(Project__c pro: newLst){
            pro.name+= +' '+pro.category__c;
        }
    }
    
    public static void method2(List<Project__c> newLst,Map<id,Project__c> oldMap)
    {
       List<Project_team__c> lstuser=new List<Project_team__c>();
        List<Project__c> lstpro=new List<Project__c>();
        for(Project__c pro:newLst){
            if(oldMap.get(pro.id).Project_manager__c!=pro.Project_manager__c)
            {
                lstpro.add(pro);
            }
        }
        List<Task> ta =new List<Task>();
        for(Project_Team__c pteam: [select project__c,Consultant__c 
                                    from Project_Team__c 
                                    where project__c in:lstpro])
        {
            Task t = new Task();
            t.description = 'Notification';
            t.Subject='Project manager is changed';
            t.WhatId = pteam.Consultant__c;
            ta.add(t);
                   }
        insert ta;
        }
}