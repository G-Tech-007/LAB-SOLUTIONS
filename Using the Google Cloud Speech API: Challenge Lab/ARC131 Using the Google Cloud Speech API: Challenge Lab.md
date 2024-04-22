# ```ARC131: Using the Google Cloud Speech API: Challenge Lab```

## ```SSH in VM instance```
```cmd
export API_KEY=
```

```cmd
task_2_request_file=""
```

```cmd
task_2_response_file=""
```

```cmd
task_3_request_file=""
```

```cmd
task_3_response_file=""
```

```cmd
cat > "$task_2_request_file" <<EOF
{
  "config": {
    "encoding": "LINEAR16",
    "languageCode": "en-US",
    "audioChannelCount": 2
  },
  "audio": {
    "uri": "gs://spls/arc131/question_en.wav"
  }
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @"$task_2_request_file" \
"https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > "$task_2_response_file"

# Generate request_sp.json file
cat > "$task_3_request_file" <<EOF
{
  "config": {
    "encoding": "FLAC",
    "languageCode": "es-ES"
  },
  "audio": {
    "uri": "gs://spls/arc131/multi_es.flac"
  }
}
EOF

curl -s -X POST -H "Content-Type: application/json" --data-binary @"$task_3_request_file" \
"https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > "$task_3_response_file"
```

## ```Thanks For Watching :)```
## ```Share, Support, Subscribe!!!``` 
