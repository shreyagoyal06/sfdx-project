@isTest
public class someClassTest {
    @isTest
    public static void testsum(){
        Integer result=someClass.sum(2,3);
        System.assertEquals(5, result);
    }
    @isTest
    public static void testsumFirstArgumentZero(){
        Integer result=someClass.sum(0,3);
        System.assertEquals(3, result);
    }
    

}