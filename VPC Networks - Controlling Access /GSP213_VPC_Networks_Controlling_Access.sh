


gcloud compute instances create blue --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-medium --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --tags=web-server,http-server --create-disk=auto-delete=yes,boot=yes,device-name=blue,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230509,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

gcloud compute instances create green --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-medium --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --create-disk=auto-delete=yes,boot=yes,device-name=blue,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230509,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

gcloud compute --project=$DEVSHELL_PROJECT_ID firewall-rules create allow-http-web-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80,icmp --source-ranges=0.0.0.0/0 --target-tags=web-server


gcloud compute instances create test-vm --machine-type=f1-micro --subnet=default --zone=$ZONE


gcloud iam service-accounts create network-admin --description="Service account for Network Admin role" --display-name="Network-admin"


gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member=serviceAccount:network-admin@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --role=roles/compute.networkAdmin

gcloud iam service-accounts keys create credentials.json --iam-account=network-admin@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com


cat > bluessh.sh <<'EOF_END'
sudo apt-get install nginx-light -y
sudo sed -i "14c\<h1>Welcome to the blue server!</h1>" /var/www/html/index.nginx-debian.html
EOF_END

gcloud compute scp bluessh.sh blue:/tmp --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet

gcloud compute ssh blue --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet --command="bash /tmp/bluessh.sh" --ssh-flag="-o ConnectTimeout=60"



cat > greenssh.sh <<'EOF_END'
sudo apt-get install nginx-light -y
sudo sed -i "14c\<h1>Welcome to the green server!</h1>" /var/www/html/index.nginx-debian.html
EOF_END

gcloud compute scp greenssh.sh green:/tmp --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet

gcloud compute ssh green --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet --command="bash /tmp/greenssh.sh"



