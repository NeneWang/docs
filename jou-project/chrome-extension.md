



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




![[Pasted image 20240628152314.png]]



See here:

```js
  
  

  const isAuthenticated = await auth0Client.isAuthenticated();
  
  if (isAuthenticated) {
    console.log("> User is authenticated");
    window.history.replaceState({}, document.title, window.location.pathname);
    updateUI();
    return;
  }

  console.log("> User not authenticated");

  const query = window.location.search;
  const shouldParseResult = query.includes("code=") && query.includes("state=");

  

  if (shouldParseResult) {

    console.log("> Parsing redirect");
    try {
      const result = await auth0Client.handleRedirectCallback();
      if (result.appState && result.appState.targetUrl) {
        showContentFromUrl(result.appState.targetUrl);
      }

      console.log("Logged in!");
    } catch (err) {
      console.log("Error parsing redirect:", err);
    }
  

    window.history.replaceState({}, document.title, "/");

  }

```


The `isAuthenticated` feature can be set up for auth0clientfeature to keep track of user authentication is used on `app.js`

- Query Search,   `isAuthenticated` Feature awaits for the atuhtenntication to replace 