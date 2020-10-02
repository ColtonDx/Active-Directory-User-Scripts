#This script will create new AD Users based on the spreadsheet C:\Admin\userlist.xlsx

<######################################
   _____ ______ _______ _    _ _____  
  / ____|  ____|__   __| |  | |  __ \ 
 | (___ | |__     | |  | |  | | |__) |
  \___ \|  __|    | |  | |  | |  ___/ 
  ____) | |____   | |  | |__| | |     
 |_____/|______|  |_|   \____/|_|   
######################################>

#import the proper module, this does require that psexcel be installed
import-module psexcel
Import-Module ActiveDirectory

#Set the path for the .xlsx we will import
$path = "C:\Admin\userlist.xlsx"

#Generate a Log File - This part is a work in progress
$log = "C:\Admin\WSUS\Approved_Updates_{0:MMddyyyy_HHmm}.log" -f (Get-Date)
new-item -path $log -type file -force

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

New-ADUser -Name $user.Username -GivenName $user.First -Surname $user.Last -UserPrincipalName $user.Username -AccountPassword $user.Password -Enabled $true -ChangePasswordAtLogon $true
"Created new user: " + ($user) | Out-File $Logfile

#Mobile Phone Number
if ($user.MobilePhone -ne $null)
{Set-ADUser $user.Username -MobilePhone $user.MobilePhone
"Added Mobile Phone to: " + ($user) | Out-File $Logfile
}


#Department
if ($user.Department -ne $null)
{Set-ADUser $user.Username -Department $user.Department
"Added Department to: " + ($user) | Out-File $Logfile
}

#City
if ($user.City -ne $null)
{Set-ADUser $user.Username -City $user.City
"Added City to: " + ($user) | Out-File $Logfile
}

#Company
if ($user.Company -ne $null)
{Set-ADUser $user.Username -Company $user.Company
"Added Company to: " + ($user) | Out-File $Logfile
}

#EmployeeNumber
if ($user.EmployeeNumber -ne $null)
{Set-ADUser $user.Username -EmployeeNumber $user.EmployeeNumber
"Added Employee Number to: " + ($user) | Out-File $Logfile
}

#EmployeeID
if ($user.EmployeeID -ne $null)
{Set-ADUser $user.Username -EmployeeID $user.EmployeeID
"Added EmployeeID to: " + ($user) | Out-File $Logfile
}

#Fax
if ($user.Fax -ne $null)
{Set-ADUser $user.Username -Fax $user.Fax
"Added Fax Number to: " + ($user) | Out-File $Logfile
}

#Office
if ($user.Office -ne $null)
{Set-ADUser $user.Username -Office $user.Office
"Added Office Number to: " + ($user) | Out-File $Logfile
}

#State
if ($user.State -ne $null)
{Set-ADUser $user.Username -State $user.State
"Added State to: " + ($user) | Out-File $Logfile
}

#StreetAddress
if ($user.StreetAddress -ne $null)
{Set-ADUser $user.Username -StreetAddress $user.StreetAddress
"Added Street Address to: " + ($user) | Out-File $Logfile
}

#Organization
if ($user.Organization -ne $null)
{Set-ADUser $user.Username -Organization $user.Organization
"Added Organization to: " + ($user) | Out-File $Logfile
}

#OfficePhone
if ($user.OfficePhone -ne $null)
{Set-ADUser $user.Username -OfficePhone $user.OfficePhone
"Added Office Phone Number to: " + ($user) | Out-File $Logfile
}

#PostalCode
if ($user.PostalCode -ne $null)
{Set-ADUser $user.Username -PostalCode $user.PostalCode
"Added Postal Code to: " + ($user) | Out-File $Logfile
}

#POBox
if ($user.POBox -ne $null)
{Set-ADUser $user.Username -POBox $user.POBox
"Added PO Box to: " + ($user) | Out-File $Logfile
}

#HomePhone
if ($user.HomePhone -ne $null)
{Set-ADUser $user.Username -HomePhone $user.HomePhone
"Added Home Phone Number to: " + ($user) | Out-File $Logfile
}

#Country
if ($user.Country -ne $null)
{Set-ADUser $user.Username -Country $user.Country
"Added Country to: " + ($user) | Out-File $Logfile
}

#JobTitle
if ($user.Title -ne $null)
{Set-ADUser $user.Username -Title $user.Title
"Added Title to: " + ($user) | Out-File $Logfile
}

#Initials
if ($user.Initials -ne $null)
{Set-ADUser $user.Username -Initials $user.Initials
"Added Initials to: " + ($user) | Out-File $Logfile
}

#Description, comment this out, but its a useful way to know when the import was successfully completed.
$descriptionstring = "Imported with Powershell:" + (Get-Date)
Set-ADUser $user.Username -Description $descriptionstring

}
