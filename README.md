SystemBashScripts
=================

Collection of bash scripts I use for system maintenance. All scripts in this repository are licensed under the GNU Genereal Public License version 3 or later.

apt-grate
--------------
This script is for debian based systems and is used for backing up/restoring repositories and the list of installed software.

INSTALLATION:
Copy apt-grat.conf to /usr/local/etc
Copy apt-grate to wherever you'd like (/usr/local/bin would be a sensible choice)

USAGE:
apt-grate.conf
 - Change any option you don't want included in the backup to "false"
 - Change BKDIR to path to directory you want backup archive to be stored

syntax
 - apt-grate {backup | restore} [/path/to/backup]
 - Path to backup is an optional argument which is specified in case config file is not used or to override config file

NOTES:
Restore operation can take quite a bit of time, as it involved apt-get install for every piece of software backed up to the installed software list

git-update-notify.sh
-----------------------

*THIS SCRIPT IS CURRENTLY BUG RIDDEN. USAGE IS NOT RECOMMENDED*

Script is designed for Arch Linux to work with Arch User Repository git packages. Script will check the folders of all git-based AUR packages in a selected directory when run; gives desktop notification if updates are found.

TO USE: Place the folders which include the src directories for all AUR git packages in a single folder, and alter the "gitdir" variable at the top of the script to point to that containing directory. Run script when you want to check for updates, or add to crontab for automatic update checks.
Script only checks for updates; does not pull them.

