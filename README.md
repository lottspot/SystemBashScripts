SystemBashScripts
=================

Collection of bash scripts I use for system maintenance. All scripts in this repository are licensed under the GNU Genereal Public License version 3 or later.

git-update-notify.sh
-----------------------
Script is designed for Arch Linux to work with Arch User Repository git packages. Script will check the folders of all git-based AUR packages in a selected directory when run; gives desktop notification if updates are found.

TO USE: Place the folders which include the src directories for all AUR git packages in a single folder, and alter the "gitdir" variable at the top of the script to point to that containing directory. Run script when you want to check for updates, or add to crontab for automatic update checks.
Script only checks for updates; does not pull them.