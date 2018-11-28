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
