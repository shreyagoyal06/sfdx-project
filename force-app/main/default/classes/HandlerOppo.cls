public class HandlerOppo {
    public static void method(Boolean isBefore,Boolean isInsert,Boolean isUpdate,List<Opportunity> newlst,Map<id,Opportunity> oldmap){
        if(isBefore && (isInsert || isUpdate))
        {
            HelperOppo.method(newlst,oldmap);
        }
    }

}