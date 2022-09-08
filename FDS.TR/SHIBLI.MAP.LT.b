* @ValidationCode : Mjo4MDYxMjQyNTY6Q3AxMjUyOjE1NzUzNTQ5NDc3MDA6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 03 Dec 2019 12:35:47
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
PROGRAM SHIBLI.MAP.LT
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.Updates
    $USING ST.Customer
    $USING LC.Contract
    $USING AC.AccountOpening
*-----------------------------------------------------------------------------
    GOSUB INITIALISE;
    GOSUB PROCESS;
    
RETURN

INITIALISE:
    Y.LR.APPL = 'CUSTOMER':FM:'ACCOUNT':FM:'COLLATERAL'
    Y.LR.FIELD = 'CU.EFF.DATE':VM:'SEGMENT':VM:'CREDITOR.ID':FM:'ALLOW.SEPA.TXN':VM:'WELCOME.PACK':FM:'MANUFACTURER':VM:'CHASSIS.NUMBER':VM:'ENGINE.NUMBER'
    Y.LR.POS = ''
RETURN
*
PROCESS:
    EB.Updates.MultiGetLocRef(Y.LR.APPL, Y.LR.FIELD, Y.LR.POS)
    PRINT "LOCAL REFERENCE POSITION OF CU.EFF.DATE IN CUSTOMER IS ":Y.LR.POS<1,1>
    PRINT "LOCAL REFERENCE POSITION OF SEGMENT IN CUSTOMER IS ":Y.LR.POS<1,2>
    PRINT "LOCAL REFERENCE POSITION OF CREDITOR.ID IN CUSTOMER IS ":Y.LR.POS<1,3>
    PRINT "LOCAL REFERENCE POSITION OF ALLOW.SEPA.TXN IN ACCOUNT IS ":Y.LR.POS<2,1>
    PRINT "LOCAL REFERENCE POSITION OF WELCOME.PACK IN ACCOUNT IS ":Y.LR.POS<2,2>
    PRINT "LOCAL REFERENCE POSITION OF MANUFACTURER  IN COLLATERAL IS ":Y.LR.POS<3,1>
    PRINT "LOCAL REFERENCE POSITION OF CHASSIS.NUMBER  IN COLLATERAL IS ":Y.LR.POS<3,2>
    PRINT "LOCAL REFERENCE POSITION OF ENGINE.NUMBER  IN COLLATERAL IS ":Y.LR.POS<3,3>
RETURN
END

