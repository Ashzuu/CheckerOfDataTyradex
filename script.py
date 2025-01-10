import selenium
import selenium.webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.remote.webelement import WebElement

driver = selenium.webdriver.Firefox()
# oui ça me soulé Robot Framework j'ai tous refait mdr



driver.get("https://www.pokepedia.fr/Bulbizarre")

# Attention, ici on ne traite rien, on récupère juste les données



def getDataInSite(xpath:str)->WebElement:
    
    return driver.find_element(By.XPATH, xpath)



id = getDataInSite("//span[@title='Numérotation nationale']")
generation = getDataInSite("//table[@data-section='Descriptions']/tbody/tr/td[2]/a")
category = getDataInSite("//table[contains(@class,'ficheinfo')]/tbody//a[text()='Catégorie']/..")
nameFr = getDataInSite("//table[contains(@class,'ficheinfo')]/thead/tr/th[2]")
nameEn = getDataInSite("//th[text()='Nom anglais']/../td")
nameJap = getDataInSite("")
types = getDataInSite("")
stats = getDataInSite("")
resistances = getDataInSite("")
evolutions = getDataInSite("")
height =getDataInSite("")
weight = getDataInSite("")
eggGroups = getDataInSite("")
sexe = getDataInSite("")
catchRate = getDataInSite("")
toLevel100 = getDataInSite("")

print(id.text)

driver.close()
