* @ValidationCode : MjoxOTM3OTkyMTUyOkNwMTI1MjoxNTgyNTI3MjcxNzg4OnVzZXI6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzEwLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 24 Feb 2020 12:54:31
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : user
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0
PROGRAM HIS.ACC


    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.DataAccess
    $USING AC.AccountOpening
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports
    $USING ST.CompanyCreation
    
    ST.CompanyCreation.LoadCompany("BNK")
    
    Y.ACC.ID='85747'
    
    FN.ACC='FBNK.ACCOUNT'
    F.ACC=''
    FN.ACC.HIS='FBNK.ACCOUNT$HIS'
    F.ACC.HIS=''
    EB.DataAccess.Opf(FN.ACC, F.ACC)
    EB.DataAccess.Opf(FN.ACC.HIS, F.ACC.HIS)
    EB.DataAccess.FRead(FN.ACC, Y.ACC.ID, R.LIVE, F.ACC, ERR.EEE)
    EB.DataAccess.ReadHistoryRec(F.ACC.HIS, Y.ACC.ID, R.HIS, Y.ERR)
    
    SEL.CMD = "SELECT ":FN.ACC:" WITH CO.CODE EQ ":EB.SystemTables.getIdCompany()
    
    IF (Y.ACC.ID) THEN
        SEL.CMD := " AND @ID EQ ":Y.ACC.ID
    
        EB.DataAccess.Readlist(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)
    END
    PRINT "SELECT LIST OF ACCOUNT: " : SEL.CMD
    PRINT "LIVE FILE":R.LIVE
    PRINT "HISTORY DOC"
    PRINT "HIS FILE":R.HIS
        
    LANG  = EB.SystemTables.getToday()
    PRINT
    DAYS = 'SAT':FM:'OD'
    
    DC = COUNT(DAYS,FM) + 1
    DC1 = DCOUNT(DAYS,FM)
    PRINT DC
    PRINT "DCOUNT IS :":DC1
    LOCATE "THU" IN DAYS SETTING FOUND ELSE FOUND = 0

    MYARRAY ='5':VM:'GEORGE':VM:'FRED':VM:'2':VM:'JOHN':VM:'ANDY'
    
    CRT SORT (MYARRAY)
        
END

