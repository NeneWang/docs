



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

- Query Search,   `isAuthenticated` Feature awaits for the authentication to replace has to be found on Auth0Client
- Then you have `UI Updated`  

The main question sis that if you can create a popup here from inside the connector to be used.:

- You can get the result redirect for parsing.
- Handle Redirect Callback()

![[Pasted image 20240628153425.png]]

- You have here also some UI elements that make it so that it requires showing content. So the UI here is mainly updating the content
### Trying to replicte to learn thinsgs


- [ ] Create a new Logoff Button
- [ ] Create a new login button that calls own function
- [ ] Print the id or unique identitfier


### Replicating Features in the Connector 



![[Pasted image 20240628154206.png]]

Oh look it seems we have a clientId.

- [ ] Check if this is the same client id that appears on auth0

![[Pasted image 20240628154700.png]]

Here is the user_id google-oauth2|110519369435080577723

LEts research if it is the case?

Use the auth client id? as identifier?


wangnelson2@gmail.com
user_id:

auth0|660c33c97ac7a7bdee06e17b


https://auth0.github.io/auth0-spa-js/classes/Auth0Client.html


Seems that wie need: `getTokenSilently`


Now given this token we should be able to:

![[Pasted image 20240628155356.png]]

Retrieve the user id:

### Lets Review Authentication here

https://auth0.com/docs/quickstart/backend/python/02-using?download=true

Which is a completely different set of tasks:

https://manage.auth0.com/dashboard/us/dev-aq3gvyp32qokfo08/applications/YQBKH5h8sOccEoA0x7m8Kv518QjKR92Z/quickstart/python




To run the sample follow these steps:

1. Set the **Allowed Callback URLs** in the [Application Settings](https://manage.auth0.com/#/applications/YQBKH5h8sOccEoA0x7m8Kv518QjKR92Z/settings) to:

```text
http://localhost:3000/callback
```

2. Set the **Allowed Logout URLs** in the [Application Settings](https://manage.auth0.com/#/applications/YQBKH5h8sOccEoA0x7m8Kv518QjKR92Z/settings) to:

```text
http://localhost:3000
```

3. Make sure [Python](https://www.python.org/downloads/) is installed and execute the following commands in the sample's directory:

```bash
pip install -r requirements.txt
python3 server.py
```

You can also run it from a [Docker](https://www.docker.com/) image with the following commands:

```bash
# In Linux / macOS
sh exec.sh
# In Windows' Powershell
./exec.ps1
```

