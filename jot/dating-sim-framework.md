# uLudating usim uframework

## 2018-11-30 flex calculations

divide the screen in to 3 sections, each section has the style

```
sections {
   display: flex;
}

section {
   flex: log2( $NUMBER_OF_CHARACTERS ) + 1, 0
   transition: flex 1s;
}
```

then you can add and subtract characters from each section and have the display shift them about nicely
