﻿###
# The Setup
###

# Settings all the variables that will not change during the runtime of the script

#Set the path for the .xlsx we will import
$path = "C:\Admin\userlist.xlsx"

#import the proper module, this does require that psexcel be installed
import-module psexcel
Import-Module ActiveDirectory

#Pull Computer Name from Current PC
	$Computer = $env:COMPUTERNAME

#Pull Domain Name from Current PC
	$Domain = $env:USERDNSDOMAIN

#Generate Fully Qualified Domain Name of Current PC
	$FQDN = "$Computer" + "." + "$Domain"

#Generate Array
$users = new-object System.Collections.ArrayList


###
# Loop Template
###
foreach ($user in (Import-XLSX -Path $path -RowStart 1))
{
Set-ADUser $user.Username -Manager $user.Manager
Set-ADUser $user.Username -MobilePhone $user.Phone
Set-ADUser $user.Username -Department $user.Department
}