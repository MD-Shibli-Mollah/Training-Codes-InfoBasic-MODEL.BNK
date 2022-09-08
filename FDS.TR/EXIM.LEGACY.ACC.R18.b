* @ValidationCode : Mjo0MDgyNzkyMDpDcDEyNTI6MTU4MDEwNjk5NDQxNjp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 27 Jan 2020 12:36:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : user
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0
*SUBROUTINE EXIM.LEGACY.ACC.R18
PROGRAM EXIM.LEGACY.ACC.R18
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.SystemTables
    $USING EB.DataAccess
    $USING EB.Reports
    
    $USING AC.AccountOpening
    $USING EB.Updates
    $USING AA.Account
   
*
*
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN

INIT:
*-----
    CALL LOAD.COMPANY('GB0010001')
    FN.ALT.ACCT = 'F.ALTERNATE.ACCOUNT'
    F.ALT.ACCT = ''
 
RETURN
*_________________DONE INITIALIZATION_________________

*_________________OPENING FILES___________________
OPENFILES:
    EB.DataAccess.Opf(FN.ALT.ACCT, F.ALT.ACCT)
RETURN

*_______________PROCESSING IS STARTED FROM HERE_____
PROCESS:
*
    LEGACY.ID = "123456"
    EB.DataAccess.FRead(FN.ALT.ACCT,LEGACY.ID, REC.ALT.ACCT, F.ALT.ACCT, ERR.ALT.ACCT.ID)
    EXIM.R18.ACCT.ID = REC.ALT.ACCT<AC.AccountOpening.AlternateAccount.AacGlobusAcctNumber>
    PRINT EXIM.R18.ACCT.ID
RETURN