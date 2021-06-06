trigger trgOpp on Opportunity (before update,after update) {
    handlerOpp.method(Trigger.isBefore,Trigger.isUpdate,Trigger.isAfter,Trigger.new,Trigger.oldmap);
    

}