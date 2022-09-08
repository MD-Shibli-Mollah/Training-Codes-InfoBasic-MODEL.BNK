* @ValidationCode : MjotMTgwMTY3Nzk0ODpDcDEyNTI6MTU3OTA2NzE1MTQ0OTp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 15 Jan 2020 11:45:51
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
SUBROUTINE CONV.ACC.SH
*---------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.Reports
    $USING ST.Config
    $USING EB.DataAccess
*-----------------------------------------------------------------------------
    Y.CATEG = EB.Reports.getOData()
    FN.CATEG = 'F.CATEGORY'
    F.CATEG = ''
    EB.DataAccess.Opf(FN.CATEG,F.CATEG)
    EB.DataAccess.FRead(FN.CATEG,Y.CATEG,R.CATEG,F.CATEG,Y.CATEG.ERR)
    Y.CATEG.DESC = R.CATEG<ST.Config.Category.EbCatDescription>
    EB.Reports.setOData(Y.CATEG.DESC)
END