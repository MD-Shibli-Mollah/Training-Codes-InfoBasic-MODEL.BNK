* @ValidationCode : MjoxODU5NTI5MDEwOkNwMTI1MjoxNTgzNTYzMTY4NjQ3OnVzZXI6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzEwLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 07 Mar 2020 12:39:28
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : user
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201710.0
PROGRAM TEST.MB
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    
    $USING EB.Foundation
    $USING EB.Updates
    
    
    
    EB.Foundation.MapLocalFields("DRAWINGS", "LT.TF.IMPRT.NME", LT.POS)
    
    APPLICATION.NAMES = 'DRAWINGS'
    LOCAL.FIELDS = 'LT.TF.EXPRT.NME':VM:'LT.TF.IMPRT.NME':VM:'LT.TFDR.PSLNO'
    EB.Updates.MultiGetLocRef(APPLICATION.NAMES, LOCAL.FIELDS, FLD.POS)
    Y.LT.TF.EXPRT.NME.POS = FLD.POS<1,2>
    
    PRINT " MultiLoc ": Y.LT.TF.EXPRT.NME.POS
    PRINT "POS IS ": LT.POS
    Y.DATE = "20190101\20240101"
    Y.YEAR = Y.DATE[1,4]
    Y.MON = Y.DATE[5,2]
    Y.START.DATE = FIELD(Y.DATE,"\",1,1)
    Y.END.DATE = FIELD(Y.DATE,"\",2,1)
    Y.COMPANY = ID.COMPANY
    
    MYARRAY = "FDS-BD"
    
    ARR = MYARRAY[3,1]
    
    PRINT "ARRAY IS ": ARR
    
    PRINT "COMANY IS ": Y.COMPANY
    
    PRINT "DATE: " : Y.DATE
    PRINT "START DATE: " : Y.START.DATE
    PRINT "END DATE: " : Y.END.DATE
    
    QVAR = 5
    QJAR = 2
    QVAR += QJAR
    PRINT QVAR
END
