$TITLE     PEP standard model 1-1, version 2.1
$STITLE    Single country static version, July 2013

*==============================================================================*
*                                                                              *
*           Except where otherwise noted, this work is licensed under          *
*               http://creativecommons.org/licenses/by-nc-sa/3.0/              *
*                                                                              *
*                                                                              *
*  You are free to share, to copy, distribute and transmit the work under      *
*  the following conditions:                                                   *
*                                                                              *
*  - Attribution:         You must attribute the work to:                      *
*                         Veronique Robichaud, Andre Lemelin,                  *
*                         Helene Maisonnave and Bernard Decaluwe.              *
*  - Noncommercial:       You may not use this work for commercial purposes.   *
*  - Share Alike:         If you alter, transform, or build upon this work,    *
*                         you may distribute the resulting work only under     *
*                         the same or similar license to this one.             *
*                                                                              *
*==============================================================================*

* 1 Set definition

** 1.1 Sectors and commodities

SET

J All industries
/
 agr             Agriculture and other primary industries
 ind             Manufacturing and construction
 ser             Services
 adm             Public administration
/

I All commodities
/
 agr             Agriculture and other primary commodities
 food            Food and beverages
 othind          Other manufacturing and construction
 ser             Services
 adm             Public administration
/

I1(I) All commodities except agriculture
/
* agr             Agriculture and other primary commodities
 food            Food and beverages
 othind          Other manufacturing and construction
 ser             Services
 adm             Public administration
/


** 1.2 Production factors

L Labor categories
/
 usk             Unskilled workers
 sk              Skilled workers
/

K Capital categories
/
 cap             Capital
 land            Land
/


** 1.3 Agents

AG All agents
/
 hrp             Poor rural households
 hup             Poor urban households
 hrr             Rich rural households
 hur             Rich urban households
 firm            Firms
 gvt             Government
 row             Rest of the world
/

AGNG(AG) Non governmental agents
/
 hrp             Poor rural households
 hup             Poor urban households
 hrr             Rich rural households
 hur             Rich urban households
 firm            Firms
* gvt             Government
 row             Rest of the world
/

AGD(AG) Domestic agents
/
 hrp             Poor rural households
 hup             Poor urban households
 hrr             Rich rural households
 hur             Rich urban households
 firm            Firms
 gvt             Government
* row             Rest of the world
/

H(AG) Households
/
 hrp             Poor rural households
 hup             Poor urban households
 hrr             Rich rural households
 hur             Rich urban households
/

F(AG) Firms
/
 firm            Firms
/
;

ALIAS (j,jj)
ALIAS (i,ij)
ALIAS (ag,agj)
ALIAS (h,hj)
ALIAS (l,lj)
ALIAS (k,kj)
;


* 2 Parameters and benchmark variables definition

** 2.1 Parameters

PARAMETERS
 aij(i,j)          Input output coefficient
 B_KD(j)           Scale parameter (CES - composite capital)
 B_LD(j)           Scale parameter (CES - composite labor)
 B_M(i)            Scale parameter (CES - composite commodity)
 B_VA(j)           Scale parameter (CES - value added)
 B_X(j,i)          Scale parameter (CET - exports and local sales)
 B_XT(j)           Scale parameter (CET - total output)
 beta_KD(k,j)      Share parameter (CES - composite capital)
 beta_LD(l,j)      Share parameter (CES - composite labor)
 beta_M(i)         Share parameter (CES - composite commodity)
 beta_VA(j)        Share parameter (CES - value added)
 beta_X(j,i)       Share parameter (CET - exports and local sales)
 beta_XT(j,i)      Share parameter (CET - total output)
 eta               Price elasticity of indexed transfers and parameters
 frisch(h)         Frisch parameter (LES function)
 gamma_GVT(i)      Share of commodity i in total current public expenditures on goods and services
 gamma_INV(i)      Share of commodity i in total investment expenditures
 gamma_LES(i,h)    Marginal share of commodity i in household h consumption budget
 io(j)             Coefficient (Leontief - intermediate consumption)
 kmob              Flag parameter (1 if capital is mobile)
 lambda_RK(ag,k)   Share of type k capital income received by agent ag
 lambda_TR(ag,agj) Share parameter (transfer functions)
 lambda_WL(h,l)    Share of type l labor income received by type h households
 rho_KD(j)         Elasticity parameter (CES - composite capital)
 rho_LD(j)         Elasticity parameter (CES - composite labor)
 rho_M(i)          Elasticity parameter (CES - composite commodity)
 rho_VA(j)         Elasticity parameter (CES - value added)
 rho_X(j,i)        Elasticity parameter (CET - exports and local sales)
 rho_XT(j)         Elasticity parameter (CET - total output)
 sigma_KD(j)       Elasticity (CES - composite capital)
 sigma_LD(j)       Elasticity (CES - composite labor)
 sigma_M(i)        Elasticity (CES - composite commodity)
 sigma_VA(j)       Elasticity (CES - value added)
 sigma_X(j,i)      Elasticity (CET - exports and local sales)
 sigma_XT(j)       Elasticity (CET - total output)
 sigma_XD(i)       Price elasticity of the world demand for exports of product i
 sigma_Y(i,h)      Income elasticity of consumption
 tmrg(i,ij)        Rate of margin i applied to commodity ij
 tmrg_X(i,ij)      Rate of margin i applied to exported commodity i
 v(j)              Coefficient (Leontief - value added)


** 2.2 Variables - Benchmark
* Benchmark values of variables are parameters.
* Their acronyms are the corresponding variable names,
* followed by the letter "O".

**  2.2.1 Volume variables
 CO(i,h)           Consumption of commodity i by type h households
 CGO(i)            Public consumption of commodity i
 CIO(j)            Total intermediate consumption of industry j
 CMINO(i,h)        Minimum consumption of commodity i by type h households
 CTH_REALO(h)      Real consumption budget of type h households
 DDO(i)            Domestic demand for commodity i produced locally
 DIO(i,j)          Intermediate consumption of commodity i by industry j
 DITO(i)           Total intermediate demand for commodity i
 DSO(j,i)          Supply of commodity i by sector j to the domestic market
 EXO(j,i)          Quantity of product i exported by sector j
 EXDO(i)           World demand for exports of product i
 G_REALO           Real current government expenditures on goods and services
 GDP_BP_REALO      Real GDP at basic prices
 GDP_MP_REALO      Real GDP at market prices
 GFCF_REALO        Real gross fixed capital formation
 IMO(i)            Quantity of product i imported
 INVO(i)           Final demand of commodity i for investment purposes (GFCF)
 KDO(k,j)          Demand for type k capital by industry j
 KDCO(j)           Industry j demand for composite capital
 KSO(k)            Supply of type k capital
 LDO(l,j)          Demand for type l labor by industry j
 LDCO(j)           Industry j demand for composite labor
 LSO(l)            Supply of type l labor
 MRGNO(i)          Demand for commodity i as a trade or transport margin
 QO(i)             Quantity demanded of composite commodity i
 VAO(j)            Value added of industry j
 VSTKO(i)          Inventory change of commodity i
 XSO(j,i)          Industry j production of commodity i
 XSTO(j)           Total aggregate output of industry j

**  2.2.2 Price variables
 eO                Exchange rate (price of foreign currency in local currency)
 PO(j,i)           Basic price of industry j's production of commodity i
 PCO(i)            Purchaser price of composite comodity i (including all taxes and margins)
 PCIO(j)           Intermediate consumption price index of industry j
 PDO(i)            Price of local product i sold on the domestic market (including all taxes and margins)
 PEO(i)            Price received for exported commodity i (excluding export taxes)
 PE_FOBO(i)        FOB price of exported commodity i (in local currency)
 PIXCONO           Consumer price index
 PIXGDPO           GDP deflator
 PIXGVTO           Public expenditures price index
 PIXINVO           Investment price index
 PLO(i)            Price of local product i (excluding all taxes on products)
 PMO(i)            Price of imported product i (including all taxes and tariffs)
 PPO(j)            Industry j unit cost including taxes directly related to the use of capital and labor but excluding other taxes on production
 PTO(j)            Basic price of industry j's output
 PVAO(j)           Price of industry j value added (including taxes on production directly related to the use of capital and labor)
 PWMO(i)           World price of imported product i (expressed in foreign currency)
 PWXO(i)           World price of exported product i (expressed in foreign currency)
 RO(k,j)           Rental rate of type k capital in industry j
 RCO(j)            Rental rate of industry j composite capital
 RKO(k)            Rental rate of type k capital (if capital is mobile)
 RTIO(k,j)         Rental rate paid by industry j for type k capital including capital taxes
 WO(l)             Wage rate of type l labor
 WCO(j)            Wage rate of industry j composite labor
 WTIO(l,j)         Wage rate paid by industry j for type l labor including payroll taxes

**  2.2.3 Nominal (value) variables
 CABO              Current account balance
 CTHO(h)           Consumption budget of type h households
 GO                Current government expenditures on goods and services
 GDP_BPO           GDP at basic prices
 GDP_FDO           GDP at purchasers' prices from the perspective of final demand
 GDP_IBO           GDP at market prices (income-based)
 GDP_MPO           GDP at market prices
 GFCFO             Gross fixed capital formation
 ITO               Total investment expenditures
 SFO(f)            Savings of type f businesses
 SGO               Government savings
 SHO(h)            Savings of type h households
 SROWO             Rest-of-the-world savings
 TDFO(f)           Income taxes of type f businesses
 TDFTO             Total government revenue from business income taxes
 TDHO(h)           Income taxes of type h households
 TDHTO             Total government revenue from household income taxes
 TICO(i)           Government revenue from indirect taxes on product i
 TICTO             Total government receipts of indirect taxes on commodities
 TIKO(k,j)         Government revenue from taxes on type k capital used by industry j
 TIKTO             Total government revenue from from taxes on capital
 TIMO(i)           Government revenue from import duties on product i
 TIMTO             Total government revenue from import duties
 TIPO(j)           Government revenue from taxes on industry j production (excluding taxes directly related to the use of capital and labor)
 TIPTO             Total government revenue from production taxes (excluding taxes directly related to the use of capital and labor)
 TIWO(l,j)         Government revenue from payroll taxes on type l labor in industry j
 TIWTO             Total government revenue from payroll taxes
 TIXO(i)           Government revenue from export taxes on product i
 TIXTO             Total government revenue from export taxes
 TPRCTSO           Total government revenue from taxes on products and imports
 TPRODNO           Total government revenue from other taxes on production
 TRO(ag,agj)       Transfers from agent agj to agent ag
 YDFO(f)           Disposable income of type f businesses
 YDHO(h)           Disposable income of type h households
 YFO(f)            Total income of type f businesses
 YFKO(f)           Capital income of type f businesses
 YFTRO(f)          Transfer income of type f businesses
 YGO               Total government income
 YGKO              Government capital income
 YGTRO             Government transfer income
 YHO(h)            Total income of type h households
 YHKO(h)           Capital income of type h households
 YHLO(h)           Labor income of type h households
 YHTRO(h)          Transfer income of type h households
 YROWO             Rest-of-the-world income

**  2.2.4 Rates and intercepts
 sh0O(h)           Intercept (type h household savings)
 sh1O(h)           Slope (type h household savings)
 tr0O(h)           Intercept (transfers by type h households to government)
 tr1O(h)           Marginal rate of transfers by type h households to government
 ttdf0O(f)         Intercept (income taxes of type f businesses)
 ttdf1O(f)         Marginal income tax rate of type f businesses
 ttdh0O(h)         Intercept (income taxes of type h households)
 ttdh1O(h)         Marginal income tax rate of type h households
 tticO(i)          Tax rate on commodity i
 ttikO(k,j)        Tax rate on type k capital used in industry j
 ttimO(i)          Rate of taxes and duties on imports of commodity i
 ttipO(j)          Tax rate on the production of industry j
 ttiwO(l,j)        Tax rate on type l worker compensation in industry j
 ttixO(i)          Export tax rate on exported commodity i
;


* 3 Data

** 3.1 Data from the SAM
*  SAM data are nominal values. However, several volume variables are
*  provisionally set equal to the corresponding nominal SAM value. Once the
*  benchmark prices have been set or calibrated, volumes will be re-calculated
*  (section 4.4).

PARAMETER
SAM(*,*,*,*);

$CALL GDXXRW.EXE data/SAM-V2_0.xls par=SAM rng=SAM!A4:AJ39 Rdim=2 Cdim=2
$CALL mv SAM-V2_0.gdx data/SAM-V2_0.gdx
$GDXIN data/SAM-V2_0.gdx
$LOAD SAM
$GDXIN

 CO(i,h)         = SAM('I',i,'AG',h);
 CGO(i)          = SAM('I',i,'AG','gvt');
 DSO(j,i)        = SAM('J',j,'I',i);
 DDO(i)          = SUM[j,DSO(j,i)];
 DIO(i,j)        = SAM('I',i,'J',j);
 EXO(j,i)        = SAM('J',j,'X',i);
 EXDO(i)         = SAM('X',i,'AG','ROW');
 INVO(i)         = SAM('I',i,'OTH','INV');
 VSTKO(i)        = SAM('I',i,'OTH','VSTK');
 IMO(i)          = SAM('AG','ROW','I',i);
 KDO(k,j)        = SAM('K',k,'J',j);
 LDO(l,j)        = SAM('L',l,'J',j);
 SFO(f)          = SAM('OTH','INV','AG',f);
 SGO             = SAM('OTH','INV','AG','GVT');
 SHO(h)          = SAM('OTH','INV','AG',h);
 SROWO           = SAM('OTH','INV','AG','ROW');
 TDFO(f)         = SAM('AG','TD','AG',f);
 TDHO(h)         = SAM('AG','TD','AG',h);
 TICO(i)         = SAM('AG','TI','I',i);
 TIKO(k,j)       = SAM('AG',k,'J',j);
 TIMO(i)         = SAM('AG','TM','I',i);
 TIPO(j)         = SAM('AG','GVT','J',j);
 TIXO(i)         = SAM('AG','GVT','X',i);
 TIWO(l,j)       = SAM('AG',l,'J',j);
 TRO(ag,agj)     = SAM('AG',ag,'AG',agj);
 lambda_RK(ag,k) = SAM('AG',ag,'K',k);
 lambda_WL(h,l)  = SAM('AG',h,'L',l);
 tmrg(i,ij)      = SAM('I',i,'I',ij);
 tmrg_X(i,ij)    = SAM('I',i,'X',ij);


** 3.2 Other data
** Some parameters cannot be calibrated using SAM values
** Exogenous parameters

PARAMETER
PARJ(j,*), PARI(i,*), PARJI(j,i), PARAG(*,*);

$CALL GDXXRW.EXE data/VAL_PAR.xlsx squeeze = 'no' par=PARJ rng=PAR!A5:E9 par=PARI rng=PAR!A12:C17 par=PARJI rng=PAR!A20:F24 par=PARAG rng=PAR!A27:F37
$CALL mv VAL_PAR.gdx data/VAL_PAR.gdx
$GDXIN data/VAL_PAR.gdx
$LOAD PARJ, PARI, PARJI, PARAG
$GDXIN


** CES and CET elasticities
 sigma_KD(j)     = PARJ(j,'sigma_KD');
 sigma_LD(j)     = PARJ(j,'sigma_LD');
 sigma_M(i)      = PARI(i,'sigma_M');
 sigma_VA(j)     = PARJ(j,'sigma_VA');
 sigma_X(j,i)    = PARJI(j,i);
 sigma_XT(j)     = PARJ(j,'sigma_XT');

** Elasticity of international demand for exported commodity i
 sigma_XD(i)     = PARI(i,'sigma_XD');

** LES parameters
 frisch(h)       = PARAG('frisch',h);
 sigma_y(i,h)    = PARAG(i,h);

** Intercepts of transfers, direct taxes and savings
*  One can either choose to assign a value to the intercept and calibrate
*  the slopes accordingly, or the other way around. This type of modelling
*  can be useful to take into account known marginal savings or taxation rates
*  or to deal with negative average saving rates in cases where savings are
*  negative for some household groups.
*  When no further information is available, one can simply set the intercepts
*  to zero and calibrate an average rate: this is what we do here.
 sh0O(h)         = PARAG('sh0O',h);
 tr0O(h)         = PARAG('tr0O',h);
 ttdf0O(f)       = PARAG('ttdf0O',f);
 ttdh0O(h)       = PARAG('ttdh0O',h);

** Price elasticity (should be set equal to one when verifying model homogeneity)
 eta             = 1;

** Also we need to assign values to some prices
 PLO(i)          = 1;
 PEO(i)          = 1;
 eO              = 1;
 PWMO(i)         = 1;
 WO(l)           = 1;
 RKO(k)          = 1;
 RO(k,j)         = RKO(k);


* 4 Calibration

** 4.1 Calculation of income and savings related variables and parameters

 YHKO(h)         = SUM[k,lambda_RK(h,k)];
 YHLO(h)         = SUM[l,lambda_WL(h,l)];
 YHTRO(h)        = SUM[ag,TRO(h,ag)];
 YHO(h)          = YHLO(h)+YHKO(h)+YHTRO(h);
 YDHO(h)         = YHO(h)-TDHO(h)-TRO('gvt',h);
 CTHO(h)         = YDHO(h)-SHO(h)-SUM[agng,TRO(agng,h)];

 YFKO(f)         = SUM[k,lambda_RK(f,k)];
 YFTRO(f)        = SUM[ag,TRO(f,ag)];
 YFO(f)          = YFKO(f)+YFTRO(f);
 YDFO(f)         = YFO(f)-TDFO(f);

 YGKO            = SUM[k,lambda_RK('gvt',k)];
 TDHTO           = SUM[h,TDHO(h)];
 TDFTO           = SUM[f,TDFO(f)];
 TICTO           = SUM[i,TICO(i)];
 TIMTO           = SUM[i,TIMO(i)];
 TIXTO           = SUM[i,TIXO(i)];
 TIWTO           = SUM[(l,j),TIWO(l,j)];
 TIKTO           = SUM[(k,j),TIKO(k,j)];
 TIPTO           = SUM[j,TIPO(j)];
 TPRODNO         = TIKTO+TIWTO+TIPTO;
 TPRCTSO         = TICTO+TIMTO+TIXTO;
 YGTRO           = SUM[ag,TRO('gvt',ag)];
 YGO             = YGKO+TDHTO+TDFTO+TPRODNO+TPRCTSO+YGTRO;

 YROWO           = SUM[i,IMO(i)]+SUM[k,lambda_RK('row',k)]
                  +SUM[ag,TRO('row',ag)];
 CABO            = -SROWO;

 ITO             = SUM[h,SHO(h)]+SUM[f,SFO(f)]+SGO+SROWO;

 lambda_RK(ag,k) = lambda_RK(ag,k)/SUM[j,KDO(k,j)];
 lambda_WL(h,l)  = lambda_WL(h,l)/SUM[j,LDO(l,j)];
 lambda_TR(agng,h)
                 = TRO(agng,h)/YDHO(h);
 lambda_TR(ag,f) = TRO(ag,f)/YDFO(f);

 sh1O(h)         = [SHO(h)-sh0O(h)]/YDHO(h);
 tr1O(h)         = [TRO('gvt',h)-tr0O(h)]/YHO(h);

** 4.2 Calibration of investment and government spending shares

 gamma_GVT(i)    = CGO(i)/SUM[ij,CGO(ij)];
 gamma_INV(i)    = INVO(i)/SUM[ij,INVO(ij)];


** 4.3 Calibration of direct tax rates

 ttdf1O(f)       = [TDFO(f)-ttdf0O(f)]/YFKO(f);
 ttdh1O(h)       = [TDHO(h)-ttdh0O(h)]/YHO(h);

** 4.4 Calibration of other tax rates, prices, margins and volumes

 PCO(i)          = [DDO(i)+IMO(i)+SUM(ij,tmrg(ij,i))+TICO(i)+TIMO(i)]
                  /[DDO(i)+IMO(i)];
 tmrg(i,ij)      = tmrg(i,ij)/PCO(i);
 tmrg_X(i,ij)    = tmrg_X(i,ij)/PCO(i);

 DDO(i)          = DDO(i)/PLO(i);
 IMO(i)          = IMO(i)/(PWMO(i)*eO);

 tmrg(i,ij)      = tmrg(i,ij)/{DDO(ij)+IMO(ij)};

 tticO(i)        = TICO(i)/{(PLO(i)+SUM[ij,PCO(ij)*tmrg(ij,i)])*DDO(i)
                           +(eO*PWMO(i)+SUM[ij,PCO(ij)*tmrg(ij,i)])*IMO(i)
                           +TIMO(i)};

 PDO(i)          = {PLO(i)+SUM[ij,PCO(ij)*tmrg(ij,i)]}*(1+tticO(i));

 ttimO(i)$IMO(i) = TIMO(i)/[eO*PWMO(i)*IMO(i)];

 PMO(i)          = {(1+ttimO(i))*eO*PWMO(i)+SUM[ij,PCO(ij)*tmrg(ij,i)]}
                   *(1+tticO(i));

 EXO(j,i)        = EXO(j,i)/PEO(i);
 tmrg_X(ij,i)$EXDO(i)
                 = tmrg_X(ij,i)/SUM[j,EXO(j,i)];
 ttixO(i)$EXDO(i)
                 = TIXO(i)/[EXDO(i)-TIXO(i)];
 PE_FOBO(i)      = (1+ttixO(i))*(PEO(i)+SUM[ij,PCO(ij)*tmrg_X(ij,i)]);
 PWXO(i)         = PE_FOBO(i)/eO;
 EXDO(i)         = EXDO(i)/(PWXO(i)*eO);

 DSO(j,i)        = DSO(j,i)/PLO(i);
 XSO(j,i)        = DSO(j,i)+EXO(j,i);
 PO(j,i)$XSO(j,i)= [PLO(i)*DSO(j,i)+PEO(i)*EXO(j,i)]/XSO(j,i);
 XSTO(j)         = SUM[i,XSO(j,i)];
 PTO(j)          = SUM[i$XSO(j,i),PO(j,i)*XSO(j,i)]/XSTO(j);

 QO(i)           = [PMO(i)*IMO(i)+PDO(i)*DDO(i)]/PCO(i);

 MRGNO(i)        = SUM[ij,tmrg(i,ij)*DDO(ij)]+
                   SUM[ij,tmrg(i,ij)*IMO(ij)]+
                   SUM[(j,ij),tmrg_X(i,ij)*EXO(j,ij)];

 CO(i,h)         = CO(i,h)/PCO(i);
 CGO(i)          = CGO(i)/PCO(i);
 DIO(i,j)        = DIO(i,j)/PCO(i);
 INVO(i)         = INVO(i)/PCO(i);
 VSTKO(i)        = VSTKO(i)/PCO(i);
 GFCFO           = ITO-SUM[i,PCO(i)*VSTKO(i)];

 CIO(j)          = SUM[i,DIO(i,j)];
 DITO(i)         = SUM[j,DIO(i,j)];
 GO              = SUM[i,PCO(i)*CGO(i)];

 PCIO(j)         = SUM[i,PCO(i)*DIO(i,j)]/CIO(j);

 ttiwO(l,j)$LDO(l,j)
                 = TIWO(l,j)/LDO(l,j);
 WTIO(l,j)       = WO(l)*(1+ttiwO(l,j));
 ttikO(k,j)$KDO(k,j)
                 = TIKO(k,j)/KDO(k,j);
 RTIO(k,j)       = RO(k,j)*(1+ttikO(k,j));

 LDO(l,j)        = LDO(l,j)/WO(l);
 LDCO(j)         = SUM[l,LDO(l,j)];
 LSO(l)          = SUM[j,LDO(l,j)];
 WCO(j)$LDCO(j)  = SUM[l,WTIO(l,j)*LDO(l,j)]/LDCO(j);

 KDO(k,j)        = KDO(k,j)/RO(k,j);
 KDCO(j)         = SUM[k,KDO(k,j)];
 KSO(k)          = SUM[j,KDO(k,j)];
 RCO(j)$KDCO(j)  = SUM[k,RTIO(k,j)*KDO(k,j)]/KDCO(j);

 VAO(j)          = LDCO(j)+KDCO(j);
 PVAO(j)         = [WCO(j)*LDCO(j)+RCO(j)*KDCO(j)]/VAO(j);

 ttipO(j)        = TIPO(j)/{PVAO(j)*VAO(j)+SUM[i,PCO(i)*DIO(i,j)]};

 PPO(j)          = PTO(j)/(1+ttipO(j));

* PIXGDPO is tautologically equal to 1, based on its formula
* PIXGDPO         = {SUM[j,{(PVAO(j)*VAO(j)+TIPO(j))/VAO(j)}*VAO(j)]
*                   /SUM[j,{(PVAO(j)*VAO(j)+TIPO(j))/VAO(j)}*VAO(j)]
*                   *SUM[j,{(PVAO(j)*VAO(j)+TIPO(j))/VAO(j)}*VAO(j)]
*                   /SUM[j,{(PVAO(j)*VAO(j)+TIPO(j))/VAO(j)}*VAO(j)]}**0.5;
 PIXGDPO         = 1;

* PIXCONO is tautologically equal to 1, based on its formula
* PIXCONO         = SUM[i,PCO(i)*SUM[h,CO(i,h)]]/SUM[i,PCO(i)*SUM[h,CO(i,h)]];
 PIXCONO         = 1;

* PIXGVTO is tautologically equal to 1, based on its formula
* PIXGVTO         = PROD[i$gamma_GVT(i),(PCO(i)/PCO(i))**gamma_GVT(i)];
 PIXGVTO         = 1;

* PIXINVO is tautologically equal to 1, based on its formula
* PIXINVO         = PROD[i$gamma_INV(i),(PCO(i)/PCO(i))**gamma_INV(i)];
 PIXINVO         = 1;

** 4.5 Calibration of indexed transfers and parameters

 TRO(agd,'row')  = TRO(agd,'row')/PIXCONO**eta;
 TRO(agng,'gvt') = TRO(agng,'gvt')/PIXCONO**eta;
 ttdf0O(f)       = ttdf0O(f)/PIXCONO**eta;
 ttdh0O(h)       = ttdh0O(h)/PIXCONO**eta;
 sh0O(h)         = sh0O(h)/PIXCONO**eta;
 tr0O(h)         = tr0O(h)/PIXCONO**eta;


** 4.6 Calibration of function parameters

**  4.6.1 Leontief functions
 io(j)           = CIO(j)/XSTO(j);
 v(j)            = VAO(j)/XSTO(j);
 aij(i,j)        = DIO(i,j)/CIO(j);

**  4.6.2 Calibration of CET parameters
**   4.6.2.1 CET between commodities
 rho_XT(j)       = (1+sigma_XT(j))/sigma_XT(j);
 beta_XT(j,i)$XSO(j,i)
                 = PO(j,i)*XSO(j,i)**(1-rho_XT(j))/
                   SUM[ij$XSO(j,ij),PO(j,ij)*XSO(j,ij)**(1-rho_XT(j))];
 B_XT(j)         = XSTO(j)
                  /SUM[i$XSO(j,i),beta_XT(j,i)*XSO(j,i)**rho_XT(j)
                  ]**(1/rho_XT(j));

**   4.6.2.2 CET between exports and local production
 rho_X(j,i)$[EXO(j,i) and DSO(j,i)]
                 = (1+sigma_X(j,i))/sigma_X(j,i);
 rho_X(j,i)$[(not EXO(j,i)) or (not DSO(j,i))]
                 = 1;
 beta_X(j,i)$XSO(j,i)
                 = PEO(i)*EXO(j,i)**(1-rho_X(j,i))/
                  [PEO(i)*EXO(j,i)**(1-rho_X(j,i))
                  +PLO(i)*DSO(j,i)**(1-rho_X(j,i))];
 B_X(j,i)$XSO(j,i)
                 = XSO(j,i)/
                 [beta_X(j,i)*EXO(j,i)**rho_X(j,i)+
                 (1-beta_X(j,i))*DSO(j,i)**rho_X(j,i)]
                 **(1/rho_X(j,i));

**  4.6.3 Calibration of CES parameters
**   4.6.3.1 Composite good
 rho_M(i)$[IMO(i) and DDO(i)]
                 = (1-sigma_M(i))/sigma_M(i);
 rho_M(i)$[(not IMO(i)) or (not DDO(i))]
                 = -1;
 beta_M(i)$QO(i) = PMO(i)*IMO(i)**(rho_M(i)+1)/
                  [PMO(i)*IMO(i)**(rho_M(i)+1)+
                   PDO(i)*DDO(i)**(rho_M(i)+1)];
 B_M(i)$QO(i)    = QO(i)
                   /[beta_M(i)*IMO(i)**(-rho_M(i))+
                   (1-beta_M(i))*DDO(i)**(-rho_M(i))
                   ]**(-1/rho_M(i));

**   4.6.3.2 Composite capital
 rho_KD(j)$KDCO(j)
                 = (1-sigma_KD(j))/sigma_KD(j);
 beta_KD(k,j)$KDO(k,j)
                 = RTIO(k,j)*KDO(k,j)**(rho_KD(j)+1)/
                   SUM[kj,RTIO(kj,j)*KDO(kj,j)**(rho_KD(j)+1)];
 B_KD(j)$KDCO(j) = KDCO(j)
                  /SUM[k$KDO(k,j),beta_KD(k,j)*KDO(k,j)**(-rho_KD(j))
                  ]**(-1/rho_KD(j));

**   4.6.3.3 Composite labor
 rho_LD(j)       = (1-sigma_LD(j))/sigma_LD(j);
 beta_LD(l,j)$LDO(l,j)
                 = WTIO(l,j)*LDO(l,j)**(rho_LD(j)+1)/
                   SUM[lj,WTIO(lj,j)*LDO(lj,j)**(rho_LD(j)+1)];
 B_LD(j)$LDCO(j) = LDCO(j)/SUM[l,beta_LD(l,j)$LDO(l,j)*LDO(l,j)**(-rho_LD(j))]
                            **(-1/rho_LD(j));

**   4.6.3.4 Value added
 rho_VA(j)$[KDCO(j) and LDCO(j)]
                 = (1-sigma_VA(j))/sigma_VA(j);
 rho_VA(j)$[(not KDCO(j)) or (not LDCO(j))]
                 = -1;
 beta_VA(j)      = WCO(j)*LDCO(j)**(rho_VA(j)+1)/
                  [WCO(j)*LDCO(j)**(rho_VA(j)+1)+
                   RCO(j)*KDCO(j)**(rho_VA(j)+1)];
 B_VA(j)         = VAO(j)
                   /[beta_VA(j)*LDCO(j)**(-rho_VA(j))+
                   (1-beta_VA(j))*KDCO(j)**(-rho_VA(j))
                   ]**(-1/rho_VA(j));



**  4.6.4 Calibration of LES parameters
*   As the assigned values of income elasticities may not result in
*   consumption shares that add up to 1, this first step
*   adjusts the elasticities proportionnaly

 sigma_Y(i,h)    = sigma_Y(i,h)*CTHO(h)/SUM[ij,sigma_Y(ij,h)*PCO(ij)*CO(ij,h)];
 gamma_LES(i,h)  = PCO(i)*CO(i,h)*sigma_Y(i,h)/CTHO(h);
 CMINO(i,h)      = CO(i,h)+gamma_LES(i,h)*[CTHO(h)/
                  (PCO(i)*frisch(h))];

** 4.7 Calibration of gross domestic products

 GDP_BPO         = SUM[j,PVAO(j)*VAO(j)]+TIPTO;
 GDP_MPO         = GDP_BPO+TPRCTSO;
 GDP_IBO         = SUM[(l,j),WO(l)*LDO(l,j)]+SUM[(k,j),RO(k,j)*KDO(k,j)]
                   +TPRODNO+TPRCTSO;
 GDP_FDO         = SUM{i,PCO(i)*(SUM[h,CO(i,h)]+CGO(i)+INVO(i)+VSTKO(i))}
                  +SUM[i,PE_FOBO(i)*EXDO(i)]-SUM[i,PWMO(i)*eO*IMO(i)];

** 4.8 Calibration of real (volume) variables computed from price indices
 CTH_REALO(h)    = CTHO(h)/PIXCONO;
 G_REALO         = GO/PIXGVTO;
 GDP_BP_REALO    = GDP_BPO/PIXGDPO;
 GDP_MP_REALO    = GDP_MPO/PIXCONO;
 GFCF_REALO      = GFCFO/PIXINVO;
 
DISPLAY sh0O, sh1O, tr0O, tr1O, ttdf0O, ttdf1O, ttdh0O, ttdh1O, tticO,
ttikO, ttimO, ttipO, ttiwO, ttixO, lambda_RK, lambda_WL, beta_X,
XSO, EXO, rho_X, DSO tmrg tmrg_X, PMO;

* 5 Model

** 5.1 Variable definition

VARIABLES

**  5.1.1 Volume variables
 C(i,h)          Consumption of commodity i by type h households
 CG(i)           Public final consumption of commodity i
 CI(j)           Total intermediate consumption of industry j
 CMIN(i,h)       Minimum consumption of commodity i by type h households
 CTH_REAL(h)     Real consumption budget of type h households
 DD(i)           Domestic demand for commodity i produced locally
 DI(i,j)         Intermediate consumption of commodity i by industry j
 DIT(i)          Total intermediate demand for commodity i
 DS(j,i)         Supply of commodity i by sector j to the domestic market
 EX(j,i)         Quantity of product i exported by sector j
 EXD(i)          World demand for exports of product x
 G_REAL          Real current government expenditures on goods and services
 GDP_BP_REAL     Real GDP at basic prices
 GDP_MP_REAL     Real GDP at market prices
 GFCF_REAL       Real gross fixed capital formation
 IM(i)           Quantity of product i imported
 INV(i)          Final demand of commodity i for investment purposes (GFCF)
 KD(k,j)         Demand for type k capital by industry j
 KDC(j)          Industry j demand for composite capital
 KS(k)           Supply of type k capital
 LD(l,j)         Demand for type l labor by industry j
 LDC(j)          Industry j demand for composite labor
 LS(l)           Supply of type l labor
 MRGN(i)         Demand for commodity i as a trade or transport margin
 Q(i)            Quantity demanded of composite commodity i
 VA(j)           Value added of industry j
 VSTK(i)         Inventory change of commodity i
 XS(j,i)         Industry j production of commodity i
 XST(j)          Total aggregate output of industry j

**  5.1.2 Price variables
 e               Exchange rate (price of foreign currency in local currency)
 P(j,i)          Basic price of industry j's production of commodity i
 PC(i)           Purchaser price of composite comodity i (including all taxes and margins)
 PCI(j)          Intermediate consumption price index of industry j
 PD(i)           Price of local product i sold on the domestic market (including all taxes and margins)
 PE(i)           Price received for exported commodity i (excluding export taxes)
 PE_FOB(i)       FOB price of exported commodity i (in local currency)
 PIXCON          Consumer price index
 PIXGDP          GDP deflator
 PIXGVT          Public expenditures price index
 PIXINV          Investment price index
 PL(i)           Price of local product i (excluding all taxes on products)
 PM(i)           Price of imported product i (including all taxes and tariffs)
 PP(j)           Industry j unit cost including taxes directly related to the use of capital and labor but excluding other taxes on production
 PT(j)           Basic price of industry j's output
 PVA(j)          Price of industry j value added (including taxes on production directly related to the use of capital and labor)
 PWM(i)          World price of imported product i (expressed in foreign currency)
 PWX(i)          World price of exported product i (expressed in foreign currency)
 R(k,j)          Rental rate of type k capital in industry j
 RC(j)           Rental rate of industry j composite capital
 RK(k)           Rental rate of type k capital (if capital is mobile)
 RTI(k,j)        Rental rate paid by industry j for type k capital including capital taxes
 W(l)            Wage rate of type l labor
 WC(j)           Wage rate of industry j composite labor
 WTI(l,j)        Wage rate paid by industry j for type l labor including payroll taxes

**  5.1.3 Nominal (value) variables
 CAB             Current account balance
 CTH(h)          Consumption budget of type h households
 G               Current government expenditures on goods and services
 GDP_BP          GDP at basic prices
 GDP_FD          GDP at purchasers' prices from the perspective of final demand
 GDP_IB          GDP at market prices (income-based)
 GDP_MP          GDP at market prices
 GFCF            Gross fixed capital formation
 IT              Total investment expenditures
 SF(f)           Savings of type f businesses
 SG              Government savings
 SH(h)           Savings of type h households
 SROW            Rest-of-the-world savings
 TDF(f)          Income taxes of type f businesses
 TDFT            Total government revenue from business income taxes
 TDH(h)          Income taxes of type h households
 TDHT            Total government revenue from household income taxes
 TIC(i)          Government revenue from indirect taxes on product i
 TICT            Total government receipts of indirect taxes on commodities
 TIK(k,j)        Government revenue from taxes on type k capital used by industry j
 TIKT            Total government revenue from from taxes on capital
 TIM(i)          Government revenue from import duties on product i
 TIMT            Total government revenue from import duties
 TIP(j)          Government revenue from taxes on industry j production (excluding taxes directly related to the use of capital and labor)
 TIPT            Total government revenue from production taxes (excluding taxes directly related to the use of capital and labor)
 TIW(l,j)        Government revenue from payroll taxes on type l labor in industry j
 TIWT            Total government revenue from payroll taxes
 TIX(i)          Government revenue from export taxes on product i
 TIXT            Total government revenue from export taxes
 TPRCTS          Total government revenue from taxes on products and imports
 TPRODN          Total government revenue from other taxes on production
 TR(ag,agj)      Transfers from agent agj to agent ag
 YDF(f)          Disposable income of type f businesses
 YDH(h)          Disposable income of type h households
 YF(f)           Total income of type f businesses
 YFK(f)          Capital income of type f businesses
 YFTR(f)         Transfer income of type f businesses
 YG              Total government income
 YGK             Government capital income
 YGTR            Government transfer income
 YH(h)           Total income of type h households
 YHK(h)          Capital income of type h households
 YHL(h)          Labor income of type h households
 YHTR(h)         Transfer income of type h households
 YROW            Rest-of-the-world income

**  5.1.4 Rates and intercepts
 sh0(h)          Intercept (type h household savings)
 sh1(h)          Slope (type h household savings)
 tr0(h)          Intercept (transfers by type h households to government)
 tr1(h)          Marginal rate of transfers by type h households to government
 ttdf0(f)        Intercept (income taxes of type f businesses)
 ttdf1(f)        Marginal income tax rate of type f businesses
 ttdh0(h)        Intercept (income taxes of type h households)
 ttdh1(h)        Marginal income tax rate of type h households
 ttic(i)         Tax rate on commodity i
 ttik(k,j)       Tax rate on type k capital used in industry j
 ttim(i)         Rate of taxes and duties on imports of commodity i
 ttip(j)         Tax rate on the production of industry j
 ttiw(l,j)       Tax rate on type l worker compensation in industry j
 ttix(i)         Export tax rate on exported commodity i

**  5.1.5 Other variables
 LEON            Excess supply on the last market
;


** 5.2 Equation definition

EQUATIONS

 EQ1(j)          Value added demand in industry j (Leontief)
 EQ2(j)          Total intermediate consumption demand in industry j (Leontief)
 EQ3(j)          CES between of composite labor and capital
 EQ4(j)          Relative demand for composite labor and capital by industry j(CES)
 EQ5(j)          CES between labor categories
 EQ6(l,j)        Demand for type l labor by industry j (CES)
 EQ7(j)          CES between capital categories
 EQ8(k,j)        Demand for type k capital by industry j (CES)
 EQ9(i,j)        Intermediate consumption of commodity i by industry j (Leontief)
 EQ10(h)         Total income of type h households
 EQ11(h)         Labor income of type h households
 EQ12(h)         Capital income of type h households
 EQ13(h)         Transfer income of type h households
 EQ14(h)         Disposable income of type h households
 EQ15(h)         Consumption budget of type h households
 EQ16(h)         Savings of type h households
 EQ17(f)         Total income of type f businesses
 EQ18(f)         Capital income of type f businesses
 EQ19(f)         Transfer income of type f businesses
 EQ20(f)         Disposable income of type f businesses
 EQ21(f)         Savings of type f businesses
 EQ22            Total government income
 EQ23            Government capital income
 EQ24            Total government revenue from household income taxes
 EQ25            Total government revenue from business income taxes
 EQ26            Total government revenue from other taxes on production
 EQ27            Total government receipts of indirect taxes on wages
 EQ28            Total government receipts of indirect taxes on capital
 EQ29            Total government revenue from production taxes
 EQ30            Total government revenue from taxes on products and imports
 EQ31            Total government receipts of indirect taxes on commodities
 EQ32            Total government revenue from import duties
 EQ33            Total government revenue from export taxes
 EQ34            Government transfer income
 EQ35(h)         Income taxes of type h households
 EQ36(f)         Income taxes of type f businesses
 EQ37(l,j)       Government revenue from payroll taxes on type l labor in industry j
 EQ38(k,j)       Government revenue from taxes on type k capital used by industry j
 EQ39(j)         Government revenue from taxes on industry j production
 EQ40(i)         Government revenue from indirect taxes on product i
 EQ41(i)         Government revenue from import duties on product i
 EQ42(i)         Government revenue from export taxes on product i
 EQ43            Government savings
 EQ44            Rest-of-the-world income
 EQ45            Rest-of-the-world savings
 EQ46            Equivalence between current account balance and ROW savings
 EQ47(agng,h)    Transfers from household h to agent agng
 EQ48(h)         Transfers from household h to government
 EQ49(ag,f)      Transfers from type f businesses to agent ag
 EQ50(agng)      Public transfers
 EQ51(agd)       Transfers from abroad
 EQ52(i,h)       Consumption of commodity i by type h households
 EQ53            Gross fixed capital formation
 EQ54(i)         Final demand of commodity i for investment purposes (GFCF)
 EQ55(i)         Public final consumption of commodity i
 EQ56(i)         Total intermediate demand for commodity i
 EQ57(i)         Demand for commodity i as a trade or transport margin
 EQ58(j)         CET between different commodities produced by industry j
 EQ59(j,i)       Industry j production of commodity i (CET)
 EQ60(j,i)       CET between exports and local commodity
 EQ61(j,i)       Relative supply of exports and local commodity (CET)
 EQ62(i)         World demand for exports of product i
 EQ63(i)         CES between imports and local production
 EQ64(i)         Demand for imports (CES)
 EQ65(j)         Industry j unit cost
 EQ66(j)         Basic price of industry j's production of commodity i
 EQ67(j)         Intermediate consumption price index of industry j
 EQ68(j)         Price of industry j value added
* EQ69(j)         Wage rate of industry j composite labor
 EQ70(l,j)       Wage rate paid by industry j for type l labor including payroll taxes
* EQ71(j)         Rental rate of industry j composite capital
 EQ72(k,j)       Rental rate paid by industry j for type k capital including capital taxes
 EQ73(k,j)       Rental rate of type k capital (if capital is mobile)
 EQ74(j,i)       Total producer price is equal to P if there is only one product
 EQ75(j,i)       Basic price of industry j's production of commodity i
 EQ76(i)         Price received for exported commodity i (excluding export taxes)
 EQ77(i)         Price of local product i sold on the domestic market (including all taxes and margins)
 EQ78(i)         Price of imported product i (including all taxes and tariffs)
 EQ79(i)         Purchaser price of composite comodity i
 EQ80            GDP deflator (Fischer index)
 EQ81            Consumer price index (Laspeyres)
 EQ82            Investment price index (derived from investment function)
 EQ83            Public expenditures price index
 EQ84(i1)        Domestic absorbtion
 EQ85(l)         Labor supply equals labor demand
 EQ86(k)         Capital supply equals capital demand
 EQ87            Total investment equals total savings
 EQ88            Supply of domestic production equals local demand
 EQ89(i)         Supply of exports equals international world demand
 EQ90            GDP at basic prices
 EQ91            GDP at market prices
 EQ92            GDP at market prices (income-based)
 EQ93            GDP at purchasers' prices from the perspective of final demand
 EQ94(h)         Real consumption budget of type h households
 EQ95            Real current government expenditures on goods and services
 EQ96            Real GDP at basic prices
 EQ97            Real GDP at market prices
 EQ98            Real gross fixed capital formation

 WALRAS          Walras law verification
;

** 5.3 Equations

**  5.3.1 Production

 EQ1(j)..        VA(j) =e= v(j)*XST(j);

 EQ2(j)..        CI(j) =e= io(j)*XST(j);

 EQ3(j)..        VA(j) =e= B_VA(j)*{
                               [beta_VA(j)*LDC(j)**(-rho_VA(j))]$LDCO(j)
                              +[(1-beta_VA(j))*KDC(j)**(-rho_VA(j))]$KDCO(j)
                                   }**(-1/rho_VA(j));

 EQ4(j)$[LDCO(j) and KDCO(j)]..
                 LDC(j) =e= {[beta_VA(j)/(1-beta_VA(j))]*[RC(j)/WC(j)]}
                           **sigma_VA(j)*KDC(j);

 EQ5(j)$LDCO(j)..
                 LDC(j) =e= B_LD(j)*SUM[l$LDO(l,j),beta_LD(l,j)*LD(l,j)
                            **(-rho_LD(j))]**(-1/rho_LD(j));

 EQ6(l,j)$LDO(l,j)..
                 LD(l,j) =e= [beta_LD(l,j)*WC(j)/WTI(l,j)]**sigma_LD(j)
                             *B_LD(j)**(sigma_LD(j)-1)*LDC(j);

 EQ7(j)$KDCO(j)..
                 KDC(j) =e= B_KD(j)*SUM[k$KDO(k,j),beta_KD(k,j)*KD(k,j)
                            **(-rho_KD(j))]**(-1/rho_KD(j));

 EQ8(k,j)$KDO(k,j)..
                 KD(k,j) =e= [beta_KD(k,j)*RC(j)/RTI(k,j)]**sigma_KD(j)
                             *B_KD(j)**(sigma_KD(j)-1)*KDC(j);

 EQ9(i,j)..      DI(i,j) =e= aij(i,j)*CI(j);

**  5.3.2 Income and savings
**    5.3.2.1 Households

 EQ10(h)..       YH(h) =e= YHL(h)+YHK(h)+YHTR(h);

 EQ11(h)..       YHL(h) =e= SUM{l,lambda_WL(h,l)*W(l)*SUM[j$LDO(l,j),LD(l,j)]};

 EQ12(h)..       YHK(h) =e= SUM{k,lambda_RK(h,k)*SUM[j$KDO(k,j),R(k,j)*KD(k,j)]};

 EQ13(h)..       YHTR(h) =e= SUM[ag,TR(h,ag)];

 EQ14(h)..       YDH(h) =e= YH(h)-TDH(h)-TR('gvt',h);

 EQ15(h)..       CTH(h) =e= YDH(h)-SH(h)-SUM[agng,TR(agng,h)];

 EQ16(h)..       SH(h) =e= PIXCON**eta*sh0(h)+sh1(h)*YDH(h);


**    5.3.2.2 Firms

 EQ17(f)..       YF(f) =e= YFK(f)+YFTR(f);

 EQ18(f)..       YFK(f) =e= SUM{k,lambda_RK(f,k)*SUM[j$KDO(k,j),R(k,j)*KD(k,j)]};

 EQ19(f)..       YFTR(f) =e= SUM[ag,TR(f,ag)];

 EQ20(f)..       YDF(f) =e= YF(f)-TDF(f);

 EQ21(f)..       SF(f) =e= YDF(f)-SUM[ag,TR(ag,f)];

**    5.3.2.3 Government

 EQ22..          YG =e= YGK+TDHT+TDFT+TPRODN+TPRCTS+YGTR;

 EQ23..          YGK =e= SUM{k,lambda_RK('gvt',k)*SUM[j$KDO(k,j),R(k,j)*KD(k,j)]};

 EQ24..          TDHT =e= SUM[h,TDH(h)];

 EQ25..          TDFT =e= SUM[f,TDF(f)];

 EQ26..          TPRODN =e= TIWT+TIKT+TIPT;

 EQ27..          TIWT =e= SUM[(l,j)$LDO(l,j),TIW(l,j)];

 EQ28..          TIKT =e= SUM[(k,j)$KDO(k,j),TIK(k,j)];

 EQ29..          TIPT =e= SUM[j,TIP(j)];

 EQ30..          TPRCTS =e= TICT+TIMT+TIXT;

 EQ31..          TICT =e= SUM[i,TIC(i)];

 EQ32..          TIMT =e= SUM[i$IMO(i),TIM(i)];

 EQ33..          TIXT =e= SUM[i$EXDO(i),TIX(i)];

 EQ34..          YGTR =e= SUM[agng,TR('gvt',agng)];

 EQ35(h)..       TDH(h) =e= PIXCON**eta*ttdh0(h)+ttdh1(h)*YH(h);

 EQ36(f)..       TDF(f) =e= PIXCON**eta*ttdf0(f)+ttdf1(f)*YFK(f);

 EQ37(l,j)$LDO(l,j)..
                 TIW(l,j) =e= ttiw(l,j)*W(l)*LD(l,j);

 EQ38(k,j)$KDO(k,j)..
                 TIK(k,j) =e= ttik(k,j)*R(k,j)*KD(k,j);

 EQ39(j)..       TIP(j) =e= ttip(j)*PP(j)*XST(j);

 EQ40(i)..       TIC(i) =e= ttic(i)*{
                 [(PL(i)+SUM[ij,PC(ij)*tmrg(ij,i)])*DD(i)]$DDO(i)
                +[((1+ttim(i))*e*PWM(i)+SUM[ij,PC(ij)*tmrg(ij,i)])*IM(i)]$IMO(i)
                                    };

 EQ41(i)$IMO(i)..
                 TIM(i) =e= ttim(i)*e*PWM(i)*IM(i);

 EQ42(i)$EXDO(i)..
                 TIX(i) =e= ttix(i)*{PE(i)+SUM[ij,PC(ij)*tmrg_X(ij,i)]}*EXD(i);

 EQ43..          SG =e= YG-SUM[agng,TR(agng,'gvt')]-G;

**    5.3.2.4 Rest of the world

 EQ44..          YROW =e= e*SUM[i$IMO(i),PWM(i)*IM(i)]
                       +SUM{k,lambda_RK('row',k)*SUM[j$KDO(k,j),R(k,j)*KD(k,j)]}
                       +SUM[agd,TR('row',agd)];

 EQ45..          SROW =e= YROW-SUM[i$EXDO(i),PE_FOB(i)*EXD(i)]
                         -SUM[agd,TR(agd,'row')];

 EQ46..          SROW =e= -CAB;

**    5.3.2.5 Transfers

 EQ47(agng,h)..  TR(agng,h) =e= lambda_TR(agng,h)*YDH(h);

 EQ48(h)..       TR('gvt',h) =e= PIXCON**eta*tr0(h)+tr1(h)*YH(h);

 EQ49(ag,f)..    TR(ag,f) =e= lambda_TR(ag,f)*YDF(f);

 EQ50(agng)..    TR(agng,'gvt') =e= PIXCON**eta*TRO(agng,'gvt');

 EQ51(agd)..     TR(agd,'row') =e= PIXCON**eta*TRO(agd,'row');


**  5.3.3 Demand

 EQ52(i,h)..     PC(i)*C(i,h) =e= PC(i)*CMIN(i,h)+gamma_LES(i,h)*{CTH(h)-
                                  SUM[ij,PC(ij)*CMIN(ij,h)]};

 EQ53..          GFCF =e= IT-SUM[i,PC(i)*VSTK(i)];

 EQ54(i)..       PC(i)*INV(i) =e= gamma_INV(i)*GFCF;

 EQ55(i)..       PC(i)*CG(i) =e= gamma_GVT(i)*G;

 EQ56(i)..       DIT(i) =e= SUM[j,DI(i,j)];

 EQ57(i)..       MRGN(i) =e= SUM[ij$DDO(ij),tmrg(i,ij)*DD(ij)]
                            +SUM[ij$IMO(ij),tmrg(i,ij)*IM(ij)]
                            +SUM[ij$EXDO(ij),tmrg_X(i,ij)*EXD(ij)];


**  5.3.4 International trade

 EQ58(j)..       XST(j) =e= B_XT(j)*SUM[i$XSO(j,i),beta_XT(j,i)*XS(j,i)
                            **rho_XT(j)]**(1/rho_XT(j));

 EQ59(j,i)${XSO(j,i) and [XSO(j,i) ne XSTO(j)]}..
                 XS(j,i) =e= XST(j)/B_XT(j)**(1+sigma_XT(j))*
                             {P(j,i)/[beta_XT(j,i)*PT(j)]}**sigma_XT(j);

 EQ60(j,i)$XSO(j,i)..
                 XS(j,i) =e= B_X(j,i)*{
                               [beta_X(j,i)*EX(j,i)**rho_X(j,i)]$EXO(j,i)
                              +[(1-beta_X(j,i))*DS(j,i)**rho_X(j,i)]$DSO(j,i)
                                      }**(1/rho_X(j,i));

 EQ61(j,i)$[EXO(j,i) and DSO(j,i)]..
                 EX(j,i) =e= {[(1-beta_X(j,i))/beta_X(j,i)]*[PE(i)/PL(i)]}
                           **sigma_X(j,i)*DS(j,i);

 EQ62(i)$EXDO(i)..
                 EXD(i)  =e=  EXDO(i)*[e*PWX(i)/PE_fob(i)]**sigma_XD(i);

 EQ63(i)..       Q(i) =e= B_M(i)*{
                                  [beta_M(i)*IM(i)**(-rho_M(i))]$IMO(i)
                                 +[(1-beta_M(i))*DD(i)**(-rho_M(i))]$DDO(i)
                                 }**(-1/rho_M(i));

 EQ64(i)$[IMO(i) and DDO(i)]..
                 IM(i) =e= {[beta_M(i)/(1-beta_M(i))]*[PD(i)/PM(i)]}
                           **sigma_M(i)*DD(i);

**  5.3.5 Prices

 EQ65(j)..       PP(j)*XST(j) =e= PVA(j)*VA(j)+PCI(j)*CI(j);

 EQ66(j)..       PT(j) =e= (1+ttip(j))*PP(j);

 EQ67(j)..       PCI(j)*CI(j) =e= SUM[i,PC(i)*DI(i,j)];

 EQ68(j)..       PVA(j)*VA(j) =e= [WC(j)*LDC(j)]$LDCO(j)
                                 +[RC(j)*KDC(j)]$KDCO(j);

* Given the way equation 6 is written, equation 69 is redundant
* EQ69(j)..       WC(j)*LDC(j) =e= SUM[l$LDO(l,j),WTI(l,j)*LD(l,j)];

 EQ70(l,j)..     WTI(l,j) =e= W(l)*(1+ttiw(l,j));

* Given the way equation 8 is written, equation 71 is redundant
* EQ71(j)$(kmob and KDCO(j))..
*                 RC(j)*KDC(j) =e= SUM[k$KDO(k,j),RTI(k,j)*KD(k,j)];

 EQ72(k,j)$KDO(k,j)..
                 RTI(k,j) =e= R(k,j)*(1+ttik(k,j));

 EQ73(k,j)$(kmob and KDO(k,j))..
                 R(k,j) =e= RK(k);

* Given the way equation 59 is written, equation 74 is redundant if
* a sector produces more than one commodity
* EQ74(j)..      PT(j)*XST(j) =e= SUM[i,P(j,i)*XS(j,i)];

 EQ74(j,i)$[XSO(j,i) eq XSTO(j)]..
                 P(j,i) =e= PT(j);

 EQ75(j,i)$XSO(j,i)..
                 P(j,i)*XS(j,i) =e= [PE(i)*EX(j,i)]$EXO(j,i)
                                   +[PL(i)*DS(j,i)]$DSO(j,i);

 EQ76(i)$EXDO(i)..
                 PE_FOB(i) =e= (1+ttix(i))*{PE(i)+SUM[ij,PC(ij)*tmrg_X(ij,i)]};

 EQ77(i)$DDO(i)..
                 PD(i) =e= (1+ttic(i))*{PL(i)+SUM[ij,PC(ij)*tmrg(ij,i)]};

 EQ78(i)$IMO(i)..
                 PM(i) =e= (1+ttic(i))*{(1+ttim(i))*
                           e*PWM(i)+SUM[ij,PC(ij)*tmrg(ij,i)]};

 EQ79(i)..       PC(i)*Q(i) =e=[PM(i)*IM(i)]$IMO(i)
                              +[PD(i)*DD(i)]$DDO(i);

 EQ80..          PIXGDP =e= {SUM[j,{(PVA(j)*VA(j)+TIP(j))/VA(j)}*VAO(j)]
                            /SUM[j,{(PVAO(j)*VAO(j)+TIPO(j))/VAO(j)}*VAO(j)]
                            *SUM[j,{(PVA(j)*VA(j)+TIP(j))/VA(j)}*VA(j)]
                            /SUM[j,{(PVAO(j)*VAO(j)+TIPO(j))/VAO(j)}*VA(j)]}**0.5;

 EQ81..          PIXCON =e= SUM[i,PC(i)*SUM[h,CO(i,h)]]
                           /SUM[i,PCO(i)*SUM[h,CO(i,h)]];

 EQ82..          PIXINV =e= PROD[i$gamma_INV(i),(PC(i)/PCO(i))**gamma_INV(i)];

 EQ83..          PIXGVT =e= PROD[i$gamma_GVT(i),(PC(i)/PCO(i))**gamma_GVT(i)];

**  5.3.6 Equilibrium

 EQ84(i1)..      Q(i1) =e= SUM[h,C(i1,h)]+CG(i1)+INV(i1)+VSTK(i1)+DIT(i1)
                           +MRGN(i1);

 EQ85(l)..       LS(l) =e= SUM[j$LDO(l,j),LD(l,j)];

 EQ86(k)..       KS(k) =e= SUM[j$KDO(k,j),KD(k,j)];

 EQ87..          IT =e= SUM[h,SH(h)]+SUM[f,SF(f)]+SG+SROW;

 EQ88(i)$DDO(i)..
                 SUM[j$DSO(j,i),DS(j,i)] =e= DD(i);

 EQ89(i)$EXDO(i)..
                 SUM[j$EXO(j,i),EX(j,i)] =e= EXD(i);


**  5.3.7 Gross domestic product

 EQ90..          GDP_BP =e= SUM[j,PVA(j)*VA(j)]+TIPT;

 EQ91..          GDP_MP =e= GDP_BP+TPRCTS;

 EQ92..          GDP_IB =e= SUM[(l,j)$LDO(l,j),W(l)*LD(l,j)]
                           +SUM[(k,j)$KDO(k,j),R(k,j)*KD(k,j)]
                           +TPRODN+TPRCTS;

 EQ93..          GDP_FD =e= SUM[i,PC(i)*(SUM[h,C(i,h)]+CG(i)+INV(i)+VSTK(i))]
                           +SUM[i$EXDO(i),PE_FOB(i)*EXD(i)]
                           -SUM[i$IMO(i),PWM(i)*e*IM(i)];

**  5.3.8 Real variables

 EQ94(h)..       CTH_REAL(h) =e= CTH(h)/PIXCON;

 EQ95..          G_REAL =e= G/PIXGVT;

 EQ96..          GDP_BP_REAL =e= GDP_BP/PIXGDP;

 EQ97..          GDP_MP_REAL =e= GDP_MP/PIXCON;

 EQ98..          GFCF_REAL =e= GFCF/PIXINV;

**  5.3.9 Other

 WALRAS..        LEON =e= Q('agr')-SUM[h,C('agr',h)]-CG('agr')-INV('agr')
                          -VSTK('agr')-DIT('agr')-MRGN('agr');


* 6 Numerical resolution

** 6.1 Variable initialisation
**  6.1.1 Volume variables
 C.l(i,h)        = CO(i,h);
 CG.l(i)         = CGO(i);
 CI.l(j)         = CIO(j);
 CMIN.l(i,h)     = CMINO(i,h);
 DD.l(i)         = DDO(i);
 DI.l(i,j)       = DIO(i,j);
 DIT.l(i)        = DITO(i);
 DS.l(j,i)       = DSO(j,i);
 EX.l(j,i)       = EXO(j,i);
 EXD.l(i)        = EXDO(i);
 IM.l(i)         = IMO(i);
 INV.l(i)        = INVO(i);
 KD.l(k,j)       = KDO(k,j);
 KDC.l(j)        = KDCO(j);
 KS.l(k)         = KSO(k);
 LD.l(l,j)       = LDO(l,j);
 LDC.l(j)        = LDCO(j);
 LS.l(l)         = LSO(l);
 MRGN.l(i)       = MRGNO(i);
 Q.l(i)          = QO(i);
 VA.l(j)         = VAO(j);
 VSTK.l(i)       = VSTKO(i);
 XS.l(j,i)       = XSO(j,i);
 XST.l(j)        = XSTO(j);

**  6.1.2 Price variables
 e.l             = eO;
 P.l(j,i)        = PO(j,i);
 PC.l(i)         = PCO(i);
 PCI.l(j)        = PCIO(j);
 PD.l(i)         = PDO(i);
 PE.l(i)         = PEO(i);
 PE_FOB.l(i)     = PE_FOBO(i);
 PIXCON.l        = PIXCONO;
 PIXGDP.l        = PIXGDPO;
 PIXGVT.l        = PIXGVTO;
 PIXINV.l        = PIXINVO;
 PL.l(i)         = PLO(i);
 PM.l(i)         = PMO(i);
 PP.l(j)         = PPO(j);
 PT.l(j)         = PTO(j);
 PVA.l(j)        = PVAO(j);
 PWM.l(i)        = PWMO(i);
 PWX.l(i)        = PWXO(i);
 R.l(k,j)        = RO(k,j);
 RC.l(j)         = RCO(j);
 RK.l(k)         = RKO(k);
 RTI.l(k,j)      = RTIO(k,j);
 W.l(l)          = WO(l);
 WC.l(j)         = WCO(j);
 WTI.l(l,j)      = WTIO(l,j);

**  6.1.3 Nominal (value) variables
 CAB.l           = CABO;
 CTH.l(h)        = CTHO(h);
 G.l             = GO;
 GDP_BP.l        = GDP_BPO;
 GDP_FD.l        = GDP_FDO;
 GDP_IB.l        = GDP_IBO;
 GDP_MP.l        = GDP_MPO;
 GFCF.l          = GFCFO;
 IT.l            = ITO;
 SF.l(f)         = SFO(f);
 SG.l            = SGO;
 SH.l(h)         = SHO(h);
 SROW.l          = SROWO;
 TDF.l(f)        = TDFO(f);
 TDFT.l          = TDFTO;
 TDH.l(h)        = TDHO(h);
 TDHT.l          = TDHTO;
 TIC.l(i)        = TICO(i);
 TICT.l          = TICTO;
 TIK.l(k,j)      = TIKO(k,j);
 TIKT.l          = TIKTO;
 TIM.l(i)        = TIMO(i);
 TIMT.l          = TIMTO;
 TIP.l(j)        = TIPO(j);
 TIPT.l          = TIPTO;
 TIW.l(l,j)      = TIWO(l,j);
 TIWT.l          = TIWTO;
 TIX.l(i)        = TIXO(i);
 TIXT.l          = TIXTO;
 TPRCTS.l        = TPRCTSO;
 TPRODN.l        = TPRODNO;
 TR.l(ag,agj)    = TRO(ag,agj);
 YDF.l(f)        = YDFO(f);
 YDH.l(h)        = YDHO(h);
 YF.l(f)         = YFO(f);
 YFK.l(f)        = YFKO(f);
 YFTR.l(f)       = YFTRO(f);
 YG.l            = YGO;
 YGK.l           = YGKO;
 YGTR.l          = YGTRO;
 YH.l(h)         = YHO(h);
 YHK.l(h)        = YHKO(h);
 YHL.l(h)        = YHLO(h);
 YHTR.l(h)       = YHTRO(h);
 YROW.l          = YROWO;

** 6.1.4 Real (volume) variables computed from price indices
 CTH_REAL.l(h)   = CTH_REALO(h);
 G_REAL.l        = G_REALO;
 GDP_BP_REAL.l   = GDP_BP_REALO;
 GDP_MP_REAL.l   = GDP_MP_REALO;
 GFCF_REAL.l     = GFCF_REALO;

**  6.1.5 Rates and intercepts
 sh0.l(h)        = sh0O(h);
 sh1.l(h)        = sh1O(h);
 tr0.l(h)        = tr0O(h);
 tr1.l(h)        = tr1O(h);
 ttdf0.l(f)      = ttdf0O(f);
 ttdf1.l(f)      = ttdf1O(f);
 ttdh0.l(h)      = ttdh0O(h);
 ttdh1.l(h)      = ttdh1O(h);
 ttic.l(i)       = tticO(i);
 ttik.l(k,j)     = ttikO(k,j);
 ttim.l(i)       = ttimO(i);
 ttip.l(j)       = ttipO(j);
 ttiw.l(l,j)     = ttiwO(l,j);
 ttix.l(i)       = ttixO(i);

**  6.1.6  Other
 LEON.l          = 0;

** 6.2 Choice of mobile or sector-specific capital

*  If kmob=1, capital is mobile, if kmob=0, it is sector-specific
 kmob            = 1;
 KD.fx(k,j)$(kmob eq 0)
                 = KDO(k,j);
 KS.fx(k)$kmob   = KSO(k);

** 6.3 Closures
*  The numeraire is the nominal exchange rate

 e.fx            = 1;
 CAB.fx          = CABO;
 CMIN.fx(i,h)    = CMINO(i,h);
 G.fx            = GO;
 LS.fx(l)        = LSO(l);
 PWM.fx(i)       = PWMO(i);
 PWX.fx(i)       = PWXO(i);
 VSTK.fx(i)      = VSTKO(i);
 sh0.fx(h)       = sh0O(h);
 sh1.fx(h)       = sh1O(h);
 tr0.fx(h)       = tr0O(h);
 tr1.fx(h)       = tr1O(h);
 ttdf0.fx(f)     = ttdf0O(f);
 ttdf1.fx(f)     = ttdf1O(f);
 ttdh0.fx(h)     = ttdh0O(h);
 ttdh1.fx(h)     = ttdh1O(h);
 ttic.fx(i)      = tticO(i);
 ttik.fx(k,j)    = ttikO(k,j);
 ttim.fx(i)      = ttimO(i);
 ttip.fx(j)      = ttipO(j);
 ttiw.fx(l,j)    = ttiwO(l,j);
 ttix.fx(i)      = ttixO(i);
 

** 6.4 Simulations
*  25% increase of international import price of AGR
* PWM.fx('agr')   = PWMO('agr')*1.25;

*  25% decrease of the indirect tax rates on all commodities
* ttix.fx(i)         = ttixO(i)*0.75;

*  20% increase of public expenditures
 G.fx            = GO*1.2;

** 6.5 Resolution
option limrow = 10000;
OPTION NLP = conopt3
MODEL PEP11 Standard PEP static model version 2_1 /ALL/;
PEP11.HOLDFIXED=1;
SOLVE PEP11 USING CNS;
$include RESULTS PEP 1-1.GMS
