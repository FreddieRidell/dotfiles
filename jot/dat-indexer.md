# Dat-Indexer

## 2018-12-06 Big Idea

It could be relativly simple to make an app that

- starts at a `dat://` page
- craws links
- indexes pages
- applies pagerank
- publishes this data to a `dat`
- has a public app that allows you to query that `dat`

## How to index

Stop trying to parse a whole site, you'll get worse results in the short-term, and it's more open to abuse.

Instead, why not parse the `head`, to extract info from the `meta`, `title`, and `links` tags

You could even request that people add a `topics` meta tag, that contains up to 10 topics that the site contains

By limiting what you parse, rather than trying to be smart, you improve performance, and limit abuse
