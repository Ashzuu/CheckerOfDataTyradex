from datetime import datetime

def MakeLogs():
    with open(r"Logs/logs.txt","a", encoding="utf-8") as file:
        file.write(f"Lancement de l'analyse à {datetime.now().strftime(("%d/%m/%Y à %H:%M:%S"))}\n")
        file.close()
def WriteInLogs(message:str):
    with open(r"logs.txt","a", encoding="utf-8") as file:
        file.write(message + "\n")
        file.close()