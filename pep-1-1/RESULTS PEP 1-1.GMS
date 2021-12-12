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

SET

SCEN Scenarios
/
 BASE            Initial values
 SIM1            After shock values
 VAR             Variation from benchmark (in percentage)
/

PARAMETER

 valC(i,h,scen)       Consumption of commodity i by type h households
 valCAB(scen)         Current account balance
 valCG(i,scen)        Public final consumption of commodity i
 valCI(j,scen)        Total intermediate consumption of industry j
 valCMIN(i,h,scen)    Minimum consumption of commodity i by type h households
 valCTH(h,scen)       Consumption budget of type h households
 valCTH_REAL(h,scen)  Real consumption budget of type h households
 valDD(i,scen)        Domestic demand for commodity i produced locally
 valDI(i,j,scen)      Intermediate consumption of commodity i by industry j
 valDIT(i,scen)       Total intermediate demand for commodity i
 valDS(j,i,scen)      Supply of commodity i by sector j to the domestic market
 vale(scen)           Exchange rate (price of foreign currency in local currency)
 valEX(j,i,scen)      Quantity of product x exported by sector j
 valEXD(i,scen)       World demand for exports of product x
 valG(scen)           Current government expenditures on goods and services
 valG_REAL(scen)      Real current government expenditures on goods and services
 valGDP_BP(scen)      GDP at basic prices
 valGDP_BP_REAL(scen) Real GDP at basic prices
 valGDP_FD(scen)      GDP at purchasers' prices from the perspective of final demand
 valGDP_IB(scen)      GDP at market prices (income-based)
 valGDP_MP(scen)      GDP at market prices
 valGDP_MP_REAL(scen) Real GDP at market prices
 valGFCF(scen)        Gross fixed capital formation
 valGFCF_REAL(scen)   Real gross fixed capital formation
 valIM(i,scen)        Quantity of product m imported
 valINV(i,scen)       Final demand of commodity i for investment purposes (GFCF)
 valIT(scen)          Total investment expenditures
 valKD(k,j,scen)      Demand for type k capital by industry j
 valKDC(j,scen)       Industry j demand for composite capital
 valKS(k,scen)        Supply of type k capital
 valLD(l,j,scen)      Demand for type l labor by industry j
 valLDC(j,scen)       Industry j demand for composite labor
 valLS(l,scen)        Supply of type l labor
 valMRGN(i,scen)      Demand for commodity i as a trade or transport margin
 valP(j,i,scen)       Basic price of industry j's production of commodity i
 valPC(i,scen)        Purchaser price of composite comodity i (including all taxes and margins)
 valPCI(j,scen)       Intermediate consumption price index of industry j
 valPD(i,scen)        Price of local product i sold on the domestic market (including all taxes and margins)
 valPE(i,scen)        Price received for exported commodity x (excluding export taxes)
 valPE_FOB(i,scen)    FOB price of exported commodity x (in local currency)
 valPIXCON(scen)      Consumer price index
 valPIXGDP(scen)      GDP deflator
 valPIXGVT(scen)      Public expenditures price index
 valPIXINV(scen)      Investment price index
 valPL(i,scen)        Price of local product i (excluding all taxes on products)
 valPM(i,scen)        Price of imported product m (including all taxes and tariffs)
 valPP(j,scen)        Industry j unit cost including taxes directly related to the use of capital and labor but excluding other taxes on production
 valPT(j,scen)        Basic price of industry j's output
 valPVA(j,scen)       Price of industry j value added (including taxes on production directly related to the use of capital and labour)
 valPWM(i,scen)       World price of imported product m (expressed in foreign currency)
 valPWX(i,scen)       World price of exported product x (expressed in foreign currency)
 valQ(i,scen)         Quantity demanded of composite commodity i
 valR(k,j,scen)       Rental rate of type k capital in industry j
 valRC(j,scen)        Rental rate of industry j composite capital
 valRK(k,scen)        Rental rate of type k capital (if capital is mobile)
 valRTI(k,j,scen)     Rental rate paid by industry j for type k capital including capital taxes
 valSF(f,scen)        Savings of type f businesses
 valSG(scen)          Government savings
 valSH(h,scen)        Savings of type h households
 valsh0(h,scen)       Intercept (type h household savings)
 valsh1(h,scen)       Slope (type h household savings)
 valSROW(scen)        Rest-of-the-world savings
 valTDF(f,scen)       Income taxes of type f businesses
 valTDFT(scen)        Total government revenue from business income taxes
 valTDH(h,scen)       Income taxes of type h households
 valTDHT(scen)        Total government revenue from household income taxes
 valTIC(i,scen)       Government revenue from indirect taxes on product i
 valTICT(scen)        Total government receipts of indirect taxes on commodities
 valTIK(k,j,scen)     Government revenue from taxes on type k capital used by industry j
 valTIKT(scen)        Total government revenue from from taxes on capital
 valTIM(i,scen)       Government revenue from import duties on product m
 valTIMT(scen)        Total government revenue from import duties
 valTIP(j,scen)       Government revenue from taxes on industry j production (excluding taxes directly related to the use of capital and labor)
 valTIPT(scen)        Total government revenue from production taxes (excluding taxes directly related to the use of capital and labor)
 valTIW(l,j,scen)     Government revenue from payroll taxes on type l labor in industry j
 valTIWT(scen)        Total government revenue from payroll taxes
 valTIX(i,scen)       Government revenue from export taxes on product x
 valTIXT(scen)        Total government revenue from export taxes
 valTPRCTS(scen)      Total government revenue from taxes on products and imports
 valTPRODN(scen)      Total government revenue from other taxes on production
 valTR(ag,agj,scen)   Transfers from agent agj to agent ag
 valtr0(h,scen)       Intercept (transfers by type h households to government)
 valtr1(h,scen)       Marginal rate of transfers by type h households to government
 valttdf0(f,scen)     Intercept (income taxes of type f businesses)
 valttdf1(f,scen)     Marginal income tax rate of type f businesses
 valttdh0(h,scen)     Intercept (income taxes of type h households)
 valttdh1(h,scen)     Marginal income tax rate of type h households
 valttic(i,scen)      Tax rate on commodity i
 valttik(k,j,scen)    Tax rate on type k capital used in industry j
 valttim(i,scen)      Rate of taxes and duties on imports of commodity i
 valttip(j,scen)      Tax rate on the production of industry j
 valttiw(l,j,scen)    Tax rate on type l worker compensation in industry j
 valttix(i,scen)      Export tax rate on exported commodity i
 valVA(j,scen)        Value added of industry j
 valVSTK(i,scen)      Inventory change of commodity i
 valW(l,scen)         Wage rate of type l labor
 valWC(j,scen)        Wage rate of industry j composite labor
 valWTI(l,j,scen)     Wage rate paid by industry j for type l labor including payroll taxes
 valXS(j,i,scen)      Industry j production of commodity i
 valXST(j,scen)       Total aggregate output of industry j
 valYDF(f,scen)       Disposable income of type f businesses
 valYDH(h,scen)       Disposable income of type h households
 valYF(f,scen)        Total income of type f businesses
 valYFK(f,scen)       Capital income of type f businesses
 valYFTR(f,scen)      Transfer income of type f businesses
 valYG(scen)          Total government income
 valYGK(scen)         Government capital income
 valYGTR(scen)        Government transfer income
 valYH(h,scen)        Total income of type h households
 valYHK(h,scen)       Capital income of type h households
 valYHL(h,scen)       Labor income of type h households
 valYHTR(h,scen)      Transfer income of type h households
 valYROW(scen)        Rest-of-the-world income
;
 valC(i,h,'base')        = CO(i,h);
 valCAB('base')          = CABO;
 valCG(i,'base')         = CGO(i);
 valCI(j,'base')         = CIO(j);
 valCMIN(i,h,'base')     = CMINO(i,h);
 valCTH(h,'base')        = CTHO(h);
 valCTH_REAL(h,'base')   = CTH_REALO(h);
 valDD(i,'base')         = DDO(i);
 valDI(i,j,'base')       = DIO(i,j);
 valDIT(i,'base')        = DITO(i);
 valDS(j,i,'base')       = DSO(j,i);
 vale('base')            = eO;
 valEX(j,i,'base')       = EXO(j,i);
 valEXD(i,'base')        = EXDO(i);
 valG('base')            = GO;
 valG_REAL('base')       = G_REALO;
 valGFCF('base')         = GFCFO;
 valGFCF_REAL('base')    = GFCF_REALO;
 valGDP_BP('base')       = GDP_BPO;
 valGDP_BP_REAL('base')  = GDP_BP_REALO;
 valGDP_FD('base')       = GDP_FDO;
 valGDP_IB('base')       = GDP_IBO;
 valGDP_MP('base')       = GDP_MPO;
 valGDP_MP_REAL('base')  = GDP_MP_REALO;
 valIM(i,'base')         = IMO(i);
 valINV(i,'base')        = INVO(i);
 valIT('base')           = ITO;
 valKD(k,j,'base')       = KDO(k,j);
 valKDC(j,'base')        = KDCO(j);
 valKS(k,'base')         = KSO(k);
 valLD(l,j,'base')       = LDO(l,j);
 valLDC(j,'base')        = LDCO(j);
 valLS(l,'base')         = LSO(l);
 valMRGN(i,'base')       = MRGNO(i);
 valP(j,i,'base')        = PO(j,i);
 valPC(i,'base')         = PCO(i);
 valPCI(j,'base')        = PCIO(j);
 valPD(i,'base')         = PDO(i);
 valPE(i,'base')         = PEO(i);
 valPE_FOB(i,'base')     = PE_FOBO(i);
 valPIXCON('base')       = PIXCONO;
 valPIXGDP('base')       = PIXGDPO;
 valPIXGVT('base')       = PIXGVTO;
 valPIXINV('base')       = PIXINVO;
 valPL(i,'base')         = PLO(i);
 valPM(i,'base')         = PMO(i);
 valPP(j,'base')         = PPO(j);
 valPT(j,'base')         = PTO(j);
 valPVA(j,'base')        = PVAO(j);
 valPWM(i,'base')        = PWMO(i);
 valPWX(i,'base')        = PWXO(i);
 valQ(i,'base')          = QO(i);
 valR(k,j,'base')        = RO(k,j);
 valRC(j,'base')         = RCO(j);
 valRK(k,'base')         = RKO(k);
 valRTI(k,j,'base')      = RTIO(k,j);
 valSF(f,'base')         = SFO(f);
 valSG('base')           = SGO;
 valSH(h,'base')         = SHO(h);
 valsh0(h,'base')        = sh0O(h);
 valsh1(h,'base')        = sh1O(h);
 valSROW('base')         = SROWO;
 valTDF(f,'base')        = TDFO(f);
 valTDFT('base')         = TDFTO;
 valTDH(h,'base')        = TDHO(h);
 valTDHT('base')         = TDHTO;
 valTIC(i,'base')        = TICO(i);
 valTICT('base')         = TICTO;
 valTIK(k,j,'base')      = TIKO(k,j);
 valTIKT('base')         = TIKTO;
 valTIM(i,'base')        = TIMO(i);
 valTIMT('base')         = TIMTO;
 valTIP(j,'base')        = TIPO(j);
 valTIPT('base')         = TIPTO;
 valTIW(l,j,'base')      = TIWO(l,j);
 valTIWT('base')         = TIWTO;
 valTIX(i,'base')        = TIXO(i);
 valTIXT('base')         = TIXTO;
 valTPRCTS('base')       = TPRCTSO;
 valTPRODN('base')       = TPRODNO;
 valTR(ag,agj,'base')    = TRO(ag,agj);
 valtr0(h,'base')        = tr0O(h);
 valtr1(h,'base')        = tr1O(h);
 valttdf0(f,'base')      = ttdf0O(f);
 valttdf1(f,'base')      = ttdf1O(f);
 valttdh0(h,'base')      = ttdh0O(h);
 valttdh1(h,'base')      = ttdh1O(h);
 valttic(i,'base')       = tticO(i);
 valttik(k,j,'base')     = ttikO(k,j);
 valttim(i,'base')       = ttimO(i);
 valttip(j,'base')       = ttipO(j);
 valttiw(l,j,'base')     = ttiwO(l,j);
 valttix(i,'base')       = ttixO(i);
 valVA(j,'base')         = VAO(j);
 valVSTK(i,'base')       = VSTKO(i);
 valW(l,'base')          = WO(l);
 valWC(j,'base')         = WCO(j);
 valWTI(l,j,'base')      = WTIO(l,j);
 valXS(j,i,'base')       = XSO(j,i);
 valXST(j,'base')        = XSTO(j);
 valYDF(f,'base')        = YDFO(f);
 valYDH(h,'base')        = YDHO(h);
 valYF(f,'base')         = YFO(f);
 valYFK(f,'base')        = YFKO(f);
 valYFTR(f,'base')       = YFTRO(f);
 valYG('base')           = YGO;
 valYGK('base')          = YGKO;
 valYGTR('base')         = YGTRO;
 valYH(h,'base')         = YHO(h);
 valYHK(h,'base')        = YHKO(h);
 valYHL(h,'base')        = YHLO(h);
 valYHTR(h,'base')       = YHTRO(h);
 valYROW('base')         = YROWO;

 valC(i,h,'sim1')        = C.L(i,h);
 valCAB('sim1')          = CAB.L;
 valCG(i,'sim1')         = CG.L(i);
 valCI(j,'sim1')         = CI.L(j);
 valCMIN(i,h,'sim1')     = CMIN.L(i,h);
 valCTH(h,'sim1')        = CTH.L(h);
 valCTH_REAL(h,'sim1')   = CTH_REAL.L(h);
 valDD(i,'sim1')         = DD.L(i);
 valDI(i,j,'sim1')       = DI.L(i,j);
 valDIT(i,'sim1')        = DIT.L(i);
 valDS(j,i,'sim1')       = DS.L(j,i);
 vale('sim1')            = e.L;
 valEX(j,i,'sim1')       = EX.L(j,i);
 valEXD(i,'sim1')        = EXD.L(i);
 valG('sim1')            = G.L;
 valG_REAL('sim1')       = G_REAL.L;
 valGFCF('sim1')         = GFCF.L;
 valGFCF_REAL('sim1')    = GFCF_REAL.L;
 valGDP_BP('sim1')       = GDP_BP.L;
 valGDP_BP_REAL('sim1')  = GDP_BP_REAL.L;
 valGDP_FD('sim1')       = GDP_FD.L;
 valGDP_IB('sim1')       = GDP_IB.L;
 valGDP_MP('sim1')       = GDP_MP.L;
 valGDP_MP_REAL('sim1')  = GDP_MP_REAL.L;
 valIM(i,'sim1')         = IM.L(i);
 valINV(i,'sim1')        = INV.L(i);
 valIT('sim1')           = IT.L;
 valKD(k,j,'sim1')       = KD.L(k,j);
 valKDC(j,'sim1')        = KDC.L(j);
 valKS(k,'sim1')         = KS.L(k);
 valLD(l,j,'sim1')       = LD.L(l,j);
 valLDC(j,'sim1')        = LDC.L(j);
 valLS(l,'sim1')         = LS.L(l);
 valMRGN(i,'sim1')       = MRGN.L(i);
 valP(j,i,'sim1')        = P.L(j,i);
 valPC(i,'sim1')         = PC.L(i);
 valPCI(j,'sim1')        = PCI.L(j);
 valPD(i,'sim1')         = PD.L(i);
 valPE(i,'sim1')         = PE.L(i);
 valPE_FOB(i,'sim1')     = PE_FOB.L(i);
 valPIXCON('sim1')       = PIXCON.L;
 valPIXGDP('sim1')       = PIXGDP.L;
 valPIXGVT('sim1')       = PIXGVT.L;
 valPIXINV('sim1')       = PIXINV.L;
 valPL(i,'sim1')         = PL.L(i);
 valPM(i,'sim1')         = PM.L(i);
 valPP(j,'sim1')         = PP.L(j);
 valPT(j,'sim1')         = PT.L(j);
 valPVA(j,'sim1')        = PVA.L(j);
 valPWM(i,'sim1')        = PWM.L(i);
 valPWX(i,'sim1')        = PWX.L(i);
 valQ(i,'sim1')          = Q.L(i);
 valR(k,j,'sim1')        = R.L(k,j);
 valRC(j,'sim1')         = RC.L(j);
 valRK(k,'sim1')         = RK.L(k);
 valRTI(k,j,'sim1')      = RTI.L(k,j);
 valSF(f,'sim1')         = SF.L(f);
 valSG('sim1')           = SG.L;
 valSH(h,'sim1')         = SH.L(h);
 valsh0(h,'sim1')        = sh0.L(h);
 valsh1(h,'sim1')        = sh1.L(h);
 valSROW('sim1')         = SROW.L;
 valTDF(f,'sim1')        = TDF.L(f);
 valTDFT('sim1')         = TDFT.L;
 valTDH(h,'sim1')        = TDH.L(h);
 valTDHT('sim1')         = TDHT.L;
 valTIC(i,'sim1')        = TIC.L(i);
 valTICT('sim1')         = TICT.L;
 valTIK(k,j,'sim1')      = TIK.L(k,j);
 valTIKT('sim1')         = TIKT.L;
 valTIM(i,'sim1')        = TIM.L(i);
 valTIMT('sim1')         = TIMT.L;
 valTIP(j,'sim1')        = TIP.L(j);
 valTIPT('sim1')         = TIPT.L;
 valTIW(l,j,'sim1')      = TIW.L(l,j);
 valTIWT('sim1')         = TIWT.L;
 valTIX(i,'sim1')        = TIX.L(i);
 valTIXT('sim1')         = TIXT.L;
 valTPRCTS('sim1')       = TPRCTS.L;
 valTPRODN('sim1')       = TPRODN.L;
 valTR(ag,agj,'sim1')    = TR.L(ag,agj);
 valtr0(h,'sim1')        = tr0.L(h);
 valtr1(h,'sim1')        = tr1.L(h);
 valttdf0(f,'sim1')      = ttdf0.L(f);
 valttdf1(f,'sim1')      = ttdf1.L(f);
 valttdh0(h,'sim1')      = ttdh0.L(h);
 valttdh1(h,'sim1')      = ttdh1.L(h);
 valttic(i,'sim1')       = ttic.L(i);
 valttik(k,j,'sim1')     = ttik.L(k,j);
 valttim(i,'sim1')       = ttim.L(i);
 valttip(j,'sim1')       = ttip.L(j);
 valttiw(l,j,'sim1')     = ttiw.L(l,j);
 valttix(i,'sim1')       = ttix.L(i);
 valVA(j,'sim1')         = VA.L(j);
 valVSTK(i,'sim1')       = VSTK.L(i);
 valW(l,'sim1')          = W.L(l);
 valWC(j,'sim1')         = WC.L(j);
 valWTI(l,j,'sim1')      = WTI.L(l,j);
 valXS(j,i,'sim1')       = XS.L(j,i);
 valXST(j,'sim1')        = XST.L(j);
 valYDF(f,'sim1')        = YDF.L(f);
 valYDH(h,'sim1')        = YDH.L(h);
 valYF(f,'sim1')         = YF.L(f);
 valYFK(f,'sim1')        = YFK.L(f);
 valYFTR(f,'sim1')       = YFTR.L(f);
 valYG('sim1')           = YG.L;
 valYGK('sim1')          = YGK.L;
 valYGTR('sim1')         = YGTR.L;
 valYH(h,'sim1')         = YH.L(h);
 valYHK(h,'sim1')        = YHK.L(h);
 valYHL(h,'sim1')        = YHL.L(h);
 valYHTR(h,'sim1')       = YHTR.L(h);
 valYROW('sim1')         = YROW.L;

 valC(i,h,'var')$CO(i,h)            = (valC(i,h,'sim1')/valC(i,h,'base')-1)*100;
 valCAB('var')$CABO                 = (valCAB('sim1')/valCAB('base')-1)*100;
 valCG(i,'var')$CGO(i)              = (valCG(i,'sim1')/valCG(i,'base')-1)*100;
 valCI(j,'var')$CIO(j)              = (valCI(j,'sim1')/valCI(j,'base')-1)*100;
 valCMIN(i,h,'var')$CMINO(i,h)      = (valCMIN(i,h,'sim1')/valCMIN(i,h,'base')-1)*100;
 valCTH(h,'var')$CTHO(h)            = (valCTH(h,'sim1')/valCTH(h,'base')-1)*100;
 valCTH_REAL(h,'var')$CTH_REALO(h)  = (valCTH_REAL(h,'sim1')/valCTH_REAL(h,'base')-1)*100;
 valDD(i,'var')$DDO(i)              = (valDD(i,'sim1')/valDD(i,'base')-1)*100;
 valDI(i,j,'var')$DIO(i,j)          = (valDI(i,j,'sim1')/valDI(i,j,'base')-1)*100;
 valDIT(i,'var')$DITO(i)            = (valDIT(i,'sim1')/valDIT(i,'base')-1)*100;
 valDS(j,i,'var')$DSO(j,i)          = (valDS(j,i,'sim1')/valDS(j,i,'base')-1)*100;
 vale('var')$eO                     = (vale('sim1')/vale('base')-1)*100;
 valEX(j,i,'var')$EXO(j,i)          = (valEX(j,i,'sim1')/valEX(j,i,'base')-1)*100;
 valEXD(i,'var')$EXDO(i)            = (valEXD(i,'sim1')/valEXD(i,'base')-1)*100;
 valG('var')$GO                     = (valG('sim1')/valG('base')-1)*100;
 valG_REAL('var')$G_REALO           = (valG_REAL('sim1')/valG_REAL('base')-1)*100;
 valGFCF('var')$GFCFO               = (valGFCF('sim1')/valGFCF('base')-1)*100;
 valGFCF_REAL('var')$GFCF_REALO     = (valGFCF_REAL('sim1')/valGFCF_REAL('base')-1)*100;
 valGDP_BP('var')$GDP_BPO           = (valGDP_BP('sim1')/valGDP_BP('base')-1)*100;
 valGDP_BP_REAL('var')$GDP_BP_REALO = (valGDP_BP_REAL('sim1')/valGDP_BP_REAL('base')-1)*100;
 valGDP_FD('var')$GDP_FDO           = (valGDP_FD('sim1')/valGDP_FD('base')-1)*100;
 valGDP_IB('var')$GDP_IBO           = (valGDP_IB('sim1')/valGDP_IB('base')-1)*100;
 valGDP_MP('var')$GDP_MPO           = (valGDP_MP('sim1')/valGDP_MP('base')-1)*100;
 valGDP_MP_REAL('var')$GDP_MP_REALO = (valGDP_MP_REAL('sim1')/valGDP_MP_REAL('base')-1)*100;
 valIM(i,'var')$IMO(i)              = (valIM(i,'sim1')/valIM(i,'base')-1)*100;
 valINV(i,'var')$INVO(i)            = (valINV(i,'sim1')/valINV(i,'base')-1)*100;
 valIT('var')$ITO                   = (valIT('sim1')/valIT('base')-1)*100;
 valKD(k,j,'var')$KDO(k,j)          = (valKD(k,j,'sim1')/valKD(k,j,'base')-1)*100;
 valKDC(j,'var')$KDCO(j)            = (valKDC(j,'sim1')/valKDC(j,'base')-1)*100;
 valKS(k,'var')$KSO(k)              = (valKS(k,'sim1')/valKS(k,'base')-1)*100;
 valLD(l,j,'var')$LDO(l,j)          = (valLD(l,j,'sim1')/valLD(l,j,'base')-1)*100;
 valLDC(j,'var')$LDCO(j)            = (valLDC(j,'sim1')/valLDC(j,'base')-1)*100;
 valLS(l,'var')$LSO(l)              = (valLS(l,'sim1')/valLS(l,'base')-1)*100;
 valMRGN(i,'var')$MRGNO(i)          = (valMRGN(i,'sim1')/valMRGN(i,'base')-1)*100;
 valP(j,i,'var')$PO(j,i)            = (valP(j,i,'sim1')/valP(j,i,'base')-1)*100;
 valPC(i,'var')$PCO(i)              = (valPC(i,'sim1')/valPC(i,'base')-1)*100;
 valPCI(j,'var')$PCIO(j)            = (valPCI(j,'sim1')/valPCI(j,'base')-1)*100;
 valPD(i,'var')$PDO(i)              = (valPD(i,'sim1')/valPD(i,'base')-1)*100;
 valPE(i,'var')$PEO(i)              = (valPE(i,'sim1')/valPE(i,'base')-1)*100;
 valPE_FOB(i,'var')$PE_FOBO(i)      = (valPE_FOB(i,'sim1')/valPE_FOB(i,'base')-1)*100;
 valPIXCON('var')$PIXCONO           = (valPIXCON('sim1')/valPIXCON('base')-1)*100;
 valPIXGDP('var')$PIXGDPO           = (valPIXGDP('sim1')/valPIXGDP('base')-1)*100;
 valPIXGVT('var')$PIXGVTO           = (valPIXGVT('sim1')/valPIXGVT('base')-1)*100;
 valPIXINV('var')$PIXINVO           = (valPIXINV('sim1')/valPIXINV('base')-1)*100;
 valPL(i,'var')$PLO(i)              = (valPL(i,'sim1')/valPL(i,'base')-1)*100;
 valPM(i,'var')$PMO(i)              = (valPM(i,'sim1')/valPM(i,'base')-1)*100;
 valPP(j,'var')$PPO(j)              = (valPP(j,'sim1')/valPP(j,'base')-1)*100;
 valPT(j,'var')$PTO(j)              = (valPT(j,'sim1')/valPT(j,'base')-1)*100;
 valPVA(j,'var')$PVAO(j)            = (valPVA(j,'sim1')/valPVA(j,'base')-1)*100;
 valPWM(i,'var')$PWMO(i)            = (valPWM(i,'sim1')/valPWM(i,'base')-1)*100;
 valPWX(i,'var')$PWXO(i)            = (valPWX(i,'sim1')/valPWX(i,'base')-1)*100;
 valQ(i,'var')$QO(i)                = (valQ(i,'sim1')/valQ(i,'base')-1)*100;
 valR(k,j,'var')$RO(k,j)            = (valR(k,j,'sim1')/valR(k,j,'base')-1)*100;
 valRC(j,'var')$RCO(j)              = (valRC(j,'sim1')/valRC(j,'base')-1)*100;
 valRK(k,'var')$RKO(k)              = (valRK(k,'sim1')/valRK(k,'base')-1)*100;
 valRTI(k,j,'var')$RTIO(k,j)        = (valRTI(k,j,'sim1')/valRTI(k,j,'base')-1)*100;
 valSF(f,'var')$SFO(f)              = (valSF(f,'sim1')/valSF(f,'base')-1)*100;
 valSG('var')$SGO                   = (valSG('sim1')/valSG('base')-1)*100;
 valSH(h,'var')$SHO(h)              = (valSH(h,'sim1')/valSH(h,'base')-1)*100;
 valsh0(h,'var')$sh0O(h)            = (valsh0(h,'sim1')/valsh0(h,'base')-1)*100;
 valsh1(h,'var')$sh1O(h)            = (valsh1(h,'sim1')/valsh1(h,'base')-1)*100;
 valSROW('var')$SROWO               = (valSROW('sim1')/valSROW('base')-1)*100;
 valTDF(f,'var')$TDFO(f)            = (valTDF(f,'sim1')/valTDF(f,'base')-1)*100;
 valTDFT('var')$TDFTO               = (valTDFT('sim1')/valTDFT('base')-1)*100;
 valTDH(h,'var')$TDHO(h)            = (valTDH(h,'sim1')/valTDH(h,'base')-1)*100;
 valTDHT('var')$TDHTO               = (valTDHT('sim1')/valTDHT('base')-1)*100;
 valTIC(i,'var')$TICO(i)            = (valTIC(i,'sim1')/valTIC(i,'base')-1)*100;
 valTICT('var')$TICTO               = (valTICT('sim1')/valTICT('base')-1)*100;
 valTIK(k,j,'var')$TIKO(k,j)        = (valTIK(k,j,'sim1')/valTIK(k,j,'base')-1)*100;
 valTIKT('var')$TIKTO               = (valTIKT('sim1')/valTIKT('base')-1)*100;
 valTIM(i,'var')$TIMO(i)            = (valTIM(i,'sim1')/valTIM(i,'base')-1)*100;
 valTIMT('var')$TIMTO               = (valTIMT('sim1')/valTIMT('base')-1)*100;
 valTIP(j,'var')$TIPO(j)            = (valTIP(j,'sim1')/valTIP(j,'base')-1)*100;
 valTIPT('var')$TIPTO               = (valTIPT('sim1')/valTIPT('base')-1)*100;
 valTIW(l,j,'var')$TIWO(l,j)        = (valTIW(l,j,'sim1')/valTIW(l,j,'base')-1)*100;
 valTIWT('var')$TIWTO               = (valTIWT('sim1')/valTIWT('base')-1)*100;
 valTIX(i,'var')$TIXO(i)            = (valTIX(i,'sim1')/valTIX(i,'base')-1)*100;
 valTIXT('var')$TIXTO               = (valTIXT('sim1')/valTIXT('base')-1)*100;
 valTPRCTS('var')$TPRCTSO           = (valTPRCTS('sim1')/valTPRCTS('base')-1)*100;
 valTPRODN('var')$TPRODNO           = (valTPRODN('sim1')/valTPRODN('base')-1)*100;
 valTR(ag,agj,'var')$TRO(ag,agj)    = (valTR(ag,agj,'sim1')/valTR(ag,agj,'base')-1)*100;
 valtr0(h,'var')$tr0O(h)            = (valtr0(h,'sim1')/valtr0(h,'base')-1)*100;
 valtr1(h,'var')$tr1O(h)            = (valtr1(h,'sim1')/valtr1(h,'base')-1)*100;
 valttdf0(f,'var')$ttdf0O(f)        = (valttdf0(f,'sim1')/valttdf0(f,'base')-1)*100;
 valttdf1(f,'var')$ttdf1O(f)        = (valttdf1(f,'sim1')/valttdf1(f,'base')-1)*100;
 valttdh0(h,'var')$ttdh0O(h)        = (valttdh0(h,'sim1')/valttdh0(h,'base')-1)*100;
 valttdh1(h,'var')$ttdh1O(h)        = (valttdh1(h,'sim1')/valttdh1(h,'base')-1)*100;
 valttic(i,'var')$tticO(i)          = (valttic(i,'sim1')/valttic(i,'base')-1)*100;
 valttik(k,j,'var')$ttikO(k,j)      = (valttik(k,j,'sim1')/valttik(k,j,'base')-1)*100;
 valttim(i,'var')$ttimO(i)          = (valttim(i,'sim1')/valttim(i,'base')-1)*100;
 valttip(j,'var')$ttipO(j)          = (valttip(j,'sim1')/valttip(j,'base')-1)*100;
 valttiw(l,j,'var')$ttiwO(l,j)      = (valttiw(l,j,'sim1')/valttiw(l,j,'base')-1)*100;
 valttix(i,'var')$ttixO(i)          = (valttix(i,'sim1')/valttix(i,'base')-1)*100;
 valVA(j,'var')$VAO(j)              = (valVA(j,'sim1')/valVA(j,'base')-1)*100;
 valVSTK(i,'var')$VSTKO(i)          = (valVSTK(i,'sim1')/valVSTK(i,'base')-1)*100;
 valW(l,'var')$WO(l)                = (valW(l,'sim1')/valW(l,'base')-1)*100;
 valWC(j,'var')$WCO(j)              = (valWC(j,'sim1')/valWC(j,'base')-1)*100;
 valWTI(l,j,'var')$WTIO(l,j)        = (valWTI(l,j,'sim1')/valWTI(l,j,'base')-1)*100;
 valXS(j,i,'var')$XSO(j,i)          = (valXS(j,i,'sim1')/valXS(j,i,'base')-1)*100;
 valXST(j,'var')$XSTO(j)            = (valXST(j,'sim1')/valXST(j,'base')-1)*100;
 valYDF(f,'var')$YDFO(f)            = (valYDF(f,'sim1')/valYDF(f,'base')-1)*100;
 valYDH(h,'var')$YDHO(h)            = (valYDH(h,'sim1')/valYDH(h,'base')-1)*100;
 valYF(f,'var')$YFO(f)              = (valYF(f,'sim1')/valYF(f,'base')-1)*100;
 valYFK(f,'var')$YFKO(f)            = (valYFK(f,'sim1')/valYFK(f,'base')-1)*100;
 valYFTR(f,'var')$YFTRO(f)          = (valYFTR(f,'sim1')/valYFTR(f,'base')-1)*100;
 valYG('var')$YGO                   = (valYG('sim1')/valYG('base')-1)*100;
 valYGK('var')$YGKO                 = (valYGK('sim1')/valYGK('base')-1)*100;
 valYGTR('var')$YGTRO               = (valYGTR('sim1')/valYGTR('base')-1)*100;
 valYH(h,'var')$YHO(h)              = (valYH(h,'sim1')/valYH(h,'base')-1)*100;
 valYHK(h,'var')$YHKO(h)            = (valYHK(h,'sim1')/valYHK(h,'base')-1)*100;
 valYHL(h,'var')$YHLO(h)            = (valYHL(h,'sim1')/valYHL(h,'base')-1)*100;
 valYHTR(h,'var')$YHTRO(h)          = (valYHTR(h,'sim1')/valYHTR(h,'base')-1)*100;
 valYROW('var')$YROWO               = (valYROW('sim1')/valYROW('base')-1)*100;

execute_unload "output/results",
 valC, valCAB, valCG, valCI, valCMIN, valCTH, valCTH_REAL, valDD, valDI, valDIT,
 valDS, vale, valEX, valEXD, valG, valG_REAL, valGFCF, valGFCF_REAL, valGDP_BP,
 valGDP_BP_REAL, valGDP_FD, valGDP_IB, valGDP_MP, valGDP_MP_REAL, valIM, valINV,
 valIT, valKD, valKDC, valKS, valLD, valLDC, valLS, valMRGN, valP, valPC, valPCI,
 valPD, valPE, valPE_FOB, valPIXCON, valPIXGDP, valPIXGVT, valPIXINV, valPL,
 valPM, valPP, valPT, valPVA, valPWM, valPWX, valQ, valR, valRC, valRK, valRTI,
 valSF, valSG, valSH, valsh0, valsh1, valSROW, valTDF, valTDFT, valTDH, valTDHT,
 valTIC, valTICT, valTIK, valTIKT, valTIM, valTIMT, valTIP, valTIPT, valTIW,
 valTIWT, valTIX, valTIXT, valTPRCTS, valTPRODN, valTR, valtr0, valtr1, valttdf0,
 valttdf1, valttdh0, valttdh1, valttic, valttik, valttim, valttip, valttiw,
 valttix, valVA, valVSTK, valW, valWC, valWTI, valXS, valXST, valYDF, valYDH,
 valYF, valYFK, valYFTR, valYG, valYGK, valYGTR, valYH, valYHK, valYHL, valYHTR,
 valYROW;
execute '=gdx2xls output/results.gdx';

execute_unload "output/parameters",
 aij, B_KD, B_LD, B_M, B_VA, B_X, B_XT, beta_KD, beta_LD, beta_M, beta_VA,
 beta_X, beta_XT, eta, frisch, gamma_GVT, gamma_INV, gamma_LES, io, kmob,
 lambda_RK, lambda_TR, lambda_WL, rho_KD, rho_LD, rho_M, rho_VA, rho_X, rho_XT,
 sigma_KD, sigma_LD, sigma_M, sigma_VA, sigma_X, sigma_XT, sigma_XD, sigma_Y,
 tmrg, tmrg_X, v;
execute '=gdx2xls output/parameters.gdx';
