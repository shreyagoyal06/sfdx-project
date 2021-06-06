trigger trgContact on Contact (after Update,after insert) {
    HandlerCon.method(Trigger.isAfter,Trigger.isUpdate,Trigger.isInsert,Trigger.new,Trigger.oldmap);

}