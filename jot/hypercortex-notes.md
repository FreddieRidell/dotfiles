# Hypercortex Notes

## 2018-10-12

make a hypercortex wrapper that takes a hyperdb, wrapps it in middleware and returns an object of handler functions that match the current API
each `type` should have an `onMount` and `onUpdate` middleware

- `onMount` does house keeping, like deleting very old tasks
- `onUpdate`
  - intercpets modifications, to block or modify them
  - creates any follow up modifications that need to be made

## 2018-10-17

### hypertask export

create an `export` command, that (for now) creates a string of commands that can be pasted into a shell to have hypertask re-construct the full state in a new hypercortex
needs to sort by score, so that the new cortex has them in the correct modified order, but should get them before filtering, so we can use tasks that are waiting

### hyperclip

make a nice hypercortex bookmark manger called hyperclip
