trigger trgProject on Project__c (before insert,after update) {
    
    handlerProject.method(Trigger.isBefore,Trigger.isInsert,Trigger.isAfter,Trigger.isUpdate,Trigger.new,Trigger.oldmap);

}