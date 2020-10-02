# AD-User-Data-Import
Import Data to User Accounts from an Excel Spreadsheet



The idea with this script is that we have an excel spreadsheet of data we need imported into active directory. Each column in our spreadsheet is represented by $user.COLUMN where COLUMN
is the name of the column. We must use usernames and not the first/last names of the users in order for AD to verify it, so adding an auto-calculating cell that pulls the usernames
may be worth it. Also I plan on adding cell verification so that if there is an empty cell in the spreadsheet it doesn't overwrite the data in AD. Also note, this will not create
the users if they aren't in there already, I will be working that in another script.
