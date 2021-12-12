$TITLE MODEL AUTETA
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

*1.2 parameters and variables

PARAMETERS
A(j)        "Scale parameter (Cobb-Douglas - Production function)"
aij(tr,j)   "Coefficient (Leontief - intermediate consumption"
alpha(tr)   "Elasticity (Cobb-Douglas production function)"
gamma(tr,h) "Share of commodity tr in type h household consumption budget"
io(j)       "Coefficient (Leontief - total intermediate consumption)"
lambda      "Share of capital income receied by capitalists"
mu(tr)      "Share of commodity tr in total investment expenditures"
psi(h)      "Average propensity to save of type h household"
tx(tr)      "Tax rate on commodity tr"
tyf         "Direct tax on rate of firms' income"
tyh(h)      "Direct tax rate on household h income"
v(j)        "Coefficient (Leontief - value added)"

* Definition of variables for the base year
* Note, "O" is added to indicate base year
* Volume variables (quantities)
CO(tr,h)    "Consumption of commodity tr by type h households"
CIO(j)      "Total intermediate consumption of industry j"
DIO(tr,j)   "Intermediate consumption of commodity tr in industry j"
DITO(tr)    "Total intermediate demand fo commodity tr"
INVO(tr)    "Final demand of commodity tr for investment purposes"
KDO(tr)     "Industry tr demand for capital"
KSO(tr)     "Capital supply in industry tr"
LDO(j)      "Industry j demand for labour"
LSO         "Total labour supply"
VAO(j)      "Value added of industry j"
XSO(j)      "Output of industry j"

* Prices
PO(i)       "Price of commodity i"
PCIO(j)     "Intermediate consumption price index of industry j"
PDO(tr)     "Price of commodity tr (including taxes)"
PVAO(j)     "Price of industry j value added"
RO(tr)      "Rental rate of capital in industry tr"
WO          "Wage rate"

* Nominal variables (values)
CTHO(h)     "Consumption budget of type h households"
DIVO        "Dividends"
DTFO        "Receipts from direct taxation on firm' income"
DTHO(h)     "Receipts from direct taxation on household h income"
GO          "Current public expenditures"
ITO         "Total investment"
SFO         "Business savings"
SGO         "Government savings"
SHO(h)      "Savings of type h households"
TGO         "Public transfers to salaried households"
TIO(tr)     "Receipts from indirect tax on commodity tr"
YDHO(h)     "Disposable income of type h households"
YFO         "Business income"
YGO         "Goernment income"
YHO(h)      "Income of type h households"
;

PARAMETER
SAM(*,*,*,*) SAM for AUTETA;

$CALL GDXXRW.EXE I=data/AUTETA.xlsx O=AUTETA.gdx par=SAM rng=SAM!A1:R18 Rdim=2 Cdim=2
$CALL mv AUTETA.gdx data/AUTETA.gdx
$GDXIN data/AUTETA.gdx
$LOAD SAM
$GDXIN


*assignment of variables
DIVO            = SAM('AG','CAP','AG','FIRM');
ITO             = SAM('OTH','TOT','OTH','ACC');
SFO             = SAM('OTH','ACC','AG','FIRM');
SHO(h)          = SAM('OTH','ACC','AG',h);
YFO             = SAM('OTH','TOT','AG','FIRM');
YHO(h)          = SAM('OTH','TOT','AG',h);
GO              = SAM('I','PUB','AG','GVT');
TGO             = SAM('AG','SAL','AG','GVT');
DTHO(h)         = SAM('AG','GVT','AG',h);
DTFO            = SAM('AG','GVT','AG','FIRM');
TIO(tr)         = SAM('AG','GVT','I',tr);
YGO             = SAM('OTH','TOT','AG','GVT');
SGO             = SAM('OTH','ACC','AG','GVT');
** For some variables in volume, we first assign a temporary value from
** the SAM. Later on, we will divide this value by the corresponding price
XSO(j)          = SAM('OTH','TOT','J',j);
CO(tr,h)        = SAM('I',tr,'AG',h);
DIO(tr,j)       = SAM('I',tr,'J',j);
INVO(tr)        = SAM('I',tr,'OTH','ACC');
KDO(tr)         = SAM('F','KD','J',tr);
LDO(j)          = SAM('F','LD','J',j);

* Prices
WO              = 1;
RO(tr)          = 1;
PO(i)           = 1;

* Computation of variables in volume
LDO(j)          = LDO(j)/WO;
KDO(tr)         = KDO(tr)/RO(tr);
XSO(j)          = XSO(j)/PO(j);

* For other volumes, we must first compute the price including taxes
tx(tr)          = TIO(tr)/[PO(tr)*XSO(tr)];
PDO(tr)         = [1+tx(tr)]*PO(tr);

CO(tr,h)        = CO(tr,h)/PDO(tr);
INVO(tr)        = INVO(tr)/PDO(tr);
DIO(tr,j)       = DIO(tr,j)/PDO(tr);

* Calibration of other variables
LSO             = SUM[j,LDO(j)];
KSO(tr)         = KDO(tr);
VAO(tr)         = LDO(tr) + KDO(tr);
PVAO(tr)        = {WO*LDO(tr)+RO(tr)*KDO(tr)}/VAO(tr);
VAO('pub')      = LDO('pub');
PVAO('pub')     = WO;
DITO(tr)        = SUM[j,DIO(tr,j)];
CIO(j)          = SUM[tr,DIO(tr,j)];
PCIO(j)         = SUM[tr,PDO(tr)*DIO(tr,j)]/CIO(j);
YDHO(h)         = YHO(h)-DTHO(h);
CTHO(h)         = YDHO(h) - SHO(h);

* Calibration of Parameters
* Production (Cobb-Douglas and Leontied)
alpha(tr)       = WO*LDO(tr)/{PVAO(tr)*VAO(tr)};
A(tr)           = VAO(tr)/{LDO(tr)**alpha(tr)*KDO(tr)**(1-alpha(tr))};
v(j)            = VAO(j)/XSO(j);
io(j)           = CIO(j)/XSO(j);
aij(tr,j)       = DIO(tr,j)/CIO(j);

* Distribution parameters
gamma(tr,h)     = PDO(tr)*CO(tr,h)/CTHO(h);
lambda          = {YHO('cap')-DIVO}/SUM[tr,RO(tr)*KDO(tr)];
mu(tr)          = PDO(tr)*INVO(tr)/ITO;
psi(h)          = SHO(h)/YDHO(h);

* Income tax rates
tyh(h)          = DTHO(h)/YHO(h);
tyf             = DTFO/YFO;

* Parameters to be displayed in the output file
DISPLAY A, alpha, io, v, aij, gamma, psi, mu, lambda, tyh, tyf, tx, CO;

* MODEL

* Definition of variables
VARIABLES
* Volume variables (quantities)
C(tr,h)     "Consumption of commodity tr by type h households"
CI(j)       "Total intermediate consumption of industry j"
DI(tr,j)    "Intermediate consumption of commodity tr in industry j"
DIT(tr)     "Total intermediate demand for commodity tr"
INV(tr)     "Final demand of commodity tr for investment purposes"
KD(tr)      "Industry j demand for capital"
KS(tr)      "Capital supply in industry j"
LD(j)       "Industry j demand for labour"
LS          "Total labour supply"
VA(j)       "Value added of industry j"
XS(j)       "Output of industry j"

* Prices
P(i)        "Price of commodity tr (exluding taxes)"
PCI(j)      "Intermediate consumption price index of industry j"
PD(tr)      "Price of commodity tr (including taxes)"
PVA(j)      "Price of industry j value added"
R(tr)       "Rental rate of capital in industry tr"
W           "Wage rate"

* Nominal variables (values)
CTH(h)      "Consumption budget of type h households"
DIV         "Dividends"
DTF         "Receipts from direct taxation on firm' income"
DTH(h)      "Receipts from direct taxation on household h income"
G           "Current public expenditures"
IT          "Total investment"
SF          "Business savings"
SG          "Government savings"
SH(h)       "Savings of type h households"
TG          "Public transfers to salaried households"
TI(tr)      "Receipts from indirect tax on commodity tr"
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
*DIFFERENT: equations over TR. LDPEQ is new
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
;
*DIFFERENT: over TR, TG variable, YDHEQ equation
* SHEQ and CTHEQ use disposable income (YDH)
* NEW variables: TG, YDH, DTF, DTH, TI
* NEW parameters: tx(tr), tyh(h), tyf
 YHSEQ..        YH('sal') =e= W*SUM(j,LD(j)) + TG;
 YHCEQ..        YH('cap') =e= lambda*SUM(tr,R(tr)*KD(tr))+DIV;
 YDHEQ(h)..     YDH(h) =e= YH(h) - DTH(h);
 SHEQ(h)..      SH(h) =e= psi(h)*YDH(h);
 CTHEQ(h)..     CTH(h) =e= YDH(h)-SH(h);
 YFEQ..         YF =e= (1-lambda)*SUM(tr,R(tr)*KD(tr));
 SFEQ..         SF =e= YF-DIV-DTF;
 YGEQ..         YG =e= SUM[tr,TI(tr)] + SUM[h,DTH(h)] + DTF;
 TIEQ(tr)..     TI(tr) =e= tx(tr)*P(tr)*XS(tr);
 DTHEQ(h)..     DTH(h) =e= tyh(h)*YH(h);
 DTFEQ..        DTF =e= tyf*YF;
 SGEQ..         SG =e= YG - G - TG;
 
*Demand
EQUATIONS
 CEQ(tr,h)      "Household h consumption of commodity i"
 INVEQ(tr)      "Investment in commodity i"
 DITEQ(tr)      "Intermediate demand for commodity i"
;
*DIFFERENT: use of PD instead of P
 CEQ(tr,h)..    PD(tr)*C(tr,h) =e= gamma(tr,h)*CTH(h);
 INVEQ(tr)..    PD(tr)*INV(tr) =e= mu(tr)*IT;
 DITEQ(tr)..    DIT(tr) =e= SUM(j,DI(tr,j));
 
* Prices
EQUATIONS
 PVAPEQ         "Equivalence between PVA and W for public sector"
 PCIEQ(j)       "Intermediate consumption price index"
 CPEQ(j)        "Production costs for sector j"
 PDEQ(tr)       "Price of commodity tr including taxes"
;
*DIFFERENT: new equations: PVAPEQ, PDEQ
* NEW variables: PD
 PVAPEQ..       PVA('pub') =e= W;
 PCIEQ(j)..     PCI(j)*CI(j) =e= SUM(tr,PD(tr)*DI(tr,j));
 CPEQ(j)..      P(j)*XS(j) =e= PVA(j)*VA(j) + PCI(j)*CI(j);
 PDEQ(tr)..     PD(tr) =e= P(tr)*[1+tx(tr)];
 
* Equilibrium
EQUATIONS
 PEQ(bns)       "Domestic absorption"
 PPUBEQ         "Equilibrium on the market for public services"
 WEQ            "Labour market equilibrium"
 REQ(tr)        "Capital market equilibrium"
 ITEQ           "Investment-savings equilibrium"
;

* DIFFERENT: PPUBEQ equation
* NEW variables: G
 PEQ(bns)..     XS(bns) =e= SUM(h,C(bns,h)) + DIT(bns) + INV(bns);
 PPUBEQ..       XS('pub')*P('pub') =e= G;
 WEQ..          LS =e= SUM(j,LD(j));
 REQ(tr)..      KS(tr) =e= KD(tr);
 ITEQ..         IT =e= SUM(h,SH(h)) + SF + SG;
 
* Other
EQUATIONS
  WALRAS        "Verification of Walras' law"
;
 WALRAS..       LEON =e= XS('ser')-SUM[h,C('ser',h)] - DIT('ser') - INV('ser');
 
* Initialisation of variables
C.l(tr,h)   = CO(tr,h);
CI.l(j)     = CIO(j);
CTH.l(h)    = CTHO(h);
DI.l(tr,j)  = DIO(tr,j);
DIT.l(tr)   = DITO(tr);
DIV.l       = DIVO;
DTH.l(h)    = DTHO(h);
DTF.l       = DTFO;
G.l         = GO;
INV.l(tr)   = INVO(tr);
IT.l        = ITO;
KD.l(tr)    = KDO(tr);
KS.l(tr)    = KSO(tr);
LD.l(j)     = LDO(j);
LS.l        = LSO;
P.l(i)      = PO(i);
PCI.l(j)    = PCIO(j);
PD.l(tr)    = PDO(tr);
PVA.l(j)    = PVAO(j);
R.l(tr)     = RO(tr);
SF.l        = SFO;
SG.l        = SGO;
SH.l(h)     = SHO(h);
TG.l        = TGO;
TI.l(tr)    = TIO(tr);
VA.l(j)     = VAO(j);
W.l         = WO;
XS.l(j)     = XSO(j);
YDH.l(h)    = YDHO(h);
YF.l        = YFO;
YG.l        = YGO;
YH.l(h)     = YHO(h);

* Fixed/exogenous variables

* P(AGR) is the numéraire
P.fx('agr') = PO('agr');
*shock to numeraire
* P.fx('agr') = PO('agr')*1.5;

* Capital is sector-specific
KS.fx(tr)    = KSO(tr);
* Capital shock on service sector
*KS.fx('ser')    = KSO('ser')*1.1;

* Total labour supply is fixed
LS.fx       = LSO;

* Dividends are exogenous (nominal)
DIV.fx      = DIVO;
*shock to numeraire
*DIV.fx      = DIVO*1.5;

* Public expenditures are exogenous
G.fx        = GO;
* Public  transfers to households are exogenous
TG.fx       = TGO;

* SHOCKS
tx(tr)      = 0.75 * tx(tr)

* Model execution
MODEL AUTETA "Autarky with government" /ALL/;
AUTETA.HOLDFIXED=1;
SOLVE AUTETA USING CNS;


*CNS = Constrained non-linear system;