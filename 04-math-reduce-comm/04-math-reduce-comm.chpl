use Math;
use GpuDiagnostics;

config const n = 100;
config const writeData = n<=10;

// 4a. use `config` variables to choose between GPU and CPU dynamically
config const useGpu = true;
const targetLocale = if useGpu then here.gpus[0] else here;

// 4b. declare an array and write it out
var CpuData: [-n..n] real = (-n..n)/(n:real);
if writeData then writeln(CpuData);

// 4c. move the execution and allocation to the target locale
on targetLocale {
  // 4d. declare an array _on the target locale_ and write it out
  var GpuData = CpuData;
  if writeData then writeln(GpuData);

  // 4e. compute the hyperbolic tangent and the "integral" of the curve
  var sum: real;
  forall d in GpuData with (+ reduce sum) {
    d = tanh(d);
    sum += abs(d);
  }
  writeln("Area under the curve: ", sum);
  if writeData then writeln(GpuData);

  // 4f. sum-reduce the generated data: result should be close to 0
  writeln("Sum: ", + reduce GpuData);

  // 4g. copy the data back to CPU
  CpuData = GpuData;
}

// 4h. write the data
if writeData then writeln(CpuData);

// 4h. also sum-reduce on the CPU to confirm
writeln("Sum: ", + reduce CpuData);

