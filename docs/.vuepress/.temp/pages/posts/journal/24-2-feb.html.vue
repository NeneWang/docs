<template><div><h2 id="_9-friday" tabindex="-1"><a class="header-anchor" href="#_9-friday"><span>9 Friday</span></a></h2>
<h3 id="_9-todo" tabindex="-1"><a class="header-anchor" href="#_9-todo"><span>9.todo</span></a></h3>
<ul>
<li>[x] 9.1 Gathering some thoughts about the Hackathon</li>
<li>[ ] 9.2 Finishing the feat based Radar graph.</li>
<li>[ ] 9.3 Start working on Decks Sharing System</li>
<li>[ ] 9.4 Plan a plan for learning algorihtms better</li>
<li>[ ] 9.5 Draft a plan for social at hack</li>
<li>[ ] 9.6 Build the Lang Chain system.</li>
<li>[ ] 9.7 Build Simple React Native Expo Template</li>
<li>[ ] 9.8 Rough development using <code v-pre>Angular</code> for Maid-CLI's Project</li>
<li>[ ] 9.9 Explore Sentiment Analysis</li>
<li>[ ] 9.10 Prepare everthing for Ferrnando to test your application.</li>
</ul>
<h3 id="_9-1-gathering-some-thoughts-about-the-hackathon" tabindex="-1"><a class="header-anchor" href="#_9-1-gathering-some-thoughts-about-the-hackathon"><span>9.1 Gathering some thoughts about the Hackathon</span></a></h3>
<p>What I am thinking here, the likehood of the best tool to develop here would be something that were to combine the following stack</p>
<ul>
<li>
<p>Langchain: For LLM features.</p>
</li>
<li>
<p>React Native: I need it on my portfolio to build things.</p>
</li>
<li>
<p>Some random backend is good enough.</p>
</li>
<li>
<p>You dont need to setup user whatever but would definitevely be a plus.</p>
</li>
</ul>
<p><strong>Planning Socially Speaking</strong></p>
<ul>
<li>
<p>This shouldnt take priority over meeting people. You might want to print your resume and get to get pass as one of the students there. The idea is to strike friendly converations meet talented people. Probably aim to keep contact with them.
What would make people like you?</p>
</li>
<li>
<p>Not being a jerk/sending memes. being friendly and hear people out</p>
</li>
<li>
<p>Also try to optimize for this: Skilled People + People likelier to invite you.</p>
<ul>
<li>If they looking for internship you can ask if you want them you to ask your manager.</li>
<li>Look for asians and seniors that they share the same interests as you. If they come from some shty school that might even be better.</li>
</ul>
</li>
<li>
<p>Also in the end try to go though others projects and learn more about them.</p>
</li>
<li>
<p>Sticking and working the project throughky</p>
</li>
<li>
<p>Staying the night for the Hackathon</p>
</li>
<li>
<p>Help over the design of the project.</p>
</li>
<li>
<p>Being positive and attempt to stick out with other's ideas. (helping talented people buidl the ideas)</p>
</li>
<li>
<p>Probably try to find male friends to hang out with.</p>
</li>
<li>
<p>Ask for linkedings. Ask if anyone looking for internships you can ask your manager. Say is paying double around $30 which makes sesnse sicne you are being paid double for part-time.</p>
</li>
<li>
<p>Try to connect with that bc guy, who seems very promising in participation + algorithms.</p>
</li>
</ul>
<p><strong>Review the project stack.</strong></p>
<h3 id="_9-2-finishing-the-feat-based-radar-graph" tabindex="-1"><a class="header-anchor" href="#_9-2-finishing-the-feat-based-radar-graph"><span>9.2 Finishing the feat based Radar graph.</span></a></h3>
<ul>
<li>For this which are the features I am asking for?
<ul>
<li>I would be asking, for <code v-pre>pro</code> <code v-pre>math</code> <code v-pre>term</code>?</li>
</ul>
</li>
</ul>
<p>But honestly I think I stopped tracking term and math. So the focus should be instead of: <code v-pre>pro</code> <code v-pre>feat</code> and perhaps <code v-pre>algo</code> and <code v-pre>algo_w</code> ?</p>
<p><code v-pre>pro</code> <code v-pre>algo_w</code> <code v-pre>feat</code></p>
<p>And the idea is to have them weekly since they have a miss feature, that should also be used as the cap for the weeks requirements.</p>
<ul>
<li>Lets try first in hardcoded way. Never mind beacuse they are propportional, they should work while we support having.</li>
<li>[x] Lets actually care for commits and cards regardlesss.</li>
<li>[x] Make the performance increase b the typen</li>
<li>[ ] Ensure that the database is fetching from the current year.</li>
</ul>
<p>Which api is being requested?</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>this_week_dates <span class="token operator">=</span> <span class="token punctuation">[</span> today_date <span class="token operator">-</span> datetime<span class="token punctuation">.</span>timedelta<span class="token punctuation">(</span>minus<span class="token punctuation">)</span> <span class="token keyword">for</span> minus <span class="token keyword">in</span> <span class="token builtin">range</span><span class="token punctuation">(</span><span class="token number">1</span><span class="token punctuation">,</span> <span class="token number">7</span><span class="token punctuation">)</span><span class="token punctuation">]</span>

<span class="token keyword">for</span> performance <span class="token keyword">in</span> performances<span class="token punctuation">:</span>
    
    performances_date <span class="token operator">=</span> performance<span class="token punctuation">.</span>daily_performances <span class="token comment"># List of daily performances</span>
    <span class="token keyword">for</span> date_performance <span class="token keyword">in</span> performances_date<span class="token punctuation">:</span>

        <span class="token keyword">if</span> this_month<span class="token punctuation">:</span>
            performanceReport <span class="token operator">=</span> distrubuteFeatsByMonth<span class="token punctuation">(</span>selected_month<span class="token operator">=</span>today_month<span class="token punctuation">,</span> 
                feature<span class="token operator">=</span>performance<span class="token punctuation">.</span>title<span class="token punctuation">,</span> date_performance<span class="token operator">=</span>date_performance<span class="token punctuation">,</span> performanceReport<span class="token operator">=</span>performanceReport
            <span class="token punctuation">)</span>

        <span class="token keyword">if</span> get_today<span class="token punctuation">:</span>
            performanceReport <span class="token operator">=</span> distributeFeatsByDate<span class="token punctuation">(</span>selected_date<span class="token operator">=</span>today_date<span class="token punctuation">,</span> 
            date_performance<span class="token operator">=</span>date_performance<span class="token punctuation">,</span> feature<span class="token operator">=</span>performance<span class="token punctuation">.</span>title<span class="token punctuation">,</span>  performanceReport<span class="token operator">=</span>performanceReport 
            <span class="token punctuation">)</span>

        <span class="token keyword">if</span> this_week<span class="token punctuation">:</span>
            <span class="token comment"># print("Running this week with", this_week_dates)</span>
            performanceReport <span class="token operator">=</span> distributeFeatsByDates<span class="token punctuation">(</span>selected_dates<span class="token operator">=</span>this_week_dates<span class="token punctuation">,</span> 
            date_
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Right this doesnt make sense:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
    db<span class="token punctuation">.</span>rollback<span class="token punctuation">(</span><span class="token punctuation">)</span>
    user_data <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>models<span class="token punctuation">.</span>Account<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Account<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token operator">==</span>account_id<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    performances <span class="token operator">=</span> user_data<span class="token punctuation">.</span>performances

    performances_formatted <span class="token operator">=</span> getPerformanceForDate<span class="token punctuation">(</span>performances<span class="token punctuation">)</span>
    <span class="token keyword">return</span> performances_formatted
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Just get them</p>
<p>From the account</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>

<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>get</span><span class="token punctuation">(</span><span class="token string">'/account/report/{account_id}'</span><span class="token punctuation">,</span> tags<span class="token operator">=</span><span class="token punctuation">[</span><span class="token string">'Account'</span><span class="token punctuation">]</span><span class="token punctuation">)</span>
<span class="token keyword">def</span> <span class="token function">getReport</span><span class="token punctuation">(</span>account_id<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""
    Gets the report based on the account id which should always be one to be honest.
    """</span>
    db<span class="token punctuation">.</span>rollback<span class="token punctuation">(</span><span class="token punctuation">)</span>
    user_data <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>models<span class="token punctuation">.</span>Account<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Account<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token operator">==</span>account_id<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    performances <span class="token operator">=</span> user_data<span class="token punctuation">.</span>performances

    performances_formatted <span class="token operator">=</span> getPerformanceForDate<span class="token punctuation">(</span>performances<span class="token punctuation">)</span>
    <span class="token keyword">return</span> performances_formatted


</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>This is what fascinates me:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>This is absolutelly insane, because it means that is creating the pro term for the user all the time. Whihc means there is no selection for pro. But pro dues acutlaly is being having with the smae user you have</p>
<ul>
<li>cant find the date_selected.di with the performance_id for that user_account. Which is what makes sure that the system is consistent?</li>
</ul>
<p>Lets check on the db table. But to the surprise the pro, is actually being updated in such a way tthat is queriable. Some might be more of a dynamic case but that should be okay.</p>
<p>Lets now try to build the cahrting operations for the system.</p>
<p>This method seems perfect to me:</p>
<p>date_selected = getDayByDate(date=today)</p>
<p>But it seems that tis not shared when querying for the dates.</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>get</span><span class="token punctuation">(</span><span class="token string">'/account/report/{account_id}'</span><span class="token punctuation">,</span> tags<span class="token operator">=</span><span class="token punctuation">[</span><span class="token string">'Account'</span><span class="token punctuation">]</span><span class="token punctuation">)</span>
<span class="token keyword">def</span> <span class="token function">getReport</span><span class="token punctuation">(</span>account_id<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""
    Gets the report based on the account id which should always be one to be honest.
    """</span>
    db<span class="token punctuation">.</span>rollback<span class="token punctuation">(</span><span class="token punctuation">)</span>
    user_data <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>models<span class="token punctuation">.</span>Account<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Account<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token operator">==</span>account_id<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    
    db<span class="token punctuation">.</span>execute<span class="token punctuation">(</span><span class="token string">"SELECT * FROM performance "</span><span class="token punctuation">)</span>

    <span class="token comment"># Filter performances of this year only</span>
    

    performances_formatted <span class="token operator">=</span> getPerformanceForDate<span class="token punctuation">(</span>performances<span class="token punctuation">)</span>
    <span class="token keyword">return</span> performances_formatted

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_15-thursday" tabindex="-1"><a class="header-anchor" href="#_15-thursday"><span>15.Thursday</span></a></h2>
<h3 id="_15-todo" tabindex="-1"><a class="header-anchor" href="#_15-todo"><span>15.todo</span></a></h3>
<ul>
<li>[x] 15.1 Make the cursor work?</li>
<li>[ ] 15.2 Publishing and Making Sure I am using the Correct API.</li>
</ul>
<h3 id="_15-1-make-the-cursor-work" tabindex="-1"><a class="header-anchor" href="#_15-1-make-the-cursor-work"><span>15.1 Make the cursor work?</span></a></h3>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>SELECT id FROM organization WHERE guid = '123e4567-e89b-12d3-a456-1231231'
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>It seems that I was supposed to run curor.execute and then cursor.fetchall() to get the results.</p>
<h3 id="_15-2-publishing-and-making-sure-i-am-using-the-correct-api" tabindex="-1"><a class="header-anchor" href="#_15-2-publishing-and-making-sure-i-am-using-the-correct-api"><span>15.2 Publishing and Making Sure I am using the Correct API.</span></a></h3>
<ul>
<li>Wasn't I using a different api on the past?</li>
</ul>
<h2 id="_20-tuesday" tabindex="-1"><a class="header-anchor" href="#_20-tuesday"><span>20. Tuesday</span></a></h2>
<h3 id="_20-todo" tabindex="-1"><a class="header-anchor" href="#_20-todo"><span>20.todo</span></a></h3>
<ul>
<li>[x] 20.1 Complete the Adapting system for Windows
<ul>
<li>[x] Test</li>
</ul>
</li>
<li>[x] 20.2 Complete the Adapting system for Email
<ul>
<li>[x] Test</li>
<li>[x] Fix Check all Identities instead of per platform.</li>
</ul>
</li>
<li>[x] 20.3 Complete the adapting system for Chrome Connectors
<ul>
<li>[x] Test</li>
</ul>
</li>
<li>[x] 20.4 Clean the UI, Make sure it is feasible given latest iteration of the models.
&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD</li>
<li>[ ] 20.5 Finish Script presentation
=======</li>
<li>[x] 20.5 Finish Script presentation</li>
</ul>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<blockquote>
<p>98234f7d48a399fbc3c4a1a5f12a5e1549626adf</p>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
<ul>
<li>[ ] 20.6 Do all ses for Algorithms and Datastructures.</li>
<li>[ ] 20.6.1 Consider publishing all docs internally instead by using github pages.</li>
<li>[ ] 20.7 Brainstorm, how to, combine the studies + 5 minutes break successfully. (Whats the balance for doing sports instead?? How about the Gym? )</li>
<li>[ ] 20.8 Continue working on support for multiusers in DSA.</li>
<li>[ ] 20.9 How will you balance now with Also the hackathon + the work + the gym + the studies + Codepath + Algorithms and any fellowships + Completing self projects + Interview prep?
<ul>
<li>[ ] Blocking your time, and doing exactly how you blocked might help. Consider doing that on na Excel.</li>
<li>[ ] For applications, I would stop rn. to focus on the above mentioned. But the ideal is that if they are sinergized work together. The ideal is for exmaple if doing one can be done overlapping the other. Or both work hand on hand.</li>
</ul>
</li>
<li>[ ] 20.10 Design Mastery Onboarding system.
<ul>
<li>[ ] Diagram the Flow</li>
<li>[ ] Create the necessary API to populate default Settings. (Just overwrite the settings. And ask for user changing such as VIM or Code (Visual Studio.))</li>
<li>[ ] Reconsider taking back the Angular Project to include blogs and tutorials about the courses that you actulaly care about.</li>
</ul>
</li>
</ul>
<h3 id="_20-1-complete-the-adapting-system-for-windows" tabindex="-1"><a class="header-anchor" href="#_20-1-complete-the-adapting-system-for-windows"><span>20.1 Complete the Adapting system for Windows</span></a></h3>
<ul>
<li>[x] 20.1.1 Test</li>
</ul>
<p>Is mostly developed, now you need to on the testings.</p>
<blockquote>
<p>Timestamp seems not to be found there.</p>
</blockquote>
<p>So it seems to be a bug related to whenever the timestamp and the end_time is the same. The while loop would skip it.</p>
<p>Now that I fixed that: Here it states the following error:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
self <span class="token operator">=</span> <span class="token operator">&lt;</span>test_adapters<span class="token punctuation">.</span>TestAdapter <span class="token builtin">object</span> at <span class="token number">0x000001DDB2BCD6D0</span><span class="token operator">></span>
job_service <span class="token operator">=</span> <span class="token operator">&lt;</span>processing_engine<span class="token punctuation">.</span>job_service<span class="token punctuation">.</span>JobService <span class="token builtin">object</span> at <span class="token number">0x000001DDB2CB5E20</span><span class="token operator">></span>

    <span class="token keyword">def</span> <span class="token function">test_adapts_windows</span><span class="token punctuation">(</span>self<span class="token punctuation">,</span> job_service<span class="token punctuation">)</span><span class="token punctuation">:</span>
        windows_integration_adapter <span class="token operator">=</span> WindowsIntegrationAdapter<span class="token punctuation">(</span><span class="token punctuation">)</span>
        sample_events <span class="token operator">=</span> json<span class="token punctuation">.</span>load<span class="token punctuation">(</span><span class="token builtin">open</span><span class="token punctuation">(</span><span class="token string">'tests/data/events_windows.json'</span><span class="token punctuation">)</span><span class="token punctuation">)</span>

<span class="token operator">></span>       adapted_events<span class="token punctuation">:</span> List<span class="token punctuation">[</span>EventData<span class="token punctuation">]</span> <span class="token operator">=</span> windows_integration_adapter<span class="token punctuation">.</span>adapt<span class="token punctuation">(</span>sample_events<span class="token punctuation">,</span> job_service<span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre v-pre class="language-bash"><code>processing_engine<span class="token punctuation">\</span>processing_abstract.py:180: <span class="token keyword">in</span> checkConsistency
    end_time <span class="token operator">=</span> parse<span class="token punctuation">(</span>eventData.end_time<span class="token punctuation">)</span>
C:<span class="token punctuation">\</span>Users<span class="token punctuation">\</span>NelsonWang<span class="token punctuation">\</span>anaconda3<span class="token punctuation">\</span>lib<span class="token punctuation">\</span>site-packages<span class="token punctuation">\</span>dateutil<span class="token punctuation">\</span>parser.py:748: <span class="token keyword">in</span> parse
    <span class="token builtin class-name">return</span> DEFAULTPARSER.parse<span class="token punctuation">(</span>timestr, **kwargs<span class="token punctuation">)</span>
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>It seems the cause to be on the parsing side. Where it attempts to parse <code v-pre>end_time</code>.</p>
<p>Lets see here where the:</p>
<h3 id="_20-2-complete-the-adapting-system-for-email" tabindex="-1"><a class="header-anchor" href="#_20-2-complete-the-adapting-system-for-email"><span>20.2 Complete the Adapting system for Email</span></a></h3>
<p>It seems that there were some cases in which if the duration was 0: Python would return none. because the question was eventData.duration:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
<span class="token keyword">if</span> eventData<span class="token punctuation">.</span>end_time <span class="token keyword">is</span> <span class="token boolean">None</span> <span class="token keyword">or</span> eventData<span class="token punctuation">.</span>duration <span class="token keyword">is</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> <span class="token boolean">None</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><blockquote>
<p>Here you can see that isntead we should use <code v-pre>None</code>.</p>
</blockquote>
<h3 id="_20-3-complete-the-adapting-system-for-chrome-connectors" tabindex="-1"><a class="header-anchor" href="#_20-3-complete-the-adapting-system-for-chrome-connectors"><span>20.3 Complete the adapting system for Chrome Connectors</span></a></h3>
<h3 id="fixing-the-issue-with-keypresses-as-some-as-they-should-be-expected-to-track-the-movements-and-interactions-on-that-single-minute" tabindex="-1"><a class="header-anchor" href="#fixing-the-issue-with-keypresses-as-some-as-they-should-be-expected-to-track-the-movements-and-interactions-on-that-single-minute"><span>Fixing the issue with Keypresses. As some as they should be expected to track the movements and interactions on that single minute.</span></a></h3>
<ul>
<li>[x] Fix for windows</li>
<li>[x] Fix for Chroem</li>
</ul>
<p>Note the following case:</p>
<div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre v-pre class="language-bash"><code>
<span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">=</span> Adapted Chrome Event <span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span>
<span class="token punctuation">{</span><span class="token string">'action_type'</span><span class="token builtin class-name">:</span> <span class="token string">'ACTIVE'</span>,
 <span class="token string">'app'</span><span class="token builtin class-name">:</span> <span class="token string">'github.com'</span>,
 <span class="token string">'app_type'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'application'</span><span class="token builtin class-name">:</span> <span class="token string">'Chrome'</span>,
 <span class="token string">'description'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'duration'</span><span class="token builtin class-name">:</span> <span class="token number">4</span>,
 <span class="token string">'email_bcc'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'email_cc'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'email_imid'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'email_subject'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'end_time'</span><span class="token builtin class-name">:</span> <span class="token string">'2023-09-26T18:11:06.758000+00:00'</span>,
 <span class="token string">'end_time_local'</span><span class="token builtin class-name">:</span> datetime.datetime<span class="token punctuation">(</span><span class="token number">2023</span>, <span class="token number">9</span>, <span class="token number">26</span>, <span class="token number">14</span>, <span class="token number">11</span>, <span class="token number">6</span>, <span class="token number">758000</span>, <span class="token assign-left variable">tzinfo</span><span class="token operator">=</span><span class="token operator">&lt;</span>DstTzInfo <span class="token string">'US/Eastern'</span> EDT-1 day, <span class="token number">20</span>:00:00 DST<span class="token operator">></span><span class="token punctuation">)</span>,
 <span class="token string">'event_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'f309f876-136e-4d1b-52e6-5c09987ae70c'</span>,
 <span class="token string">'file_count'</span><span class="token builtin class-name">:</span> <span class="token number">0</span>,
 <span class="token string">'files'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'from_address'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'geolocation'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'integration_name'</span><span class="token builtin class-name">:</span> <span class="token string">'Chrome'</span>,
 <span class="token string">'ipv4'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'keystrokes'</span><span class="token builtin class-name">:</span> <span class="token punctuation">{</span><span class="token string">'2023-09-26 18:11'</span><span class="token builtin class-name">:</span> <span class="token number">10</span><span class="token punctuation">}</span>,
 <span class="token string">'local_ipv4'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'local_timezone'</span><span class="token builtin class-name">:</span> <span class="token string">'US/Eastern'</span>,
 <span class="token string">'mouse_clicks'</span><span class="token builtin class-name">:</span> <span class="token punctuation">{</span><span class="token string">'2023-09-26 18:11'</span><span class="token builtin class-name">:</span> <span class="token number">1</span><span class="token punctuation">}</span>,
 <span class="token string">'operation'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'operation_type'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'organization_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'123e4567-e89b-12d3-a456-1231231'</span>,
 <span class="token string">'organization_id'</span><span class="token builtin class-name">:</span> <span class="token number">1</span>,
 <span class="token string">'phone_result'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'processing_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'65dc302d-d591-4634-a531-a5eae45e182b'</span>,
 <span class="token string">'record_id'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'record_url'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'recording_url'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'site'</span><span class="token builtin class-name">:</span> <span class="token string">'github.com'</span>,
 <span class="token string">'size'</span><span class="token builtin class-name">:</span> <span class="token number">0</span>,
 <span class="token string">'staging_detail_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'f309f876-136e-4d1b-52e6-5c09987ae70c'</span>,
 <span class="token string">'staging_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'65dc302d-d591-4634-a531-a5eae45e182b'</span>,
 <span class="token string">'tags'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'timestamp'</span><span class="token builtin class-name">:</span> <span class="token string">'2023-09-26T18:11:02.758Z'</span>,
 <span class="token string">'timestamp_local'</span><span class="token builtin class-name">:</span> <span class="token string">'2023-09-26T14:11:02.758000-04:00'</span>,
 <span class="token string">'to_address'</span><span class="token builtin class-name">:</span> None,
 <span class="token string">'url'</span><span class="token builtin class-name">:</span> <span class="token string">'https://github.com/'</span>,
 <span class="token string">'user_id'</span><span class="token builtin class-name">:</span> <span class="token number">285</span><span class="token punctuation">}</span>


<span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">=</span> Received First Timeslot <span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span><span class="token operator">==</span>


<span class="token punctuation">{</span><span class="token string">'day'</span><span class="token builtin class-name">:</span> <span class="token number">26</span>,
 <span class="token string">'day_local'</span><span class="token builtin class-name">:</span> <span class="token number">26</span>,
 <span class="token string">'event_end_time'</span><span class="token builtin class-name">:</span> <span class="token string">'2023-09-26T18:11:06.758000+00:00'</span>,
 <span class="token string">'event_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'f309f876-136e-4d1b-52e6-5c09987ae70c'</span>,
 <span class="token string">'hour'</span><span class="token builtin class-name">:</span> <span class="token number">18</span>,
 <span class="token string">'hour_local'</span><span class="token builtin class-name">:</span> <span class="token number">14</span>,
 <span class="token string">'keystrokes'</span><span class="token builtin class-name">:</span> <span class="token number">0</span>,
 <span class="token string">'minute'</span><span class="token builtin class-name">:</span> <span class="token number">11</span>,
 <span class="token string">'minute_local'</span><span class="token builtin class-name">:</span> <span class="token number">11</span>,
 <span class="token string">'month'</span><span class="token builtin class-name">:</span> <span class="token number">9</span>,
 <span class="token string">'month_local'</span><span class="token builtin class-name">:</span> <span class="token number">9</span>,
 <span class="token string">'mouse_clicks'</span><span class="token builtin class-name">:</span> <span class="token number">0</span>,
 <span class="token string">'organization_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'123e4567-e89b-12d3-a456-1231231'</span>,
 <span class="token string">'processing_guid'</span><span class="token builtin class-name">:</span> <span class="token string">'65dc302d-d591-4634-a531-a5eae45e182b'</span>,
 <span class="token string">'tl1'</span><span class="token builtin class-name">:</span> <span class="token number">851</span>,
 <span class="token string">'tl10'</span><span class="token builtin class-name">:</span> <span class="token number">85</span>,
 <span class="token string">'tl15'</span><span class="token builtin class-name">:</span> <span class="token number">56</span>,
 <span class="token string">'tl5'</span><span class="token builtin class-name">:</span> <span class="token number">170</span>,
 <span class="token string">'ts1'</span><span class="token builtin class-name">:</span> <span class="token number">1091</span>,
 <span class="token string">'ts10'</span><span class="token builtin class-name">:</span> <span class="token number">109</span>,
 <span class="token string">'ts15'</span><span class="token builtin class-name">:</span> <span class="token number">72</span>,
 <span class="token string">'ts5'</span><span class="token builtin class-name">:</span> <span class="token number">218</span>,
 <span class="token string">'week'</span><span class="token builtin class-name">:</span> <span class="token number">39</span>,
 <span class="token string">'week_local'</span><span class="token builtin class-name">:</span> <span class="token number">39</span>,
 <span class="token string">'weekday'</span><span class="token builtin class-name">:</span> <span class="token number">1</span>,
 <span class="token string">'weekday_local'</span><span class="token builtin class-name">:</span> <span class="token number">1</span>,
 <span class="token string">'year'</span><span class="token builtin class-name">:</span> <span class="token number">2023</span>,
 <span class="token string">'year_local'</span><span class="token builtin class-name">:</span> <span class="token number">2023</span><span class="token punctuation">}</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>So I had to fix the logic here:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code><span class="token keyword">def</span> <span class="token function">datetimeToYearMonthDayMinute</span><span class="token punctuation">(</span>dateString<span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">str</span><span class="token punctuation">:</span>
        <span class="token triple-quoted-string string">"""
        Converts a datetime to a string in the format of "%Y-%m-%dT%H:%M"
        """</span>
        <span class="token keyword">if</span> dateString <span class="token operator">==</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
            <span class="token keyword">return</span> <span class="token boolean">None</span>
        
        <span class="token keyword">if</span> <span class="token builtin">type</span><span class="token punctuation">(</span>dateString<span class="token punctuation">)</span> <span class="token operator">==</span> datetime<span class="token punctuation">.</span>datetime<span class="token punctuation">:</span>
            dateString <span class="token operator">=</span> dateString<span class="token punctuation">.</span>strftime<span class="token punctuation">(</span><span class="token string">"%Y-%m-%dT%H:%M"</span><span class="token punctuation">)</span>
        
        <span class="token keyword">return</span> parser<span class="token punctuation">.</span>parse<span class="token punctuation">(</span>dateString<span class="token punctuation">)</span><span class="token punctuation">.</span>strftime<span class="token punctuation">(</span><span class="token string">"%Y-%m-%dT%H:%M"</span><span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h3 id="refactor-ensure-that-is-datetime-at-all-times-use-utils-parse-instead" tabindex="-1"><a class="header-anchor" href="#refactor-ensure-that-is-datetime-at-all-times-use-utils-parse-instead"><span>Refactor, ensure that is datetime at all times + Use Utils.parse instead</span></a></h3>
<ul>
<li>Done</li>
</ul>
<h3 id="testing-collapsed-events" tabindex="-1"><a class="header-anchor" href="#testing-collapsed-events"><span>Testing Collapsed Events</span></a></h3>
<p>Lets see the endtstampt is not matching?</p>
<ul>
<li>[x] Using endtime instead?</li>
</ul>
<blockquote>
<p>Now I do have the correct stamp, but sitll they are not being collapsed:</p>
</blockquote>
<p>e.g. Sample output.</p>
<p>It seems I was misusing the reference as well.</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>

<span class="token keyword">for</span> idx<span class="token punctuation">,</span> collapsedEvent <span class="token keyword">in</span> <span class="token builtin">enumerate</span><span class="token punctuation">(</span>eventDataList<span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token keyword">if</span> collapsedEvent<span class="token punctuation">.</span>event_guid <span class="token keyword">not</span> <span class="token keyword">in</span> event_guid_min_max_memory<span class="token punctuation">:</span>
        min_max_event_data <span class="token operator">=</span> <span class="token punctuation">{</span>
            <span class="token string">"min"</span><span class="token punctuation">:</span> collapsedEvent<span class="token punctuation">.</span>timestamp<span class="token punctuation">,</span>
            <span class="token string">"max"</span><span class="token punctuation">:</span> collapsedEvent<span class="token punctuation">.</span>end_time<span class="token punctuation">,</span>
            <span class="token string">"idx"</span><span class="token punctuation">:</span> idx <span class="token comment"># keeps track and updates the first time reference.</span>
            
        <span class="token punctuation">}</span>
        event_guid_min_max_memory<span class="token punctuation">[</span>collapsedEvent<span class="token punctuation">.</span>event_guid<span class="token punctuation">]</span> <span class="token operator">=</span> min_max_event_data
    <span class="token keyword">else</span><span class="token punctuation">:</span>
        min_max_event_data <span class="token operator">=</span> event_guid_min_max_memory<span class="token punctuation">[</span>collapsedEvent<span class="token punctuation">.</span>event_guid<span class="token punctuation">]</span>
        <span class="token keyword">if</span> collapsedEvent<span class="token punctuation">.</span>end_time <span class="token operator">></span> min_max_event_data<span class="token punctuation">[</span><span class="token string">"max"</span><span class="token punctuation">]</span><span class="token punctuation">:</span>
            min_max_event_data<span class="token punctuation">[</span><span class="token string">"max"</span><span class="token punctuation">]</span> <span class="token operator">=</span> collapsedEvent<span class="token punctuation">.</span>end_time
            reference_id <span class="token operator">=</span> min_max_event_data<span class="token punctuation">[</span><span class="token string">"idx"</span><span class="token punctuation">]</span>
            addClicksAndKeystrokes<span class="token punctuation">(</span>collapsedEvent<span class="token punctuation">,</span> reference_id<span class="token punctuation">,</span> eventDataList<span class="token punctuation">)</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h3 id="_20-4-clean-the-ui-make-sure-it-is-feasible-given-latest-iteration-of-the-models" tabindex="-1"><a class="header-anchor" href="#_20-4-clean-the-ui-make-sure-it-is-feasible-given-latest-iteration-of-the-models"><span>20.4 Clean the UI, Make sure it is feasible given latest iteration of the models.</span></a></h3>
<ul>
<li>[x] Ensure that the management of <code v-pre>timeoff</code> works.</li>
</ul>
<p>Finished</p>
<h3 id="_20-5-finish-script-presentation" tabindex="-1"><a class="header-anchor" href="#_20-5-finish-script-presentation"><span>20.5 Finish Script presentation</span></a></h3>
<ul>
<li>[x] Introduction Part.</li>
<li>[ ] Why I am a good candidate for X part.</li>
<li>[ ] Revise on public transport reasons</li>
</ul>
<h4 id="introduction-part" tabindex="-1"><a class="header-anchor" href="#introduction-part"><span>Introduction Part.</span></a></h4>
<ol>
<li>Show your github and projects.</li>
</ol>
<p>I admire Basta because of its initiaitve to  bridge employment gap for first generation students. I have always taken my studies and CS seriously For example since my Sophomore Year 2021 That I had been consistently developing and furthering my development skills while working part time. Unfortunately my job experience wasnt on an industry role, I worked as a Line cook, Programming instructor but unfortunately they were all paid minimum wage and werent related to building career, so I tried doing my share of unpaid internships and volunteering my skills to nonprofits and Students clubs using my software skills. But unfortunately I had been unable to get a paying interneship. As an first generation student with no connections to people working in the industry, its disheartening to see that I am not able to break into the industry. I am hoping that by joining Basta, I can get to help and get help to break into the industry.
Once I get more experience I also want to help future Basta members. I deeply understand the pain of being a first generational student and not having the connections to break into the field. I am hoping to be able to help others in the same situationas well, help others also break into the industry..</p>
<p>From reading the job Description, I understand that would be beneffited by someone who is passionate about Creating Software Solutions that bring Tech and Finance Economy Science Together. Because I always wanted to augmantate people's Finance skills using tech, For example, I am the lead developer Paper Market, which I started together with my schools Investment Club president. Paper Marketis a platform that are used right now by them to compete in the stock market using virtual paper money. And you can actually playtest the application by scanning this QR.</p>
<p>From what I know of this company, they are looking into building projects in South America, Which is great, While I am an US Citizen I lived more than 14 years in Argentina, and also visited different parts of South America in part because of my argentinian mother and because of non-profit organizations I was involved such as Bliad an my membershiip to Mercosur which allows me to easily travel between many South American Countries.</p>
<p>It also happens that I am fluent in spanish and had my entire highschool completed back in Argentina, and I have made many friends from South America that always keep me updated regarding their countries socio-economic countries, in fact, I was few months ago able to participate in the historic elections of Argentina, which I believe is an historic moment for the country as it symbolizes a shift on the political spectrum, going from a mostly socialistic state to an freemarket liberalist country.</p>
<p>There are also some ideas of very interesting projects related to risk of Monsoons and agriculture that aligns with a project I been working with recently Together with some friends and the inventor of Argentinian game, Ecopolis. We started working on a simulation game for improving decision making that combines the power of data modeling to help emulate the impact of various economic policies and factors such as environment and agriculture policies affect society such as in education, economy.</p>
<p>A third reason I could be a strong candidate is that I can help their projects with my data science and Software engineering skills. Here I am showing some of my previous work with Data science. Direct applications of Data Science could be using Linear Regressions into understanding and drawing forecast to make smarter business decisions, Natural Language Processing techniques to understand public opinions regarding new policies, or waves of trends. And also Feature Ranking with Random Forest to understand what are the most important factors to consider when taking investment decisions. I have also participated in Hackathons and Internships that helped me improve on my full stack experience that can be used to build any prototypes or Production software.</p>
<h4 id="revise-on-public-transport-reasons" tabindex="-1"><a class="header-anchor" href="#revise-on-public-transport-reasons"><span>Revise on public transport reasons</span></a></h4>
<p>A reason that I want to join is becuse I admire Basta for its initiative to bridge the employment gap for first-generation students. I have always taken my studies and computer science seriously. Since my sophomore year in 2021, I have been consistently developing my skills while working part-time. Unfortunately, my job experience wasn't in industry roles; I worked as a line cook and Highschool programming instructor, positions  that I appreciate but couldnt help building my career. Therefore to breach the gap, I sought out unpaid internships and volunteered my skills to nonprofits and student clubs, using my software expertise. Despite doing this, I have been never been able to secure a paying internship. As a first-generation student without connections in the industry, it a disheartening state. I hope that by joining Basta, I can both give and receive help to break into the industry. Once I gain more experience, I also want to assist future Basta members. I deeply understand the challenges faced by first-generation students and I aim to help others in similar situations break into the industry.</p>
<p>From reading the job description, I understand that the company would benefit from someone passionate about creating software solutions that bring technology and finance together. I have always wanted to augment people's financial skills using technology. For example, I am the lead developer of Paper Market, a platform I started with my school's Investment Club president. Paper Market is currently used by members to compete in the stock market using virtual money. You can test the application by scanning this QR code.</p>
<p>interest in building projects in South America excites me. Although I am a U.S. citizen, I lived in Argentina for over 14 years and have visited various parts of South America, partly due to my Argentine mother and my involvement in nonprofit organizations and my membership in Mercosur, which allows me to travel easily between many South American countries.</p>
<p>I am fluent in Spanish and completed my high school education in Argentina, this helped make many friends from South America who keep me updated on their countries' socio-economic conditions. In fact, I recently participated in the historic elections of Argentina, symbolizing a shift in the political spectrum towards a more free-market liberalist country.</p>
<p>I am also working on a project related to the risk of monsoons and agriculture, in collaboration with friends and the inventor of the Argentine game Ecopolis. We are developing a simulation game to improve decision-making by combining data modeling to emulate the impact of various economic policies and factors, such as environmental and agricultural policies, on society.</p>
<p>A third reason I could be a strong candidate is my data science and software engineering skills. Here I am showcassing my previous work with data science, That can be used on pragamatical applications like linear regressions for forecasting to help building better decision, natural language processing to gauge public opinion on new policies, and feature ranking with random forests for improving the decisions making process when it comes to considering the factors before investing. My participation in hackathons and internships has also enhanced my full-stack development skills, which could be instrumental in building prototypes or production software.</p>
<h3 id="_20-6-do-all-ses-for-algorithms-and-datastructures-ses" tabindex="-1"><a class="header-anchor" href="#_20-6-do-all-ses-for-algorithms-and-datastructures-ses"><span>20.6 Do all ses for Algorithms and Datastructures SES.</span></a></h3>
<h2 id="atlantic-revolutions-north-american-and-france" tabindex="-1"><a class="header-anchor" href="#atlantic-revolutions-north-american-and-france"><span>Atlantic Revolutions North American and France</span></a></h2>
<p>This week I’ve asked you to read four primary sources and, like last week, I want you to imagine how the authors of two of these – Mary Wollstonecraft and Frederick Douglass - might have responded to two seminal political documents of the age: the Declaration of Independence and the Declaration of the Rights of Man and of the Citizen.</p>
<p>Imagine each one was making a public statement (such as a speech or an open letter) in response to the main ideas and ideals underpinning one of the two declarations – Wollstonecraft to the French declaration and Douglass to the North American.</p>
<p>Wollstonecraft to the French declaration</p>
<p>Douglass to the North American</p>
<h2 id="a-f-cool-game-using-iot" tabindex="-1"><a class="header-anchor" href="#a-f-cool-game-using-iot"><span>A f cool game using IOT.</span></a></h2>
<p>Imagine now. An sustainability Project in which it would look like Ecopolis.</p>
</div></template>


