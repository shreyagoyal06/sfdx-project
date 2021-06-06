public class AccountCustomController {
    
    private final Account acc;
    public String Name;
    public String Phone;
    public String Industry;
    public AccountCustomController(){
        if(ApexPages.currentPage().getParameters().get('id')!=null){
            acc=[select name,Phone,Industry,demo__c from account where id =:ApexPages.currentPage().getParameters().get('id')];
            Name=acc.Name;
            Phone=acc.Phone;
            Industry=acc.Industry;
        }
        else
        {
            acc=new Account();
            
        }
    }
        public Account getAccount(){
            return acc;
        }
        public PageReference save(){
            if(acc.id!=null)
            {
                update acc;
            }
            else{
                insert acc;
            }
            PageReference redirect=new ApexPages.StandardController(acc).view();
            return redirect;
        }
    public String getName(){
        return Name;
    } 
    public void setName(String n){
        Name=n;
    }
    public String getPhone(){
        return Phone;
    }
    public void setPhone(String p){
        Phone=p;
    }
    public String getIndustry(){
        return Industry;
    }
    public void setIndustry(String i){
        Industry=i;
    }
    
    
        
    
}