*** Settings ***

Library    SeleniumLibrary
Library    ../Python/checkData.py
Library    ../Python/tools.py
Library    ../Python/logs.py    
Library    Collections
Resource   ../Scripts/verifPokemon.robot


*** Variables ***

${URLStart}      https://www.pokepedia.fr/Bulbizarre

*** Keywords ***

J'ouvre le site Poképedia sur Firefox
    Open Browser    ${URLStart}    Firefox
    Make Logs
    

Je récupère le nom du Pokemon en cours
    Wait Until Page Contains Element    xpath: /html/body/div[2]/div/div[3]/main/header/h1/span
    ${nomEnCours} =    Get Text    xpath: /html/body/div[2]/div/div[3]/main/header/h1/span

Je vérifie toutes les informations avec le JSON existant
    # Récupération des différentes données des Pokemons présents sur le site
    TRY
    ${idInSite}=               Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[1]/tbody/tr[2]/td[2]
    ${idInSite}=               Convert To Integer    ${idInSite}
    ${generationInSite}=       Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[5]/tbody/tr/td[2]/a
    ${generationInSite}=       Convert To Integer    ${generationInSite}
    ${nameFrInSite}=           Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/thead/tr/th[2]
    ${heightInSite}=           Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/tbody/tr[10]/td
    ${heightInSite}=           Extract Weight    ${heightInSite}
    ${weightInSite}=           Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/tbody/tr[11]/td
    ${weightInSite}=           Extract Weight    ${weightInSite}
    ${catchRateInSite}=        Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/tbody/tr[20]/td
    ${catchRateInSite}=        Convert To Integer    ${catchRateInSite}
    ${toLevel100InSite}=       Get Text    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/tbody/tr[17]/td
    ${toLevel100InSite}=       Extract Level 100    ${toLevel100InSite}


    # Récupération des données du Pokemon
    ${allPokemons}=    Get All Pokemon Data
    ${thePokemon}=    Get Specific Pokemon    ${idInSite}    ${allPokemons}
    ${idOfPokemon}=    Get From Dictionary    ${thePokemon}    pokedex_id

    # Vérification des données
    ${finalResult}     Set Variable    ${True}
    ${result}=    Verify ID    ${idInSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${idInSite}    level=WARN    console=${True}
        Write In Logs    [WARN] L'id (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    ${result}=    Verify Generation    ${generationInSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${generationInSite}    level=WARN    console=${True}
        Write In Logs    [WARN] La génération (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    ${result}=    Verify Name    ${nameFrInSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${nameFrInSite}    level=WARN    console=${True}
        Write In Logs    [WARN] Le nom français (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    ${result}=    Verify Height    ${heightInSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${heightInSite}    level=WARN    console=${True}
        Write In Logs    [WARN] Le poids (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    ${result}=    Verify Weight    ${weightInSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${weightInSite}    level=WARN    console=${True}
        Write In Logs    [WARN] La taille (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    ${result}=    Verify Catch Rate    ${catchRateInSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${catchRateInSite}    level=WARN    console=${True}
        Write In Logs    [WARN] Le catch rate (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    ${result}=    Verify Exp To 100   ${toLevel100InSite}    ${thePokemon}
    IF     ${result} == ${False}
        ${finalResult}    Set Variable    ${False}
        Log    message=${toLevel100InSite}    level=WARN    console=${True}
        Write In Logs    [WARN] L'exp jusqu'au niveau 100 (Pokemon numéro : ${idOfPokemon}) du Pokemon ne correspond pas avec celui du site
    END
    IF  ${finalResult} == ${True}
        Log    message=Le pokemon ${nameFrInSite} a l'air correct !    console=${True}    level=INFO
        Write In Logs    [COMPLETE] Pokemon numéro : ${idOfPokemon}
    ELSE
        Log    message=Le pokemon ${nameFrInSite} a un petit souci... Mais quoi, à toi de me dire parce que j'ai la flemme !    console=${True}    level=WARN
        Write In Logs    [ERROR] Pokemon numéro : ${idOfPokemon} a obtenu une ou plusieurs erreurs (voir plus haut)
    END
    EXCEPT
        Log    Erreur pour le Pokemon (ID: ${idInSite}) en cours, on passe!    console=${True}
        Write In Logs    Il y a eu des erreurs pour le Pokémon numéro ${idInSite} de sorte à ce qu'il n'a même pas pu être testé !
    END

Je passe au Pokémon suivant
    Page Should Contain Element    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[1]/tbody/tr[1]/td[9]/a
    Click Element    xpath: /html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[1]/tbody/tr[1]/td[9]/a