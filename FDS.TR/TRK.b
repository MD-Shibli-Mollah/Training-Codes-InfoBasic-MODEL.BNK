* @ValidationCode : Mjo3MDQyOTMwNDI6Q3AxMjUyOjE1ODAxMDYyNDgyOTA6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 27 Jan 2020 12:24:08
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : user
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0
PROGRAM TRK
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.DataAccess
    $USING EB.Reports
    $USING AC.AccountOpening
    $USING EB.SystemTables
    $USING AA.Account
    $USING ST.CompanyCreation
*-----------------------------------------------------------------------------
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    
RETURN

****
INIT:
****
    ST.CompanyCreation.LoadCompany("BNK")
    FN.ALT.ACCT = 'FBNK.ALTERNATE.ACCOUNT'
    F.ALT.ACCT = ''
RETURN

*********
OPENFILES:
**********
    EB.DataAccess.Opf(FN.ALT.ACCT,F.ALT.ACCT)

RETURN
   
********
PROCESS:
********
    LAGACY.ID = '123456'
    EB.DataAccess.FRead(FN.ALT.ACCT,LAGACY.ID,R.ALT.ACCT,F.ALT.ACCT,ALT.ACCT.ERR)
    R18.ALT.ACC.ID = R.ALT.ACCT<AC.AccountOpening.AlternateAccount.AacGlobusAcctNumber>

    PRINT R18.ALT.ACC.ID

END
