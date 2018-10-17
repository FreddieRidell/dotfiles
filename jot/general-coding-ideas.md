# General Coding Ideas

## 2018-10-16

In data stores, always store a collection as an object, unless the following all apply:

- They have an ordering
- They are most often displayed/used in that ordering

This means that they are always addresable by their IDs and encorages you to created any orderings as derrived data.
If they don't have an implicit ordering that is most frequently used, you'll be sorting them at use time anyway, so you might as well remove the false implication of an ordering from the store

It also makes for easier insertion and deletion
