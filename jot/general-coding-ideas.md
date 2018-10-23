# General Coding Ideas

## 2018-10-16 Data Stores

In data stores, always store a collection as an object, unless the following all apply:

- They have an ordering
- They are most often displayed/used in that ordering

This means that they are always addressable by their IDs and encourages you to created any orderings as derived data.
If they don't have an implicit ordering that is most frequently used, you'll be sorting them at use time anyway, so you might as well remove the false implication of an ordering from the store

It also makes for easier insertion and deletion

## 2018-10-18 Incremental Redux Images

You **MAY** have a special reducer, called `images`, that can be used to maintain any images of the data that are:

- expensive to calculate
- updated incrementally by actions
  an example image would be a list of 1000 comments sorted by `createdAt`, which is being constantly updated by a websocket

## 2018-10-23

### Example of a app that doesn't need to couple data, route, and rendering.

- `store` contains `user` data
- routing has some paths that can be viewed by guests (`/faq`), and some that can only be visited by users (`/my-account`)
- render tree contains a `ModalOnSessionExpire` component that on each render, checks the current route:
  - if `route === "/faq"` then do nothing
  - if `route === "/my-account"` then
    - if `user` is authorised, then do nothing
    - if `user` is `null`, or unauthorized, then render a modal that blocks all other access to the page, and displays only a button to go to `/login`

If `ModalOnSessionExpire` has a complete list/function to determine which routes need auth, this setup provides a declarative, clean, and graceful system for booting a user who's session has expired. It doesn't couple the data store to the routing and makes a user's `loggedin` status into a derived property of the store, and makes the actual logging out action initiated by the user

### What goes where in the path?
