#!/usr/bin/env bash

# First, remove the old copy of the dependencies from the release folder
rm ./*.so.*

# Now, use ldd to figure out the (presumably newer) dependencies are
for i in `ldd ./node_modules/canvas/build/Release/canvas.node | awk '{print $3}' | grep so`; do
    # Copy them to the top level folder for the next build
    cp $i ./
done
