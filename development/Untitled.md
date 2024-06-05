


```python
    if hasattr(toolbox, "settings"):

        settingsDict = toolbox.settings()

        population_limit = settingsDict["population_limit"]

        k = settingsDict["encounters_per_lifetime"]

        print("====================================================")

        print('population limit:', population_limit, 'k:', k)

    print("====================================================")

    print('population limit:', population_limit, 'k:', k,)

    individuals = sorted(individuals, key=lambda x: x.fitness.values[0], reverse=True)
```




![](Pasted%20image%2020240508030003.png)


![](Pasted%20image%2020240508030159.png)


- Here it seems that the 1: is kind of extra in this case.



After fix:



- Fixed. Lets go over the other points. Table here

- [ ] Lets have it working for shortest path as well 

