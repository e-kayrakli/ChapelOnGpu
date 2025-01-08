This repository contains GPU programming examples using
[Chapel](https://chapel-lang.org/).

### Overview of Examples

Examples are in their own directories with an associated README file describing
the concepts introduced very briefly alongside some links for further reading.
These directories are

- [00-intro](https://github.com/e-kayrakli/ChapelOnGpu/tree/main/00-intro): No
  GPU programming here, just fundamental Chapel concepts
- [01-basics](https://github.com/e-kayrakli/ChapelOnGpu/tree/main/01-basics):
  Allocating Chapel arrays and running Chapel loops on GPU
- [02-locale](https://github.com/e-kayrakli/ChapelOnGpu/tree/main/02-locale):
  Running the same code on the GPU and CPU using `locale` variables
- [03-math-reduce](https://github.com/e-kayrakli/ChapelOnGpu/tree/main/03-math-reduce):
  Kernels with some math operations and reductions
- [04-math-reduce-comm](https://github.com/e-kayrakli/ChapelOnGpu/tree/main/04-math-reduce-comm):
  Same as above, but with CPU-GPU data transfers

### Quickstart Instructions

Here's some quick start instructions. For more detailed information, please
check out [Chapel
documentation](https://chapel-lang.org/docs/usingchapel/index.html) and the [GPU
technical note](https://chapel-lang.org/docs/technotes/gpu.html). The following
assumes that either `nvcc` or `hipcc` exists and accessible in the terminal
session.

1. Download the latest Chapel
   [release](https://github.com/chapel-lang/chapel/releases)
2. Untar and go into the directory

```shell
$ tar xzvf chapel-X.Y.Z.tar.gz
$ cd chapel-X.Y.Z
```

3. Set Chapel environment with GPU support enabled

```shell
$ source util/setchplenv.bash
$ export CHPL_LOCALE_MODEL=gpu # otherwise, GPU support is not enabled
```

4. Build Chapel

```shell
$ make
```

4. Compile and run examples

```
$ cd <path to this repo>
$ cd 00-intro
$ chpl 00-intro.chpl
$ ./00-intro
```

**NOTE**: If you expand on these examples and want to run some performance
analysis, make sure to use `--fast` when compiling. e.g.

```shell
$ chpl --fast 00-intro.chpl
```

### Other Resources

- [GPU Programming in
  Chapel](https://chapel-lang.org/blog/series/gpu-programming-in-chapel/) blog
  series
- [GPU Technote](https://chapel-lang.org/docs/technotes/gpu.html)
- [Vendor-Neutral GPU Programming in
  Chapel](https://www.youtube.com/watch?v=nj-WqhGEy24&t=1s&ab_channel=HewlettPackardEnterprise),
  an HPE Developer community talk
  - or a playlist of [short live
    demos](https://www.youtube.com/watch?v=h1V7QuJ9mzk&list=PLuqM5RJ2KYFgNM62w9QdRTcWPpf3rfSwr)
    contained in it
- A recorded [live demo session](https://www.youtube.com/watch?v=5OqjQhfGKes)
  going over similar examples
