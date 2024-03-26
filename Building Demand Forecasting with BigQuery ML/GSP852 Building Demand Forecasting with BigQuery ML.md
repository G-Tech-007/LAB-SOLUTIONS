# ```GSP852: Building Demand Forecasting with BigQuery ML```

## ```Cloudshell:-```
```cmd
bq mk bqmlforecast
```
## ```BigQuery:- ```
```cmd
SELECT
   bikeid,
   starttime,
   start_station_name,
   end_station_name,
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime is not null
LIMIT 5
```
```cmd
SELECT
  EXTRACT (DATE FROM TIMESTAMP(starttime)) AS start_date,
  start_station_id,
  COUNT(*) as total_trips
FROM
 `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
   starttime BETWEEN DATE('2016-01-01') AND DATE('2017-01-01')
GROUP BY
    start_station_id, start_date
LIMIT 5
```
```cmd
SELECT
 DATE(starttime) AS trip_date,
 start_station_id,
 COUNT(*) AS num_trips
FROM
 `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
 starttime BETWEEN DATE('2014-01-01') AND ('2016-01-01')
 AND start_station_id IN (521,435,497,293,519)
GROUP BY
 start_station_id,
 trip_date
```
## Save Result > BigQuery Table > Dataset `bqmlforecast` > Table name `training_data`
```cmd
CREATE OR REPLACE MODEL bqmlforecast.bike_model
  OPTIONS(
    MODEL_TYPE='ARIMA',
    TIME_SERIES_TIMESTAMP_COL='trip_date',
    TIME_SERIES_DATA_COL='num_trips',
    TIME_SERIES_ID_COL='start_station_id',
    HOLIDAY_REGION='US'
  ) AS
  SELECT
    trip_date,
    start_station_id,
    num_trips
  FROM
    bqmlforecast.training_data
```
```cmd
SELECT
  *
FROM
  ML.EVALUATE(MODEL bqmlforecast.bike_model)
```
```cmd
 DECLARE HORIZON STRING DEFAULT "30"; #number of values to forecast
 DECLARE CONFIDENCE_LEVEL STRING DEFAULT "0.90";
 EXECUTE IMMEDIATE format("""
     SELECT
         *
     FROM
       ML.FORECAST(MODEL bqmlforecast.bike_model,
                   STRUCT(%s AS horizon,
                          %s AS confidence_level)
                  )
     """, HORIZON, CONFIDENCE_LEVEL)
```

## ```Thanks For Watching :)```
## ```Share, Support, Subscribe!!!``` 
