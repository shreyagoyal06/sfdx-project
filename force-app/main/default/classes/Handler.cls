public class Handler {
    public static void method(Boolean isUpdate,Boolean isBefore,Boolean isInsert,Boolean isAfter,Boolean isDelete,List<Account> lstAcc,Map<id,Account> mapacc)
    {
        if(isUpdate && isBefore)
        {
             helper.methodDeactive(lstAcc,mapacc);
        }
        if(isBefore && isInsert)
        {
            helper.methodAccType(lstacc);
        }
        if(isAfter && isUpdate)
        {
            helper.methodPhone(lstAcc,mapacc);
        }
        if(isBefore && isDelete)
        {
            helper.methodDeleteAcc(mapacc);
        }
        
       
    }

}