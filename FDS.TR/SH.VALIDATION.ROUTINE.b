* @ValidationCode : MjoxNDk3NDYyNDU1OkNwMTI1MjoxNTc1Nzk4NDg1NzE0OnVzZXI6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzEwLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 08 Dec 2019 15:48:05
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

SUBROUTINE SH.VALIDATION.ROUTINE
    
    $USING EB.SystemTables
    $USING EB.DataAccess
    $USING EB.ErrorProcessing
    $USING FT.Contract
    $USING AC.AccountOpening
    
    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
    Y.DR.AMT = EB.SystemTables.getComi();
    Y.DR.ACC = EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitAcctNo)
    
    EB.DataAccess.Opf(FN.ACCOUNT, F.ACCOUNT)
    EB.DataAccess.FRead(FN.ACCOUNT,Y.DR.ACC,R.ACC,F.ACCOUNT,Y.ERR)
    
    IF Y.DR.AMT GT R.ACC<AC.AccountOpening.Account.WorkingBalance> THEN
        EB.SystemTables.setEtext('DEBIT ACCOUNT IS NOT HAVING ENOUGH BALANCE')
        EB.ErrorProcessing.StoreEndError()
    END
RETURN
END