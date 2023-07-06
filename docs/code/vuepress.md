---
title: Vuepress
tags: ["vuepress"]
---

<Header />

[[toc]]

### Adding Bootstrap:


https://conorsheehan1.hashnode.dev/add-bootstrap-vue-to-vuepress

For Adding Bootstrap into it.

Have Bootstrap.


### Fetching Pages in Current Folder:



```js

<script>
import FeatureCard from "./FeatureCard.vue";
export default {
  components: { FeatureCard },
  mounted() {
    console.log("mounted");
    this.getPagesInCurrentFolder();
    console.log(this.pagesInCurrentFolder);
  },
  data() {
    return {
      projects: [
        {
          name: "Project 1",
          description: "Description 1",
          link: "Some link",
        },
        {
          name: "Project 2",
          description: "Description 2",
          link: "Some link",
        },
        {
          name: "Project 3",
          description: "Description 2",
          link: "Some link",
        },
        {
          name: "Project 4",
          description: "Description 1",
          link: "Some link",
        },
        {
          name: "Project 5",
          description: "Description 2",
          link: "Some link",
        },
        {
          name: "Project 6",
          description: "Description 2",
          link: "Some link",
        },
      ],
      pagesInCurrentFolder: [],
    };
  },
  methods: {
    getPagesInCurrentFolder() {
      const currentFolder = this.$route.path.substring(
        0,
        this.$route.path.lastIndexOf("/")
      );
      this.pagesInCurrentFolder = this.$site.pages.filter((page) =>
        page.path.startsWith(currentFolder)
      );
    },
  },
};
</script>

<style></style>

```

Which means it wors. 
```
Array(3) [ {…}, {…}, {…} ]
​
0: Object { title: Getter & Setter, frontmatter: Getter & Setter, regularPath: Getter & Setter, … }
​​
__ob__: Object { value: {…}, dep: {…}, vmCount: 0 }
​​
createdTime: 
​​
frontmatter: Object { title: Getter & Setter, … }
​​​
__ob__: Object { value: {…}, dep: {…}, vmCount: 0 }
​​​
title: 
​​​
<get title()>: function reactiveGetter()
​​​
<set title()>: function reactiveSetter(newVal)
​​​
<prototype>: Object { … }
​​
key: 
​​
lastUpdated: 
​​
path: 
​​
regularPath: 
​​
relativePath: 
​​
title: 
​​
<get createdTime()>: function reactiveGetter()
​​
<set createdTime()>: function reactiveSetter(newVal)
​​
<get frontmatter()>: function reactiveGetter()
​​
<set frontmatter()>: function reactiveSetter(newVal)
​​
<get key()>: function reactiveGetter()
​​
<set key()>: function reactiveSetter(newVal)
​​
<get lastUpdated()>: function reactiveGetter()
​​
<set lastUpdated()>: function reactiveSetter(newVal)
​​
<get path()>: function reactiveGetter()
​​
<set path()>: function reactiveSetter(newVal)
​​
<get regularPath()>: function reactiveGetter()
​​
<set regularPath()>: function reactiveSetter(newVal)
​​
<get relativePath()>: function reactiveGetter()
​​
<set relativePath()>: function reactiveSetter(newVal)
​​
<get title()>: function reactiveGetter()
​​
<set title()>: function reactiveSetter(newVal)
​​
<prototype>: Object { … }
​
1: Object { title: Getter & Setter, frontmatter: Getter & Setter, regularPath: Getter & Setter, … }
​
2: Object { title: Getter & Setter, frontmatter: Getter & Setter, regularPath: Getter & Setter, … }
​
__ob__: Object { value: (3) […], dep: {…}, vmCount: 0 }
​
length: 3
​
<prototype>: Object { … }
ProjectTable.vue:24

```
