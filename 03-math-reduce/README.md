This example introduces more "real" computations in GPU programming. Here, we
create an array (`Data`) on the GPU, and compute its hyberbolic tangent while
summing all the values.

Note `+ reduce sum` _intent_ and the `+ reduce Data` expressions. Reductions are
also first-class expressions in Chapel. If the reduced data is on the GPU, the
reduction will be performed on the GPU. If it is a distributed array, it will be
executed in a distributed fashion efficiently.

### Further Reading
- `forall` intents
  - `reduce` intents
- `reduce` expressions
- Reductions primer
- `Math` module documentation
