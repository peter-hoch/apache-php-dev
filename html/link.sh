#!/bin/bash

file=$1

cd basic
ln -s ../$file $file
cd ..
cd digest
ln -s ../$file $file
cd ..
cd test
ln -s ../$file $file
cd ..

