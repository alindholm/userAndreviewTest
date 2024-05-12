*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Resource   ../../Resource/ConnectToDatabase.robot

*** Variables ***
${name}    Kalliosaari (Uudenmaan virkistysalueyhdistys)
${text}    Hyvä paikka, viihdyin hyvin!
${id}       5

*** Test Cases ***
Add User Test
    [Tags]  Add
    Connect To Movehel
    Execute SQL String  INSERT INTO review ("id_sportsPlace", "name_sportsPlace", rating, "reviewText", created_at, id_user)VALUES (72361, '${name}', 4, '${text}', CURRENT_TIMESTAMP, ${id})
    @{result}    Query    SELECT * FROM rteamseview
    Log Many    ${result}
    Disconnect From Movehel
