import{_ as t,r as o,o as i,c as r,a as n,b as e,d as l,e as s}from"./app-DQekuI1D.js";const c="/salaryman-guide/assets/Pasted image 20240312112552-De5W2zzd.png",p="/salaryman-guide/assets/Pasted image 20240312112450-DkvuOi37.png",d="/salaryman-guide/assets/Pasted image 20240312112501-DOsGRc-x.png",u={},h=s(`<h2 id="_5-tuesday" tabindex="-1"><a class="header-anchor" href="#_5-tuesday"><span>5 Tuesday</span></a></h2><h3 id="some-notes-regarding-the-idea-of-dev-and-how-to-enforce-such" tabindex="-1"><a class="header-anchor" href="#some-notes-regarding-the-idea-of-dev-and-how-to-enforce-such"><span>Some notes regarding the idea of dev. And how to enforce such:</span></a></h3><ul><li>48 Hours policy for all getbacks. 24 Hours Policy for sms replies.</li></ul><p>With this type of policy you should be able to keep up with work.</p><ul><li>In New York locations allow also: Visits and Monthly Photoshoot Sessions to keep Media upkeep.</li></ul><p>How to enforce such? Using the Focusmate strategy and just blocking the hours expected during the week immediatelly upon having a task received.</p><p>Also how do you keep track of clients?</p><p>How about the hours credit proposal?</p><p>Wait how am I handling the Interactions again? Does it make sense to hae the event start and end, and not keep track of all interactions? My guess is that I can avoid creating the timeslots. And if the end one (The latest one records everyting as expected)</p><h2 id="_7-thursday" tabindex="-1"><a class="header-anchor" href="#_7-thursday"><span>7 Thursday</span></a></h2><h3 id="where-is-the-error" tabindex="-1"><a class="header-anchor" href="#where-is-the-error"><span>Where is the error?</span></a></h3><div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre class="language-bash"><code>Processing ID fetched: <span class="token punctuation">[</span><span class="token number">246</span><span class="token punctuation">]</span>
Processing Status Changed to: PROCESSING
Processing Started for: 6c9a5500-00f0-4a26-a1b6-efd5c7eba828
ERROR:ERROR: current transaction is aborted, commands ignored <span class="token keyword">until</span> end of transaction block
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>This occurs before:</p><div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre class="language-python"><code><span class="token keyword">class</span> <span class="token class-name">ConnectorBasedIntegrationAdapter</span><span class="token punctuation">(</span>IntegrationDataAdapter<span class="token punctuation">)</span><span class="token punctuation">:</span>
    integration_name <span class="token operator">=</span> <span class="token string">&#39;connector_based_adapter&#39;</span>
    <span class="token keyword">def</span> <span class="token function">retrieveOrganizationData</span><span class="token punctuation">(</span>self<span class="token punctuation">,</span> jobService<span class="token punctuation">:</span> JobService<span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">&gt;</span> <span class="token builtin">dict</span><span class="token punctuation">:</span>
        <span class="token triple-quoted-string string">&quot;&quot;&quot;
        Retrieves in the following format:
        Since the same user is guaranteed for this entire data cluster. Expect only a single requirement.
        {
            organization_guid: str,
            organization_id: int,
            timezone: str,
            user_id: int
        }
        &quot;&quot;&quot;</span>
        
        cursor <span class="token operator">=</span> jobService<span class="token punctuation">.</span>cursor
        res <span class="token operator">=</span> <span class="token punctuation">{</span>
            <span class="token string">&quot;organization_guid&quot;</span><span class="token punctuation">:</span> jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">,</span>

        <span class="token punctuation">}</span> <span class="token comment"># nod to leetcode xd</span>


        
        <span class="token comment"># Retrieve organization_id </span>
        cursor<span class="token punctuation">.</span>execute<span class="token punctuation">(</span>
            <span class="token string-interpolation"><span class="token string">f&quot;SELECT id FROM organization WHERE guid = &#39;</span><span class="token interpolation"><span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span></span><span class="token string">&#39;&quot;</span></span>
        <span class="token punctuation">)</span>
        cursor_response_organization <span class="token operator">=</span> cursor<span class="token punctuation">.</span>fetchone<span class="token punctuation">(</span><span class="token punctuation">)</span>
        <span class="token keyword">print</span><span class="token punctuation">(</span><span class="token string">&#39;Organization data found for connector:&#39;</span><span class="token punctuation">,</span> cursor_response_organization<span class="token punctuation">)</span>

        <span class="token keyword">if</span> <span class="token keyword">not</span> cursor_response_organization<span class="token punctuation">:</span>
            jobService<span class="token punctuation">.</span>addLogMessage<span class="token punctuation">(</span>
                log_message<span class="token operator">=</span><span class="token string-interpolation"><span class="token string">f&quot;Organization not found in the database. from organization </span><span class="token interpolation"><span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span></span><span class="token string">&quot;</span></span><span class="token punctuation">,</span>
                log_detail<span class="token operator">=</span>&quot;Organization <span class="token keyword">not</span> found <span class="token keyword">in</span> the database<span class="token punctuation">.</span> <span class="token keyword">from</span> organization <span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span>\\n\\
                    using integration_name <span class="token punctuation">{</span>self<span class="token punctuation">.</span>integration_name<span class="token punctuation">}</span> <span class="token keyword">and</span> organization_guid <span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span>&quot;<span class="token punctuation">,</span>
                log_type<span class="token operator">=</span><span class="token string">&quot;Error&quot;</span>
                <span class="token punctuation">)</span>
            <span class="token comment"># This should be a breaking error</span>
            <span class="token keyword">raise</span> Exception<span class="token punctuation">(</span><span class="token string">&quot;Organization not found in the database.&quot;</span><span class="token punctuation">)</span>
        
        res<span class="token punctuation">[</span><span class="token string">&quot;organization_id&quot;</span><span class="token punctuation">]</span> <span class="token operator">=</span> cursor_response_organization<span class="token punctuation">[</span><span class="token number">0</span><span class="token punctuation">]</span>

        <span class="token comment"># Check for the user_id where connector is X</span>
        cursor<span class="token punctuation">.</span>execute<span class="token punctuation">(</span>
            <span class="token string-interpolation"><span class="token string">f&quot;SELECT c.user_id, u.timezone FROM connector AS c JOIN users AS u ON u.id = c.user_id WHERE c.guid = &#39;</span><span class="token interpolation"><span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>connector_guid<span class="token punctuation">}</span></span><span class="token string">&#39;;&quot;</span></span>
        <span class="token punctuation">)</span>
        cursor_response <span class="token operator">=</span> cursor<span class="token punctuation">.</span>fetchone<span class="token punctuation">(</span><span class="token punctuation">)</span>  
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_8-friday" tabindex="-1"><a class="header-anchor" href="#_8-friday"><span>8 Friday</span></a></h2><ul><li>[x] 8.1 Allowing Errors Report to be also on the end message.</li><li>[x] 8.2 Add some design considerations</li><li>[x] 8.3 Deploy a Staging Equivalent? (This is required first for the migration of data models to be run first.)</li><li>[x] 8.4 Update Model&#39;s username to be included.</li><li>[x] 8.5 Send the correct model and the right snapshot.</li><li>[x] 8.6 Continue working first on the Data Science Project: Get started with it!</li><li>[x] 8.7 Fix Nancy Site, issue with the images.</li><li>[x] 8.8 Drafting a General Business Proposal as for how the business works.</li><li>[x] 8.12 Work on Music Assignment</li><li>[x] 8.13 Work on IOS App Dev Assignment.</li><li>[x] 8.9 Drafting a simple logistics way to have the pricing for each feature and estimated rates for different common services.</li><li>[x] 8.10 Draft a way to logically divide distinct work.</li><li>[x] 8.11 Add that feature to your website (Anvil Tech).</li></ul><h3 id="_8-1-allowing-errors-report-to-be-also-on-the-end-message" tabindex="-1"><a class="header-anchor" href="#_8-1-allowing-errors-report-to-be-also-on-the-end-message"><span>8.1 Allowing Errors Report to be also on the end message.</span></a></h3><p>It looks as if the error report does indeed make sense.</p><h3 id="_8-2-adding-design-considerations" tabindex="-1"><a class="header-anchor" href="#_8-2-adding-design-considerations"><span>8.2 Adding Design Considerations</span></a></h3><ul><li>models <code>username</code></li><li>Update layout screens with the ts1, etc. configurations</li></ul><h3 id="_8-6-continue-working-first-on-the-data-science-project-get-started-with-it" tabindex="-1"><a class="header-anchor" href="#_8-6-continue-working-first-on-the-data-science-project-get-started-with-it"><span>8.6 Continue working first on the Data Science Project: Get started with it!</span></a></h3><ul><li>[ ] Show the data</li><li>[ ] Work on Showing the basics of the dataset illustrating the distributions?</li></ul><h2 id="_12-tuesday" tabindex="-1"><a class="header-anchor" href="#_12-tuesday"><span>12 Tuesday</span></a></h2><h3 id="_12-todo" tabindex="-1"><a class="header-anchor" href="#_12-todo"><span>12.todo</span></a></h3><ul><li>[ ] 12.1 Create Mockup Cards <ul><li>[ ] Document the Creation of mockup cards</li></ul></li><li>[ ] 12.2 Chrome Extension</li><li>[ ] 12.3 Checking Antonio&#39;s Latest Release</li><li>[ ] 12.4 Exploring Future Cookbook integrations (Soon) regex, sql, react <ul><li>[ ] Second tier: Math, Stats, Discrete (From the practice book)</li></ul></li></ul><h3 id="_12-1-create-mockup-cards" tabindex="-1"><a class="header-anchor" href="#_12-1-create-mockup-cards"><span>12.1 Create Mockup Cards</span></a></h3><ul><li><p>[ ] Document the creation of Mockup Cards</p></li><li><p>Ensure new model related to suer is documented in summary:</p></li></ul><p>newest changes:</p><ul><li>Added username</li><li></li></ul><ul><li>[ ] Feature Request?</li></ul><h3 id="_12-2-continue-working-on-chrome-extension" tabindex="-1"><a class="header-anchor" href="#_12-2-continue-working-on-chrome-extension"><span>12.2 Continue Working On Chrome Extension</span></a></h3>`,31),g={href:"https://in.api.loading.win/dev/incoming",title:"https://in.api.loading.win/dev/incoming",target:"_blank",rel:"noopener noreferrer"},k=n("li",null,"[ ] Update Chrome documentation to reflect recent changes.",-1),m=n("li",null,"[ ] Changing body to suit latest staging event structure.",-1),v=n("li",null,"[ ] Use Chrome Connector Credential Associated.",-1),b=n("li",null,"[ ] Update to 1 minute instead of whatever it is right now.",-1),f=s('<h3 id="_12-3-checking-antonio-s-latest-release" tabindex="-1"><a class="header-anchor" href="#_12-3-checking-antonio-s-latest-release"><span>12.3 Checking Antonio&#39;s latest release.</span></a></h3><p>Make sure to check the following is working properly:</p><ul><li>[ ] Does it send events correctly?</li></ul><blockquote><p>Lets explore the tracking?</p></blockquote><p><img src="'+c+`" alt=""></p><p>It doesn&#39;t seem to be sending events that are being accepted</p><blockquote><p>is it sending towards <code>localhost</code>?</p></blockquote><div class="language-csharp line-numbers-mode" data-ext="cs" data-title="cs"><pre class="language-csharp"><code><span class="token preprocessor property">#<span class="token directive keyword">if</span> false    </span>
                <span class="token comment">// SettingsService.SetRestApiEndpoint(&quot;http://localhost:3000/staging_events&quot;);</span>
                SettingsService<span class="token punctuation">.</span><span class="token function">SetRestApiEndpoint</span><span class="token punctuation">(</span><span class="token string">&quot;http://stage.api.loading.win/staging_events&quot;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token preprocessor property">#<span class="token directive keyword">else</span></span>
                SettingsService<span class="token punctuation">.</span><span class="token function">SetRestApiEndpoint</span><span class="token punctuation">(</span><span class="token string">&quot;https://in.api.loading.win/dev/incoming&quot;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token preprocessor property">#<span class="token directive keyword">endif</span></span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Doesn&#39;t seem to, not the <code>false</code></p><blockquote><p>Let&#39;s see what happens on the Lambda logs + Dynamo for any error logs.</p></blockquote><p><img src="`+p+'" alt=""></p><p>We can see here that it all matches:</p><p>![[Pasted image 20240312111010.png]]</p><p>And the connector is matching</p><blockquote><p>Checking for error marked in dynamo table?</p></blockquote><p><img src="'+d+'" alt=""></p><p>Can be seen that no <code>total_errors</code> neither <code>total_connects</code> were updated, is this because the lambda didn&#39;t implement it?</p><ul><li>[ ] How about if a user is active in a site for more than 1 minute?</li><li>[ ] How about Admin install permissions?</li></ul>',18);function _(w,y){const a=o("ExternalLinkIcon");return i(),r("div",null,[h,n("ul",null,[n("li",null,[e("[ ] Modify Link to update to newest endpoint. "),n("a",g,[e("https://in.api.loading.win/dev/incoming"),l(a)])]),k,m,v,b]),f])}const S=t(u,[["render",_],["__file","24-3-march.html.vue"]]),q=JSON.parse(`{"path":"/posts/journal/24-3-march.html","title":"2024 March","lang":"en-US","frontmatter":{"title":"2024 March"},"headers":[{"level":2,"title":"5 Tuesday","slug":"_5-tuesday","link":"#_5-tuesday","children":[{"level":3,"title":"Some notes regarding the idea of dev. And how to enforce such:","slug":"some-notes-regarding-the-idea-of-dev-and-how-to-enforce-such","link":"#some-notes-regarding-the-idea-of-dev-and-how-to-enforce-such","children":[]}]},{"level":2,"title":"7 Thursday","slug":"_7-thursday","link":"#_7-thursday","children":[{"level":3,"title":"Where is the error?","slug":"where-is-the-error","link":"#where-is-the-error","children":[]}]},{"level":2,"title":"8 Friday","slug":"_8-friday","link":"#_8-friday","children":[{"level":3,"title":"8.1 Allowing Errors Report to be also on the end message.","slug":"_8-1-allowing-errors-report-to-be-also-on-the-end-message","link":"#_8-1-allowing-errors-report-to-be-also-on-the-end-message","children":[]},{"level":3,"title":"8.2 Adding Design Considerations","slug":"_8-2-adding-design-considerations","link":"#_8-2-adding-design-considerations","children":[]},{"level":3,"title":"8.6 Continue working first on the Data Science Project: Get started with it!","slug":"_8-6-continue-working-first-on-the-data-science-project-get-started-with-it","link":"#_8-6-continue-working-first-on-the-data-science-project-get-started-with-it","children":[]}]},{"level":2,"title":"12 Tuesday","slug":"_12-tuesday","link":"#_12-tuesday","children":[{"level":3,"title":"12.todo","slug":"_12-todo","link":"#_12-todo","children":[]},{"level":3,"title":"12.1 Create Mockup Cards","slug":"_12-1-create-mockup-cards","link":"#_12-1-create-mockup-cards","children":[]},{"level":3,"title":"12.2 Continue Working On Chrome Extension","slug":"_12-2-continue-working-on-chrome-extension","link":"#_12-2-continue-working-on-chrome-extension","children":[]},{"level":3,"title":"12.3 Checking Antonio's latest release.","slug":"_12-3-checking-antonio-s-latest-release","link":"#_12-3-checking-antonio-s-latest-release","children":[]}]}],"git":{"updatedTime":1710257900000,"contributors":[{"name":"NelsonWang","email":"wangnelson2@gmail.com","commits":2}]},"filePathRelative":"posts/journal/24-3-march.md","excerpt":"<h2>5 Tuesday</h2>\\n<h3>Some notes regarding the idea of dev. And how to enforce such:</h3>\\n<ul>\\n<li>48 Hours policy for all getbacks. 24 Hours Policy for sms replies.</li>\\n</ul>\\n<p>With this type of policy you should be able to keep up with work.</p>\\n<ul>\\n<li>In New York locations allow also: Visits and Monthly Photoshoot Sessions to keep Media upkeep.</li>\\n</ul>"}`);export{S as comp,q as data};
