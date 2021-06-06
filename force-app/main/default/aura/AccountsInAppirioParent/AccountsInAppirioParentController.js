({
	CallJS : function(component, event, helper) {
        var name=component.get("v.AccountName");
        var owner=component.get("v.AccountOwner");
        
        var childCmp = component.find("AccountsInAppirioChildID");
        var retnMsg = childCmp.GetMessageFromChildMethod(name,owner);
        	component.set("v.message",retnMsg);
        	
     }
})