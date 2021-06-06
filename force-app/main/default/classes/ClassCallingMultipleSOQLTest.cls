@isTest
public class ClassCallingMultipleSOQLTest {
    
    @TestSetup
    public static void calledBeforeEveryTest(){
        System.debug('calledBeforeEveryTest called');
        List<Profile> lstprofile=[select id,name from profile where NAme='Solution manager'];
        for(Profile pro: lstprofile){
            System.debug('Profile name='+pro.Name);
        }
        User testuser=new User();
        testuser.profileid=lstprofile.get(0).id;
        testuser.Username='testuser@teeeeestuser.com';
        testuser.LastName='Goyals';
        testuser.Email='testuser@testuser.com';
        testuser.Alias='shreya';
        testuser.TimeZoneSidKey='Asia/Kolkata';
        testuser.LocaleSidKey='en_IN';
        testuser.EmailEncodingKey='UTF-8';
        testuser.LanguageLocaleKey='en_US';
        
        insert testuser;
        
    }
    
    @isTest
    public static void emptyMethod(){
        System.debug('emptyMethod called');
    }
   
    @isTest
    public static void classSOQLTest(){
        List<Contact> lstcon=[select id from contact];
                lstcon=[select id from contact];
                lstcon=[select id from contact];
                lstcon=[select id from contact];
        System.debug('classSOQLTest called');
        System.debug('1.Number of Queries used in this apex code so far: ' + Limits.getQueries());
        Test.startTest();
        
        System.debug('1.Number of Queries used in this apex code so far: ' + Limits.getQueries());
        
        
        User testuser=[select id from User where Username='testuser@teeeeestuser.com'];
        System.runAs(testuser){
        ClassCallingMultipleSOQL.classSOQL();
        }
        
        Test.stopTest();
    }

}