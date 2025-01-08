use GpuDiagnostics;

// use `config` variables to choose between GPU and CPU dynamically
// to use this config variable, compile the application normally:
//   
//   $ chpl 02-locale.chpl
//
// Then, run with the flag that's baked in to the application by the compiler:
//
//   $ ./02-locale --useGpu=true
//
config const useGpu = true;
const targetLocale = if useGpu then here.gpus[0] else here;

// declare an array on the target locale (_may_ be GPU)
on targetLocale var Arr: [1..10] int;

// write it out
writeln(Arr);

// increment elements by one and print (_not_ on the GPU)
startVerboseGpu();
forall a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();

// increment elements by one on the target locale and print
startVerboseGpu();
on targetLocale do forall a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();

// `on` statements can also target a non-locale variable. In that case, the
// locale in which the variable is declared will be targeted. Therefore, the
// following `forall` loop will turn into a kernel and execute on the GPU _iff_
// `Arr` was declared on the GPU.
startVerboseGpu();
on Arr do forall a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();
