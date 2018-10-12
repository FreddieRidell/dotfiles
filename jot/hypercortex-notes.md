# Hypercortex Notes

## 2018-10-12
make a hypercortex wrapper that takes a hyperdb, wrapps it in middleware and returns an object of handler functions that match the current API
each `type` should have an `onMount` and `onUpdate` middleware

+ `onMount` does house keeping, like deleting very old tasks
+ `onUpdate`
   + intercpets modifications, to block or modify them
   + creates any follow up modifications that need to be made
