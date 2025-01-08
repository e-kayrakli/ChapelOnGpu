// declare an array with indices 1..0 and 64-bit integer elements
var Arr: [1..10] int;

// write it out
writeln(Arr);

// increment elements by one in parallel (_not_ on GPU)
forall a in Arr do a += 1;

// write it out
writeln(Arr);
