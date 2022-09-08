* @ValidationCode : MjotMTU0MjI0MDExMDpDcDEyNTI6MTU4NzI1ODIxNDgyMzp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Apr 2020 07:03:34
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
SUBROUTINE PR.ACCOUNT.LIST
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.SystemTables
    $USING EB.DataAccess
    $USING AC.AccountOpening
    $USING ST.CompanyCreation

    CALL LOAD.COMPANY('GB0010001')
    FN.ACCT = 'F.ACCOUNT'
    F.ACCT = ''
    EB.DataAccess.Opf(FN.ACCT, F.ACCT)