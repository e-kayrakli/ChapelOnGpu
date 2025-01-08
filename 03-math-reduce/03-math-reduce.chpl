use Math;
use GpuDiagnostics;

config const n = 100;
config const writeData = n<=10;

// use `config` variables to choose between GPU and CPU dynamically
config const useGpu = true;
const targetLocale = if useGpu then here.gpus[0] else here;

// move the execution and allocation to the target locale
on targetLocale {
  startVerboseGpu();

  // declare an array and write it out
  var Data: [-n..n] real = (-n..n)/(n:real);
  if writeData then writeln(Data);

  // compute the hyperbolic tangent and the "integral" of the curve
  var sum: real;
  forall d in Data with (+ reduce sum) {
    d = tanh(d);
    sum += abs(d);
  }
  writeln(sum);

  // sum-reduce the generated data: result should be close to 0
  // if Data is on the GPU (e.g. `./03-math-reduce --useGpu=true`), the
  // reduction below will execute in the GPU via a compiler-generated kernel
  writeln(+ reduce Data);
  stopVerboseGpu();
}
