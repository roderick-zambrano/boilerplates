# Scripts

## PowerShell

- Remove-BluetoothDevice
  - Input Type:
    - DeviceName: string
  - Output Type: None
  - Admin: Required
  - Description:
    Parameterized function that takes a string (wildcards accepted) and unlists matches from the "Other devices" section of the "Bluetooth & other devices" Settings page. Sometimes some unused but discovered devices end up with duplicate entries, without frequent monitoring this list can increase steadily. By using the specific name of the duplicate device as an argument, all matching entries can be removed in a single action.
- Set-PreferredKeyboardLayouts
  - Input Type:
    - MainLayout: string
    - AdditionalLayouts: array
  - Output Type: None
  - Description: 
    Parameterized function (with default "en-US" input locale) to overwrite Current User Keyboard Layouts. Accepted parameters are all Microsoft accepted input profiles (input locales), "en-US" as a default and a reference. At time of creation does not work with PowerShell versions above 5.x.

