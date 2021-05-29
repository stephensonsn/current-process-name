/* ====================================================================
   file      current-process-name-2.p
   by        Oliveira Stephenson, 2021
             stephenson.silva@outlook.com
   ==================================================================== */
DEFINE VARIABLE hModule   AS INTEGER   NO-UNDO.
DEFINE VARIABLE cFileName AS CHARACTER NO-UNDO.
DEFINE VARIABLE RetVal    AS INTEGER   NO-UNDO.
 
ASSIGN hModule   = 0
       cFileName = FILL(" ",256).
 
RUN GetModuleFileNameA( INPUT  hModule, 
                        OUTPUT cFileName, 
                        INPUT 256, 
                        OUTPUT RetVal).
                        
ASSIGN cFileName = SUBSTRING(cFileName, R-INDEX(cFileName,"\") + 1 ).
 
MESSAGE cFileName  
   VIEW-AS ALERT-BOX.   

PROCEDURE GetModuleFileNameA EXTERNAL "kernel32.dll":
  DEFINE INPUT  PARAMETER hModule    AS LONG.
  DEFINE OUTPUT PARAMETER lpFilename AS CHARACTER.
  DEFINE INPUT  PARAMETER nSize      AS LONG.
  DEFINE RETURN PARAMETER ReturnSize AS LONG.
END PROCEDURE.

