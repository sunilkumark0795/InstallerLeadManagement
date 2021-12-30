({
    createExpense : function(component, exepense) {
        let theExpenses = component.get("v.expenses");
        let newExpense = JSON.parse(JSON.stringify(expense));
        theExpenses.push(newExpense);
        component.set("v.expenses", theExpenses);

    }
})
