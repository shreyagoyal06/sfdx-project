public class HandlerAcc {
    public static void method(Boolean isAfter,Boolean isUpdate,List<Account> newLst,Map<id,Account> oldmap)
    {
        if(isAfter && isUpdate)
        {
            HelperAcc.method(newlst,oldmap);
        }
    }

}