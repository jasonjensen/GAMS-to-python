$TITLE MODEL AUTA
$STITLE AUTARCHY WITHOUT GOVERNMENT

* Model of a closed economy without government
* 2 factors owned by 2 types of households

SETS
I "Industries and commodities"
/ AGR agriculture
  MAN manufacturing
  SER sevices /
BNS(I) "Goods"
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
aij(i,j)    "Coefficient (Leontief - intermediate consumption"
alpha(j)    "Elasticity (Cobb-Douglas production function)"
gamma(i,h)  "Share of commodity i in type h household consumption budget"
io(j)       "Coefficient (Leontief - total intermediate consumption)"
lambda      "Share of capital income receied by capitalists"
mu(i)       "Share of commodity i in total investment expenditures"
psi(h)      "Average propensity to save of type h household"
v(j)        "Coefficient (Leontief - value added)"

* Definition of variables for the base year
* Note, "O" is added to indicate base year
* Volume variables (quantities)
CO(i,h)     "Consumption of commodity i by type h households"
CIO(j)      "Total intermediate consumption of industry j"
DIO(j,j)    "Intermediate consumption of commodity i in industry j"
DITO(i)     "Total intermediate demand fo commodity i"
INVO(i)     "Final demand of commodity i for investment purposes"
KDO(j)      "Industry j demand for capital"
KSO(j)      "Capital supply in industry j"
LDO(j)      "Industry j demand for labour"
LSO         "Total labour supply"
VAO(j)      "Value added of industry j"
XSO(j)      "Output of industry j"

* Prices
PO(i)       "Price of commodity i"
PCIO(j)     "Intermediate consumption price index of industry j"
PVAO(j)     "Price of industry j value added"
RO(j)       "Rental rate of capital in industry j"
WO          "Wage rate"

* Nominal variables (values)
CTHO(h)     "Consumption budget of type h households"
DIVO        "Dividends"
ITO         "Total investment"
SFO         "Business savings"
SHO(h)      "Savings of type h households"
YFO         "Business income"
YHO(h)      "Income of type h households"
;


*Initial data

TABLE SAM(*,*) "Social accounting matrix"
       LD    KD    SAL    CAP    F    AGR    MAN    SER    ACC 
LD                                    300    100    200	
KD                                    100    150    100	
SAL   600								
CAP         210                 70				
F           140							
AGR                162     21          50    150     90     27
MAN                108     84          20    150     90    173
SER                270    105          30     75    120	
ACC                 60     70   70				
TOT  600    350    600    280  140    500    625    600    200
;

*assignment of variables
DIVO            = SAM('CAP','F');
ITO             = SAM('TOT','ACC');
SFO             = SAM('ACC','F');
SHO(h)          = SAM('ACC',h);
YFO             = SAM('TOT','F');
YHO(h)          = SAM('TOT',h);
** For some variable sin volume, we first assign a temporary value from
** the SAM. Later on, we will divide this value by the corresponding price
XSO(j)          = SAM('TOT',j);
CO(i,h)         = SAM(i,h);
DIO(i,j)        = SAM(i,j);
INVO(i)         = SAM(i,'ACC');
KDO(j)          = SAM('KD',j);
LDO(j)          = SAM('LD',j);

* Prices
WO              = 1;
RO(j)           = 1;
PO(i)           = 1;

* Computation of variables in volume
LDO(j)          = LDO(j)/WO;
KDO(j)          = KDO(j)/RO(j);
XSO(j)          = XSO(j)/PO(j);
CO(i,h)         = CO(i,h)/PO(i);
INVO(i)         = INVO(i)/PO(i);
DIO(i,j)        = DIO(i,j)/PO(i);

* Calibration of other variables
LSO             = SUM[i,LDO(i)];
KSO(j)          = KDO(j);
VAO(j)          = LDO(j) + KDO(j);
PVAO(j)         = {WO*LDO(j)+RO(j)*KDO(j)}/VAO(j);
DITO(i)         = SUM[j,DIO(i,j)];
CIO(j)          = SUM[i,DIO(i,j)];
PCIO(j)         = SUM[i,PO(i)*DIO(i,j)]/CIO(j);
CTHO(h)         = YHO(h) - SHO(h);

* Calibration of Parameters
* Production (Cobb-Douglas and Leontied)
alpha(j)        = WO*LDO(j)/{PVAO(j)*VAO(j)};
A(j)            = VAO(j)/{LDO(j)**alpha(j)*KDO(j)**(1-alpha(j))};
v(j)            = VAO(j)/XSO(j);
io(j)           = CIO(j)/XSO(j);
aij(i,j)        = DIO(i,j)/CIO(j);

* Distribution parameters
gamma(i,h)      = PO(i)*CO(i,h)/CTHO(h);
lambda          = {YHO('cap')-DIVO}/SUM[j,RO(j)*KDO(j)];
mu(i)           = PO(i)*INVO(i)/ITO;
psi(h)          = SHO(h)/YHO(h);

* Parameters to be displayed in the output file
DISPLAY A, alpha, io, v, aij, gamma, psi, mu, lambda;

* MODEL

* Definition of variables
VARIABLES
* Volume variables (quantities)
C(i,h)      "Consumption of commodity i by type h households"
CI(j)       "Total intermediate consumption of industry j"
DI(j,j)     "Intermediate consumption of commodity i in industry j"
DIT(i)      "Total intermediate demand fo commodity i"
INV(i)      "Final demand of commodity i for investment purposes"
KD(j)       "Industry j demand for capital"
KS(j)       "Capital supply in industry j"
LD(j)       "Industry j demand for labour"
LS          "Total labour supply"
VA(j)       "Value added of industry j"
XS(j)       "Output of industry j"

* Prices
P(i)        "Price of commodity i"
PCI(j)      "Intermediate consumption price index of industry j"
PVA(j)      "Price of industry j value added"
R(j)        "Rental rate of capital in industry j"
W           "Wage rate"

* Nominal variables (values)
CTH(h)      "Consumption budget of type h households"
DIV         "Dividends"
IT          "Total investment"
SF          "Business savings"
SH(h)       "Savings of type h households"
YF          "Business income"
YH(h)       "Income of type h households"

* Other variable
LEON        "Excess supply on the market for services"
;

* Definition of the equations
*Production
EQUATIONS
 XSEQ(j)    "Value added demand in industry j (Leontief)"
 CIEQ(j)    "Total intermediate consumption demand in industry j (Leontief)"
 VAEQ(j)    "Cobb-Douglas between labour and capital"
 LDEQ(j)    "Demand for labour by industry j"
 KDEQ(j)    "Demand for capital by industry j"
 DIEQ(i,j)  "Intermediate consumption of commodity i by sector j"
;

 XSEQ(j)..      VA(j) =e= v(j)*XS(j);
 CIEQ(j)..      CI(j) =e= io(j)*XS(j);
 VAEQ(j)..      VA(j) =e= A(j)*LD(j)**alpha(j)*KD(j)**(1-alpha(j));
 LDEQ(j)..      W*LD(j) =e= alpha(j)*PVA(j)*VA(j);
 KDEQ(j)..      R(j)*KD(j) =e= (1-alpha(j))*PVA(j)*VA(j);
 DIEQ(i,j)..    DI(i,j) =e= aij(i,j)*CI(j);
 
*Income and savings
EQUATIONS
 YHSEQ      "Household income (workers)"
 YHCEQ      "Household income (capitalists)"
 SHEQ(h)    "Household h savings"
 CTHEQ(h)   "Consumption budget for household h"
 YFEQ       "Firms income"
 SFEQ       "Firms savings"
;

 YHSEQ..        YH('sal') =e= W*SUM(j,LD(j));
 YHCEQ..        YH('cap') =e= lambda*SUM(j,R(j)*KD(j))+DIV;
 SHEQ(h)..      SH(h) =e= psi(h)*YH(h);
 CTHEQ(h)..     CTH(h) =e= YH(h)-SH(h);
 YFEQ..         YF =e= (1-lambda)*SUM(j,R(j)*KD(j));
 SFEQ..         SF =e= YF-DIV;
 
*Demand
EQUATIONS
 CEQ(i,h)       "Household h consumption of commodity i"
 INVEQ(i)       "Investment in commodity i"
 DITEQ(i)       "Intermediate demand for commodity i"
;

 CEQ(i,h)..     P(i)*C(i,h) =e= gamma(i,h)*CTH(h);
 INVEQ(i)..     P(i)*INV(i) =e= mu(i)*IT;
 DITEQ(i)..     DIT(i) =e= SUM(j,DI(i,j));
 
* Prices
EQUATIONS
 PCIEQ(j)       "Intermediate consumption price index"
 CPEQ(j)        "Production costs for sector j"
;

 PCIEQ(j)..     PCI(j)*CI(j) =e= SUM(i,P(i)*DI(i,j));
 CPEQ(j)..      P(j)*XS(j) =e= PVA(j)*VA(j) + PCI(j)*CI(j);
 
* Equilibrium
EQUATIONS
 PEQ(bns)       "Domestic absorption"
 WEQ            "Labour market equilibrium"
 REQ(j)         "Capital market equilibrium"
 ITEQ           "Investment-savings equilibrium"
;

 PEQ(bns)..     XS(bns) =e= SUM(h,C(bns,h)) + DIT(bns) + INV(bns);
 WEQ..          LS =e= SUM(j,LD(j));
 REQ(j)..       KS(j) =e= KD(j);
 ITEQ..         IT =e= SUM(h,SH(h)) + SF;
 
* Other
EQUATIONS
  WALRAS        "Verification of Walras' law"
;
 WALRAS..       LEON =e= XS('ser')-SUM[h,C('ser',h)] - DIT('ser') - INV('ser');
 
* Initialisation of variables
C.l(i,h)    = CO(i,h);
CI.l(j)     = CIO(j);
CTH.l(h)    = CTHO(h);
DI.l(i,j)   = DIO(i,j);
DIT.l(i)    = DITO(i);
DIV.l       = DIVO;
INV.l(i)    = INVO(i);
IT.l        = ITO;
KD.l(j)     = KDO(j);
KS.l(j)     = KSO(j);
LD.l(j)     = LDO(j);
LS.l        = LSO;
P.l(i)      = PO(i);
PCI.l(j)    = PCIO(j);
PVA.l(j)    = PVAO(j);
R.l(j)      = RO(j);
SF.l        = SFO;
SH.l(h)     = SHO(h);
VA.l(j)     = VAO(j);
W.l         = WO;
XS.l(j)     = XSO(j);
YF.l        = YFO;
YH.l(h)     = YHO(h);

* Fixed/exogenous variables

* P(AGR) is the numéraire
P.fx('agr') = PO('agr');
*shock to numeraire
* P.fx('agr') = PO('agr')*1.5;

* Capital is sector-specific
KS.fx(j)    = KSO(j);
* Capital shock on service sector
KS.fx('ser')    = KSO('ser')*1.1;

* Total labour supply is fixed
LS.fx       = LSO;

* Dividends are exogenous (nominal)
DIV.fx      = DIVO;
*shock to numeraire
*DIV.fx      = DIVO*1.5;

* Model execution
MODEL AUTA "Autarky without government" /ALL/;
AUTA.HOLDFIXED=1;
SOLVE AUTA USING CNS;


*CNS = Constrained non-linear system;