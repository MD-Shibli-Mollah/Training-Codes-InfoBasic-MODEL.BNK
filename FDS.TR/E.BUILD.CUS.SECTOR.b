* @ValidationCode : MjotMTAxNzI4MTAxNDpDcDEyNTI6MTU4NDE3NzQyNTY2Njp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 14 Mar 2020 15:17:05
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
*-----------------------------------------------------------------------------
SUBROUTINE E.BUILD.CUS.SECTOR(ENQ.DATA)
*PROGRAM E.BUILD.CUS.SECTOR
    $INSERT I_COMMON
    $INSERT I_EQUATE
*  $INSERT I_ENQUIRY.COMMON
*
    Y.FIELDS = ENQ.DATA<2>
    Y.POS = DCOUNT(Y.FIELDS,@VM) +1
    ENQ.DATA<2,Y.POS>='SECTOR'
    ENQ.DATA<3,Y.POS>='EQ'
    ENQ.DATA<4,Y.POS>='1002'
*
**---1499 1500 1501 1503 1599 1600 1601 1699 1900 1999 2000 2001 2002 2003 2005 2999 3000 3001 3002 3003 3005 3499 3500'
RETURN
END