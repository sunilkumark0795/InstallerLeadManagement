({
    onAdd : function(component, event, helper) {
        component.set('v.opsName', '+');
        helper.arithmeticOperationHelper(component);

    },

    onSubtract : function(component, event, helper) {
        component.set('v.opsName', '-');
        helper.arithmeticOperationHelper(component);

    },

    onMultiply : function(component, event, helper) {
        component.set('v.opsName', '*');
        helper.arithmeticOperationHelper(component);
    },

    onDivide : function(component, event, helper) {
        component.set('v.opsName', '/');
        helper.arithmeticOperationHelper(component);

    },

    
})