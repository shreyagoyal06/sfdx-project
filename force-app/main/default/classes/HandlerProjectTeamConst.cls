public class HandlerProjectTeamConst {
    public static void handlermethod(Boolean isInsert ,Boolean isBefore,Boolean isUpdate,List<Project_Team__c> lstconst,Map<id,Project_team__c> oldmap){
        
        if(isBefore && (isInsert || isUpdate)){
        helperProjectTeamConst.helpermethod(lstconst);
        }
    }
    

}