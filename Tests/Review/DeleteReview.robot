*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../Resource/ConnectToDatabase.robot


*** Keywords ***
Delete Review
    [Arguments]    ${id}
    Connect To Movehel
    ${review_found}=    Query    SELECT * FROM review WHERE id_review='${id}'
    ${delete_result}=    Execute SQL String    DELETE FROM review WHERE id_review='${id}'
    Run Keyword If    not ${review_found}    Fail    Failed to delete review with id ${id}
    ...    ELSE    Log    Review with id ${id} deleted successfully
    Disconnect From Movehel
*** Test Cases ***
Delete Review Test
    [Tags]  Delete
    Delete Review  1

