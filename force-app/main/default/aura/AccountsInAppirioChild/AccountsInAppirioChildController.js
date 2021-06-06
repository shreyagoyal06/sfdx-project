({
	getMessage : function(component, event) {
        var params = event.getParam('arguments');
        if (params) {
            var param1 = params.Name;
            var param2= params.Owner;
            return "Account Name is "+param1+" And its Owner is "+param2;
        }
        return "";
    }

})