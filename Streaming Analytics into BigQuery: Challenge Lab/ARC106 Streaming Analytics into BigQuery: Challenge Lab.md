# ```ARC106: Streaming Analytics into BigQuery: Challenge Lab```

## ```Exports:-```
```cmd
export DATASET_NAME=
```
```cmd
export TABLE_NAME=
```

```cmd
export TOPIC_NAME=
```

```cmd
export JOB_NAME=
```

```cmd
export REGION=
```

## ```Cloudshell: (Task 1,Task2 and Task 3)```
```cmd
gsutil mb gs://$DEVSHELL_PROJECT_ID

bq mk $DATASET_NAME

bq mk --table \
$DEVSHEL_PROJECT_ID:$DATASET_NAME.$TABLE_NAME \
data:string

gcloud pubsub topics create $TOPIC_NAME

gcloud pubsub subscriptions create $TOPIC_NAME-sub --topic=$TOPIC_NAME
```
## ```Task: 4```
```cmd
gcloud dataflow jobs run $JOB_NAME-1 --gcs-location gs://dataflow-templates-$REGION/latest/PubSub_to_BigQuery --region $REGION --staging-location gs://$DEVSHELL_PROJECT_ID/temp --parameters inputTopic=projects/$DEVSHELL_PROJECT_ID/topics/$TOPIC_NAME,outputTableSpec=$DEVSHELL_PROJECT_ID:$DATASET_NAME.$TABLE_NAME
```

## ```Task: 5```
```cmd
gcloud pubsub topics publish $TOPIC_NAME --message='{"data": "73.4 F"}'

bq query --nouse_legacy_sql "SELECT * FROM \`$DEVSHELL_PROJECT_ID.$DATASET_NAME.$TABLE_NAME\`"
```
## ```Thanks For Watching :)```
## ```Share, Support, Subscribe!!!``` 
