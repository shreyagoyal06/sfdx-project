@isTest
public class helperacctest {
    @isTest
    public static void testmethodAccType(){
    Account acc=new Account(Name='Radhika',Type='Internal');
    /*acc.Name='Radhika';
    acc.Type='Internal';*/
    insert acc;
        Account ac=[Select Name from Account];
        System.assertEquals('Radhika Internal', ac.Name);
    }
    @isTest
    public static void testmethodAccTypeOther(){
    Account acc=new Account();
    acc.Name='Radhika';
    acc.Type='External';
    insert acc;
                Account ac=[Select Name from Account];
        System.assertEquals('Radhika External', ac.Name);
    }
    
  /*  @isTest
    public static void testmethodDeactive(){
        Account acc;
        acc.Active__c='No';
        List<Contact> lstcon=[select accountid from contact where accountid =:acc.Id];
        
    }*/

}