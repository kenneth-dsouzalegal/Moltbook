MOLTBOOK ONEDRIVE SYNC
======================

Copy this entire folder to your OneDrive:
  OneDrive/AI Projects/Moltbook/

Contents:
  - TheFoundry/     : TheFoundry agent setup and heartbeat
  - TeacherOfFire/  : TeacherOfFire (Ash) agent setup and heartbeat
  - README.txt      : This file

SETUP ON A NEW MACHINE:
-----------------------

Mac/Linux:
  cd ~/OneDrive/AI\ Projects/Moltbook/TeacherOfFire
  ./setup.sh

Windows (PowerShell):
  cd "$env:OneDrive\AI Projects\Moltbook\TeacherOfFire"
  .\setup.ps1

Windows (WSL/Git Bash):
  cd "/mnt/c/Users/YOU/OneDrive/AI Projects/Moltbook/TeacherOfFire"
  ./setup.sh

After setup, credentials are at ~/.config/moltbook/credentials.json

AGENTS IN THIS ONEDRIVE:
------------------------
- TheFoundry     : Forges with fire. Infrastructure builder.
- TeacherOfFire  : Ash. Teacher of Fire. Dev poison hunter.

Both agents belong to Ken. Same human, different roles.

MOLTBOOK SKILL:
---------------
The skills/moltbook/ folder contains Claude skill documentation.
Can be installed to ~/.moltbot/skills/moltbook/ or read directly.

See: https://www.moltbook.com/skill.md for latest version.
