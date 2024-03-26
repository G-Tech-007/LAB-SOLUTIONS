# ```GSP1036: Securing Virtual Machines using BeyondCorp Enterprise (BCE)```

```cmd
export ZONE=
```

```cmd
gcloud services enable iap.googleapis.com
gcloud compute instances create linux-iap \
--machine-type e2-medium \
--subnet=default \
--no-address \
--zone $ZONE
gcloud compute instances create windows-iap \
--machine-type e2-medium \
--subnet=default \
--no-address \
--zone $ZONE \
--create-disk auto-delete=yes,boot=yes,device-name=windows-iap,image=projects/windows-cloud/global/images/windows-server-2016-dc-v20230315,mode=rw,size=50,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced
gcloud compute instances create windows-connectivity \
--machine-type e2-medium \
--zone $ZONE \
--create-disk auto-delete=yes,boot=yes,device-name=windows-connectivity,image=projects/qwiklabs-resources/global/images/iap-desktop-v001,mode=rw,size=50,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced \
--scopes https://www.googleapis.com/auth/cloud-platform
```

### ```Search Firewall > Create Firewall Rule ```
> Name ```allow-ingress-from-iap```

>Target ```All instances in the network```

>Source IPv4 Ranges ```35.235.240.0/20```

>Select TCP and enter ```22, 3389```


## ```Search Identity-Aware Proxy > SSH and TCP Resources```
>Check ```linux-iap```**&**```windows-iap```

>Click ```Add principal```

>Principle: Enter ```service``` and select the first one 

>Role ```IAP-Secured Tunnel User```

>Click SAVE

>Click ```Add principal```

>Principle:  ```Paste your Username```

>Role ```IAP-Secured Tunnel User```

>Click SAVE

### ```Thanks For Watching :)```
### ```Share, Support, Subscribe!!!``` 
