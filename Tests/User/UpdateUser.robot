*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../Resource/ConnectToDatabase.robot

*** Variables ***

*** Keywords ***
Update Password
    [Arguments]   ${id}     ${password}
    Connect To Movehel
    ${user_found}=    Query    SELECT * FROM "appUser" WHERE id_user='${id}'
    Run Keyword If    not ${user_found}    Fail    Failed to delete user with id ${id}
    Execute SQL String    UPDATE "appUser" SET usr_passwrd = '${password}' WHERE id_user = '${id}';
    @{result}    Query    SELECT * FROM "appUser" WHERE id_user = '${id}'
    Log Many    ${result}
    Disconnect From Movehel
*** Test Cases ***
Update User Test
    [Tags]  Update
    Update Password  3     salasana

