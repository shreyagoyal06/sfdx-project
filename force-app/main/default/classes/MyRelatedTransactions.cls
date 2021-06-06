public class MyRelatedTransactions {
    public Contact con;
    public List<Transaction__c> trans;
    public MyRelatedTransactions(){
        ID id1=ApexPages.currentPage().getParameters().get('id');
        if(id1!=null)
        {
            trans=[select contact__r.name from transaction__c where id=:id1];
            
        }
        else
        {
          trans=[select account__r.name from transaction__c] ;  
        }
    }
    public Contact getContact(){
        return con;
    }

}