#!/bin/bash
tim=$(time)
echo BUILT AT: $tim
echo ' { "buildtime" : "' $tim '" }' > build.json