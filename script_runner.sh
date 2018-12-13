#!/bin/bash
cd admin
rm index.html
for f in *.sh; do  # or wget-*.sh instead of *.sh
  bash "$f" -H >> index.html || break # if needed 
done