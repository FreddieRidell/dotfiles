# General Coding Ideas

## 2018-10-16 Data Stores

In data stores, always store a collection as an object, unless the following all apply:

- They have an ordering
- They are most often displayed/used in that ordering

This means that they are always addresable by their IDs and encorages you to created any orderings as derrived data.
If they don't have an implicit ordering that is most frequently used, you'll be sorting them at use time anyway, so you might as well remove the false implication of an ordering from the store

It also makes for easier insertion and deletion

## 2018-10-18 Incremental Redux Images

You **MAY** have a special reducer, called `images`, that can be used to maintain any images of the data that are:

- expensive to calculate
- updated incrementally by actions
  an example image would be a list of 1000 comments sorted by `createdAt`, which is being constantly updated by a websocket
