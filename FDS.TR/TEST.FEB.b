* @ValidationCode : MjotMTE1NTY0NDIyODpDcDEyNTI6MTU4NzI1ODA0OTEyNTp1c2VyOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcxMC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Apr 2020 07:00:49
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : user
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0


PROGRAM TEST.FEB

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $USING EB.Reports
    $USING ST.Config
    $USING EB.DataAccess
    $USING EB.Service
*-----------------------------------------------------------------------------
    Y.CATEG = EB.Reports.getOData()
    Y.CATEG = 1015
*
    FN.CATEG = 'F.CATEGORY'
    F.CATEG = ''
    
    EB.DataAccess.Opf(FN.CATEG,F.CATEG)
    
    EB.DataAccess.FRead(FN.CATEG,Y.CATEG,R.CATEG,F.CATEG,Y.CATEG.ERR)
*
    
    Y.CATEG.DESC = R.CATEG<ST.Config.Category.EbCatDescription>
    EB.Reports.setOData(Y.CATEG.DESC)
*
    Y.DATE = "20190101\20240101"
    Y.YEAR = Y.DATE[1,4]
    Y.MON = Y.DATE[5,2]
    Y.START.DATE = FIELD(Y.DATE,"\",1,1)
    Y.END.DATE = FIELD(Y.DATE,"\",2,1)
    
    PRINT "DATE: " : Y.DATE
    PRINT "START DATE: " : Y.START.DATE
    PRINT "END DATE: " : Y.END.DATE
    
    
    
    
    
END