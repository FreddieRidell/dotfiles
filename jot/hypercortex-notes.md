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

## 2018-10-16

keep the prop-per-node architecture, but have the value be a tuple that also contains the modifiedAt and modifiedBy fields. so we can keep the lack of overwriting, but also pick a correct answer
Try using proxies to provide an api to hypercortex objects, we need a functional wrapper to make sure we can add and remove fields from sets (e.g. tags) in a context free way.

```js
//try this api:

await x.prop = newVal
const val = await x.prop
await x.propAdd(newVal)
await x.propRemove(oldVal)
```

## 2018-10-19

### Hypertask rendering

Instead of coming up with my own stupid algorithm for laying out a table in the CLI, why not spend an evening looking through the taskwarrior source and seeing how they do it?
Furthermore, why not see if there's a nice rust crate that does the same thing...

## 2018-10-21

### hypercortex in general

I remembered today my original plan to have one single store of untyped objects, and to have programs select them only if they had props relevant to them. eg:

- `task` only selects objects with a `due` date.
- `clip` selects objects with a `link` prop
- `contacts` selects objects with a `phoneNumber`, `email`, or `name` prop

there are two ways I can think to implement this:

- order data in hyperdb first by prop (`/data/due/fdewyudoidheo`) so that our first operation can be to select objects that have a prop. this strikes me as ineficient, and abusing how hyperdb should best be used.
- eventually move over to a more [ssb](https://github.com/noffle/multifeed-index) like system, where we construct per-app indexes based on a global stream of actions.I'd likely have to write my own code for this as it needs to satisfy several specific requirements:
  - needs to be able to incorporate sorted data, so we don't overwrite info just based on discovery order
  - needs to be able to incorporate a whole object into a per-app index, after it's been created (if i've just added a `due` date to an object, the whole thing should appear in `task`

These problems could possibly be solved with a `hypercortex-server`, that allowed rapid querying from memory, but i'd have to do some timing tests to check.

alltogether though, none of this is important enough to derail the development of these apps, the api that they use to connect to `hypercortex-core` should remain largely unchanged.

> after thinking about this for a while, i've decided it's stupid, i keep thinking of fringe cases where this is needed, but it is still an over complication: focus on the product, don't let perfect be the enimy of good. you don't need to automatically make `clip` entries into tasks, and calDAV already has supourt for tasks you don't need this sort of cross app functionality, everything is actually well suited to being sorted into types
