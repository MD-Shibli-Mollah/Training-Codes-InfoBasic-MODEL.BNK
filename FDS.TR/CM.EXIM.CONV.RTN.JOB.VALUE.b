* @ValidationCode : Mjo5MDIxOTY5MTc6Q3AxMjUyOjE1ODA4OTQ5NjQ5NjA6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 05 Feb 2020 15:29:24
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
SUBROUTINE CM.EXIM.CONV.RTN.JOB.VALUE(Y.RETURN)
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
    $USING FT.Contract
    $USING AC.AccountOpening
    $USING ST.CompanyCreation
*-----------------------------------------------------------------------------
    GOSUB INIT
    GOSUB OPENFILES
*
    GOSUB PROCESS
RETURN
*-----
INIT:
*-----
    CALL LOAD.COMPANY('GB0010001')
*Y.FT.ID = EB.Reports.getOData()

    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
*
    FN.ACCT = 'F.ACCOUNT'
    F.ACCT = ''
*
    Y.COMM.AMT = ""
    Y.BLNK.LINE= " "
RETURN
*----------
OPENFILES:
*----------
    EB.DataAccess.Opf(FN.FT, F.FT)
    EB.DataAccess.Opf(FN.ACCT, F.ACCT)
RETURN
*---------
PROCESS:
*
*Y.FT.ID = 'FT1801802PTB'
    LOCATE "FT.ID" IN EB.Reports.getEnqSelection()<2,1> SETTING FT.POS THEN
        Y.FT.ID = EB.Reports.getEnqSelection()<4, FT.POS>
    END
*-----IF ID PASSES THEN--------------
    IF Y.FT.ID THEN
        SEL.CMD.AC = "SELECT ":FN.FT:" WITH @ID EQ ":Y.FT.ID
    END
*------GETTING ALL FT INFORMATION FROM SELECT COMMAND-----------------
    ELSE
        SEL.CMD.AC = "SELECT ":FN.FT:" WITH CO.CODE EQ " :EB.SystemTables.getIdCompany()
    END
    EB.DataAccess.Readlist(SEL.CMD.AC, SEL.LIST, "", NO.OF.RECORD, RET.CODE)
    LOOP
        REMOVE Y.ID FROM SEL.LIST SETTING POS
    WHILE Y.ID:POS
        EB.DataAccess.FRead(FN.FT, Y.ID, REC.FT.ID, F.FT, ERR.FT.ID)
        Y.DATE = REC.FT.ID<FT.Contract.FundsTransfer.DebitValueDate>
        Y.AMT = REC.FT.ID<FT.Contract.FundsTransfer.LocAmtCredited>
        Y.CR.ACC = REC.FT.ID<FT.Contract.FundsTransfer.CreditAcctNo>
        Y.DR.ACC = REC.FT.ID<FT.Contract.FundsTransfer.DebitAcctNo>
*
        EB.DataAccess.FRead(FN.ACCT, Y.CR.ACC, REC.ACCT, F.ACCT, ERROR.ACCT)
        Y.ACCT.NAME = REC.ACCT<AC.AccountOpening.Account.ShortTitle>
*
        EB.DataAccess.FRead(FN.ACCT, Y.DR.ACC, REC.ACCT, F.ACCT, ERROR.ACCT)
        Y.ACCT.DR.NAME = REC.ACCT<AC.AccountOpening.Account.ShortTitle>
    
        Y.DATE = ICONV(Y.DATE, 'D4')
        Y.DATE = OCONV(Y.DATE, 'D')
    
        Y.RETURN<-1> = Y.DATE:"*":Y.AMT:"*":Y.CR.ACC:"*":Y.ACCT.NAME:"*":Y.DR.ACC:"*":Y.ACCT.DR.NAME:"*":Y.ID
    REPEAT
RETURN
END