# Javascript <Badge text="Lab"/>


Examples From:
- [Javascript Cheatsheet](https://websitesetup.org/javascript-cheat-sheet/)
- [Array Methods](https://javascript.info/array-methods)

## Basics

<table-code>
<table-row-pre title="var" 
code=' Can be reassigned but only accessed within a function. Variables
defined with var move to the top when code is executed. '/>

<table-row-pre title="const" 
code=' Cannot be reassigned and not accessible before they appear within the code'/>

<table-row-pre title="const" 
code=' Similar to const, however, let variable can be reassigned but not re-declared.
'/>


</table-code>

## Array Methods
<table-code>
<table-row-code title="adds items to the end," code='arr.push(...items)
' />
<table-row-code title="splice" sub=" Delete element from array" 
code='let arr = ["I", "study", "JavaScript"];
arr.splice(1, 1); // from index 1 remove 1 element
alert( arr ); // ["I", "JavaScript"]
' />


<table-row-code title="slice" 
code='let arr = ["t", "e", "s", "t"];
alert( arr.slice(1, 3) ); // e,s (copy from 1 to 3)
alert( arr.slice(-2) ); // s,t (copy from -2 till the end)
'/>

<table-row-code title="concat" sub=" The method arr.concat creates a new array that includes values from other arrays and additional items." 
code='let arr = [1, 2];

// create an array from: arr and [3,4]
alert( arr.concat([3, 4]) ); // 1,2,3,4

// create an array from: arr and [3,4] and [5,6]
alert( arr.concat([3, 4], [5, 6]) ); // 1,2,3,4,5,6

// create an array from: arr and [3,4], then add values 5 and 6
alert( arr.concat([3, 4], 5, 6) ); // 1,2,3,4,5,6
' />


<table-row-code title="Iterate: forEach" sub=" Delete element from array" 
code='
arr.forEach(function(item, index, array) {
  // ... do something with item
});

' />


<table-row-code title="indexOf/lastIndexOf" 
code='let arr = [1, 0, false];

alert( arr.indexOf(0) ); // 1
alert( arr.indexOf(false) ); // 2
alert( arr.indexOf(null) ); // -1

alert( arr.includes(1) ); // true
' />


<tre  title="find" >

      let users = [
        {id: 1, name: "John"},
        {id: 2, name: "Pete"},
        {id: 3, name: "Mary"}
        ];
      let user = users.find(item => item.id == 1);
</tre>

<tre  title="find" >

      let users = [
        {id: 1, name: "John"},
        {id: 2, name: "Pete"},
        {id: 3, name: "Mary"}
        ];
      let user = users.find(item => item.id == 1);
</tre>



</table-code>

## String Methods


## Number Methods

## Math Methods 

## Dates
