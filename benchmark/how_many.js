b = 0;
console.time("Subtract Loop");
for (let a = 0; a < 200_000_000; a++) {
    c = a;
    b = c - b;
    b = c;
}
console.timeEnd("Subtract Loop");

console.time("Addition Loop");
b = 0;
for (let j = 0; j < 200_000_000; j++) {
    c = j;
    b = c + b;
    b = c;
}
console.timeEnd("Addition Loop");

console.time("Comparison Loop");
b = 0;
for (let d = 0; d < 200_000_000; d++) {
    c = d;
    if (d < b) {
        b = d;
    }
    b = c;
}
console.timeEnd("Comparison Loop");
