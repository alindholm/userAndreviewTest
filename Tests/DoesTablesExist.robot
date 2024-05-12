*** Settings ***
Library    OperatingSystem
Library    DatabaseLibrary
Resource   ../Resource/ConnectToDatabase.robot

*** Variables ***
${username}    test_user
${password}    test_password
${email}       test@example.com
${is_admin}    False
*** Keywords ***
Check Table Exists
    [Arguments]    ${table_name}
    ${query_result} =    Query    SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = '${table_name}')
    Log    ${query_result}
    ${exists} =  Set Variable If   ${query_result[0][0]} == True    True    False
    Should Be True    ${exists}
*** Test Cases ***
Log Database Contents
    [Documentation]    Fetches and logs names of all tables in the public schema.
    Connect To Movehel
    Check Table Exists    appUser
    Check Table Exists    review
    Disconnect From Movehel