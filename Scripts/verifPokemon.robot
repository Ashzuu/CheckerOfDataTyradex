*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/resource.resource


*** Test Cases ***

J'effectue mes différents tests sur tous les Pokemons
    J'ouvre le site Poképedia sur Firefox
    ${exists}     Set Variable    ${True}
    WHILE   ${exists} == ${True}    
        Je récupère le nom du Pokemon en cours
        Je vérifie toutes les informations avec le JSON existant
        ${elementExists}=    Run Keyword And Return Status    Page Should Contain Element    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[1]/tbody/tr[1]/td[9]/a
        IF     ${elementExists} == ${True}
            Je passe au Pokémon suivant
            ${exists}     Set Variable    ${True}
        ELSE
            ${exists}     Set Variable    ${False}
        END
    END