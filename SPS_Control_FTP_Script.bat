@Echo Off
setlocal ENABLEEXTENSIONS
Setlocal Enabledelayedexpansion

@echo %DATE% > log.txt

REM -- Server: com
REM -- Address: 
REM -- Non-Authoritive answer: 

REM -- Batch File creates/deletes 2 Temporary Scripts to Download/Delete Files --
REM -- Off of the SPS FTP Server for PO_Receipts --



REM -- Download all XML Files from FTP Site for SPS_PO Reciepts
@echo open > SPS_PO_GET.txt
@echo username >>  SPS_PO_GET.txt
@echo password >> SPS_PO_GET.txt
@echo !Title Processing... %FtpCommand% >> SPS_PO_DELETE.txt
REM -- REPLACE THIS WITH LOCAL DIRECTORY FOR PO_RECEIPTS! --
@echo lcd C:/Users/rmendez/Documents/SPS_PO >> SPS_PO_GET.txt
@echo cd  out/ >>  SPS_PO_GET.txt
@echo mget *xml >>  SPS_PO_GET.txt
@echo !Title Disconnecting... >> SPS_PO_DELETE.txt
@echo close >>  SPS_PO_GET.txt
@echo bye >> SPS_PO_GET.txt

REM -- Execute Ftp Script, Download files
ftp -i -s:SPS_PO_GET.txt
GOTO:EOF

del SPS_PO_GET.txt

REM -- Delete all XML Files from FTP Site for SPS_PO Reciepts to avoid Duplications
@echo open > SPS_PO_DELETE.txt
@echo username >>  SPS_PO_DELETE.txt
@echo password >> SPS_PO_DELETE.txt
@echo !Title Processing... %FtpCommand% >> SPS_PO_DELETE.txt
REM -- REPLACE THIS WITH LOCAL DIRECTORY FOR PO_RECEIPTS! --
@echo lcd C:/Users/rmendez/Documents/SPS_PO >> SPS_PO_DELETE.txtt
@echo cd  out/ >>  SPS_PO_DELETE.txt
@echo rm test.txt >>  SPS_PO_DELETE.txt
@echo close >>  SPS_PO_DELETE.txt
@echo !Title Disconnecting... >> SPS_PO_DELETE.txt
@echo bye >> SPS_PO_DELETE.txt

REM -- Execute Ftp Script, Delete files on FTP
ftp -i -s:SPS_PO_DELETE.txt
GOTO:EOF

del SPS_PO_DELETE.txt

@echo
@echo SCRIPT COMPLETED END NOW
