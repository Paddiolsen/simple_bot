*** Settings ***
Documentation   A simple bot
...     Open a browser 
...     Press accept to the Iframe 
...     Search for Nyxtech and 
...     Pick the first result 
Library         RPA.Browser

*** Variables ***
${url}=     https://www.google.dk

*** Keywords ***
Open Browser and insert text
        Open Available Browser   url=${url}  

*** keywords ***
Click button if visible
    Run Keyword And Ignore Error
    ...        Select iframe

*** keywords ***
Select iframe
    Select Frame    xpath=//*[@id="cnsw"]/iframe
    Click Element   xpath=//*[@id="introAgreeButton"]/span/span
    Unselect Frame

*** keywords ***
Type in search query
    Input Text  name=q  nyxtech
    Wait Until Element Is Visible  name=btnK
    Submit Form
    #Click Element  name=btnK

*** keywords ***
Get the first result
    Wait Until Element Is Visible  xpath=//*[@id="rso"]/div[1]/div/div[1]/a/h3/span
    Click Element   xpath=//*[@id="rso"]/div[1]/div/div[1]/a/h3/span

*** Tasks ***
Open browser and search on google for Nyxtech
    Open Browser and insert text
    Click button if visible
    Type in search query
    Get the first result
