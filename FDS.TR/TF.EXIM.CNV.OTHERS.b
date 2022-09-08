* @ValidationCode : MjotMzc3MTIxMjY6Q3AxMjUyOjE1ODI1Mjk3NTQ3NDQ6dXNlcjotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MTAuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 24 Feb 2020 13:35:54
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

SUBROUTINE TF.EXIM.CNV.OTHERS
  
* SUBROUTINE DESCRIPTION
* This conversion routine is used to fetch the OTHER charges amount from LC Application
*-------------------------------------------------------------------------------
* INSERTING FILES

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LETTER.OF.CREDIT
    $INSERT I_F.LC.ACCOUNT.BALANCES
    
    $USING EB.Reports
    $USING ST.CompanyCreation
*
    GOSUB INIT      ;*/Initialisation
    GOSUB OPEN      ;*/Open files
    GOSUB PROCESS   ;*/Processing
*
RETURN
*--------------------------------------------------------------------------------
INIT:
*-----
    ST.CompanyCreation.LoadCompany("BNK")
    FN.LC.ACCOUNT.BALANCES = 'F.LC.ACCOUNT.BALANCES'
    F.LC.ACCOUNT.BALANCES = ''
    R.LC.ACCOUNT.BALANCES = ''
    Y.LETTER.OF.CREDIT.ID = ''
    Y.LC.ACCOUNT.BALANCES.ERR = ''
    Y.FLD.COUNT = ''
    Y.CHARG.COUNT = ''
    Y.OTHERS = ''

RETURN
*-------------------------------------------------------------------------------
OPEN:
*----
    CALL OPF(FN.LC.ACCOUNT.BALANCES,F.LC.ACCOUNT.BALANCES)

RETURN
*------------------------------------------------------------------------------
PROCESS:
*------

    Y.LETTER.OF.CREDIT.ID = EB.Reports.getOData()
    CALL F.READ(FN.LC.ACCOUNT.BALANCES,Y.LETTER.OF.CREDIT.ID,R.LC.ACCOUNT.BALANCES,F.LC.ACCOUNT.BALANCES,Y.LC.ACCOUNT.BALANCES.ERR)
    Y.CHARG.COUNT = COUNT(R.LC.ACCOUNT.BALANCES<LCAC.CHRG.CODE>,VM) +1
    LOOP
        Y.FLD.COUNT += 1
    WHILE Y.FLD.COUNT LE Y.CHARG.COUNT
        Y.LC.CHARGE.CODE = R.LC.ACCOUNT.BALANCES<LCAC.CHRG.CODE,Y.FLD.COUNT>
        IF Y.LC.CHARGE.CODE EQ 'ADCONFBTAPP' OR Y.LC.CHARGE.CODE EQ 'ADCONFBTBNF' OR Y.LC.CHARGE.CODE EQ 'ADCONFCBNF' OR Y.LC.CHARGE.CODE EQ 'ADCONFCDAP1' OR Y.LC.CHARGE.CODE EQ 'ADCO' THEN
            Y.OTHERS += R.LC.ACCOUNT.BALANCES<LCAC.CHRG.LCCY.AMT,Y.FLD.COUNT>
        END
    REPEAT
    EB.Reports.setOData(Y.OTHERS)
    Y.FLD.COUNT = 0

RETURN
*------------------------------------------------------------------------------------------------------------------------------
END
