@echo off

:MENU
cls
mode con lines=35
echo DATA:
date /t
echo.
echo ORA:
time /t
echo.

echo                                                       COMANDI DI RETE

echo.

echo 1)HOSTNAME
echo 2)WHOAMI
echo 3)PING 
echo 4)TRACERT
echo 5)IPCONFIG
echo 6)ARP
echo 7)NETSTAT
echo 8)NSLOOKUP
echo 9)NETSH
echo 10)NET
echo 11)ROUTE
echo 12)SSH
echo 13)TELNET
echo 14)FTP
echo 15)GPRESULT
echo 16)GPUPDATE
echo 17)START
echo 18)CMD
echo 19)SCP (comando di backup su server remoto tramite ssh)
echo 20)NMAP (scansione di rete, viene eseguito solo se e' installato il programma e esegui lo script da amministratore)
echo.
echo digita exit per uscire
echo.

set /p comando=inserisci numero del comando da eseguire:

if %comando% == 1 goto HOSTNAME
if %comando% == 2 goto WHOAMI
if %comando% == 3 goto PING
if %comando% == 4 goto TRACERT
if %comando% == 5 goto IPCONFIG
if %comando% == 6 goto ARP
if %comando% == 7 goto NETSTAT
if %comando% == 8 goto NSLOOKUP
if %comando% == 9 goto NETSH
if %comando% == 10 goto NET
if %comando% == 11 goto ROUTE
if %comando% == 12 goto SSH
if %comando% == 13 goto TELNET
if %comando% == 14 goto FTP
if %comando% == 15 goto GPRESULT
if %comando% == 16 goto GPUPDATE
if %comando% == 17 goto START
if %comando% == 18 goto CMD
if %comando% == 19 goto SCP
if %comando% == 20 goto NMAP
if %comando% == exit goto EXIT

pause

:HOSTNAME
cls
echo Visualizza il nome dell'host corrente.
echo.
hostname
pause
goto MENU

:WHOAMI
cls
echo Visualizza il nome utente
echo.
whoami
pause
goto MENU

:PING
cls
set /p "ping=inserisci indirizzo ip: "
ping %ping% 
pause
goto MENU

:TRACERT
cls
set /p "tracert=inserisci indirizzo ip o nome dns: "
tracert %tracert%
pause
goto MENU

:IPCONFIG
cls
ipconfig /all
pause
goto MENU

:ARP
cls
arp -a
pause
goto MENU

:NETSTAT
cls
netstat -ano
pause
goto MENU

:NSLOOKUP
cls
nslookup
pause
goto MENU

:NETSH
cls
netsh
pause
goto MENU

:NET
cls
net user
pause
goto MENU

:ROUTE
cls
route print
pause
goto MENU

:SSH
cls
set /p "user=inserisci utente:"
set /p "ip=inserisci indirizzo ip:"
ssh %user%@%ip%
goto MENU

:TELNET 
cls
set /p "ip=inserisci indirizzo ip:"
set /p "porta=inserisci porta:"
telnet %ip% %porta%
goto MENU

:FTP
cls
set /p "ip=inserisci ip o nome dns:"
ftp %ip%
goto MENU

:GPRESULT
cls
gpresult
pause
goto MENU

:GPUPDATE
cls
gpupdate
pause
goto MENU

:START
cls
set /p "start=avvia un programma:"
pause
goto MENU

:CMD
cls
start cmd.exe
goto MENU

:SCP
cls
echo esempio di percorso da copiare: C:\Users\utente\Desktop\cartella\
echo esempio di percorso di destinazione windows : utente@ip:/C:\Users\utente\Desktop\
echo esempio di percorso di destinazione linux : utente@ip:/home/utente/
echo.
echo.
set /p "source=inserisci percorso da copiare:"
set /p "dest=inserisci il percorso della destinazione dove copiare:"

scp -r %source% %dest%
pause
goto MENU

:NMAP
cls
cd /
cd Program Files (x86)
cd Nmap
echo salva la scansione in un file di testo in Program Files (x86) nella cartella di installazione di NMAP
echo.
set /p "nmap=inserisci range indirizzo ip: "
nmap -T4 -A -v %nmap% >> nmapscan.txt
pause
goto MENU

:EXIT
cls
exit