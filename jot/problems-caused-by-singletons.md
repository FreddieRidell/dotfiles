# Problems Caused By Classes as Namespaces

## 2019-01-09 Hard to mock:

With source like this:

```js
getAccountServiceInstance().getSecurityQuestion();
```

It has to be mocked like this:

```js
jest.mock("../services/account", () => ({
  getAccountServiceInstance: jest.fn(() => ({
    getSecurityQuestion: jest.fn().mockReturnValue(Promise.resolve()),
    getDetails: jest.fn().mockReturnValue(Promise.resolve())
  }))
}));
```

This makes it very hard to overide a specific method, and adds unnescisary abstraction.
This functionality can better be achieved by having a file that exports many standalone functions
