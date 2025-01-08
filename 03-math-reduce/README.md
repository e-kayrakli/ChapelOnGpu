This example introduces more "real" computations in GPU programming. Here, we
create an array (`Data`) on the GPU, and compute its hyberbolic tangent while
summing all the values.

Note `+ reduce sum` _intent_ and the `+ reduce Data` expressions. Reductions are
also first-class expressions in Chapel. If the reduced data is on the GPU, the
reduction will be performed on the GPU. If it is a distributed array, it will be
executed in a distributed fashion efficiently.

### Further Reading
- [Reductions Primer](https://chapel-lang.org/docs/main/primers/reductions.html)
- [Forall
  Intents](https://chapel-lang.org/docs/main/language/spec/data-parallelism.html#forall-intents)
- [`Math` Module
  Documentation](https://chapel-lang.org/docs/main/modules/standard/Math.html)
