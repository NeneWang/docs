#mcli #journal



From now one I will be writing instead of separated by date. But separated by project. This is intended as it serves more purpose to separate it by project instead as to quickly trace the work on each



### Updating Backend Locally
#2024-05-30

Error at:
http://127.0.0.1:8000/ma/comment

![](../../../../img/Pasted%20image%2020240529140208.png)

- Why is this the only option for comment? 
- It seems to be because the comment model routes are not added as it should had been. 

Why is thi sinprocessable:

```json
{
  "account_id": 1,
  "body": 'sad',
  "title": 'explain why doesnt make sense',     
  "concept_slug": 'explain-why-doesnt-make-sense'
}

```


This being the expected entry:

```
{
  "account_id": 0,
  "body": "string",
  "title": "string",
  "concept_slug": "string"
}
```
But it says:

{ "detail": "Key already exists" }


Why do I still have not preset


Help me understand this error:

```

INFO:     127.0.0.1:52517 - "POST /ma/comment HTTP/1.1" 500 Internal Server Error
ERROR:    Exception in ASGI application
Traceback (most recent call last):
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 4406, in _flush
    flush_context.execute()
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\unitofwork.py", line 466, in execute
    rec.execute(self)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\unitofwork.py", line 679, in execute
    util.preloaded.orm_persistence.delete_obj(
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\persistence.py", line 174, in delete_obj
    states_to_delete = list(
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\persistence.py", line 309, in _organize_states_for_delete
    for state, dict_, mapper, connection in _connections_for_states(
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\persistence.py", line 1726, in _connections_for_states
    connection = uowtransaction.transaction.connection(base_mapper)
  File "<string>", line 2, in connection
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\state_changes.py", line 103, in _go
    self._raise_for_prerequisite_state(fn.__name__, current_state)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 944, in _raise_for_prerequisite_state
    raise sa_exc.ResourceClosedError("This transaction is closed")
sqlalchemy.exc.ResourceClosedError: This transaction is closed

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\uvicorn\protocols\http\httptools_impl.py", line 426, in run_asgi
    result = await app(  # type: ignore[func-returns-value]
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\uvicorn\middleware\proxy_headers.py", line 84, in __call__
    return await self.app(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\fastapi\applications.py", line 1054, in __call__
    await super().__call__(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\applications.py", line 123, in __call__
    await self.middleware_stack(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\middleware\errors.py", line 186, in __call__
    raise exc
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\middleware\errors.py", line 164, in __call__
    await self.app(scope, receive, _send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\middleware\cors.py", line 83, in __call__
    await self.app(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\middleware\exceptions.py", line 62, in __call__
    await wrap_app_handling_exceptions(self.app, conn)(scope, receive, send)     
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\_exception_handler.py", line 64, in wrapped_app
    raise exc
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\_exception_handler.py", line 53, in wrapped_app
    await app(scope, receive, sender)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\routing.py", line 762, in __call__
    await self.middleware_stack(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\routing.py", line 782, in app
    await route.handle(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\routing.py", line 297, in handle
    await self.app(scope, receive, send)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\routing.py", line 77, in app
    await wrap_app_handling_exceptions(app, request)(scope, receive, send)       
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\_exception_handler.py", line 64, in wrapped_app
    raise exc
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\_exception_handler.py", line 53, in wrapped_app
    await app(scope, receive, sender)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\routing.py", line 72, in app
    response = await func(request)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\fastapi\routing.py", line 299, in app
    raise e
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\fastapi\routing.py", line 294, in app
    raw_response = await run_endpoint_function(
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\fastapi\routing.py", line 193, in run_endpoint_function
    return await run_in_threadpool(dependant.call, **values)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\starlette\concurrency.py", line 40, in run_in_threadpool
    return await anyio.to_thread.run_sync(func, *args)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\anyio\to_thread.py", line 28, in run_sync
    return await get_asynclib().run_sync_in_worker_thread(func, *args, cancellable=cancellable,
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\anyio\_backends\_asyncio.py", line 818, in run_sync_in_worker_thread
    return await future
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\anyio\_backends\_asyncio.py", line 754, in run
    result = context.run(func, *args)
  File "C:\github\backend-streamlit-data-market\routes\api_mas.py", line 131, in postComment
    db.commit()
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 1967, in commit
    trans.commit(_to_root=True)
  File "<string>", line 2, in commit
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\state_changes.py", line 139, in _go
    ret_value = fn(self, *arg, **kw)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 1256, in commit
    self._prepare_impl()
  File "<string>", line 2, in _prepare_impl
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\state_changes.py", line 139, in _go
    ret_value = fn(self, *arg, **kw)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 1231, in _prepare_impl
    self.session.flush()
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 4310, in flush
    self._flush(objects)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 4446, in _flush
    transaction.rollback(_capture_exception=True)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\util\langhelpers.py", line 150, in __exit__
    raise value.with_traceback(traceback)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 4446, in _flush
    transaction.rollback(_capture_exception=True)
  File "<string>", line 2, in rollback
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\state_changes.py", line 103, in _go
    self._raise_for_prerequisite_state(fn.__name__, current_state)
  File "C:\Users\NelsonWang\anaconda3\lib\site-packages\sqlalchemy\orm\session.py", line 944, in _raise_for_prerequisite_state
    raise sa_exc.ResourceClosedError("This transaction is closed")
sqlalchemy.exc.ResourceClosedError: This transaction is closed
```


### Writing the report support
#2024-05-30 


![](../../../../img/Pasted%20image%2020240529151449.png)

- The big question here
- Also another thing to unlock is the ability of just pushing things to s3. (files) in clipboard to quickly prototype things. And then either get a markdown option by default or the link at least.
	- This could be also in the options of having it manually?

Revision: Attempting to have it as:

![](../img/Pasted%20image%2020240531150908.png)
```
"Approve Solution": async () => {

}
```


How does submission look like in terms of code?

```
Object.assign(selectable_choices_prompt, {

                    'Submit': async () => {

                        if (!did_pass_all_tests_before) {

                            console.log("You must pass all tests before submitting!");

                            // return false;

                            this.postProblemSolution(problem, { attempts_timestamp: attempts_timestamp, comments: comments });

  

                        } else {

                            console.log("Submission running", constants.ProblemStatus.solved);

                            question_state_flag = false;

                            // TODO Submit the current code that was there at least. to an post documnet.

  

                            return { status: constants.ProblemStatus.solved, details: { failed_attempts: failed_attempts }, problem_details: problem_details };

  

                        }

                    }

                })
```



The key being here:

```
return { status: constants.ProblemStatus.solved, details: { failed_attempts: failed_attempts }, problem_details: problem_details };
```


Lets check because you might no need or just by default open the solution instead?


So this is how it opens the problem Temporal:

```
await this.openProblemMetadataInTerminal(problem, { open_problem_temporal: true }); //By default opens the temrporal probelm file

... How about in the show solution? Here you can see that insteads open sthe show solution. I think this is 

this.openProblemMetadataInTerminal(problem, { open_problem_temporal: false, open_solution: true });


```


Why this kind of doesn't work:

```js
console.log("Settings.dsa_language_mode", Settings.dsa_language_mode )

print()
```

![](../img/Pasted%20image%2020240531152813.png)


is undefined, lets see how this is solved otherwise?


I am not hallucinating:

![](../img/Pasted%20image%2020240531153231.png)


Cant find this neither

![](../img/Pasted%20image%2020240531153425.png)



How about something that has no other configuration?
- Such as not at the re what does that mean?

It seems that this is ther rela working file for settings:

![](../img/Pasted%20image%2020240531153854.png)

What should we do about it?

This is kind of the key, or at least the main keyword: `absolute_temp_file_path`

```
async openSolutionFile(problem_slug, { editor_instruction = "start" } = {}) {

const absolute_temp_file_path = getDirAbsoluteUri(this.solution_filepath + problem_slug + '.js', "./");

await openEditorPlatformAgnostic(editor_instruction, { absolute_temp_file_path: absolute_temp_file_path })
```
> We can see this is the reference made. So I wonder which is the one to save it? And instead replace the key


Here:

```js so do me the following, add a conditional to also copy to clipboard:
    /**

     * Copies the file from problem_file_path to the temp_problem_filepath.

     * @param {str} problem_file_path The path to the file to copy

     * @param {str} base The path to the file to copy from e.g. base_code'

     */

    copyFileToTemp(problem_file_path, { base = "./base_code/" } = {}) {

        try {

            // console.log("Copying file from", problem_file_path, "to", this.temp_problem_filepath)

            const absolute_problem_file_path = getDirAbsoluteUri(problem_file_path, base);

            const absolute_temp_file_path = getDirAbsoluteUri(this.temp_problem_filepath, "./");

  
  

            // console.log("Opening file: " + absolute_problem_file_path, "from source,", problem_file_path);

            fs.readFile(absolute_problem_file_path, 'utf8', function (err, data) {

                if (err) {

                    console.log(err)

                    return false

                }



                fs.writeFile(absolute_temp_file_path, data, 'utf8', function (err) {

                    if (err) {

                        console.log(err)

                        return false

                    };

  

                });

            });

            return true;

        } catch (err) {

            console.error(err);

            return false;

  

        }

    }

```



Do I by any chance already copy to clipboard from before?


Yes here:

```js  
const clipboard = require('copy-paste')

...
tellCurrentDirectory = () => {

	const projectDirectory = getMaidDirectory();

	this.say(projectDirectory);

	clipboard.copy(projectDirectory);

}
```



How to copy the prompt to the clipboard:

```js
if (DEBUG) console.log("Problem prompt selected: ", promblem_prompt, "for problem", problem, "cloze?", problem.is_cloze);

renderPromptDescription(promblem_prompt, problem_details, { is_cloze: problem.is_cloze ?? false });
```


```js 
const renderPromptDescription = (prompt, prompt_details, { is_cloze = false } = {}) => {

    try {

        const constants = require("./constants");

        const chalk = require("chalk");

        marked.setOptions({

            renderer: new TerminalRenderer()

        });

        // Print title in Blue

        const title = prompt?.["title"] ?? "";

        console.log(`${chalk.hex(constants.CONSTANTS.CUTEBLUE).inverse(` ${title} `)} ${is_cloze ? "| " + chalk.hex(constants.CONSTANTS.CUTEPINK).inverse(` Cloze `) : ""}`)

  
  

        // Colored Difficulty tag.

        const prompt_difficulty = prompt_details?.["difficulty"] ?? "";

        const color_based_on_difficulty = (difficulty) => {

            if (difficulty === constants.difficulty.easy) return constants.CONSTANTS.CUTEGREEN;

            if (difficulty === constants.difficulty.medium) return constants.CONSTANTS.CUTEYELLOW;

            if (difficulty === constants.difficulty.hard) return constants.CONSTANTS.CUTEPINK;

            return constants.CONSTANTS.CUTEGREEN;

        }

        // Print tags but remove the difficulty from the tags array first

        const tags = prompt_details?.["tags"] ?? [];

        const tags_without_difficulty = tags.filter(tag => tag !== prompt_difficulty);

        // console.log(tags_without_difficulty);

  

        try {

  

            console.log(`${chalk.hex(color_based_on_difficulty(prompt_difficulty)).inverse(` ${prompt_difficulty} `)}`, tags_without_difficulty)

        } catch {

  

        }

  

        console.log(marked(prompt?.["description"] ?? ""));

        console.log(marked(prompt?.["preview"] ?? ""));

        return true;

    }

    catch (err) {

        console.log("Error while attempting to render prompt description", err);

        return false;

    }

};
```

Actually ignore that, why do that though.


No clipboard?

![](../img/Pasted%20image%2020240531155530.png)




### Sample Flow
#2024-05-30 


```js


/** 
 * https://leetcode.com/problems/design-twitter/
 * Your Twitter object will be instantiated and called as such:
 * var obj = new Twitter()
 * obj.postTweet(userId,tweetId)
 * var param_2 = obj.getNewsFeed(userId)
 * obj.follow(followerId,followeeId)
 * obj.unfollow(followerId,followeeId)
 */
class Twitter {
    constructor() {
        this.tweets = [];
        this.following = new Map();
    }

    postTweet(userId, tweetId, { tweets } = this) {
        tweets.push({ authorId: userId, id: tweetId });
    }

    getNewsFeed(userId, newsIDs = [], { tweets, following } = this) {
        for (let i = (tweets.length - 1); ((0 <= i) && (newsIDs.length < 10)); i--) {
            const tweet = tweets[i];

            const isAuthor = tweet.authorId === userId
            const isFollowing = following?.get(userId)?.has(tweet.authorId);
            const canAddTweet = isAuthor || isFollowing
            if (canAddTweet) newsIDs.push(tweet.id);
        }

        return newsIDs;
    }

    follow(followerId, followeeId, { following } = this) {
        // TODO Follow the followee by adding the followeeId to the following of the followerId.
        // Make sure it works even if the followerId does not exist
        FI following doesnt have the follower ID, create tadd that followerId into the set.
        Add that followerId into the following[followerId].add(followee)
    }

    unfollow(followerId, followeeId, { following } = this) {
        if (following.has(followerId)) following.get(followerId).delete(followeeId);
    }
}


module.exports = { Problem: Twitter };
```







