call mvn clean package -o -Pbuild-paytables
call copy /y target\dbgames\demo\datafiles\*-0-Ghst.xsl src\paytables\demo
call copy /y target\dbgames\demo\datafiles\*-0-Ghst.xsl D:\research\GHST_Tools\xsltoolstandalone
call pause