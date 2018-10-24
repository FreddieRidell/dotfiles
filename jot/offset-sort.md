# Offset Sort

## 2018-10-24

It would be useful for redux selectors to have a function like

```js
offsetSort(range, offset, comparator, xs) => ys
ys === xs.sort(comparator).slice(offset, offset + range)
```

That is more efficient that just doing the RHS operation
