* @ValidationCode : MjotMTQ2NjA4NTY1NTpDcDEyNTI6MTU3NTc0NTY1OTU3Njp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 08 Dec 2019 01:07:39
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
SUBROUTINE VER.INP.ROUTINE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.SystemTables
    $USING EB.ErrorProcessing
    $USING FT.Contract
*-----------------------------------------------------------------------------
    
    Y.DEBIT.AMT= EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitAmount)
    IF Y.DEBIT.AMT LE 100 THEN
        EB.SystemTables.setAf(FT.Contract.FundsTransfer.DebitAmount)
        EB.SystemTables.setEtext('Debit amount must be grater then 100')
        EB.ErrorProcessing.StoreEndError()
    END
RETURN
END
END
