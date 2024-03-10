<template><div><h2 id="_5-tuesday" tabindex="-1"><a class="header-anchor" href="#_5-tuesday"><span>5 Tuesday</span></a></h2>
<h3 id="some-notes-regarding-the-idea-of-dev-and-how-to-enforce-such" tabindex="-1"><a class="header-anchor" href="#some-notes-regarding-the-idea-of-dev-and-how-to-enforce-such"><span>Some notes regarding the idea of dev. And how to enforce such:</span></a></h3>
<ul>
<li>48 Hours policy for all getbacks. 24 Hours Policy for sms replies.</li>
</ul>
<p>With this type of policy you should be able to keep up with work.</p>
<ul>
<li>In New York locations allow also: Visits and Monthly Photoshoot Sessions to keep Media upkeep.</li>
</ul>
<p>How to enforce such? Using the Focusmate strategy and just blocking the hours expected during the week immediatelly upon having a task received.</p>
<p>Also how do you keep track of clients?</p>
<p>How about the hours credit proposal?</p>
<p>Wait how am I handling the Interactions again?
Does it make sense to hae the event start and end, and not keep track of all interactions?
My guess is that I can avoid creating the timeslots. And if the end one (The latest one records everyting as expected)</p>
<h2 id="_7-thursday" tabindex="-1"><a class="header-anchor" href="#_7-thursday"><span>7 Thursday</span></a></h2>
<h3 id="where-is-the-error" tabindex="-1"><a class="header-anchor" href="#where-is-the-error"><span>Where is the error?</span></a></h3>
<div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre v-pre class="language-bash"><code>Processing ID fetched: <span class="token punctuation">[</span><span class="token number">246</span><span class="token punctuation">]</span>
Processing Status Changed to: PROCESSING
Processing Started for: 6c9a5500-00f0-4a26-a1b6-efd5c7eba828
ERROR:ERROR: current transaction is aborted, commands ignored <span class="token keyword">until</span> end of transaction block
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>This occurs before:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code><span class="token keyword">class</span> <span class="token class-name">ConnectorBasedIntegrationAdapter</span><span class="token punctuation">(</span>IntegrationDataAdapter<span class="token punctuation">)</span><span class="token punctuation">:</span>
    integration_name <span class="token operator">=</span> <span class="token string">'connector_based_adapter'</span>
    <span class="token keyword">def</span> <span class="token function">retrieveOrganizationData</span><span class="token punctuation">(</span>self<span class="token punctuation">,</span> jobService<span class="token punctuation">:</span> JobService<span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">dict</span><span class="token punctuation">:</span>
        <span class="token triple-quoted-string string">"""
        Retrieves in the following format:
        Since the same user is guaranteed for this entire data cluster. Expect only a single requirement.
        {
            organization_guid: str,
            organization_id: int,
            timezone: str,
            user_id: int
        }
        """</span>
        
        cursor <span class="token operator">=</span> jobService<span class="token punctuation">.</span>cursor
        res <span class="token operator">=</span> <span class="token punctuation">{</span>
            <span class="token string">"organization_guid"</span><span class="token punctuation">:</span> jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">,</span>

        <span class="token punctuation">}</span> <span class="token comment"># nod to leetcode xd</span>


        
        <span class="token comment"># Retrieve organization_id </span>
        cursor<span class="token punctuation">.</span>execute<span class="token punctuation">(</span>
            <span class="token string-interpolation"><span class="token string">f"SELECT id FROM organization WHERE guid = '</span><span class="token interpolation"><span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span></span><span class="token string">'"</span></span>
        <span class="token punctuation">)</span>
        cursor_response_organization <span class="token operator">=</span> cursor<span class="token punctuation">.</span>fetchone<span class="token punctuation">(</span><span class="token punctuation">)</span>
        <span class="token keyword">print</span><span class="token punctuation">(</span><span class="token string">'Organization data found for connector:'</span><span class="token punctuation">,</span> cursor_response_organization<span class="token punctuation">)</span>

        <span class="token keyword">if</span> <span class="token keyword">not</span> cursor_response_organization<span class="token punctuation">:</span>
            jobService<span class="token punctuation">.</span>addLogMessage<span class="token punctuation">(</span>
                log_message<span class="token operator">=</span><span class="token string-interpolation"><span class="token string">f"Organization not found in the database. from organization </span><span class="token interpolation"><span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span></span><span class="token string">"</span></span><span class="token punctuation">,</span>
                log_detail<span class="token operator">=</span>"Organization <span class="token keyword">not</span> found <span class="token keyword">in</span> the database<span class="token punctuation">.</span> <span class="token keyword">from</span> organization <span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span>\n\
                    using integration_name <span class="token punctuation">{</span>self<span class="token punctuation">.</span>integration_name<span class="token punctuation">}</span> <span class="token keyword">and</span> organization_guid <span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>organization_guid<span class="token punctuation">}</span>"<span class="token punctuation">,</span>
                log_type<span class="token operator">=</span><span class="token string">"Error"</span>
                <span class="token punctuation">)</span>
            <span class="token comment"># This should be a breaking error</span>
            <span class="token keyword">raise</span> Exception<span class="token punctuation">(</span><span class="token string">"Organization not found in the database."</span><span class="token punctuation">)</span>
        
        res<span class="token punctuation">[</span><span class="token string">"organization_id"</span><span class="token punctuation">]</span> <span class="token operator">=</span> cursor_response_organization<span class="token punctuation">[</span><span class="token number">0</span><span class="token punctuation">]</span>

        <span class="token comment"># Check for the user_id where connector is X</span>
        cursor<span class="token punctuation">.</span>execute<span class="token punctuation">(</span>
            <span class="token string-interpolation"><span class="token string">f"SELECT c.user_id, u.timezone FROM connector AS c JOIN users AS u ON u.id = c.user_id WHERE c.guid = '</span><span class="token interpolation"><span class="token punctuation">{</span>jobService<span class="token punctuation">.</span>connector_guid<span class="token punctuation">}</span></span><span class="token string">';"</span></span>
        <span class="token punctuation">)</span>
        cursor_response <span class="token operator">=</span> cursor<span class="token punctuation">.</span>fetchone<span class="token punctuation">(</span><span class="token punctuation">)</span>  
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_8-friday" tabindex="-1"><a class="header-anchor" href="#_8-friday"><span>8 Friday</span></a></h2>
<ul>
<li>[x] 8.1 Allowing Errors Report to be also on the end message.</li>
<li>[x] 8.2 Add some design considerations</li>
<li>[x] 8.3 Deploy a Staging Equivalent? (This is required first for the migration of data models to be run first.)</li>
<li>[x] 8.4 Update Model's username to be included.</li>
<li>[ ] 8.5 Send the correct model and the right snapshot.</li>
<li>[ ] 8.6 Continue working first on the Data Science Project: Get started with it!</li>
<li>[ ] 8.7 Fix Nancy Site, issue with the images.</li>
<li>[ ] 8.8 Drafting a General Business Proposal as for how the business works.</li>
<li>[ ] 8.12 Work on Music Assignment</li>
<li>[ ] 8.13 Work on IOS App Dev Assigmnet.</li>
<li>[ ] 8.9 Drafting a simple logistics way to have the prciing for each feature and estimated rates for different common services.</li>
<li>[x] 8.10 Draft a way to logically divide distinct work.</li>
<li>[ ] 8.11 Add that feature to your website (Anvil Tech).</li>
</ul>
<h3 id="_8-1-allowing-errors-report-to-be-also-on-the-end-message" tabindex="-1"><a class="header-anchor" href="#_8-1-allowing-errors-report-to-be-also-on-the-end-message"><span>8.1 Allowing Errors Report to be also on the end message.</span></a></h3>
<p>It looks as if the error report does indeed make sense.</p>
<h3 id="_8-2-adding-design-considerations" tabindex="-1"><a class="header-anchor" href="#_8-2-adding-design-considerations"><span>8.2 Adding Design Considerations</span></a></h3>
<ul>
<li>models <code v-pre>username</code></li>
<li>Update layout screens with the ts1, etc configurations</li>
</ul>
<h3 id="_8-6-continue-working-first-on-the-data-science-project-get-started-with-it" tabindex="-1"><a class="header-anchor" href="#_8-6-continue-working-first-on-the-data-science-project-get-started-with-it"><span>8.6 Continue working first on the Data Science Project: Get started with it!</span></a></h3>
<ul>
<li>[ ] Show the data</li>
<li>[ ] Work on Shwoing the basics of the dataset illustrating the distributions?</li>
</ul>
<h3 id="_8-7-fix-nancy-site-issue-with-the-images" tabindex="-1"><a class="header-anchor" href="#_8-7-fix-nancy-site-issue-with-the-images"><span>8.7 Fix Nancy Site, issue with the images.</span></a></h3>
<blockquote>
<p>Done</p>
</blockquote>
<h3 id="_10-sunday" tabindex="-1"><a class="header-anchor" href="#_10-sunday"><span>10 Sunday</span></a></h3>
<p>Objectives:</p>
<ul>
<li>Study Notes.</li>
</ul>
</div></template>


