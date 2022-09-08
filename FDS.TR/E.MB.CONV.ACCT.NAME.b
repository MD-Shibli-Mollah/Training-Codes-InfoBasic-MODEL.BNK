* @ValidationCode : MjoxNDMyNjI2NjM1OkNwMTI1MjoxNTgzNTc5OTY4MDU3OnVzZXI6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzEwLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 07 Mar 2020 17:19:28
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

*THIS CONVERSION ROUTINE TAKES DATE TIME THEN CONVERT THE DATE ONLY TO REGULAR DATE FORMET******

SUBROUTINE E.MB.CONV.ACCT.NAME
    
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    
    $USING EB.Reports

    GOSUB PROCESS
RETURN

*--------------------------------------------------------------------------------------------------------------------------
PROCESS:
*--------------------------------------------------------------------------------------------------------------------------
    
    Y.DATE=''
    Y.DATE.1=''
    Y.DATE.2=''
    Y.DATE = EB.Reports.getOData()[1,6]
    Y.DATE.1=ICONV(Y.DATE,'D')
    Y.DATE.2=OCONV(Y.DATE.1,"D-")
    Y.ODATA.RET = Y.DATE.2[7,4]:Y.DATE.2[1,2]:Y.DATE.2[4,2]
    EB.Reports.setOData(Y.DATE.2[7,4]:Y.DATE.2[1,2]:Y.DATE.2[4,2])
RETURN
END