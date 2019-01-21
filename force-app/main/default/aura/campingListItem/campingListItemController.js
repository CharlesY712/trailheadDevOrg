({
	packItem : function(component, event, helper) {
		component.set("v.item.Packed__c", true);
 		component.set("v.disabled", true);
	}
})