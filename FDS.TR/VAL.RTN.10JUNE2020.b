* @ValidationCode : MjotNjc4MDczMjEwOkNwMTI1MjoxNTkyNDc3NjYyMjMxOnVzZXI6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzEwLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 18 Jun 2020 16:54:22
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


*SUBROUTINE VAL.RTN.10JUNE2020
PROGRAM VAL.RTN.10JUNE2020

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.SystemTables
    $USING ST.CompanyCreation
    DEBUG
    ST.CompanyCreation.LoadCompany('BNK')
    Y.COM = EB.SystemTables.getIdCompany()
    DEBUG
    Y.STOCK.REG = "DRAFT."+ Y.COM
    DEBUG
    COMI = Y.STOCK.REG
    DEBUG
RETURN
END