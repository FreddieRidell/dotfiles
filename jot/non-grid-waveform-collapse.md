# Non Grid Waveform Collapse

Instead of using a big chunky grid as the medium, instead use a grid of pixels. We'll try to work with patterns many times larger than the medium's quantisation.
The algorithm still needs to work with a finite number of states though

## Building the ruleset

1. Take `n` samples of the input image
2. For each sample also measure `m` evenly distributed points at distance `r` from the sample
3. These halo samples can be used to produce rules about what states can exist next to each other in what configurations
4. (for example, `m = 4, r = 1` is analogous to grid based WFC

## Creating the output

1. Initialise the medium to have the probability of 1 for every state
2. make `a` randomly distributed samples throughout the medium to reduce the probability of states
   1. Again take `m` evenly distributed points at distance `r`
   2. Use these points with the generated ruleset to find any impossible states
   3. Reduce the probability of that state in the medium, using a falloff of some kind from the central point
3. Make `b` random samples throughout the medium, select the sample with the most resolved state, and reduce the probability of all other states to 0 with a falloff
4. Use a heuristic to determine how overall resolved the state is, if we've not hit our target yet: go to `2`
5. Reduce the remaining partially un-determined states using voronoi spreading or something similar

This is probably best implemented in rust WASM, and would be a good chance to get to grips with this tech. I can do so here: [https://rustwasm.github.io/book/game-of-life/introduction.html](https://rustwasm.github.io/book/game-of-life/introduction.html)

## 2018-11-18
