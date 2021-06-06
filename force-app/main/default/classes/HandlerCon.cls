public class HandlerCon {
    public static void method(Boolean isAfter,Boolean isUpdate,Boolean isInsert,List<Contact> lstcon,Map<id,Contact> mapcon)
    {
        if((isAfter && isUpdate) || (isAfter && isInsert))
        {
            HelperCon.method(lstcon,mapcon);
        }
    }
}