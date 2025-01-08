This example builds upon the previous,
[03-math-reduce](https://github.com/e-kayrakli/ChapelOnGpu/tree/main/03-math-reduce)
example. The main difference is that, this time, the data is initialized on the
CPU memory, copied into a target locale (potentially a GPU). Then, the same
computation is performed before copying the output back on the CPU memory.

This represents a common pattern in GPU programming. Note the simplicity Chapel
arrays bring: they can be assigned to one another where the data will be copied
efficiently depending on many factors. Here, these copies will be done between
the GPU and CPU memories in bulk. Normally, this is done by the programmer more
explicitly by using things like `cudaMemcpy` or `hipMemcpy`.

### Further Reading
- [Chapel's High-Level Support for CPU-GPU Data Transfers and Multi-GPU Programming](https://chapel-lang.org/blog/posts/gpu-data-movement/)
