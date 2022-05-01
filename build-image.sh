#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
# derived from kiwenlau/hadoop:1.0
docker build -t leavenha/hadoop:1.1 .

echo ""
