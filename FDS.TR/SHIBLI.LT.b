* @ValidationCode : MjotMTcwMTQyNjc3MjpDcDEyNTI6MTU3NTM1Mzk2NzA0Njp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 03 Dec 2019 12:19:27
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : MD SHIBLI MOLLAH
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0
* @AUTHOR         : MD SHIBLI MOLLAH
PROGRAM SHIBLI.LT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.Foundation
    $USING EB.DataAccess
    $USING TT.Contract
*-----------------------------------------------------------------------------
    GOSUB INITIALISE;
    GOSUB PROCESS;
RETURN
INITIALISE:
    Y.LR.APPL = 'AA.PRD.DES.SETTLEMENT'
    Y.LR.FLD = 'CHKG.ACCOUNT':VM:'IS.PAYOUT'
    Y.LR.POS = ''
RETURN

PROCESS:
    EB.Foundation.MapLocalFields(Y.LR.APPL, Y.LR.FLD, Y.LR.POS)
    PRINT "LOCAL REFERENCE POSITION OF CHKG.ACCOUNT IS ":Y.LR.POS<1,1>
    PRINT "LOCAL REFERNCE POSITION OF IS.PAYOUT IS ":Y.LR.POS<1,2>
RETURN
END
END
