use GpuDiagnostics;

// 2a. use `config` variables to choose between GPU and CPU dynamically
config const useGpu = true;
const targetLocale = if useGpu then here.gpus[0] else here;

// 2b. declare an array on the target locale
on targetLocale var Arr: [1..10] int;

// 2c. write it out
writeln(Arr);

// 2d. increment elements by one and print
startVerboseGpu();
foreach a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();

// 2e. increment elements by one _on the GPU_ and print
startVerboseGpu();
on targetLocale do foreach a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();

startVerboseGpu();
on Arr do foreach a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();
