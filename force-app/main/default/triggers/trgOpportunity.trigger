trigger trgOpportunity on Opportunity (before insert,before update) {
    HandlerOppo.method(Trigger.isBefore,Trigger.isInsert,Trigger.isUpdate,Trigger.new,Trigger.oldmap);
    

}