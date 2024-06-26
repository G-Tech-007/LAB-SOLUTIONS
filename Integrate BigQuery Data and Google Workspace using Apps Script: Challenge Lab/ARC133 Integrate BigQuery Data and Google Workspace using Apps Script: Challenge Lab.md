# ```ARC133: Integrate BigQuery Data and Google Workspace using Apps Script: Challenge Lab```

# ```Task 2: ```
## Q1: Find out how many taxi companies there are in Chicago.
```cmd
=COUNTUNIQUE(taxi_trips!company)
```
## Q2: Find the percentage of taxi rides in Chicago that included a tip.
```cmd
=COUNTIF(taxi_trips!tips,">0")
```
## Q3: Find the total number of trips where the fare was greater than 0.
```cmd
=COUNTIF(taxi_trips!fare,">0")
```
# ```Task 3: ```
## => As a pie chart, what forms of payments are people using for their taxi rides?

Steps:

Drag ```payment_type``` to the Label field. Then drag fare into the Value field 

Under Value > ```Fare```, change Sum to Count. Click Apply.

### => As a line chart, how has revenue from mobile payments for taxi trips changed over time?

### =>As a line chart, how have mobile payments changed over time since revenue peaked in 2015?

Steps:

Drag ```trip_start_timestamp``` to the X-axis field.

Check the ```Group by``` option and select ```Year-Month``` from the dropdown list.

Drag ```fare``` into the Series field.

Under ```Filter click Add > payment_type.```

Select the Showing all items status dropdown.

Click on the ```Filter by``` Condition dropdown and select ```Text contains``` from the list.

Input ```mobile``` in the Value field.

Click OK.

## ```Thanks For Watching :)```
## ```Share, Support, Subscribe!!!``` 
