#!/bin/bash
tim=$(time)
echo BUILT AT: $tim
echo ' { "buildtime" : "' $tim '" }' > reviewotw/build.json