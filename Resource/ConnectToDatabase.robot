*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

*** Variables ***
${DBHOST}         localhost
${DBNAME}         movehel
${DBUSER}         postgres
${DBPASS}     password
${DBPORT}         5432


*** Keywords ***
Connect To Movehel
        Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}

Disconnect From Movehel
        Disconnect From Database