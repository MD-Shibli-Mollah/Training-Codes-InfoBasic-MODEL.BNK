* @ValidationCode : MjotODg3MDk1MTk6Q3AxMjUyOjE1Nzk0MjQ4NjI1MTk6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Jan 2020 15:07:42
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
SUBROUTINE GB.EXIM.ACC.CUS(Y.RETURN)
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_AA.LOCAL.COMMON
    $INSERT I_ENQUIRY.COMMON
    $USING EB.SystemTables
*
    $USING EB.DataAccess
    $USING EB.Reports
    $USING EB.Updates
    $USING AC.AccountOpening
    $USING ST.CompanyCreation
    $USING ST.Customer
*-----------------------------------------------------------------------------
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN
*-----
INIT:
*-----
    CALL LOAD.COMPANY('GB0010001')
    FN.ACCT = 'F.ACCOUNT'
    F.ACCT = ''
RETURN
*----------
OPENFILES:
*----------
    EB.DataAccess.Opf(FN.ACCT, F.ACCT)
RETURN
*---------
PROCESS:
    LOCATE "CUSTOMER" IN EB.Reports.getEnqSelection()<2,1> SETTING CUSTOMER.POS THEN
        Y.CUSTOMER = EB.Reports.getEnqSelection()<4,CUSTOMER.POS>
    END
    LOCATE "ACCOUNT.NUMBER" IN EB.Reports.getEnqSelection()<2,1> SETTING ACCOUNT.NUMBER.POS THEN
        Y.ACCOUNT.NUMBER = EB.Reports.getEnqSelection()<4,ACCOUNT.NUMBER.POS>
    END
*  Y.CUSTOMER = "111659"
*    Y.ACCOUNT.NUMBER = "74268"

*------GETTING ALL FT INFORMATION FROM SELECT COMMAND-----------------
*
    SEL.CMD.AC = "SELECT ":FN.ACCT:" WITH CO.CODE EQ " :EB.SystemTables.getIdCompany()

*-----IF ID PASSES THEN--------------
    IF (Y.ACCOUNT.NUMBER) THEN
        SEL.CMD.AC :=" AND @ID EQ ":Y.ACCOUNT.NUMBER
    END
*----------- A ":" CAN RUIN YOUR LIFE - SHIBLI --------------------
    IF (Y.CUSTOMER) THEN
        SEL.CMD.AC :=" AND CUSTOMER EQ ":Y.CUSTOMER: " WITH @ID EQ ":Y.CUSTOMER
    END

    EB.DataAccess.Readlist(SEL.CMD.AC, SEL.LIST, "", NO.OF.RECORD, RET.CODE)
    LOOP
        REMOVE Y.ID FROM SEL.LIST SETTING POS
    WHILE Y.ID:POS
        EB.DataAccess.FRead(FN.ACCT,Y.ID,R.AC.REC,F.ACCT,Y.ERR)
        Y.CUS.ID = R.AC.REC<AC.AccountOpening.Account.Customer>
        Y.WORKING.BAL = R.AC.REC<AC.AccountOpening.Account.WorkingBalance>
*
        Y.RETURN<-1> = Y.CUS.ID:"*":Y.ID:"*":Y.WORKING.BAL
    REPEAT
    Y.RETURN = SORT(Y.RETURN)
*
RETURN
END