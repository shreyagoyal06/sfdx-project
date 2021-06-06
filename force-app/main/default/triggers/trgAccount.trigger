trigger trgAccount on Account (before update,before insert,after insert,after update,before delete) {
    handler.method(Trigger.isUpdate,Trigger.isBefore,Trigger.isInsert,Trigger.isAfter,trigger.isDelete,Trigger.new,Trigger.oldMap);

}