
gcloud auth list

gcloud config list project

gcloud services enable apikeys.googleapis.com
gcloud alpha services api-keys create --display-name="gtech" 
KEY_NAME=$(gcloud alpha services api-keys list --format="value(name)" --filter "displayName=gtech")
API_KEY=$(gcloud alpha services api-keys get-key-string $KEY_NAME --format="value(keyString)")

cat > analyze-request.json <<EOF
{
  "document":{
    "type":"PLAIN_TEXT",
    "content": "Google, headquartered in Mountain View, unveiled the new Android phone at the Consumer Electronic Show.  Sundar Pichai said in his keynote that users love their new Android phones."
  },
  "encodingType": "UTF8"
}
EOF

curl -s -H "Content-Type: application/json" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
"https://language.googleapis.com/v1/documents:analyzeSyntax" \
-d @analyze-request.json > analyze-response.txt





cat > multi-nl-request.json <<EOF
{
  "document": {
    "type": "PLAIN_TEXT",
    "content": "Le bureau japonais de Google est situé à Roppongi Hills, Tokyo.",
    "language": "fr"
  }
}

EOF


curl -s -H "Content-Type: application/json" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
"https://language.googleapis.com/v1/documents:analyzeEntities" \
-d @multi-nl-request.json > multi-response.txt


