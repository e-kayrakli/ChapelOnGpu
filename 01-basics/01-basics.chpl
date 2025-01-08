use GpuDiagnostics; // this module contains some diagnostic tools

// declare an array _on the GPU_
on here.gpus[0] var Arr: [1..10] int;

// write it out (executes on the CPU, elements transferred one-by-one)
writeln(Arr);

// increment elements by one and print, _not_ on the GPU
// this shows that through Chapel's global memory view, GPU elements are
// directly accessible on the CPU. Though note that this will result in a
// per-element copy, and will be slow
startVerboseGpu();
forall a in Arr do a += 1;
stopVerboseGpu();
writeln(Arr);
writeln();

// increment elements by one _on the GPU_ and print
startVerboseGpu();
on here.gpus[0] do forall a in Arr do a += 1; // this is a kernel
stopVerboseGpu();
writeln(Arr);
writeln();
