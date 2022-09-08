* @ValidationCode : Mjo5MDk4Njg2MDM6Q3AxMjUyOjE1NzU1Mzc0MjQ0NDE6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 05 Dec 2019 15:17:04
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : user
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0
* @AUTHOR         : MD SHIBLI MOLLAH
SUBROUTINE MB.ENQ.CUS.ACCT.NOFILE(Y.RETURN)

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.SystemTables
    $USING AC.AccountOpening
    $USING ST.Customer
    $USING ST.CompanyCreation
    $USING EB.Reports
    $USING EB.DataAccess
*-----------------------------------------------------------------------------
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN

INIT:
    FN.AC = 'FBNK.ACCOUNT'
    F.AC = ''
    
    LOCATE "CUSTOMER" IN EB.Reports.getEnqSelection()<2,1> SETTING CUSTOMER.POS THEN
        Y.CUSTOMER = EB.Reports.getEnqSelection()<4,CUSTOMER.POS>
    END
    LOCATE "ACCOUNT.NUMBER" IN EB.Reports.getEnqSelection()<2,1> SETTING ACCOUNT.NUMBER.POS THEN
        Y.ACCOUNT.NUMBER = EB.Reports.getEnqSelection()<4,ACCOUNT.NUMBER.POS>
    END
    LOCATE "CATEGORY" IN EB.Reports.getEnqSelection()<2,1> SETTING CATEGORY.POS THEN
        Y.CATEGORY = EB.Reports.getEnqSelection()<4,CATEGORY.POS>
    END

RETURN
OPENFILES:
    EB.DataAccess.Opf(FN.AC, F.AC)
RETURN
PROCESS:
    SEL.CMD.AC = "SELECT ":FN.AC:" WITH CO.CODE EQ " :EB.SystemTables.getIdCompany()
    IF (Y.CUSTOMER) THEN
        SEL.CMD.AC := " AND CUSTOMER EQ ":Y.CUSTOMER
    END
    IF (Y.ACCOUNT.NUMBER) THEN
        SEL.CMD.AC := " AND @ID EQ ":Y.ACCOUNT.NUMBER
    END
    IF (Y.CATEGORY) THEN
        SEL.CMD.AC := " AND CATEGORY EQ ":Y.CATEGORY
    END
    EB.DataAccess.Readlist(SEL.CMD.AC,SEL.LIST,"",NO.OF.RECORD,RET.CODE)
    LOOP
        REMOVE Y.ID FROM SEL.LIST SETTING POS
    WHILE Y.ID:POS
        EB.DataAccess.FRead(FN.AC,Y.ID,R.AC.REC,F.AC,Y.ERR)
        Y.CUS.ID = R.AC.REC<AC.AccountOpening.Account.Customer>
        Y.WORKING.BAL = R.AC.REC<AC.AccountOpening.Account.WorkingBalance>

        IF Y.WORKING.BAL GT 0 THEN
            Y.RETURN<-1> = Y.CUS.ID:"*":Y.ID:"*":Y.WORKING.BAL
        END
    REPEAT
    Y.RETURN = SORT(Y.RETURN)
RETURN
END
