#!/bin/bash
# auto backup through git
# useage: crontab -h

cd /home/hiro/org-files/
git add .
git commit -m "Backup taken at @ $(date)"
git push

cd /home/hiro/bin/
git add .
git commit -m "Backup taken at @ $(date)"

cd /home/hiro/sicp/
git add .
git commit -m "Backup taken at @ $(date)"
