<template><div><h2 id="_6-thu" tabindex="-1"><a class="header-anchor" href="#_6-thu"><span>6 Thu</span></a></h2>
<ul>
<li>There is also Kaggle which you can extract data science analysis from it. As for what to do now? You can practice on building more AI models similar to Kaggle. Or also improve at algorithms?</li>
</ul>
<p>So here the idea</p>
<p>So lets see: What should the daily algorithm look like?</p>
<p>I think I should attempt to build it from having the algorithms on the end.</p>
<p>So how do you summarize the current project?</p>
<ul>
<li>
<p>Work on the algorithms</p>
</li>
<li>
<p>And the React UI Components which should just be Framer Challanges.</p>
</li>
<li></li>
<li>
<p>[ ] Learn Framer</p>
</li>
</ul>
<p>The objective is creating a slight animation for each algorithm at certain level, and have it on Framer with an explainaition of the algorithm solution? Or at least have them moving.</p>
<p>Ideally You would start from the stack of work that is the closest to your work. you can create a react or framer to get started, And the same shoudlbe</p>
<p>So lets see waht are the easy</p>
<p>Here the objectives I had set:</p>
<p>What is being expected of me?</p>
<ul>
<li>Being good at at least 1 front-end stack ( That could be React + Framer)</li>
<li>Strong algorithmic thinking</li>
</ul>
<p>What I want fo myself?</p>
<ul>
<li>Data Science on tip of my hand, perphaps being able to interpret</li>
<li>Large amount of personal</li>
</ul>
<p>You want to be good at aws spin offs, at understanding the projects, and having experience working on them. even if they were at personal work.</p>
<h2 id="_7-fri" tabindex="-1"><a class="header-anchor" href="#_7-fri"><span>7 Fri</span></a></h2>
<p>Routine:</p>
<ul>
<li>
<p>[ ] Fix the todo list so that it marks whenever a task is marked</p>
</li>
<li>
<p>[ ] Finish an algo</p>
</li>
<li>
<p>[ ] Finish the todo list challange for Storybook.</p>
</li>
<li>
<p>[ ] Build React Card Component</p>
<ul>
<li>[ ] On hover plays animation</li>
</ul>
</li>
</ul>
<p>Things to document on:</p>
<ul>
<li>How to declare methods and hte like.</li>
</ul>
<h2 id="_21-fri" tabindex="-1"><a class="header-anchor" href="#_21-fri"><span>21 Fri</span></a></h2>
<h2 id="_21-todo" tabindex="-1"><a class="header-anchor" href="#_21-todo"><span>21.todo</span></a></h2>
<ul>
<li>[x] Lets follow the pattern of 1 Tutorial =&gt; 1 project to keep in track</li>
<li>[x] Work on the Habit Tracker Flutter</li>
<li>[x] Now do the Habit Tracking in your Todo application.</li>
<li>[ ] Then do the api routes from the Mapping Fast API perspective</li>
<li>[ ] Work on the tutorial for the clean coffee App</li>
<li>[ ] For then build the models for the Application</li>
</ul>
<p>Today working on Habit Tracker =&gt; Then  You continue working on your own tracker that connects with the habits from te python</p>
<h2 id="_24-mon" tabindex="-1"><a class="header-anchor" href="#_24-mon"><span>24 Mon</span></a></h2>
<h3 id="_24-todo" tabindex="-1"><a class="header-anchor" href="#_24-todo"><span>24.todo</span></a></h3>
<ul>
<li>[x] 24.1 Connecting the Habits</li>
</ul>
<p>Backlog</p>
<ul>
<li>[x] Building the API Routes
<ul>
<li>[x] Implement the API Routes.</li>
<li>[x] Modify the API so that there is some distinction on them?</li>
<li>[ ] !Make the Habits like cards double tapped cards, with some separations?</li>
<li>[ ] !It would be interesting for habits to also have like extra details.</li>
</ul>
</li>
<li>[x] !Clean Coffee App</li>
<li>[ ] Clean Twilight Application
<ul>
<li>[ ] Create the design.</li>
<li>[ ] Mark Hits with the program. It should have 0 twice at least on the probability, because they are two dices.</li>
<li>[ ] Saves to highlight the interactions</li>
<li>[ ] Saves on Firebase the images of the photos of the match.</li>
<li>[ ] Serves as a simple guide for which are to build.</li>
<li>[ ] Ability to create statute and pictures of epic fights. You can pay 1 of gold to create a statute.</li>
</ul>
</li>
</ul>
<p>So now that the habits are there, it would entirely Make sense to connect the habits so that it makes sense. So now what you have to do is to build the habits api.</p>
<h3 id="habit-tracking-api" tabindex="-1"><a class="header-anchor" href="#habit-tracking-api"><span>Habit Tracking API</span></a></h3>
<ul>
<li>[x] How should this api be designed?</li>
<li>[x] Design it
<ul>
<li>[x] Test with Mocked</li>
</ul>
</li>
<li>[x] Change it to align to that directive and it should still work as that.</li>
</ul>
<p>For this we have to see how the api works which should be</p>
<p>Saved as:</p>
<p>[
[&quot;Run&quot;, false],
[&quot;Read&quot;, false],
];</p>
<p>My worries fo thsi is that this is not specific value.</p>
<p>date : [{ Habit: name, value: 3 ]}</p>
<p>But the percentage that remembers only that : whcich the question is is that worth it?</p>
<p>I think it should better be saved as:</p>
<p>date: {percentage: 0.5, habits: [run, read], completed: 1, }</p>
<p>So that if required I can add more feedback into it. Because you still want to compute thiings like the api habits. Which increase the total habits count</p>
<p>habits.len =&gt; gets the total for the local</p>
<p>And then with another you get:</p>
<p>(api_completed + completed)
/
(habits.len + api_habits.len)</p>
<p>To get the percentage</p>
<p><strong>Idea n2</strong></p>
<p>So the idea n 2 of this is:</p>
<ul>
<li>You load all the habits, if they share the same anme as the api one, then it retrieves or valuates an overwrites its value.</li>
</ul>
<p>With this there is no change to be made.
date: percentage</p>
<ul>
<li>[ ] Modifying the API of the backend.
<ul>
<li>[ ] As long as it sends as requested as true false for a specific API is all good.</li>
</ul>
</li>
</ul>
<h3 id="clean-coffee-api" tabindex="-1"><a class="header-anchor" href="#clean-coffee-api"><span>Clean Coffee API</span></a></h3>
<p>Clean Coffee APIs</p>
<ul>
<li>
<p>Creating</p>
</li>
<li>
<p>[x] Making the an algo view, or the like stats to show some specific stats.</p>
</li>
<li>
<p>[x] Add the icon</p>
</li>
<li>
<p>[x] Save the post of the algorithms done, everytime you insert if there is internet. =&gt; Decided to do the algo social app instead.</p>
</li>
<li>
<p>[x] Which also becomes the startup for the Gym app which should be connected with the 7 minutes app and the Habits Obstucating.</p>
</li>
<li>
<p>[ ] It would be funny if you have some users that is just you commenting that stuff, and randoizing the user that comments.</p>
</li>
<li>
<p>[ ] Think about building this social media app for it. Both in Flutter with the posts and on Angular as well.</p>
</li>
</ul>
<h2 id="_25-tue" tabindex="-1"><a class="header-anchor" href="#_25-tue"><span>25 Tue</span></a></h2>
<h3 id="_25-todo" tabindex="-1"><a class="header-anchor" href="#_25-todo"><span>25.todo</span></a></h3>
<ul>
<li>[ ] Saving the posts of the algorithms being done.</li>
</ul>
<p>It should be like a markdown first. And then we can thinki about creating posts that accept markdowns. Otherwise just a simple json format.</p>
<p>Which should have =&gt;
title:
algo: <all the algo data>
description:
date:
solutions: []</p>
<p>And array of multiple solutions that you attempted:</p>
<p>Solution Array should be:</p>
<p>{
code:
timestamp:
language:</p>
<p>}</p>
<ul>
<li>[ ] Create the Scrum logo to make it identifiable</li>
</ul>
<h2 id="building-with-aspnet-core-and-angular" tabindex="-1"><a class="header-anchor" href="#building-with-aspnet-core-and-angular"><span>Building with ASPNET Core and Angular</span></a></h2>
<p>We need .net and nvm.</p>
<ul>
<li>These are kind of the legacy stack. And then with the Angular + Spring Boot for the full blown legacy stack.</li>
</ul>
<p>The idea is to convert this into a full blown code blog with random posts and comments.</p>
<h2 id="learning-july" tabindex="-1"><a class="header-anchor" href="#learning-july"><span>Learning July.</span></a></h2>
<p>Which also becomes the startup for the Gym app which should be connected with the 7 minutes app and the Habits Obstucating</p>
<ul>
<li>[ ] 7 Minutes How to have them there.</li>
</ul>
<p>You then have have a screen</p>
<h3 id="models" tabindex="-1"><a class="header-anchor" href="#models"><span>Models</span></a></h3>
<p><strong>Circuit</strong></p>
<ul>
<li>[x] Name</li>
<li>[x] Workout: dict&lt;int: Trainning&gt; {1: Trainning, 2: Trainning}</li>
</ul>
<p><strong>Trainning</strong></p>
<ul>
<li>[x] Name</li>
<li>[x] TimeSeconds</li>
<li>[x] Image</li>
<li>[x] Description</li>
<li>[x] Audio</li>
</ul>
<p>Here the</p>
<p><strong>Upgrade the packaging</strong></p>
</div></template>


