# ```GSP647: Configuring IAM Permissions with gcloud```

```cmd
export PROJECT_ID2=
```
```cmd
export ZONE=
```
```cmd
export TECH=$(gcloud iam service-accounts list | grep -i "compute@developer.gserviceaccount.com" | awk '{print $2}')
gcloud projects add-iam-policy-binding "$DEVSHELL_PROJECT_ID" \
    --member="serviceAccount:$TECH" \
    --role="roles/owner"
gcloud projects add-iam-policy-binding "$PROJECT_ID2" \
    --member="serviceAccount:$TECH" \
    --role="roles/owner"
gcloud compute ssh centos-clean --zone=$ZONE --quiet
```
```cmd
export ZONE=
```
```cmd
gcloud compute instances create lab-1 --zone $ZONE --machine-type=e2-standard-2
cat << 'EOF' > toggle_zone_script.sh
#!/bin/bash
last_char="${ZONE: -1}"
if [ "$last_char" == "a" ]; then
    export NZONE="${ZONE%?}b"  
elif [ "$last_char" == "b" ]; then
    export NZONE="${ZONE%?}c" 
elif [ "$last_char" == "c" ]; then
    export NZONE="${ZONE%?}b"
elif [ "$last_char" == "d" ]; then
    export NZONE="${ZONE%?}b"
fi
echo "$NZONE"
EOF
chmod +x toggle_zone_script.sh
NEWZONE=$(./toggle_zone_script.sh)
y | gcloud config set compute/zone $NEWZONE
```
### ```NOTE: 👇Don't use these commands until you get a score for Task 1 & Task 2.```
#### ```If you didn't receive score for Task 2, just run the command again.```
```cmd
gcloud init --no-launch-browser
```
### Press ```2``` > Type ```user2``` > Press ```2``` > Press ```y``` 
### click the link > Use ```existing``` account > ALLOW > Copy
### Paste > Press ```1```
```cmd
export USER_ID2=
```
```cmd
export PROJECT_ID2=
```
```cmd
gcloud config configurations activate user2
echo "export PROJECTID2=$PROJECT_ID2" >> ~/.bashrc
. ~/.bashrc
gcloud config configurations activate default
sudo yum -y install epel-release
sudo yum -y install jq
echo "export USERID2=$USER_ID2" >> ~/.bashrc
. ~/.bashrc
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=roles/viewer
gcloud config configurations activate user2
gcloud config set project $PROJECTID2
gcloud compute instances create lab-2 --machine-type=e2-standard-2
gcloud config configurations activate default
gcloud iam roles create devops --project $PROJECTID2 --permissions "compute.instances.create,compute.instances.delete,compute.instances.start,compute.instances.stop,compute.instances.update,compute.disks.create,compute.subnetworks.use,compute.subnetworks.useExternalIp,compute.instances.setMetadata,compute.instances.setServiceAccount"
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=projects/$PROJECTID2/roles/devops
gcloud config configurations activate user2
gcloud compute instances create lab-2 --machine-type=e2-standard-2
gcloud config configurations activate default
gcloud config set project $PROJECTID2
gcloud iam service-accounts create devops --display-name devops
gcloud iam service-accounts list  --filter "displayName=devops"
GTECH=$(gcloud iam service-accounts list --format="value(email)" --filter "displayName=devops")
gcloud projects add-iam-policy-binding $PROJECTID2 --member serviceAccount:$GTECH --role=roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECTID2 --member serviceAccount:$GTECH --role=roles/compute.instanceAdmin
gcloud compute instances create lab-3 --machine-type=e2-standard-2 --service-account $GTECH --scopes "https://www.googleapis.com/auth/compute"
```
### ```Thanks For Watching :)```
### ```Share, Support, Subscribe!!!``` 
