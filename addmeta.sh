#!/bin/bash
tim=$(date)
echo BUILT AT: $tim
echo ' { "buildtime" : "'$tim'" }' > build.json