*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../Resource/ConnectToDatabase.robot

*** Variables ***

*** Keywords ***
Update Review
    [Arguments]   ${id}     ${rating}   ${text}
    Connect To Movehel
    ${review_found}=    Query    SELECT * FROM review WHERE id_review='${id}'
    Run Keyword If    not ${review_found}    Fail    Failed to delete review with id ${id}
    Execute SQL String    UPDATE review SET rating='${rating}', "reviewText"='${text}' WHERE id_review = '${id}';
    @{result}    Query    SELECT * FROM review WHERE id_review = '${id}'
    Log Many    ${result}
    Disconnect From Movehel
*** Test Cases ***
Update Review Test
    [Tags]  Update
    Update Review  1     3    ihan ok!

