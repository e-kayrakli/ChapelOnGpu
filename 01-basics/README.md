This is the first example where GPUs are used. The key concept that's introduced
here is the `on` statement. An `on` statement can move the execution to another
locale. That locale could be a remote node in a supercomputer or a GPU. Breaking
`on here.gpus[0]` up:

- `on` is the keyword in Chapel for `on` statement :). An `on` statement
  requires a target to move the execution to.

- `here` is a builtin keyword that returns the current execution locale, which
  is of `locale` type.

- `gpus` is a field of the `locale` type and it is a Chapel array that stores
  all the GPU "sublocales" within its owner locale.

Therefore the `on` statement here moves the execution to the first device in
there. This means:

- Dynamic memory allocations (e.g. array data) are made on the device
- Parallel loops are turned into and executed as kernels.

Furthermore, this example also introduces some of the diagnostic capabilities in
the `GpuDiagnostics` module to understand the GPU behavior of the application.


### Further Reading

- [Introduction to GPU Programming in
  Chapel](https://chapel-lang.org/blog/posts/intro-to-gpus/) blog article
- [Locales Primer](https://chapel-lang.org/docs/main/primers/locales.html)
  (includes `on` statement)
- [`GpuDiagnostics` Module
  Documentation](https://chapel-lang.org/docs/main/modules/standard/GpuDiagnostics.html)
