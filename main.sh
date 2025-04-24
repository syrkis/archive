#!/bin/bash


echo "Starting sync..."
aws s3 sync ~/desk/archive s3://syrkis/ \
    --endpoint-url https://nbg1.your-objectstorage.com \
    --exclude main.sh \
    --exclude .git/* \
    --exclude .gitignore \
    --exclude .DS_Store \
    --exclude README.md

echo "Starting git operations..."
git add .
git commit -m "Sync archive to S3"
git push
