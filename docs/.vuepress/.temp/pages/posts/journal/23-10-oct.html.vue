<template><div><h2 id="_2-monday" tabindex="-1"><a class="header-anchor" href="#_2-monday"><span>2 Monday</span></a></h2>
<ul>
<li>[x] 2.1 Improve using Rollback</li>
<li>[ ] 2.2 Do SLC Site Upload</li>
<li>[x] 2.3 Remove Async from all to remove errors</li>
<li>[x] 2.4 Adding feature to add insertion into the database with the markdowns and comments.</li>
</ul>
<h3 id="_2-1-improve-using-rollback" tabindex="-1"><a class="header-anchor" href="#_2-1-improve-using-rollback"><span>2.1 Improve using Rollback</span></a></h3>
<p>Added Rollback Also removed async</p>
<h3 id="_2-4-adding-feature-to-add-insertion-into-the-database-with-the-markdowns-and-comments" tabindex="-1"><a class="header-anchor" href="#_2-4-adding-feature-to-add-insertion-into-the-database-with-the-markdowns-and-comments"><span>2.4 Adding feature to add insertion into the database with the markdowns and comments.</span></a></h3>
<ul>
<li>[x] Designing the data being sent:</li>
<li>[x] Create the models</li>
<li>[x] Create the file Upload</li>
<li>[x] Test the file upload implement the models</li>
</ul>
<div class="language-json line-numbers-mode" data-ext="json" data-title="json"><pre v-pre class="language-json"><code><span class="token punctuation">{</span>
    <span class="token property">"comments"</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">,</span> <span class="token comment">//Array of all comments so far.</span>
    <span class="token property">"code_url"</span><span class="token operator">:</span> <span class="token string">""</span><span class="token punctuation">,</span> <span class="token comment">// S3 URL of the code</span>
    <span class="token property">"language"</span><span class="token operator">:</span> <span class="token string">"js"</span><span class="token punctuation">,</span>
    <span class="token property">"date"</span><span class="token operator">:</span> datetime<span class="token punctuation">,</span>
    <span class="token property">"attempt_counts"</span><span class="token operator">:</span> int<span class="token punctuation">,</span>
    <span class="token property">"is_correct"</span><span class="token operator">:</span> bool<span class="token punctuation">,</span> 
    <span class="token property">"problem_slug"</span><span class="token operator">:</span> <span class="token string">"problem-slug"</span><span class="token punctuation">,</span> <span class="token comment">// The slug of the problem</span>
    <span class="token string">"user_id"</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Lets see if this</p>
<p><img src="@source/posts/.vuepress/public/img/2023-10-03-12-56-37.png" alt=""></p>
<ul>
<li>Now lets have the mapping for things done</li>
<li>First have the posting of the code as an <code v-pre>option</code> in the menu</li>
<li>Then also automatically once the code is fnished.</li>
</ul>
<p>A rimworld like Adventurers game.</p>
<p>Where instead you move your character. as if it were bannerlord. Simple strategies like:</p>
<ul>
<li>Attack</li>
<li>Retreat to Me (Backline)</li>
<li>Round to me</li>
</ul>
<p>Then you can configure the armies position on your own.</p>
<p>I think something that would make sense would be some kind of <code v-pre>Mercenary simulator</code></p>
<p>Where you form a band of mercenaries to combat.</p>
<ul>
<li>Te idea is that you build your army with people from the unit according to your distinctions nd values/</li>
<li>Then also have traits such as morality etc</li>
<li>You start being drafted.</li>
<li>And the idea is that people join you</li>
<li>Or you have the permision to create an army</li>
<li>You can start like: a draftee =&gt; Starts in middle of combat with barely any weapons</li>
<li>An artisan =&gt; Building for weapons</li>
<li>A farmer =&gt; Drafted =&gt; Basic weapons. Your town is raided.</li>
<li>A noble =&gt; Family of warriors, starts with high combat stats</li>
</ul>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code><span class="token function">populateTemplate</span><span class="token punctuation">(</span>problem<span class="token punctuation">,</span> <span class="token punctuation">{</span>base<span class="token operator">=</span><span class="token string">""</span><span class="token punctuation">}</span> <span class="token operator">=</span> <span class="token punctuation">{</span><span class="token punctuation">}</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token constant">DEBUG</span><span class="token punctuation">)</span> console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">"Populating template with "</span><span class="token punctuation">,</span> problem<span class="token punctuation">,</span> <span class="token string">" and base "</span><span class="token punctuation">,</span> base<span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">if</span><span class="token punctuation">(</span>base <span class="token operator">!=</span> <span class="token string">""</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
        <span class="token keyword">return</span> <span class="token keyword">this</span><span class="token punctuation">.</span><span class="token function">copyFileToTemp</span><span class="token punctuation">(</span>problem<span class="token punctuation">.</span>file_path<span class="token punctuation">,</span> <span class="token punctuation">{</span><span class="token literal-property property">base</span><span class="token operator">:</span> base<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span><span class="token function">copyFileToTemp</span><span class="token punctuation">(</span>problem<span class="token punctuation">.</span>file_path<span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>We knwo that the base is there.</p>
<p>But as can be seen here is not there:</p>
<p><img src="@source/posts/.vuepress/public/img/2023-10-03-15-04-00.png" alt=""></p>
<p>Base is usually empty?</p>
<p>Oh here it is</p>
<p><img src="@source/posts/.vuepress/public/img/2023-10-03-15-06-03.png" alt=""></p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code><span class="token comment">// Replace 'file_path' with the actual path to your file</span>
<span class="token keyword">const</span> filePath <span class="token operator">=</span> <span class="token string">'path/to/your/file.txt'</span><span class="token punctuation">;</span>

<span class="token comment">// Create a FormData object to store the file</span>
<span class="token keyword">const</span> formData <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">FormData</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
formData<span class="token punctuation">.</span><span class="token function">append</span><span class="token punctuation">(</span><span class="token string">'file'</span><span class="token punctuation">,</span> <span class="token keyword">new</span> <span class="token class-name">Blob</span><span class="token punctuation">(</span><span class="token punctuation">[</span>fs<span class="token punctuation">.</span><span class="token function">readFileSync</span><span class="token punctuation">(</span>filePath<span class="token punctuation">)</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span> <span class="token string">'file.txt'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

<span class="token comment">// Replace 'upload_url' with the URL where you want to upload the file</span>
<span class="token keyword">const</span> uploadUrl <span class="token operator">=</span> <span class="token string">'https://example.com/upload'</span><span class="token punctuation">;</span>

<span class="token comment">// Make a POST request to the server</span>
<span class="token function">fetch</span><span class="token punctuation">(</span>uploadUrl<span class="token punctuation">,</span> <span class="token punctuation">{</span>
  <span class="token literal-property property">method</span><span class="token operator">:</span> <span class="token string">'POST'</span><span class="token punctuation">,</span>
  <span class="token literal-property property">body</span><span class="token operator">:</span> formData<span class="token punctuation">,</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span>
  <span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token parameter">response</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span>response<span class="token punctuation">.</span>ok<span class="token punctuation">)</span> <span class="token punctuation">{</span>
      <span class="token comment">// File successfully uploaded</span>
      console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">'File uploaded successfully'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
      <span class="token comment">// Handle the error</span>
      console<span class="token punctuation">.</span><span class="token function">error</span><span class="token punctuation">(</span><span class="token string">'File upload failed'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
  <span class="token punctuation">}</span><span class="token punctuation">)</span>
  <span class="token punctuation">.</span><span class="token function">catch</span><span class="token punctuation">(</span><span class="token parameter">error</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
    <span class="token comment">// Handle network errors</span>
    console<span class="token punctuation">.</span><span class="token function">error</span><span class="token punctuation">(</span><span class="token string">'Network error:'</span><span class="token punctuation">,</span> error<span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Doesnt look like it requires for absolute path:</p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>
<span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token constant">DEBUG</span><span class="token punctuation">)</span> console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">"Getting temp_file_path from "</span><span class="token punctuation">,</span> <span class="token keyword">this</span><span class="token punctuation">.</span>temp_problem_filepath<span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token keyword">delete</span> require<span class="token punctuation">.</span>cache<span class="token punctuation">[</span>require<span class="token punctuation">.</span><span class="token function">resolve</span><span class="token punctuation">(</span><span class="token keyword">this</span><span class="token punctuation">.</span>temp_problem_filepath<span class="token punctuation">)</span><span class="token punctuation">]</span> <span class="token comment">// delete the cache of the file</span>
<span class="token keyword">const</span> <span class="token punctuation">{</span> Problem <span class="token punctuation">}</span> <span class="token operator">=</span> <span class="token function">require</span><span class="token punctuation">(</span><span class="token keyword">this</span><span class="token punctuation">.</span>temp_problem_filepath<span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre v-pre class="language-bash"><code>
Error: ENOENT: no such <span class="token function">file</span> or directory, <span class="token function">open</span> <span class="token string">'./user_files/temp_problem.js'</span>
at Object.openSync <span class="token punctuation">(</span>node:fs:585:3<span class="token punctuation">)</span>
at Object.readFileSync <span class="token punctuation">(</span>node:fs:453:35<span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code><span class="token keyword">const</span> uploadCodeMetadataUrl <span class="token operator">=</span> <span class="token string">'http://127.0.0.1:8000/utils/upload_file'</span><span class="token punctuation">;</span>
        
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div></div></div><p>Now lets try fix the following:</p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>
<span class="token keyword">const</span> metadata <span class="token operator">=</span> <span class="token punctuation">{</span>
    <span class="token string-property property">"comments"</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
    <span class="token string-property property">"code_url"</span><span class="token operator">:</span> file_url<span class="token punctuation">,</span>
    <span class="token string-property property">"language"</span><span class="token operator">:</span> <span class="token string">"javascript"</span><span class="token punctuation">,</span>
    <span class="token string-property property">"date"</span><span class="token operator">:</span> <span class="token function">getCurrentDate</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token string-property property">"attempt_counts"</span><span class="token operator">:</span> <span class="token number">0</span><span class="token punctuation">,</span>
    <span class="token string-property property">"attempt_timestamps"</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
    <span class="token string-property property">"is_correct"</span><span class="token operator">:</span> <span class="token boolean">true</span><span class="token punctuation">,</span>
    <span class="token string-property property">"problem_slug"</span><span class="token operator">:</span> problem<span class="token punctuation">.</span>slug<span class="token punctuation">,</span>
    <span class="token string-property property">"account_id"</span><span class="token operator">:</span> constants<span class="token punctuation">.</span><span class="token constant">CONSTANTS</span><span class="token punctuation">.</span><span class="token constant">ACCOUNT_ID</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><ul>
<li>[x] Adding the correct attempt_timestamps whenever the count increases</li>
<li>[x] Create the variable</li>
</ul>
<p>Now we want to also</p>
<p>Now it works so lets see:</p>
<ul>
<li>We should also do the following
<ul>
<li>[x] Adding points automatically</li>
<li>[x] Checking if show solution was clicked =&gt; Can be added to database but not really makes much sense</li>
<li>[x] Modifying the local to have the actual url</li>
</ul>
</li>
</ul>
<h3 id="modify-the-local-to-have-the-actual-url" tabindex="-1"><a class="header-anchor" href="#modify-the-local-to-have-the-actual-url"><span>Modify the local to have the actual url</span></a></h3>
<p>Done</p>
<h3 id="adding-points-automatically" tabindex="-1"><a class="header-anchor" href="#adding-points-automatically"><span>Adding points automatically</span></a></h3>
<ul>
<li>But make it now that only if either is working</li>
<li>Or there exists comments</li>
</ul>
<h3 id="fixing-slc-site-upload" tabindex="-1"><a class="header-anchor" href="#fixing-slc-site-upload"><span>Fixing SLC Site Upload</span></a></h3>
<div class="language-php line-numbers-mode" data-ext="php" data-title="php"><pre v-pre class="language-php"><code><span class="token keyword">protected</span> <span class="token keyword">static</span> <span class="token keyword">function</span> <span class="token function-definition function">formatPrefix</span><span class="token punctuation">(</span><span class="token variable">$new</span><span class="token punctuation">,</span> <span class="token variable">$old</span><span class="token punctuation">,</span> <span class="token variable">$prependExistingPrefix</span> <span class="token operator">=</span> <span class="token constant boolean">true</span><span class="token punctuation">)</span>
<span class="token punctuation">{</span>
<span class="token variable">$old</span> <span class="token operator">=</span> <span class="token variable">$old</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'prefix'</span><span class="token punctuation">]</span> <span class="token operator">??</span> <span class="token constant">null</span><span class="token punctuation">;</span>

<span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token variable">$old</span> <span class="token operator">!==</span> <span class="token constant">null</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token variable">$old</span> <span class="token operator">=</span> <span class="token function">trim</span><span class="token punctuation">(</span><span class="token variable">$old</span><span class="token punctuation">,</span> <span class="token string single-quoted-string">'/'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

<span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token variable">$prependExistingPrefix</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token keyword">isset</span><span class="token punctuation">(</span><span class="token variable">$new</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'prefix'</span><span class="token punctuation">]</span><span class="token punctuation">)</span> <span class="token operator">?</span> <span class="token variable">$old</span><span class="token operator">.</span><span class="token string single-quoted-string">'/'</span><span class="token operator">.</span><span class="token function">trim</span><span class="token punctuation">(</span><span class="token variable">$new</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'prefix'</span><span class="token punctuation">]</span><span class="token punctuation">,</span> <span class="token string single-quoted-string">'/'</span><span class="token punctuation">)</span> <span class="token punctuation">:</span> <span class="token variable">$old</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token keyword">isset</span><span class="token punctuation">(</span><span class="token variable">$new</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'prefix'</span><span class="token punctuation">]</span><span class="token punctuation">)</span> <span class="token operator">?</span> <span class="token function">trim</span><span class="token punctuation">(</span><span class="token variable">$new</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'prefix'</span><span class="token punctuation">]</span><span class="token punctuation">,</span> <span class="token string single-quoted-string">'/'</span><span class="token punctuation">)</span><span class="token operator">.</span><span class="token string single-quoted-string">'/'</span><span class="token operator">.</span><span class="token variable">$old</span> <span class="token punctuation">:</span> <span class="token variable">$old</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_4-wednesday" tabindex="-1"><a class="header-anchor" href="#_4-wednesday"><span>4 Wednesday</span></a></h2>
<h3 id="_4-todo" tabindex="-1"><a class="header-anchor" href="#_4-todo"><span>4.todo</span></a></h3>
<ul>
<li>[ ] 4.1 Using a combination of Matplot lib and python create a library that:
<ul>
<li>[ ] supports different data strucutres operations</li>
<li>[ ] Creates automatically gifs for them.</li>
<li>[ ] Start with an array type.</li>
</ul>
</li>
</ul>
<p>Eventually I want it to also Create a libray the following that asks you to compelte using python: (Or an addon option for Js)</p>
<ul>
<li>Matplot and Data Science Questions</li>
<li>Becoming a wiz for Matplot</li>
<li>and df operations as well as other data science libraries would come great for your career.</li>
<li></li>
</ul>
<h3 id="improving-the-loading-speed-of-maid" tabindex="-1"><a class="header-anchor" href="#improving-the-loading-speed-of-maid"><span>Improving the loading speed of maid</span></a></h3>
<p>Now is so goddamn fast!</p>
<p>Note this is how they are initialized</p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>        <span class="token keyword">const</span> clozeScheduler <span class="token operator">=</span> <span class="token keyword">new</span> <span class="token class-name">TermScheduler</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
            <span class="token literal-property property">cards</span><span class="token operator">:</span> cloze_problems<span class="token punctuation">,</span>
            <span class="token literal-property property">cards_category</span><span class="token operator">:</span> <span class="token string">"Algo"</span>
        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token keyword">await</span> clozeScheduler<span class="token punctuation">.</span><span class="token function">setLearningCards</span><span class="token punctuation">(</span>cloze_problems<span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>
express
markdown<span class="token operator">-</span>it<span class="token operator">-</span>toc<span class="token operator">-</span>done<span class="token operator">-</span>right
<span class="token string-property property">"esm"</span><span class="token operator">:</span> <span class="token string">"^3.2.25"</span><span class="token punctuation">,</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h3 id="make-it-so-that-if-it-contains-an-image-url-then-attempt-to-search-it" tabindex="-1"><a class="header-anchor" href="#make-it-so-that-if-it-contains-an-image-url-then-attempt-to-search-it"><span>Make it so that if it contains an image url then attempt to search it.</span></a></h3>
<h3 id="design-the-hint-system" tabindex="-1"><a class="header-anchor" href="#design-the-hint-system"><span>Design the hint system</span></a></h3>
<ul>
<li>Hints could just be comments or even watching whats there</li>
<li>OR displaying the images</li>
<li>My guess is that they should be an array of strings (So to be easily supported on markdown)</li>
</ul>
<p>If they are an thml url then display the image (likely to be the image, otherwise just show the comment)</p>
<ul>
<li>[ ] Build the comment shower example
<ul>
<li>[ ] The idea for hint just to show the comments for now</li>
<li>[ ]</li>
</ul>
</li>
</ul>
<p>['']</p>
<ul>
<li>
<p>[x] Also has to be submitted on submit always - Nah not necessarily right?</p>
</li>
<li>
<p>[ ] Add the hint example</p>
</li>
<li>
<p>[ ] Try to check how is being read</p>
</li>
</ul>
<p>Lets hope this is enough supposing is there</p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>
<span class="token keyword">this</span><span class="token punctuation">.</span><span class="token function">addProblem</span><span class="token punctuation">(</span><span class="token keyword">new</span> <span class="token class-name">ProblemMetadata</span><span class="token punctuation">(</span>problem<span class="token punctuation">,</span> <span class="token punctuation">{</span>
    <span class="token literal-property property">tags</span><span class="token operator">:</span> problem_prompt<span class="token punctuation">.</span>tags<span class="token punctuation">,</span> <span class="token literal-property property">difficulty</span><span class="token operator">:</span> <span class="token function">classifyDifficulty</span><span class="token punctuation">(</span>problem_prompt<span class="token punctuation">.</span>tags<span class="token punctuation">)</span><span class="token punctuation">,</span>
    <span class="token literal-property property">name</span><span class="token operator">:</span> problem_prompt<span class="token punctuation">.</span>title<span class="token punctuation">,</span> <span class="token literal-property property">description</span><span class="token operator">:</span> problem_prompt<span class="token punctuation">.</span>description<span class="token punctuation">,</span> <span class="token literal-property property">link</span><span class="token operator">:</span> problem_prompt<span class="token punctuation">.</span>link<span class="token punctuation">,</span>
    <span class="token literal-property property">hints</span><span class="token operator">:</span> problem_prompt<span class="token punctuation">.</span>hints
<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>This seems to automatically have the prompts there</p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code><span class="token keyword">const</span> <span class="token function-variable function">createCompiledJson</span> <span class="token operator">=</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
    <span class="token keyword">let</span> parsed_prompt_dict <span class="token operator">=</span> <span class="token punctuation">{</span><span class="token punctuation">}</span><span class="token punctuation">;</span>

    <span class="token function">getFilesInDirectory</span><span class="token punctuation">(</span><span class="token string">'./prompt/'</span><span class="token punctuation">)</span>
        <span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">files</span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
            <span class="token keyword">const</span> absolutePathForFiles <span class="token operator">=</span> files<span class="token punctuation">.</span><span class="token function">map</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">file</span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
                <span class="token keyword">return</span> <span class="token function">getDirAbsoluteUri</span><span class="token punctuation">(</span>file<span class="token punctuation">,</span> <span class="token string">'./prompt/'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token constant">DEBUG</span><span class="token punctuation">)</span> console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">"absolutePathForFiles: "</span><span class="token punctuation">,</span> absolutePathForFiles<span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token keyword">const</span> promptsData <span class="token operator">=</span> md2json<span class="token punctuation">.</span><span class="token function">parse</span><span class="token punctuation">(</span>absolutePathForFiles<span class="token punctuation">,</span> options<span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token constant">DEBUG</span><span class="token punctuation">)</span> console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span>promptsData<span class="token punctuation">)</span><span class="token punctuation">;</span>
            parsed_prompt_dict <span class="token operator">=</span> <span class="token constant">JSON</span><span class="token punctuation">.</span><span class="token function">parse</span><span class="token punctuation">(</span>promptsData<span class="token punctuation">)</span><span class="token punctuation">;</span>

            <span class="token comment">// Save as a json</span>
            <span class="token keyword">const</span> json <span class="token operator">=</span> <span class="token constant">JSON</span><span class="token punctuation">.</span><span class="token function">stringify</span><span class="token punctuation">(</span>parsed_prompt_dict<span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token keyword">const</span> prompt_file_path <span class="token operator">=</span> <span class="token function">getDirAbsoluteUri</span><span class="token punctuation">(</span><span class="token constant">PROMPT_FILE</span><span class="token punctuation">,</span> <span class="token string">'./prompt/'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
            fs<span class="token punctuation">.</span><span class="token function">writeFile</span><span class="token punctuation">(</span>prompt_file_path<span class="token punctuation">,</span> json<span class="token punctuation">,</span> <span class="token punctuation">(</span><span class="token parameter">err</span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
                <span class="token keyword">if</span> <span class="token punctuation">(</span>err<span class="token punctuation">)</span> <span class="token keyword">throw</span> err<span class="token punctuation">;</span>
                console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">'The file has been saved!'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
            <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span><span class="token punctuation">)</span>
        <span class="token punctuation">.</span><span class="token function">catch</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">error</span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
            console<span class="token punctuation">.</span><span class="token function">error</span><span class="token punctuation">(</span>error<span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Whats breaking the Upload?</p>
<p><img src="@source/posts/.vuepress/public/img/2023-10-04-16-32-22.png" alt=""></p>
<div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre v-pre class="language-bash"><code>
C:<span class="token punctuation">\</span>github<span class="token punctuation">\</span>testing<span class="token punctuation">\</span>admin.brooklynslcouncil.com<span class="token punctuation">\</span>SLC-ADMIN<span class="token operator">></span>make merp <span class="token string">"deployment cred"</span> 
<span class="token function">git</span> <span class="token function">add</span> <span class="token parameter variable">--all</span>
<span class="token function">git</span> commit <span class="token parameter variable">-m</span> <span class="token string">"Deployment"</span> 
<span class="token punctuation">[</span>deployment 49f0dc1<span class="token punctuation">]</span> Deployment
 <span class="token number">1</span> <span class="token function">file</span> changed, <span class="token number">13</span> insertions<span class="token punctuation">(</span>+<span class="token punctuation">)</span>
<span class="token function">git</span> push origin HEAD
Enumerating objects: <span class="token number">5</span>, done.
Counting objects: <span class="token number">100</span>% <span class="token punctuation">(</span><span class="token number">5</span>/5<span class="token punctuation">)</span>, done.
Delta compression using up to <span class="token number">12</span> threads
Compressing objects: <span class="token number">100</span>% <span class="token punctuation">(</span><span class="token number">3</span>/3<span class="token punctuation">)</span>, done.
Writing objects: <span class="token number">100</span>% <span class="token punctuation">(</span><span class="token number">3</span>/3<span class="token punctuation">)</span>, <span class="token number">437</span> bytes <span class="token operator">|</span> <span class="token number">437.00</span> KiB/s, done.
Total <span class="token number">3</span> <span class="token punctuation">(</span>delta <span class="token number">2</span><span class="token punctuation">)</span>, reused <span class="token number">0</span> <span class="token punctuation">(</span>delta <span class="token number">0</span><span class="token punctuation">)</span>, pack-reused <span class="token number">0</span>
remote: Resolving deltas: <span class="token number">100</span>% <span class="token punctuation">(</span><span class="token number">2</span>/2<span class="token punctuation">)</span>, completed with <span class="token number">2</span> <span class="token builtin class-name">local</span> objects.
To https://github.com/Koppelman-Student-Leadership-Council/SLC-ADMIN.git
   451e6d2<span class="token punctuation">..</span>49f0dc1  HEAD -<span class="token operator">></span> deployment
<span class="token function">make</span> ft-push
make<span class="token punctuation">[</span><span class="token number">1</span><span class="token punctuation">]</span>: Entering directory <span class="token string">'C:/github/testing/admin.brooklynslcouncil.com/SLC-ADMIN'</span>
<span class="token function">git</span> <span class="token function">ftp</span> push
<span class="token number">58</span> files to sync:
<span class="token punctuation">[</span><span class="token number">1</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'.env'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">2</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'.env.deploy'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">3</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'.env.local'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">4</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'admin/.env'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">5</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'app/Http/Controllers/ApiController.php'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">6</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'index.php'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">7</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'makefile'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">8</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/9T1Urh36XL1HJ0Deau1d.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">9</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/F5QzO0O1hP3RiHTh5c4t.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">10</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/Hekra5k5KLDLKM2jIbnJ.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">11</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/ilYcr2RE9OYGOmR2xDNW.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">12</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/m4wEwDyhVdcjRHXLI1yq.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">13</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/M8oX4j23KTUZEy0lwNzp.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">14</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/qGXONG6KeLF1hMC050HY.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">15</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/unhL5J0G7kdXeeqYWRmA.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">16</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/clubs/February2022/wEC4iwsecJ7zw3ZBYLcB.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">17</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/events/February2022/QmlefRJfSxXj5zNY74Kh.jpeg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">18</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/events/March2022/99g7IIGKJfhLTThea9gA.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">19</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/events/March2022/WJNAe2mwQwRricNHfNFT.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">20</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/events/March2022/WlKkdAdA0dmq0yxvT2t2.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">21</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/events/October2021/PZdO95mFP8vujEb4jYbF.jpg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">22</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/events/September2022/WvuN2FoSBr55YJLsBgmq.jpeg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">23</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/google-calendar/service-account-credentials.json'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">24</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/settings/October2021/42HdAlLyhVRyd9izeNwN.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">25</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/settings/October2021/SEvBW14iIqesCl492f1c.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">26</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/settings/September2021/HNQriUzvcwHSTxtdewIC.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">27</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/settings/September2021/idwZBanoXdK1VjQ6q2ED.jpg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">28</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/settings/September2021/uvCE3WytoozUvFKOpHnb.jpg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">29</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/AdAIbkp3DQ4O4SGjlb87.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">30</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/BcZq0hTbwTxqWsj7xXDX.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">31</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/BK2QBiSds9qtSOYC9R3Y.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">32</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/K5CIA6wtV9tELm6Vjb2T.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">33</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/NnKiviFy6qzUfVrZpuux.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">34</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/ORNn5mVBtzLKORb73Wo1.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">35</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/February2022/qq99IDKMGEf7ARJLRUCa.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">36</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/d2jdcUWri84dqqkHEvVs.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">37</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/DSC47w0pXbSVnM9CpZ3J.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">38</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/E7wOx0oE0DVNai8CKQny.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">39</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/HR0ryw1AqYwtvclekEvI.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">40</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/Kj7QVkrQgpRdcJgMVaw3.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">41</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/V23TmEHuk4tP3tXsbxVd.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">42</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/xRsiP9TGXgRvmicw76g1.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">43</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/March2022/YMTRGRPmTHPiXOlEFZaN.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">44</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/November2021/RdeKCRQ0e6IvJmqhxTj9.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">45</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/October2021/dPyearqROySg3CD3J9Ni.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">46</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/October2021/r3mR6yzdy7pnpb5WArFF.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">47</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/October2021/waxn0qsYVagMa6gwsxkc.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">48</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/October2021/x62Q3HZeRnAj5jnc7J25.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">49</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/October2021/XuARh7CQszWQJ4fd0oOn.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">50</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/October2022/5e8Lm3B5s0LNOwJ1qs7F.jpg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">51</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/September2022/j3HjruymS23EF3UeLiid.jpg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">52</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/September2022/rv3nlzMaAGbnQfowImfU.JPEG'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">53</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/teams/September2022/XegZeYnPnpPFZiBv6ZFa.jpg'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">54</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/users/default.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">55</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'public/storage_old/users/September2021/HEEh0VyexGYQy0XZ61cb.png'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">56</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'README.md'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">57</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'routes/api.php'</span><span class="token builtin class-name">.</span>
<span class="token punctuation">[</span><span class="token number">58</span> of <span class="token number">58</span><span class="token punctuation">]</span> Buffered <span class="token keyword">for</span> upload <span class="token string">'vendor.zip'</span><span class="token builtin class-name">.</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Why would this even disroupt anything?</p>
<p><img src="@source/posts/.vuepress/public/img/2023-10-04-16-42-04.png" alt=""></p>
<h3 id="_5-thursday" tabindex="-1"><a class="header-anchor" href="#_5-thursday"><span>5 Thursday</span></a></h3>
<h3 id="_8-todo" tabindex="-1"><a class="header-anchor" href="#_8-todo"><span>8.todo</span></a></h3>
<ul>
<li>[x] 8.1 Adding basic hint system</li>
<li>[x] 8.2 Adding hint image lookup system for https</li>
<li>[ ] 8.3 Adding more wiki images to the maid cli.</li>
<li>[ ] 8.4 Adding the SLC body of contents</li>
</ul>
<h3 id="_8-1-adding-basic-hint-system" tabindex="-1"><a class="header-anchor" href="#_8-1-adding-basic-hint-system"><span>8.1 Adding basic hint system</span></a></h3>
<p><img src="@source/posts/.vuepress/public/img/2023-10-05-12-19-17.png" alt=""></p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code><span class="token string-property property">"Hint"</span><span class="token operator">:</span> <span class="token keyword">async</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
    <span class="token comment">// TO Complete</span>
    <span class="token keyword">let</span> hintsMssage <span class="token operator">=</span> <span class="token string">"No hints available"</span><span class="token punctuation">;</span>
    <span class="token keyword">if</span><span class="token punctuation">(</span>hintsGiven<span class="token punctuation">.</span>length <span class="token operator">+</span> <span class="token number">1</span> <span class="token operator">&lt;</span> problem<span class="token punctuation">.</span>hints<span class="token punctuation">.</span>length<span class="token punctuation">)</span><span class="token punctuation">{</span>
        hintsMssage <span class="token operator">=</span> problem<span class="token punctuation">.</span>hints<span class="token punctuation">[</span>hintsGiven<span class="token punctuation">.</span>length<span class="token punctuation">]</span><span class="token punctuation">;</span>
        hintsGiven<span class="token punctuation">.</span><span class="token function">push</span><span class="token punctuation">(</span>hintsMssage<span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
    question_state_flag <span class="token operator">=</span> <span class="token boolean">true</span><span class="token punctuation">;</span>
    
    console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span>hintsGiven<span class="token punctuation">)</span>
    console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">"Hint: "</span><span class="token punctuation">,</span> hintsMssage<span class="token punctuation">)</span><span class="token punctuation">;</span>

<span class="token punctuation">}</span><span class="token punctuation">,</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>That's Incorrect:</p>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code><span class="token keyword">if</span><span class="token punctuation">(</span>hintsGiven<span class="token punctuation">.</span>length <span class="token operator">&lt;</span> problem<span class="token punctuation">.</span>hints<span class="token punctuation">.</span>length<span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>Here a better one.</p>
<h3 id="_8-2-adding-hint-image-lookup-system-for-https" tabindex="-1"><a class="header-anchor" href="#_8-2-adding-hint-image-lookup-system-for-https"><span>8.2 Adding hint image lookup system for https</span></a></h3>
<p><img src="@source/posts/.vuepress/public/img/2023-10-05-13-06-25.png" alt=""></p>
<h3 id="_8-3-adding-more-wiki-images-to-the-maid-cli" tabindex="-1"><a class="header-anchor" href="#_8-3-adding-more-wiki-images-to-the-maid-cli"><span>8.3 Adding more wiki images to the maid cli.</span></a></h3>
<ul>
<li>[ ] Uploading the gifs</li>
</ul>
<h3 id="_8-4-adding-the-slc-body-of-contents" tabindex="-1"><a class="header-anchor" href="#_8-4-adding-the-slc-body-of-contents"><span>8.4 Adding the SLC body of contents</span></a></h3>
<ul>
<li>[ ] Adding the body from the SLC siteN</li>
</ul>
<h2 id="_10-fri" tabindex="-1"><a class="header-anchor" href="#_10-fri"><span>10 Fri</span></a></h2>
<h4 id="_10-todo" tabindex="-1"><a class="header-anchor" href="#_10-todo"><span>10.todo</span></a></h4>
<ul>
<li>[ ] 10.1 Doing you d Leetcode.</li>
<li>[ ] 10.2 Analysing the dataset of the J market</li>
</ul>
<h3 id="_10-1-doing-you-d-leetcode" tabindex="-1"><a class="header-anchor" href="#_10-1-doing-you-d-leetcode"><span>10.1 Doing you d Leetcode.</span></a></h3>
<h2 id="_14-sat" tabindex="-1"><a class="header-anchor" href="#_14-sat"><span>14 Sat</span></a></h2>
<ul>
<li>[x] Developing the Contact Links</li>
<li>[ ] Adding the google nextjs links</li>
<li>[ ] Adding the Our Featured Works</li>
</ul>
</div></template>


