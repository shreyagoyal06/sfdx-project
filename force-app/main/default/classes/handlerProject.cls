public class handlerProject {
    public static void method(Boolean isBefore,Boolean isInsert,Boolean isAfter,Boolean isUpdate,List<Project__c> newLst,Map<id,Project__c> oldMap)
    {
        if(isBefore && isInsert)
        {
            helperProject.method1(newLst);
        }
        if(isAfter && isUpdate)
        {
            helperProject.method2(newLst,oldMap);
        }
    }

}