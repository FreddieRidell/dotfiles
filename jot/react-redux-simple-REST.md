# React Redux Simple Reactive

## 2018-10-15

### Core API
```jsx
   <Reactive
      selector = { mapsReduxStoreToFirstArgOfChildFunction }
      generateKey = { takesOtherPropsAndGeneratesAKeyForShouldComponentUpdate }
      { ...otherProps }
   >
      { data => <div>{data}</div> }
   </GetRest>
```
