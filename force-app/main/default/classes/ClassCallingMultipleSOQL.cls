public class ClassCallingMultipleSOQL {
    public static void classSOQL(){
        id userprofileid=Userinfo.getProfileId();
        Profile profileObject=[select name from profile where Id=:userprofileid];
        System.debug('Profile name='+profileObject.Name);
        //for(Integer i=1;i<=97;i++)
        
            List<Account> acc=[select id from Account];
        System.debug('No of acc='+acc.size());
            
        
    }

}