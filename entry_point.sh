#!/bin/bash

for py_file in $(find $tests -name *.py)
do
    python $py_file
done