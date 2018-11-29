# Commune With Inner iframe

## 2018-11-28

In `iframe`

```js
new MutationObserver(() => {
  const listenTo = document.querySelector("#rcpopup :nth-child(3)");
  if (listenTo)
    listenTo.addEventListener("click", () =>
      window.top.postMessage("CLICKED_THE_THING", "*")
    );
}).observe(document.getElementById("dialogBoxContainer"), {
  childList: true,
  subtree: true
});
```

## For use with iOS

[https://medium.com/@DrawandCode/how-to-communicate-with-iframes-inside-webview-2c9c86436edb](https://medium.com/@DrawandCode/how-to-communicate-with-iframes-inside-webview-2c9c86436edb)

## 2018-11-29

It looks like this might be imposible to fix without an alteration from the vendor. I've incuded a description of the problems bellow. Not sure what next steps should be, possibly brain-storming with more people involved, I don't know how feasable it is to ask the vendor to change something (it would only have to be the addition of a single line of javascript)

The problem is that js can't interact with child iframes, other than by passing messages, so we can't intercept the game's attempt to open a new tab.
we tried to get ios' WKWebView to inject some js into the child iframe, but it seems like that's only possible on initial document load, when the correct iframe hasn't been created yet.
