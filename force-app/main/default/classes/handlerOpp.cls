public class handlerOpp {
    public static void method(Boolean isBefore,Boolean isUpdate,Boolean isAfter,List<Opportunity> newLst,Map<id,Opportunity> oldmap){
        if(isBefore && isUpdate)
        {
            //helperOpp.methodClose(newLst,oldmap);
            helperOpp.methodOppManager(newLst,oldmap);
            
        }
        if(isAfter && isUpdate)
        {
            helperOpp.methodEmail(newLst,oldMap);
        }
        
    }

}