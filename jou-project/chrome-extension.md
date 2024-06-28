



```js
const login = async (targetUrl) => {

  try {
    console.log("Logging in", targetUrl); 
    const options = {
      authorizationParams: {
        redirect_uri: window.location.origin
      }
    };
    if (targetUrl) {
      options.appState = { targetUrl };
    }
    await auth0Client.loginWithRedirect(options);
  } catch (err) {
    console.log("Log in failed", err);
  }
};
```





