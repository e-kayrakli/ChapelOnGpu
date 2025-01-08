use Math;
use GpuDiagnostics;

config const n = 100;
config const writeData = n<=10;

// use `config` variables to choose between GPU and CPU dynamically
config const useGpu = true;
const targetLocale = if useGpu then here.gpus[0] else here;

// declare an array and write it out
var CpuData: [-n..n] real = (-n..n)/(n:real);
if writeData then writeln(CpuData);

// move the execution and allocation to the target locale
on targetLocale {
  // declare an array _on the target locale_ and copy the data in
  var GpuData = CpuData;
  if writeData then writeln(GpuData);

  // compute the hyperbolic tangent and the sum of generated values
  var sum: real;
  forall d in GpuData with (+ reduce sum) {
    d = tanh(d);
    sum += abs(d);
  }
  writeln("Sum of tanh of the input: ", sum);
  if writeData then writeln(GpuData);

  // sum-reduce the generated data: result should be close to 0
  writeln("Sum: ", + reduce GpuData);

  // copy the data back to CPU
  CpuData = GpuData;
}

// write the data
if writeData then writeln(CpuData);

// also sum-reduce on the CPU to confirm
writeln("Sum: ", + reduce CpuData);

