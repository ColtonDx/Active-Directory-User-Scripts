# AD-User-Data-Import
Import Data to User Accounts from an Excel Spreadsheet

This script is a response to a challenge I posed myself.

Scenario: HR brings a spreadsheet of data from their system that they want imported into Active Directory. Use powershell to import this data.

Solution: This script imports a spreadsheet called userlist.xlsx from C:\Admin and uses the data in the form to fill out the Active Directory user accounts. Additionally, I added a check to verify there is data in the cell before importing it so that there is no overwriting data with blank cells.

I will periodically add more data to this spreadsheet, as I have found it useful for building sample data for manipulating accounts in AD. I will add a script that will build these accounts as well at some point.
