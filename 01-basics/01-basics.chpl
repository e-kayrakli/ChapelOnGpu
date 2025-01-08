use GpuDiagnostics;

// 1a. declare an array on the GPU
on here.gpus[0] var Arr: [1..10] int;

// 1b. write it out
writeln(Arr);

// TODO improve comment(s)
// 1c. increment elements by one and print
startVerboseGpu();
forall a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();

// 1d. increment elements by one _on the GPU_ and print
startVerboseGpu();
on here.gpus[0] do forall a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();


// 1e. instrument the code with GpuDiagnostics to observe the behavior
