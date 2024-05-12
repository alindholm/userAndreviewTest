*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../Resource/ConnectToDatabase.robot

*** Variables ***
${username}    Test_User
${password}    Test_Password
${email}       Test_user@example.com
${is_admin}    False

*** Test Cases ***
Add User Test
    [Tags]  Add
    Connect To Movehel
    Execute SQL String    INSERT INTO "appUser" (usr_username, usr_passwrd, usr_email, is_admin) VALUES ('${username}', '${password}', '${email}', ${is_admin})
    @{result}    Query    SELECT * FROM "appUser"
    Log Many    ${result}
    Disconnect From Movehel
