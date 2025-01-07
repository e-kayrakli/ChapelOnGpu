use Math;
use GpuDiagnostics;

config const n = 100;
config const writeData = n<=10;

// 3a. use `config` variables to choose between GPU and CPU dynamically
config const useGpu = true;
const targetLocale = if useGpu then here.gpus[0] else here;

// 3b. move the execution and allocation to the target locale
on targetLocale {
  startVerboseGpu();

  // 3c. declare an array and write it out
  var Data: [-n..n] real = (-n..n)/(n:real);
  if writeData then writeln(Data);

  // 3d. compute the hyperbolic tangent and the "integral" of the curve
  var sum: real;
  forall d in Data with (+ reduce sum) {
    d = tanh(d);
    sum += abs(d);
  }
  writeln(sum);

  // 3e. sum-reduce the generated data: result should be close to 0
  writeln(+ reduce Data);
  stopVerboseGpu();
}
