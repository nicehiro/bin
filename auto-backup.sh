#!/bin/bash
# auto backup through git

cd /home/hiro/org/
git add .
git commit -m "Backup taken at @ $(date)"
git push

cd /home/hiro/bin/
git add .
git commit -m "Backup taken at @ $(date)"
