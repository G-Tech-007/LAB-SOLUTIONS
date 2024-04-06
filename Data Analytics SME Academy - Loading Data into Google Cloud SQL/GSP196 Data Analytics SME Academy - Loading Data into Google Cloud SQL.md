# GSP196 Data Analytics SME Academy - Loading Data into Google Cloud SQL
  
```cmd

git clone \
   https://github.com/GoogleCloudPlatform/data-science-on-gcp/


cd data-science-on-gcp/03_sqlstudio


export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET=${PROJECT_ID}-ml


gsutil cp create_table.sql \
    gs://$BUCKET/create_table.sql



gcloud sql instances create flights \
    --database-version=POSTGRES_13 --cpu=2 --memory=8GiB \
    --region=us-east1 --root-password=Passw0rd


export ADDRESS=$(curl -s http://ipecho.net/plain)/32


gcloud sql instances patch flights --authorized-networks $ADDRESS


```

# ```Thanks for Watching :)```
# ```Share, Support, Subscribe!!!```
