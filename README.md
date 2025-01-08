This repository contains GPU programming examples using Chapel.

### Overview of Examples

Examples are in their own directories with an associated README file describing
the concepts introduced very briefly alongside some links for further reading.
These directories are

- 00-intro: No GPU programming here, just fundamental Chapel concepts
- 01-basics: Allocating Chapel arrays and running Chapel loops on GPU
- 02-locale: Running the same code on the GPU and CPU using `locale` variables
- 03-math-reduce: Kernels with some math operations and reductions
- 04-math-reduce-comm: Same as above, but with CPU-GPU data transfers

### Quickstart Instructions

1. Download the latest Chapel release
2. Untar and go into the directory
3. Set Chapel environment with GPU support enabled
4. Compile and run examples


**NOTE**: If you expand on these examples and want to run some performance
analysis, make sure to use `--fast` when compiling. e.g.

```bash
$ chpl --fast 00-intro.chpl
```

### Other Resources

- GPU Programming blog series
- GPU technote
- Vendor-Neutral GPU Programming in Chapel, an HPE Developer community talk
  - or a playlist of short live demos contained in it
- A recorded 1-hour live demo session going over similar examples here
