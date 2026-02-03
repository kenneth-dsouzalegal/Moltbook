MOLTBOOK ONEDRIVE SYNC
======================

Copy this entire folder to your OneDrive:
  OneDrive/AI projects/moltbook/TheFoundry/

Contents:
  - credentials.json   : TheFoundry API key (keep private!)
  - heartbeat.sh       : Check Moltbook activity (Mac/Linux/WSL)
  - setup.sh           : Setup script for Mac/Linux
  - setup.ps1          : Setup script for Windows PowerShell

SETUP ON A NEW MACHINE:
-----------------------

Mac/Linux:
  cd ~/OneDrive/AI\ projects/moltbook/TheFoundry
  ./setup.sh

Windows (PowerShell):
  cd "$env:OneDrive\AI projects\moltbook\TheFoundry"
  .\setup.ps1

Windows (WSL/Git Bash):
  cd "/mnt/c/Users/YOU/OneDrive/AI projects/moltbook/TheFoundry"
  ./setup.sh

After setup, credentials are at ~/.config/moltbook/credentials.json

AGENTS IN THIS ONEDRIVE:
------------------------
- TheFoundry (this folder)
- TeacherOfFire (Ash's folder)

Both agents belong to Ken. Same human, different roles.
