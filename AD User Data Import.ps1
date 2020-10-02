<######################################
   _____ ______ _______ _    _ _____  
  / ____|  ____|__   __| |  | |  __ \ 
 | (___ | |__     | |  | |  | | |__) |
  \___ \|  __|    | |  | |  | |  ___/ 
  ____) | |____   | |  | |__| | |     
 |_____/|______|  |_|   \____/|_|   
######################################>


#Set the path for the .xlsx we will import
$path = "C:\Admin\userlist.xlsx"

#import the proper module, this does require that psexcel be installed
import-module psexcel
Import-Module ActiveDirectory

#Generate Array
$users = new-object System.Collections.ArrayList

<######################################
  _      ____   ____  _____  
 | |    / __ \ / __ \|  __ \ 
 | |   | |  | | |  | | |__) |
 | |   | |  | | |  | |  ___/ 
 | |___| |__| | |__| | |     
 |______\____/ \____/|_|     
                           
######################################>

foreach ($user in (Import-XLSX -Path $path -RowStart 1))
{

#Sets the Manager, this will require Usernames for the Manager, no just first/last
if ($user.Manager -ne $null)
{Set-ADUser $user.Username -Manager $user.Manager}

#Mobile Phone Number
if ($user.MobilePhone -ne $null)
{Set-ADUser $user.Username -MobilePhone $user.MobilePhone}


#Department, this is just a string
if ($user.Department -ne $null)
{Set-ADUser $user.Username -Department $user.Department}

#City
if ($user.City -ne $null)
{Set-ADUser $user.Username -City $user.City}

#Company
if ($user.Company -ne $null)
{Set-ADUser $user.Username -Company $user.Company}

#EmployeeNumber
if ($user.EmployeeNumber -ne $null)
{Set-ADUser $user.Username -EmployeeNumber $user.EmployeeNumber}

#EmployeeID
if ($user.EmployeeID -ne $null)
{Set-ADUser $user.Username -EmployeeID $user.EmployeeID}

#Fax
if ($user.Fax -ne $null)
{Set-ADUser $user.Username -Fax $user.Fax}

#Office
if ($user.Office -ne $null)
{Set-ADUser $user.Username -Office $user.Office}

#State
if ($user.State -ne $null)
{Set-ADUser $user.Username -State $user.State}

#StreetAddress
if ($user.StreetAddress -ne $null)
{Set-ADUser $user.Username -StreetAddress $user.StreetAddress}

#Organization
if ($user.Organization -ne $null)
{Set-ADUser $user.Username -Organization $user.Organization}

#OfficePhone
if ($user.OfficePhone -ne $null)
{Set-ADUser $user.Username -OfficePhone $user.OfficePhone}

#PostalCode
if ($user.PostalCode -ne $null)
{Set-ADUser $user.Username -PostalCode $user.PostalCode}

#POBox
if ($user.POBox -ne $null)
{Set-ADUser $user.Username -POBox $user.POBox}

#HomePhone
if ($user.HomePhone -ne $null)
{Set-ADUser $user.Username -HomePhone $user.HomePhone}

}

<######################################
  _      ____   _____ 
 | |    / __ \ / ____|
 | |   | |  | | |  __ 
 | |   | |  | | | |_ |
 | |___| |__| | |__| |
 |______\____/ \_____|
                                               
######################################>

#To be added later
