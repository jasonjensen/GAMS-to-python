$TITLE MODEL EXTER
$STITLE AUTARCHY WITH GOVERNMENT

* Model of a closed economy without government
* 2 factors owned by 2 types of households

* DIFFERENT: SETS
SETS
I "Industries and commodities"
/ AGR agriculture
  MAN manufacturing
  SER sevices
  PUB public/
TR(I) "Tradeable commodities"
/ AGR agriculture
  MAN manufacturing
  SER services/
BNS(TR) "Goods"
/ AGR agriculture
  MAN manufacturing /
H "Households"
/ SAL labour endowed households
  CAP capital endowed households /  
;
ALIAS(i,j);
ALIAS(tr,tr1);

*1.2 parameters and variables

PARAMETERS
A(tr)       "Scale parameter (Cobb-Douglas - Production function)"
AE(tr)      "Scale parameter (CET - supply function)"
AM(tr)      "Scale parameter (CET - demand function)"
aij(tr,j)   "Coefficient (Leontief - intermediate consumption"
alpha(tr)   "Elasticity (Cobb-Douglas production function)"
betaE(tr)   "Distribution parameter (CET supply function)"
betaM(tr)   "Distribution parameter (CET demand function)"
gamma(tr,h) "Share of commodity tr in type h household consumption budget"
io(j)       "Coefficient (Leontief - total intermediate consumption)"
lambda      "Share of capital income receied by capitalists"
lambdaR     "Share of capital income receied by foreigners"
mu(tr)      "Share of commodity tr in total investment expenditures"
psi(h)      "Average propensity to save of type h household"
rhoE(tr)    "Elasticity parameter (CET supply function)"
rhoM(tr)    "Elasticity parameter (CET demand function)"
sigmaE(tr)  "Elasticity (CET supply function)"
sigmaM(tr)  "Elasticity (CET demand function)"
te(tr)      "Tax rate on exported commodity tr"
tm(tr)      "Tax rate on imported commodity tr"
tx(tr)      "Tax rate on commodity tr"
tyf         "Direct tax on rate of firms' income"
tyh(h)      "Direct tax rate on household h income"
v(j)        "Coefficient (Leontief - value added)"

* Definition of variables for the base year
* Note, "O" is added to indicate base year
* Volume variables (quantities)
CO(tr,h)    "Consumption of commodity tr by type h households"
CIO(j)      "Total intermediate consumption of industry j"
DDO(j)      "Demand for domestic commodity tr"
DIO(tr,j)   "Intermediate consumption of commodity tr in industry j"
DITO(tr)    "Total intermediate demand for commodity tr"
DSO(tr)     "Supply of commodity tr on the local market"
EXO(tr)     "Exports of commodity tr"
IMO(tr)     "Imports of commodity tr"
INVO(tr)    "Final demand of commodity tr for investment purposes"
KDO(tr)     "Industry j demand for capital"
KSO(tr)     "Capital supply in industry j"
LDO(j)      "Industry j demand for labour"
LSO         "Total labour supply"
QO          "Demand for composite commodity tr"
VAO(j)      "Value added of industry j"
XSO(j)      "Output of industry j"

* Prices
eO          "Nominal exchange rate (foreign per domestic)"
PO(j)       "Price of sector j output (exluding taxes)"
PCO(tr)     "Purchaser price of composite commodity tr"
PCIO(j)     "Intermediate consumption price index of industry j"
PDO(tr)     "Price of commodity tr sold on the local market (including taxes)"
PEO(tr)     "Producer price of exported commodity tr"
PINDEXO     "Price index (GDP deflator)"
PLO(tr)     "Price of commodity tr sold on the local market (excluding taxes)"
PMO(tr)     "Price of imported commodity tr (including duties and taxes)"
PVAO(j)     "Price of industry j value added"
PWEO(tr)    "World price of exported product tr (in foreign currency)"
PWMO(tr)    "World prce of imported product tr (in foreign currency)"
RO(tr)      "Rental rate of capital in industry tr"
WO          "Wage rate"

* Nominal variables (values)
CABO        "Current account balance"
CTHO(h)     "Consumption budget of type h households"
DIVO        "Dividends paid to households"
DIVRO       "Dividentd paid to foreigners"
DTFO        "Receipts from direct taxation on firm' income"
DTHO(h)     "Receipts from direct taxation on household h income"
GO          "Current public expenditures"
ITO         "Total investment"
SFO         "Business savings"
SGO         "Government savings"
SHO(h)      "Savings of type h households"
TGO         "Public transfers to salaried households"
TIO(tr)     "Receipts from indirect tax on commodity tr"
TIEO(tr)    "Receipts from indirect tax on exported commodity tr"
TIMO(tr)    "Receipts from import duties on commodity tr"
YDHO(h)     "Disposable income of type h households"
YFO         "Business income"
YGO         "Government income"
YHO(h)      "Income of type h households"
;

PARAMETER
SAM(*,*,*,*) SAM for EXTER;

$CALL GDXXRW.EXE I=data/EXTER.xlsx O=EXTER.gdx par=SAM rng=EXTER!A1:W23 Rdim=2 Cdim=2
$CALL mv EXTER.gdx data/EXTER.gdx
$GDXIN data/EXTER.gdx
$LOAD SAM
$GDXIN


*assignment of variables
* NOMINAL VARIABLES
CABO            = -1*SAM('OTH','ACC','AG','WORLD');
*CTH(h)      "Consumption budget of type h households"
DIVO            = SAM('AG','CAP','AG','FIRM');
DIVRO           = SAM('AG','WORLD','AG','FIRM');
DTFO            = SAM('AG','GVT','AG','FIRM');
DTHO(h)         = SAM('AG','GVT','AG',h);
GO              = SAM('I','PUB','AG','GVT');
*IT          "Total investment" - might need adjustment
ITO             = SAM('OTH','TOT','OTH','ACC');
SFO             = SAM('OTH','ACC','AG','FIRM');
SGO             = SAM('OTH','ACC','AG','GVT');
SHO(h)          = SAM('OTH','ACC','AG',h);
TGO             = SAM('AG','SAL','AG','GVT');
TIO(tr)         = SAM('AG','GVT','I',tr);
TIEO(tr)        = SAM('AG','GVT','WM',tr);
TIMO(tr)        = SAM('AG','DUTIES','I',tr);
YFO             = SAM('OTH','TOT','AG','FIRM');
YHO(h)          = SAM('OTH','TOT','AG',h);
YDHO(h)         = SAM('OTH','TOT','AG',h) - DTHO(h);
CTHO(h)         = YDHO(h) - SHO(h);
YGO             = SAM('OTH','TOT','AG','GVT');

** VOLUME variables
** For some variables in volume, we first assign a temporary value from
** the SAM. Later on, we will divide this value by the corresponding price
XSO(j)          = SAM('OTH','TOT','J',j);
CO(tr,h)        = SAM('I',tr,'AG',h);
DSO(tr)         = SAM('J',tr,'I',tr);
DIO(tr,j)       = SAM('I',tr,'J',j);
CIO(j)          = SUM(tr, DIO(tr, j));
* might need to be run after adjusting DDO for prices

*EX(tr)      "Exports of commodity tr"
EXO(tr)         = SAM('WM',tr,'AG','WORLD');
IMO(tr)         = SAM('AG','WORLD','I',tr);
INVO(tr)        = SAM('I',tr,'OTH','ACC');
KDO(tr)         = SAM('F','KD','J',tr);
* might need to be run after adjusting KDO for prices
KSO(tr)         = KDO(tr);
LDO(j)          = SAM('F','LD','J',j);
* might need to be run after adjusting LSO for prices
LSO             = SUM(j, LDO(j));
* needs to be adjusted for PC
QO(tr)          = SAM('I',tr,'OTH','TOT');
DDO(tr)         = DSO(tr);

*Q           "Demand for composite commodity tr"
**QEQ(tr)..      Q(tr) = AM(tr)*(betaM(tr)*IM(tr)**(-1*rhoM(tr))+(1-betaM(tr))*DD(tr)**(-1*rhoM(tr)))**(-11/rhoM(tr);
**QEQ2(bns)..    Q(bns) =e= SUM(h,C(bns,h)) + DIT(bns) + INV(bns);
*VA(j)       "Value added of industry j"

* Prices
eO              = 1;
WO              = 1;
PINDEXO         = 1;
RO(tr)          = 1;
PO('PUB')       = 1;
PLO(tr)         = 1;
PEO(tr)         = 1;
PWMO(tr)         = 1;
PO(tr)           = 1;


* these calculations only works with the unadjusted variables
* For other volumes, we must first compute the price including taxes
tm(tr)          = SAM('AG','DUTIES','I',tr)/SAM('AG','WORLD','I',tr);
tx(tr)          = TIO(tr)/(PLO(tr)*DDO(tr)+(1+tm(tr))*eO*PWMO(tr)*IMO(tr));
PDO(tr)         = [1+tx(tr)]*PLO(tr);
PMO(tr)         = eO*PWMO(tr)*(1+tm(tr))*(1+tx(tr));

*PCO(tr)         = QO(tr) / (TIO(tr)+TIMO(tr)+SAM('AG','WORLD','I',tr)+SAM('J',tr,'I',tr));
PCO(tr)         = SAM('I',tr,'OTH','TOT') / (SAM('AG','WORLD','I',tr)+SAM('J',tr,'I',tr));
*PCO(tr)         = QO(tr) / (TIO(tr)+TIMO(tr)+IMO(tr)+DSO(tr));
DIO(tr,j)       = DIO(tr,j)/PCO(tr);
DISPLAY PCO, QO, TIO, TIMO, IMO, DSO;

*P * XS = SAM('OTH','TOT','J',tr);
*=> XS = SAM('OTH','TOT','J',tr)
*P * XS = PLO(tr)*DSO(tr)+PEO(tr)*EXO(tr)
*P*XS = DSO(tr)+PEO(tr)/XS = 
*P * XS = WO*LDO(tr)+RO(tr)*KDO(tr)+SUM(tr, PCO(tr)*DIO(tr, j))
*PO(tr)           =

* Computation of variables in volume
LDO(j)          = LDO(j)/WO;
KDO(tr)         = KDO(tr)/RO(tr);
XSO(j)          = XSO(j)/PO(j);
XSO('PUB')      = XSO('PUB')/PO('PUB');
QO(tr)          = QO(tr)/PCO(tr);
CO(tr,h)        = SAM('I',tr,'AG',h) / PCO(tr);
INVO(tr)        = INVO(tr)/PCO(tr);
DITO(tr)        = SUM[j,DIO(tr,j)];
DSO(tr)         = DSO(tr)/PLO(tr);
* NOTE: don't price-adjust DD because it must be equal to DS


* this calulation uses the adjusted DIO (to bring it back to the unadjusted DIO)
PCIO(j)         = SUM(tr,PCO(tr)*DIO(tr,j))/CIO(j);




*PMO(tr)         = SAM('WM',tr,'J',tr)*(1+tm(tr))*(1+tx(tr));

PWEO(tr)        = SAM('WM',tr,'AG','WORLD')/(SAM('J',tr,'WM',tr)/PEO(tr)*eO);
*PWMO(tr)        = PMO(tr) / (eO*(1+tm(tr))*(1+tx(tr)));
EXO(tr)         = EXO(tr)/PWEO(tr);
*PM = e*PWM*(1+tm)*(1+tx)


* Calibration of other variables
LSO             = SUM[j,LDO(j)];
KSO(tr)         = KDO(tr);
VAO(tr)         = LDO(tr) + KDO(tr);
PVAO(tr)        = {WO*LDO(tr)+RO(tr)*KDO(tr)}/VAO(tr);
VAO('pub')      = LDO('pub');
PVAO('pub')     = WO;



* Calibration of Parameters
* Production (Cobb-Douglas and Leontied)
alpha(tr)       = WO*LDO(tr)/{PVAO(tr)*VAO(tr)};
A(tr)           = VAO(tr)/{LDO(tr)**alpha(tr)*KDO(tr)**(1-alpha(tr))};
aij(tr,j)       = DIO(tr,j)/CIO(j);
v(j)            = VAO(j)/XSO(j);
io(j)           = CIO(j)/XSO(j);

*trade parameters
*(EX/DS)^(1/rhoE) = PE/PL * (1-betaE)/betaE
*(EX/DS)^(1/rhoE) / (PE/PL)  =  (1-betaE)/betaE
*(EX/DS)^(1/rhoE) / (PE/PL)  =  1/betaE - 1
*(EX/DS)^(1/rhoE) / (PE/PL) + 1 =  1/betaE
*betaE = 1 / ((EX/DS)^(1/rhoE) / (PE/PL) + 1)
*betaM = 1 / ((IM/DD)^(1/rhoM) / (PD/PM) + 1)


* Elasticities are estimated based on a lit review
sigmaE('AGR')   = 1.5;
sigmaE('MAN')   = 0.5;
sigmaE('SER')   = 1;
sigmaM('AGR')   = 2;
sigmaM('MAN')   = 0.6;
sigmaM('SER')   = 0.2;

rhoE(tr)        = 1/sigmaE(tr) + 1;
rhoM(tr)        = 1/sigmaM(tr) - 1;

betaE(tr)       = 1 / ((EXO(tr)/DSO(tr))**(1/sigmaE(tr)) / (PEO(tr)/PLO(tr)) + 1);
betaM(tr)       = 1 / ((PDO(tr)/PMO(tr)) / (IMO(tr)/DDO(tr))**(1/sigmaM(tr)) + 1);

AE(tr)          = XSO(tr) / (betaE(tr)*EXO(tr)**rhoE(tr)+(1-betaE(tr))*DSO(tr)**rhoE(tr))**(1/rhoE(tr));
AM(tr)          = QO(tr) / (betaM(tr)*IMO(tr)**(-1*rhoM(tr))+(1-betaM(tr))*DDO(tr)**(-1*rhoM(tr)))**(-1/rhoM(tr));

* Distribution parameters
gamma(tr,h)     = PCO(tr)*CO(tr,h)/CTHO(h);
lambda          = SAM('AG','CAP','F','KD') / SUM(tr, SAM('F','KD','J',tr));
lambdaR         = 1 - lambda - SAM('AG','FIRM','F','KD') / SUM(tr, RO(tr)*KDO(tr));
mu(tr)          = PCO(tr)*INVO(tr)/ITO;
psi(h)          = SHO(h)/YDHO(h);

* Income tax rates
te(tr)          = eO*PWEO(tr)/PEO(tr) - 1;
tyh(h)          = DTHO(h)/YHO(h);
tyf             = DTFO/YFO;



* Parameters to be displayed in the output file
DISPLAY A, alpha, io, v, aij, gamma, psi, mu, lambda, tyh, tyf, tx, te, CO;
DISPLAY PINDEXO, PVAO, VAO;
display rhoE, rhoM, betaE, betaM, AE, AM;
DISPLAY QO, IMO, DDO, PCO, DIO;


* Definition of variables
VARIABLES
* Volume variables (quantities)
C(tr,h)     "Consumption of commodity tr by type h households"
CI(j)       "Total intermediate consumption of industry j"
DD(j)       "Demand for domestic commodity tr"
DI(tr,j)    "Intermediate consumption of commodity tr in industry j"
DIT(tr)     "Total intermediate demand for commodity tr"
DS(tr)      "Supply of commodity tr on the local market"
EX(tr)      "Exports of commodity tr"
IM(tr)      "Imports of commodity tr"
INV(tr)     "Final demand of commodity tr for investment purposes"
KD(tr)      "Industry j demand for capital"
KS(tr)      "Capital supply in industry j"
LD(j)       "Industry j demand for labour"
LS          "Total labour supply"
Q(tr)       "Demand for composite commodity tr"
VA(j)       "Value added of industry j"
XS(j)       "Output of industry j"

* Prices
e           "Nominal exchange rate (foreign per domestic)"
P(j)        "Price of sector j output (exluding taxes)"
PC(tr)      "Purchaser price of composite commodity tr"
PCI(j)      "Intermediate consumption price index of industry j"
PD(tr)      "Price of commodity tr sold on the local market (including taxes)"
PE(tr)      "Producer price of exported commodity tr"
PINDEX      "Price index (GDP deflator)"
PL(tr)      "Price of commodity tr sold on the local market (excluding taxes)"
PM(tr)      "Price of imported commodity tr (including duties and taxes)"
PVA(j)      "Price of industry j value added"
PWE(tr)     "World price of exported product tr (in foreign currency)"
PWM(tr)     "World prce of imported product tr (in foreign currency)"
R(tr)       "Rental rate of capital in industry tr"
W           "Wage rate"

* Nominal variables (values)
CAB         "Current account balance"
CTH(h)      "Consumption budget of type h households"
DIV         "Dividends paid to households"
DIVR        "Dividentd paid to foreigners"
DTF         "Receipts from direct taxation on firm' income"
DTH(h)      "Receipts from direct taxation on household h income"
G           "Current public expenditures"
IT          "Total investment"
SF          "Business savings"
SG          "Government savings"
SH(h)       "Savings of type h households"
TG          "Public transfers to salaried households"
TI(tr)      "Receipts from indirect tax on commodity tr"
TIE(tr)     "Receipts from indirect tax on exported commodity tr"
TIM(tr)     "Receipts from import duties on commodity tr"
YDH(h)      "Disposable income of type h households"
YF          "Business income"
YG          "Government income"
YH(h)       "Income of type h households"

* Other variable
LEON        "Excess supply on the market for services"
;

* Definition of the equations
*Production
EQUATIONS
 XSEQ(j)    "Value added demand in industry j (Leontief)"
 CIEQ(j)    "Total intermediate consumption demand in industry j (Leontief)"
 VAEQ(tr)   "Cobb-Douglas between labour and capital"
 LDEQ(tr)   "Demand for labour by industry j"
 KDEQ(tr)   "Demand for capital by industry j"
 LDPEQ      "Labor demand in the public sector"
 DIEQ(tr,j) "Intermediate consumption of commodity i by sector j"
;

 XSEQ(j)..      VA(j) =e= v(j)*XS(j);
 CIEQ(j)..      CI(j) =e= io(j)*XS(j);
 VAEQ(tr)..     VA(tr) =e= A(tr)*LD(tr)**alpha(tr)*KD(tr)**(1-alpha(tr));
 LDEQ(tr)..     W*LD(tr) =e= alpha(tr)*PVA(tr)*VA(tr);
 KDEQ(tr)..     R(tr)*KD(tr) =e= (1-alpha(tr))*PVA(tr)*VA(tr);
 LDPEQ..        LD('pub') =e= VA('pub'); 
 DIEQ(tr,j)..   DI(tr,j) =e= aij(tr,j)*CI(j);
 
*Income and savings
EQUATIONS
 YHSEQ      "Household income (workers)"
 YHCEQ      "Household income (capitalists)"
 YDHEQ(h)   "Disopsabe income"
 SHEQ(h)    "Household h savings"
 CTHEQ(h)   "Consumption budget for household h"
 YFEQ       "Firms income"
 SFEQ       "Firms savings"
 YGEQ       "Government income"
 TIEQ(tr)   "Receipts from indirect taxation"
 DTHEQ(h)   "Receipts from income taxes (households)"
 DTFEQ      "Receipts from income taxes (firms)"
 SGEQ       "Government savings"
 TIMEQ      "something"
 TIEEQ      "something"
;
* DIFFERENT: YFEQ, SFEQ, YGEQ, TIEQ, TIEQ have changed
* NEW: TIMEQ, TIEEQ
 YHSEQ..        YH('sal') =e= W*SUM(j,LD(j)) + TG;
 YHCEQ..        YH('cap') =e= lambda*SUM(tr,R(tr)*KD(tr))+DIV;
 YDHEQ(h)..     YDH(h) =e= YH(h) - DTH(h);
 SHEQ(h)..      SH(h) =e= psi(h)*YDH(h);
 CTHEQ(h)..     CTH(h) =e= YDH(h)-SH(h);
 YFEQ..         YF =e= (1-lambda-lambdaR)*SUM(tr,R(tr)*KD(tr));
 SFEQ..         SF =e= YF-DIV-DIVR-DTF;
 YGEQ..         YG =e= SUM[tr,TI(tr)+TIM(tr)+TIE(tr)] + SUM[h,DTH(h)] + DTF;
 TIEQ(tr)..     TI(tr) =e= tx(tr)*(PL(tr)*DD(tr)+(1+tm(tr))*e*PWM(tr)*IM(tr));
 TIMEQ(tr)..    TIM(tr) =e= tm(tr)*e*PWM(tr)*IM(tr);
 TIEEQ(tr)..    TIE(tr) =e= te(tr)*PE(tr)*EX(tr);
 DTHEQ(h)..     DTH(h) =e= tyh(h)*YH(h);
 DTFEQ..        DTF =e= tyf*YF;
 SGEQ..         SG =e= YG - G - TG;
 
*Demand
EQUATIONS
 CEQ(tr,h)      "Household h consumption of commodity i"
 INVEQ(tr)      "Investment in commodity i"
 DITEQ(tr)      "Intermediate demand for commodity i"
;
*DIFFERENT: use of PC instead of PD
 CEQ(tr,h)..    PC(tr)*C(tr,h) =e= gamma(tr,h)*CTH(h);
 INVEQ(tr)..    PC(tr)*INV(tr) =e= mu(tr)*IT;
 DITEQ(tr)..    DIT(tr) =e= SUM(j,DI(tr,j));
 
* International trade
* This whole section is new
EQUATIONS
XSEQ2(tr)       "Export demand?"
EXEQ(tr)        "Terms of trade (exsports)"
QEQ(tr)         "Domestic consumption of composite good"
IMEQ(tr)        "Terms of trade (imports)"
CABEQ           "Current account balance"
;

XSEQ2(tr)..     XS(tr) =e= AE(tr)*(betaE(tr)*EX(tr)**rhoE(tr)+(1-betaE(tr))*DS(tr)**rhoE(tr))**(1/rhoE(tr));
EXEQ(tr)..      EX(tr)/DS(tr) =e= ((PE(tr)/PL(tr))*((1-betaE(tr))/betaE(tr)))**sigmaE(tr);
QEQ(tr)..       Q(tr) =e= AM(tr)*(betaM(tr)*IM(tr)**(-1*rhoM(tr))+(1-betaM(tr))*DD(tr)**(-1*rhoM(tr)))**(-1/rhoM(tr));
IMEQ(tr)..      IM(tr)/DD(tr) =e= ((PD(tr)/PM(tr))*(betaM(tr)/(1-betaM(tr))))**sigmaM(tr);
CABEQ..         CAB =e= e*SUM[tr,PWE(tr)*EX(tr)] - e*SUM[tr,PWM(tr)*IM(tr)] - lambdaR*SUM[tr,R(tr)*KD(tr)] - DIVR;

* Prices
EQUATIONS
 PVAPEQ         "Equivalence between PVA and W for public sector"
 PCIEQ(j)       "Intermediate consumption price index"
 PCEQ(j)        "Production costs for sector j"
 PDEQ(tr)       "Price of commodity tr including taxes"
 PMEQ(tr)       "Price of imports"
 PCEQ2(tr)       "Price of domestic consumption"
 PEEQ(tr)       "Price of exports"
 PINDEXEQ       "Price index"
 PEQ            "Price"
;
*DIFFERENT: PCIEQ, PDEQ have changed
* NEW: PMEQ, PCEQ, PEEQ, PEQ
 PVAPEQ..       PVA('pub') =e= W;
 PCIEQ(j)..     PCI(j)*CI(j) =e= SUM(tr,PC(tr)*DI(tr,j));
 PCEQ(j)..      P(j)*XS(j) =e= PVA(j)*VA(j) + PCI(j)*CI(j);
 PDEQ(tr)..     PD(tr) =e= PL(tr)*[1+tx(tr)];
 PMEQ(tr)..     PM(tr) =e= e*PWM(tr)*(1+tm(tr))*(1+tx(tr));
 PCEQ2(tr)..    PC(tr)*Q(tr) =e= PD(tr)*DD(tr) + PM(tr)*IM(tr);
 PEEQ(tr)..     PE(tr)*(1+te(tr)) =e= e*PWE(tr);
 PEQ(tr)..      P(tr)*XS(tr) =e= PL(tr)*DS(tr) + PE(tr)*EX(tr);

* note the use of the benchmark VAO and PVAO here;
 PINDEXEQ..     PINDEX =e= SUM(j,PVA(j)*VAO(j)) / SUM(j, PVAO(j)*VAO(j)); 

* Equilibrium
EQUATIONS
 QEQ2(bns)      "Domestic absorption"
 PPUBEQ         "Equilibrium on the market for public services"
 DSEQ(tr)       "Local commodity market equilibrium"
 WEQ            "Labour market equilibrium"
 REQ(tr)        "Capital market equilibrium"
 ITEQ           "Investment-savings equilibrium"
;

* DIFFERENT: PPUBEQ equation
* NEW variables: G
 QEQ2(bns)..    Q(bns) =e= SUM(h,C(bns,h)) + DIT(bns) + INV(bns);
 PPUBEQ..       XS('pub')*P('pub') =e= G;
 DSEQ(tr)..     DS(tr) =e= DD(tr);
 WEQ..          LS =e= SUM(j,LD(j));
 REQ(tr)..      KS(tr) =e= KD(tr);
 ITEQ..         IT =e= SUM(h,SH(h)) + SF + SG - CAB;
 
* Other
EQUATIONS
  WALRAS        "Verification of Walras' law"
;
 WALRAS..       LEON =e= Q('ser')-SUM[h,C('ser',h)] - DIT('ser') - INV('ser');
 





* Initialisation of variables
C.l(tr,h)   = CO(tr,h);
CI.l(j)     = CIO(j);
DD.l(j)     = DDO(j);
DS.l(tr)    = DSO(tr);
EX.l(tr)    = EXO(tr);
IM.l(tr)    = IMO(tr);
Q.l(tr)     = QO(tr);
CTH.l(h)    = CTHO(h);
DI.l(tr,j)  = DIO(tr,j);
DIT.l(tr)   = DITO(tr);
DIV.l       = DIVO;
DIVR.l      = DIVRO;
DTH.l(h)    = DTHO(h);
DTF.l       = DTFO;
G.l         = GO;
INV.l(tr)   = INVO(tr);
IT.l        = ITO;
KD.l(tr)    = KDO(tr);
KS.l(tr)    = KSO(tr);
LD.l(j)     = LDO(j);
LS.l        = LSO;
e.l         = eO;
P.l(j)      = PO(j);
PC.l(tr)    = PCO(tr);
PCI.l(j)    = PCIO(j);
PD.l(tr)    = PDO(tr);
PE.l(tr)    = PEO(tr);
PL.l(tr)    = PLO(tr);
PM.l(tr)    = PMO(tr);
PVA.l(j)    = PVAO(j);
PWE.l(tr)   = PWEO(tr);
PWM.l(tr)   = PWMO(tr);
R.l(tr)     = RO(tr);
SF.l        = SFO;
SG.l        = SGO;
SH.l(h)     = SHO(h);
TG.l        = TGO;
TI.l(tr)    = TIO(tr);
TIE.l(tr)   = TIEO(tr);
TIM.l(tr)   = TIMO(tr);
VA.l(j)     = VAO(j);
W.l         = WO;
XS.l(j)     = XSO(j);
YDH.l(h)    = YDHO(h);
YF.l        = YFO;
YG.l        = YGO;
YH.l(h)     = YHO(h);
CAB.l       = CABO;
PINDEX.l    = PINDEXO;

* Fixed/exogenous variables

* The exchange rate is the numéraire
e.fx = eO;


* other exogenous variable:
DIV.fx      = DIVO;
DIVR.fx     = DIVRO;
G.fx        = GO;
KS.fx(tr)   = KSO(tr);
LS.fx       = LSO;
TG.fx       = TGO;
CAB.fx      = CABO;
PWE.fx(tr)  = PWEO(tr);
PWM.fx(tr)  = PWMO(tr);

*SHOCK: halving of import tariffs on manufactured goods:
tm('MAN')   = 0.5*tm('MAN');

* Model execution
MODEL EXTER "Open economy with government" /ALL/;
EXTER.HOLDFIXED=1;
SOLVE EXTER USING CNS;


*CNS = Constrained non-linear system;