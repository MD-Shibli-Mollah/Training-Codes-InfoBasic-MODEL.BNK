* @ValidationCode : Mjo5OTg5NTQ5NjY6Q3AxMjUyOjE1NzkwNjcwODA2NzU6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 15 Jan 2020 11:44:40
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

SUBROUTINE CUS.SH.ROUTINE
*-------------------
    $INSERT I_COMMON
    $USING EB.SystemTables
    
*-------------------------------
    Y.CUS.ID =EB.SystemTables.getComi()
    IF LEN(Y.CUS.ID) LT 8 THEN
        EB.SystemTables.setE('ID length must be greater than 8 digit')
    END
RETURN
END