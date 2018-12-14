# uLubetter uinline udocumentation

## 2018-12-14

inspired by [etsy](https://codeascraft.com/2018/10/10/etsys-experiment-with-immutable-documentation/).

Instead of formal old-school docstrings at the start of functions that don't tell you anything a static analyser couldn't why not create unstructured `fyi` comments in code. These can be tagged with meta data about

- which repo they're in
- which dirs/file
- what class/function they're in
- what classes/functions they're near to calls of

but these metadata is only used for querying the database for `fyi`s, the actual `fyi`s themselves have to be self contained snippets of text for information
