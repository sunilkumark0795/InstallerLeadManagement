({
    clickCreate : function(component, event, helper) {
        let validExpense = component.find('expenseform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validExpense)
        {
            let newExpense = component.get("v.newExpense");
            console.log("Create Expense" + JSON.stringify(newExpense));
            helper.createExpense(component,newExpense);
            
        }

    }
})
