# Smart Stream Divider

## 2018-12-12 Idea

Create a rust library for processing data using a series of `n` transforms over iterators.
Make this library assign these transformations into `m` groups, where `m` is the number of processors
By measuring the throughput on each processor, the library could efficiently redistribute the group bounries, to ensure maximum utilisation
