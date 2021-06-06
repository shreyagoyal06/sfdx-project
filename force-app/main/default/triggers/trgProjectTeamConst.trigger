trigger trgProjectTeamConst on Project_Team__c (before insert,before update) {
    HandlerProjectTeamConst.handlermethod(Trigger.isInsert,Trigger.isBefore,Trigger.isUpdate,Trigger.new,Trigger.oldmap);

}