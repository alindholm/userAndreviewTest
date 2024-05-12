*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../Resource/ConnectToDatabase.robot


*** Keywords ***
Delete User
    [Arguments]    ${id}
    Connect To Movehel
     ${user_found}=    Query    SELECT * FROM "appUser" WHERE id_user='${id}'
    ${delete_result}=    Execute SQL String    DELETE FROM "appUser" WHERE id_user='${id}'
    Run Keyword If    not ${user_found}    Fail    Failed to delete user with id ${id}
    ...    ELSE    Log    User with id ${id} deleted successfully
    Disconnect From Movehel

*** Test Cases ***
Delete User Test
    [Tags]  Delete
    Delete User  3

