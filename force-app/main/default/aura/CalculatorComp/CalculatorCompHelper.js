({
    arithmeticOperationHelper : function(component) {

        var num1 = component.get('v.number1');
        var num2 = component.get('v.number2');
        var opsName = component.get('v.opsName');
        var res = 0;

        var n1 = parseInt(num1);
        var n2 = parseInt(num2);
        
        if(opsName == '+') {
            var res = n1 + n2;   
        }
        else if(opsName == '-') {
            var res = n1 - n2;
        }
        else if(opsName == '*') {
            var res = n1 * n2;
        }
        else if(opsName == '/') {
            var res = n1 / n2;
        }
        component.set('v.total', res);

    }
})
