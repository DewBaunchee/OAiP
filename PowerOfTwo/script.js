var arr = [],
    p, a, mul;

arr[0] = 2;
p = +prompt();
a = 0;

for (var i = 1; i < p; i++) {
    for (var j = 0; j < arr.length; j++) {
        mul = arr[j]*2 + a;
        if (mul - (mul % 10)) {
            a = (mul - mul % 10)/10;
            arr[j] = mul % 10;
            arr.push(0);
        } else {
            a = 0;
            arr[j] = mul;
        }
    }
}

a = new  RegExp();
for (var i = arr.length; i >= 0; i--) {
    a = a + arr[i];
}

console.log(a.replace(/undefined*0*/, '').replace('/(?:)/', ''));
