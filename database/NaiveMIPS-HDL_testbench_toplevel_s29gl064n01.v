//////////////////////////////////////////////////////////////////////////////
//  File name : s29gl064n01.v
//////////////////////////////////////////////////////////////////////////////
//  Copyright (C) 2007. Spansion, LLC.
//
//  MODIFICATION HISTORY :
//
//  version: | author:      |  date:    | changes made:
//    V1.0    I.Milutinovic   07 Mar 07    Initial release
//
//////////////////////////////////////////////////////////////////////////////
//  PART DESCRIPTION:
//
//  Library:        FLASH
//  Technology:     Flash Memory
//  Part:           S29GL064N01
//
//  Description:    64 Mbit (x8/x16) Page mode Flash Memory
//
//////////////////////////////////////////////////////////////////////////////
//  Known Bugs:
//
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
// MODULE DECLARATION                                                       //
//////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns

module s29gl064n01
(
    A21      ,
    A20      ,
    A19      ,
    A18      ,
    A17      ,
    A16      ,
    A15      ,
    A14      ,
    A13      ,
    A12      ,
    A11      ,
    A10      ,
    A9       ,
    A8       ,
    A7       ,
    A6       ,
    A5       ,
    A4       ,
    A3       ,
    A2       ,
    A1       ,
    A0       ,

    DQ15     ,
    DQ14     ,
    DQ13     ,
    DQ12     ,
    DQ11     ,
    DQ10     ,
    DQ9      ,
    DQ8      ,
    DQ7      ,
    DQ6      ,
    DQ5      ,
    DQ4      ,
    DQ3      ,
    DQ2      ,
    DQ1      ,
    DQ0      ,

    CENeg    ,
    OENeg    ,
    WENeg    ,
    RESETNeg ,
    WPNeg    ,
    BYTENeg  ,
    RY

);

////////////////////////////////////////////////////////////////////////
// Port / Part Pin Declarations
////////////////////////////////////////////////////////////////////////
    input  A21  ;
    input  A20  ;
    input  A19  ;
    input  A18  ;
    input  A17  ;
    input  A16  ;
    input  A15  ;
    input  A14  ;
    input  A13  ;
    input  A12  ;
    input  A11  ;
    input  A10  ;
    input  A9   ;
    input  A8   ;
    input  A7   ;
    input  A6   ;
    input  A5   ;
    input  A4   ;
    input  A3   ;
    input  A2   ;
    input  A1   ;
    input  A0   ;

    inout  DQ15  ;
    inout  DQ14  ;
    inout  DQ13  ;
    inout  DQ12  ;
    inout  DQ11  ;
    inout  DQ10  ;
    inout  DQ9   ;
    inout  DQ8   ;
    inout  DQ7   ;
    inout  DQ6   ;
    inout  DQ5   ;
    inout  DQ4   ;
    inout  DQ3   ;
    inout  DQ2   ;
    inout  DQ1   ;
    inout  DQ0   ;

    input  CENeg    ;
    input  OENeg    ;
    input  WENeg    ;
    input  RESETNeg ;
    input  WPNeg    ;
    input  BYTENeg  ;
    output RY       ;

    // interconnect path delay signals
    wire  A21_ipd  ;
    wire  A20_ipd  ;
    wire  A19_ipd  ;
    wire  A18_ipd  ;
    wire  A17_ipd  ;
    wire  A16_ipd  ;
    wire  A15_ipd  ;
    wire  A14_ipd  ;
    wire  A13_ipd  ;
    wire  A12_ipd  ;
    wire  A11_ipd  ;
    wire  A10_ipd  ;
    wire  A9_ipd   ;
    wire  A8_ipd   ;
    wire  A7_ipd   ;
    wire  A6_ipd   ;
    wire  A5_ipd   ;
    wire  A4_ipd   ;
    wire  A3_ipd   ;
    wire  A2_ipd   ;
    wire  A1_ipd   ;
    wire  A0_ipd   ;

    wire [21 : 0] A;
    assign A = {A21_ipd,
                A20_ipd,
                A19_ipd,
                A18_ipd,
                A17_ipd,
                A16_ipd,
                A15_ipd,
                A14_ipd,
                A13_ipd,
                A12_ipd,
                A11_ipd,
                A10_ipd,
                A9_ipd,
                A8_ipd,
                A7_ipd,
                A6_ipd,
                A5_ipd,
                A4_ipd,
                A3_ipd,
                A2_ipd,
                A1_ipd,
                A0_ipd };

    wire  DQ15_ipd  ;
    wire  DQ14_ipd  ;
    wire  DQ13_ipd  ;
    wire  DQ12_ipd  ;
    wire  DQ11_ipd  ;
    wire  DQ10_ipd  ;
    wire  DQ9_ipd   ;
    wire  DQ8_ipd   ;
    wire  DQ7_ipd   ;
    wire  DQ6_ipd   ;
    wire  DQ5_ipd   ;
    wire  DQ4_ipd   ;
    wire  DQ3_ipd   ;
    wire  DQ2_ipd   ;
    wire  DQ1_ipd   ;
    wire  DQ0_ipd   ;

    wire [15 : 0 ] DIn;
    assign DIn = {DQ15_ipd,
                  DQ14_ipd,
                  DQ13_ipd,
                  DQ12_ipd,
                  DQ11_ipd,
                  DQ10_ipd,
                  DQ9_ipd,
                  DQ8_ipd,
                  DQ7_ipd,
                  DQ6_ipd,
                  DQ5_ipd,
                  DQ4_ipd,
                  DQ3_ipd,
                  DQ2_ipd,
                  DQ1_ipd,
                  DQ0_ipd };

    wire [15 : 0 ] DOut;
    assign DOut = {DQ15,
                  DQ14,
                  DQ13,
                  DQ12,
                  DQ11,
                  DQ10,
                  DQ9,
                  DQ8,
                  DQ7,
                  DQ6,
                  DQ5,
                  DQ4,
                  DQ3,
                  DQ2,
                  DQ1,
                  DQ0 };

    wire  CENeg_ipd    ;
    wire  OENeg_ipd    ;
    wire  WENeg_ipd    ;
    wire  RESETNeg_ipd ;
    wire  WPNeg_ipd    ;
    wire  BYTENeg_ipd  ;

    //  internal delays
    reg START_T1    ; // Start TimeOut
    reg START_T1_in ;
    reg CTMOUT      ; // Sector Erase TimeOut
    reg CTMOUT_in   ;
    reg READY_in    ;
    reg READY       ; // Device ready after reset
    reg PBPROG_in       ;
    reg PBPROG_out      ;
    reg UNLOCKDONE_in   ;
    reg UNLOCKDONE_out  ;

    wire  DQ15_Pass  ;
    wire  DQ14_Pass  ;
    wire  DQ13_Pass  ;
    wire  DQ12_Pass  ;
    wire  DQ11_Pass  ;
    wire  DQ10_Pass  ;
    wire  DQ9_Pass   ;
    wire  DQ8_Pass   ;
    wire  DQ7_Pass   ;
    wire  DQ6_Pass   ;
    wire  DQ5_Pass   ;
    wire  DQ4_Pass   ;
    wire  DQ3_Pass   ;
    wire  DQ2_Pass   ;
    wire  DQ1_Pass   ;
    wire  DQ0_Pass   ;

    reg [15 : 0] DOut_zd;
    reg [15 : 0] DOut_Pass;
    assign {DQ15_Pass,
            DQ14_Pass,
            DQ13_Pass,
            DQ12_Pass,
            DQ11_Pass,
            DQ10_Pass,
            DQ9_Pass,
            DQ8_Pass,
            DQ7_Pass,
            DQ6_Pass,
            DQ5_Pass,
            DQ4_Pass,
            DQ3_Pass,
            DQ2_Pass,
            DQ1_Pass,
            DQ0_Pass  } = DOut_Pass;

    reg RY_zd = 1;

    parameter UserPreload     = 1'b0;
    parameter mem_file_name   = "none";//"s29gl064n01.mem";
    parameter prot_file_name  = "none";//"s29gl064n01_prot.mem";
    parameter secsi_file_name = "none";//"s29gl064n01_secsi.mem";

    parameter TimingModel = "DefaultTimingModel";

    parameter PartID = "s29gl064n01";
    parameter MaxData = 255;
    parameter SecSize = 16'hFFFF;
    parameter SecSiSize = 255;
    parameter SecNum = 134;
    parameter HiAddrBit = 21;
    parameter AddrRANGE = 28'h7FFFFF;

    // If speedsimulation is needed uncomment following line

//     `define SPEEDSIM;

    parameter MEMORY             =3'h0;
    parameter OTP_MEM            =3'h1;
    parameter PASSW              =3'h2;
    parameter LREG               =3'h3;
    parameter PPB_BIT            =3'h4;

    reg [2:0]  PGMS_FLAG;
    //Address of the Protected Sector
    integer  ProtSecNum;
    integer  ProtSecNum1;

    //varaibles to resolve architecture used
    reg [20*8-1:0] tmp_timing;//stores copy of TimingModel
    reg [7:0] tmp_char;//stores "1", "2", "3" or "4" character
    integer found = 1'b0;

    // powerup
    reg PoweredUp;

    //FSM control signals
    reg ULBYPASS ; ////Unlock Bypass Active
    reg OTP_ACT  ; ////SecSi access
    reg PSP_ACT  ; ////Program Suspend
    reg ESP_ACT  ; ////Erase Suspend
    reg LOCK_ACT ;//Lock Register program
    reg PASS_ACT ;
    reg PPB_ACT  ;

    integer LCNT ; ////Load Counter  0-31

    ////number of location to be writen in Write Buffer: 0-31 bytes.
    ////if 32 word/byte programming
    integer PCNT  ;  //0-32

    reg PDONE    ; ////Prog. Done
    reg PSTART   ; ////Start Programming
    reg PSUSP    ; ////Suspend programming
    reg PRES     ; ////Resume Programming
    //Program location is in protected sector
    reg PERR     ;

    reg EDONE    ; ////Ers. Done
    reg ESTART   ; ////Start Erase
    reg ESUSP    ; ////Suspend Erase
    reg ERES     ; ////Resume Erase
    //All sectors selected for erasure are protected
    reg EERR     ;
    //Sectors selected for erasure
    reg [SecNum:0] Ers_queue;

    //Command Register
    reg write ;
    reg read  ;

    //Sector Address
    integer SecAddr = 0;         // 0 - SecNum

    integer SA      = 0;         // 0 TO SecNum
    integer WBPage  = 0;
    //Address within sector
    reg [31:0] Address = 0; // 0 - SecSize

    integer D_tmp0;
    integer D_tmp1;

    //A22:A11 Don't Care
    integer Addr ;

    integer WPage;
    integer RPage;
    reg RPchange ;

    //glitch protection
    wire gWE_n ;
    wire gCE_n ;
    wire gOE_n ;

    reg RST ;
    reg reseted ;

    reg[15:0] LockReg;
    //Sector Protection Status
    integer Password[0:7];
    reg[SecNum:0] DYB;
    reg[SecNum:0] PPB;

    reg PPBLock;

    reg[7:0] tempLR;
    reg[7:0] tempLo;

    //SecSi ProtectionStatus
    reg FactoryProt ;

    // timing check violation
    reg Viol = 1'b0;

    integer Mem[0:((SecNum+1)*(SecSize+1) -1) ];
    integer CFI_array[16:90];
    integer SecSi[0:SecSiSize];

    integer WBData[0:31];
    integer WBAddr[0:31];

    integer BaseLoc = 0;
    integer cnt = 0;
    reg[7:0] PassMATCH;

    //Status reg.
    reg[7:0] Status = 8'b0;
    integer S_ind = 0;
    integer ind = 0;

    reg[7:0]  old_bit, new_bit;
    integer old_int, new_int;
    integer wr_cnt;

    reg[7:0] temp;

    reg oe = 1'b0;
    reg oe_toggle = 1'b0;

    integer A_tmp  ;
    integer SA_tmp ;

    reg [16 :0] A_tmp1;
    reg [HiAddrBit:0] AddressLatched;
    reg [HiAddrBit:0] sector;
    reg [HiAddrBit:0] AddrTmp;
    reg [HiAddrBit:0] AddrLOW;
    reg [HiAddrBit:0] AddrHIGH;
    reg PR_FLAG = 0;
    reg ER_FLAG = 0;
    reg CE;

    //TPD_XX_DATA
    time OEDQ_t;
    time CEDQ_t;
    time ADDRDQ_t;
    time OENeg_event;
    time CENeg_event;
    time ADDR_event;
    reg FROMOE;
    reg FROMCE;
    reg FROMBYTE;
    reg FROMADDR;
    integer   OEDQ_01;
    integer   CEDQ_01;
    integer   ADDRDQ_01_SHORT;
    integer   ADDRDQ_01_LONG;
    reg[15:0] TempData;

    reg falling_edge_RESETNeg = 0;
    reg rising_edge_RESETNeg = 0;
    reg falling_edge_WENeg = 0;
    reg falling_edge_CENeg = 0;
    reg falling_edge_OENeg = 0;
    reg rising_edge_WENeg = 0;
    reg rising_edge_CENeg = 0;
    reg rising_edge_write = 0;
    reg rising_edge_read = 0;
    reg A_event = 0;
    reg DIn_15_event = 0;
    reg BYTENeg_event = 0;
    reg falling_edge_write = 0;
    reg falling_edge_RST = 0;
    reg rising_edge_PBPROG_out = 0;
    reg rising_edge_UNLOCKDONE_out = 0;
    reg rising_edge_EDONE = 0;
    reg rising_edge_ESTART = 0;
    reg rising_edge_ESUSP = 0;
    reg rising_edge_ERES = 0;
    reg falling_edge_EERR = 0;
    reg rising_edge_sCTMOUT = 0;
    reg rising_edge_sSTART_T1 = 0;
    reg rising_edge_PDONE = 0;
    reg falling_edge_PERR = 0;
    reg PERR_event = 0;
    reg Address_event = 0;
    reg rising_edge_PSUSP = 0;
    reg rising_edge_PRES = 0;
    reg rising_edge_PSTART = 0;
    reg rising_edge_reseted = 0;

///////////////////////////////////////////////////////////////////////////////
//Interconnect Path Delay Section
///////////////////////////////////////////////////////////////////////////////
    buf   (A21_ipd, A21);
    buf   (A20_ipd, A20);
    buf   (A19_ipd, A19);
    buf   (A18_ipd, A18);
    buf   (A17_ipd, A17);
    buf   (A16_ipd, A16);
    buf   (A15_ipd, A15);
    buf   (A14_ipd, A14);
    buf   (A13_ipd, A13);
    buf   (A12_ipd, A12);
    buf   (A11_ipd, A11);
    buf   (A10_ipd, A10);
    buf   (A9_ipd , A9 );
    buf   (A8_ipd , A8 );
    buf   (A7_ipd , A7 );
    buf   (A6_ipd , A6 );
    buf   (A5_ipd , A5 );
    buf   (A4_ipd , A4 );
    buf   (A3_ipd , A3 );
    buf   (A2_ipd , A2 );
    buf   (A1_ipd , A1 );
    buf   (A0_ipd , A0 );

    buf   (DQ15_ipd, DQ15);
    buf   (DQ14_ipd, DQ14);
    buf   (DQ13_ipd, DQ13);
    buf   (DQ12_ipd, DQ12);
    buf   (DQ11_ipd, DQ11);
    buf   (DQ10_ipd, DQ10);
    buf   (DQ9_ipd , DQ9 );
    buf   (DQ8_ipd , DQ8 );
    buf   (DQ7_ipd , DQ7 );
    buf   (DQ6_ipd , DQ6 );
    buf   (DQ5_ipd , DQ5 );
    buf   (DQ4_ipd , DQ4 );
    buf   (DQ3_ipd , DQ3 );
    buf   (DQ2_ipd , DQ2 );
    buf   (DQ1_ipd , DQ1 );
    buf   (DQ0_ipd , DQ0 );

    buf   (CENeg_ipd    , CENeg    );
    buf   (OENeg_ipd    , OENeg    );
    buf   (WENeg_ipd    , WENeg    );
    buf   (RESETNeg_ipd , RESETNeg );
    buf   (WPNeg_ipd    , WPNeg    );
    buf   (BYTENeg_ipd  , BYTENeg  );

///////////////////////////////////////////////////////////////////////////////
// Propagation  delay Section
///////////////////////////////////////////////////////////////////////////////
    nmos   (DQ15,   DQ15_Pass , 1);
    nmos   (DQ14,   DQ14_Pass , 1);
    nmos   (DQ13,   DQ13_Pass , 1);
    nmos   (DQ12,   DQ12_Pass , 1);
    nmos   (DQ11,   DQ11_Pass , 1);
    nmos   (DQ10,   DQ10_Pass , 1);
    nmos   (DQ9 ,   DQ9_Pass  , 1);
    nmos   (DQ8 ,   DQ8_Pass  , 1);
    nmos   (DQ7 ,   DQ7_Pass  , 1);
    nmos   (DQ6 ,   DQ6_Pass  , 1);
    nmos   (DQ5 ,   DQ5_Pass  , 1);
    nmos   (DQ4 ,   DQ4_Pass  , 1);
    nmos   (DQ3 ,   DQ3_Pass  , 1);
    nmos   (DQ2 ,   DQ2_Pass  , 1);
    nmos   (DQ1 ,   DQ1_Pass  , 1);
    nmos   (DQ0 ,   DQ0_Pass  , 1);

    nmos   (RY ,   1'b0      ,  ~RY_zd);

    wire deg;

    // Needed for TimingChecks, VHDL CheckEnable Equivalent
    wire RY_EQU_1;
    assign RY_EQU_1 = RY_zd;

    wire RY_EQU_0;
    assign RY_EQU_0 = ~RY_zd;

    specify
        // tipd delays: interconnect path delays , mapped to input port delays.
        // In Verilog is not necessary to declare any tipd_ delay variables,
        // they can be taken from SDF file
        // With all the other delays real delays would be taken from SDF file

                        // tpd delays
        specparam      tpd_A0_DQ0              =1;
        specparam      tpd_A0_DQ1              =1;   //tPACC
        specparam      tpd_CENeg_DQ0           =1;
                      //(tCE,tCE,tDF,-,tDF,-)
        specparam      tpd_OENeg_DQ0           =1;
                      //(tOE,tOE,tDF,-,tDF,-)
        specparam      tpd_RESETNeg_DQ0        =1;
                      //(-,-,0,-,0,-)
        specparam      tpd_CENeg_RY            =1;    //tBUSY
        specparam      tpd_WENeg_RY            =1;    //tBUSY

                      // tsetup values: setup time
        specparam      tsetup_A0_CENeg         =1;   //tAS edge \
        specparam      tsetup_A0_OENeg         =1;   //tASO edge \
        specparam      tsetup_DQ0_CENeg        =1;   //tDS edge /

                      // thold values: hold times
        specparam      thold_CENeg_RESETNeg    =1; //tRH  edge /
        specparam      thold_OENeg_WENeg       =1; //tOEH edge /
        specparam      thold_A0_CENeg          =1; //tAH  edge \
        specparam      thold_A0_OENeg          =1; //tAHT edge \
        specparam      thold_DQ0_CENeg         =1; //tDH edge /
        specparam      thold_WENeg_OENeg       =1; //tGHVL edge /

                      // tpw values: pulse width
        specparam      tpw_RESETNeg_negedge    =1; //tRP
        specparam      tpw_OENeg_posedge       =1; //tOEPH
        specparam      tpw_WENeg_negedge       =1; //tWP
        specparam      tpw_WENeg_posedge       =1; //tWPH
        specparam      tpw_CENeg_negedge       =1; //tCP
        specparam      tpw_CENeg_RY_EQ_1_posedge =1; //tCPH
        specparam      tpw_CENeg_RY_EQ_0_posedge =1; //tCEPH
        specparam      tpw_A0_negedge          =1; //tWC tRC

         // tdevice values: values for internal delays
        `ifdef SPEEDSIM
            //Effective Write Buffer Program Operation  tWHWH1
            specparam   tdevice_WBPB       = 1500; //ns;
                //Program Operation
            specparam   tdevice_POW        = 6000; //6 us per word;
                //Sector Erase Operation tWHWH2
            specparam   tdevice_SEO        = 500000;
                //Timing Limit Exceeded
            specparam   tdevice_HANG       = 400000000;
                //program/erase suspend timeout
            specparam   tdevice_START_T1   = 5000; //5 us;
                //sector erase command sequence timeout
            specparam   tdevice_CTMOUT     = 10000; //10 us;
                //device ready after Hardware reset(during embeded algorithm)
            specparam   tdevice_READY      = 2000;
                // Password Unlock
            specparam   tdevice_UNLOCK     = 2000;// 2  us;
                // configuring the PPB Lock bit to the freeze state
            specparam  tdevice_PPBLOCK     = 100; //100  ns;
        `else
                //Effective Write Buffer Program Operation tWHWH1
            specparam   tdevice_WBPB       = 7500; //ns;
                //Program Operation
            specparam   tdevice_POW        = 60000; //60 us per word;
                //Sector Erase Operation tWHWH2
            specparam   tdevice_SEO        = 500000000;
                //Timing Limit Exceeded
            specparam   tdevice_HANG       = 400000000;
                //program/erase suspend timeout
            specparam   tdevice_START_T1   = 5000; //5 us;
                //sector erase command sequence timeout
            specparam   tdevice_CTMOUT     = 50000; //50 us;
                //device ready after Hardware reset(during embeded algorithm)
            specparam   tdevice_READY      = 20000;
                // Password Unlock
            specparam   tdevice_UNLOCK     = 2000;// 2  us;
                // configuring the PPB Lock bit to the freeze state
            specparam  tdevice_PPBLOCK     = 100; //100  ns;
        `endif //SPEEDSIM

///////////////////////////////////////////////////////////////////////////////
// Input Port  Delays  don't require Verilog description
///////////////////////////////////////////////////////////////////////////////
// Path delays                                                               //
///////////////////////////////////////////////////////////////////////////////
    (CENeg => RY) = tpd_CENeg_RY;
    (WENeg => RY) = tpd_WENeg_RY;

    if (FROMCE) (CENeg *> DQ0) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ1) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ2) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ3) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ4) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ5) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ6) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ7) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ8) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ9) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ10) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ11) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ12) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ13) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ14) = tpd_CENeg_DQ0;
    if (FROMCE) (CENeg *> DQ15) = tpd_CENeg_DQ0;
    if (FROMOE) (OENeg *> DQ0) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ1) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ2) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ3) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ4) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ5) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ6) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ7) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ8) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ9) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ10) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ11) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ12) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ13) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ14) = tpd_OENeg_DQ0;
    if (FROMOE) (OENeg *> DQ15) = tpd_OENeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ0) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ1) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ2) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ3) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ4) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ5) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ6) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ7) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ8) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ9) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ10) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ11) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ12) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ13) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ14) = tpd_RESETNeg_DQ0;
    if (~RESETNeg) (RESETNeg *> DQ15) = tpd_RESETNeg_DQ0;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ0) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ1) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ2) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ3) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ4) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ5) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ6) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ7) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ8) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ9) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ10) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ11) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ12) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ13) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ14) = tpd_A0_DQ1;
    if (~BYTENeg && ~RPchange && FROMADDR) (DQ15 *> DQ15) = tpd_A0_DQ1;
    if (RPchange && FROMADDR) (A0 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A0 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A1 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A2 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A3 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A4 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A5 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A6 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A7 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A8 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A9 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A10 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A11 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A12 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A13 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A14 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A15 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A16 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A17 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A18 *> DQ15) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A19 *> DQ15) = tpd_A0_DQ0;

    if (RPchange && FROMADDR) (A20 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A20 *> DQ15) = tpd_A0_DQ0;

    if (RPchange && FROMADDR) (A21 *> DQ0) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ1) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ2) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ3) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ4) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ5) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ6) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ7) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ8) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ9) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ10) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ11) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ12) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ13) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ14) = tpd_A0_DQ0;
    if (RPchange && FROMADDR) (A21 *> DQ15) = tpd_A0_DQ0;

    if (~RPchange && FROMADDR) (A0 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A0 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A1 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A2 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A3 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A4 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A5 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A6 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A7 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A8 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A9 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A10 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A11 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A12 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A13 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A14 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A15 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A16 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A17 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A18 *> DQ15) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A19 *> DQ15) = tpd_A0_DQ1;

    if (~RPchange && FROMADDR) (A20 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A20 *> DQ15) = tpd_A0_DQ1;

    if (~RPchange && FROMADDR) (A21 *> DQ0) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ1) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ2) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ3) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ4) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ5) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ6) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ7) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ8) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ9) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ10) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ11) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ12) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ13) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ14) = tpd_A0_DQ1;
    if (~RPchange && FROMADDR) (A21 *> DQ15) = tpd_A0_DQ1;

////////////////////////////////////////////////////////////////////////////////
// Timing Violation                                                           //
////////////////////////////////////////////////////////////////////////////////
    $setup ( A0 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A1 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A2 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A3 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A4 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A5 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A6 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A7 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A8 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A9 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A10 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A11 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A12 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A13 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A14 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A15 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A16 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A17 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A18 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A19 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A20 , negedge CENeg, tsetup_A0_CENeg, Viol);
    $setup ( A21 , negedge CENeg, tsetup_A0_CENeg, Viol);

    $setup ( A0 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A1 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A2 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A3 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A4 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A5 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A6 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A7 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A8 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A9 , negedge WENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A10 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A11 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A12 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A13 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A14 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A15 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A16 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A17 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A18 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A19 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A20 , negedge WENeg, tsetup_A0_CENeg, Viol);
    $setup ( A21 , negedge WENeg, tsetup_A0_CENeg, Viol);

    $setup ( A0 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A1 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A2 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A3 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A4 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A5 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A6 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A7 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A8 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A9 , negedge OENeg,  tsetup_A0_CENeg, Viol);
    $setup ( A10 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A11 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A12 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A13 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A14 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A15 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A16 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A17 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A18 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A19 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A20 , negedge OENeg, tsetup_A0_CENeg, Viol);
    $setup ( A21 , negedge OENeg, tsetup_A0_CENeg, Viol);

    $setup ( DQ0 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ1 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ2 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ3 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ4 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ5 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ6 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ7 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ8 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ9 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ10 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ11 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ12 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ13 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ14 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ15 , posedge CENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ0 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ1 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ2 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ3 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ4 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ5 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ6 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ7 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ8 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ9 , posedge WENeg &&& deg,  tsetup_DQ0_CENeg, Viol);
    $setup ( DQ10 , posedge WENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ11 , posedge WENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ12 , posedge WENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ13 , posedge WENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ14 , posedge WENeg &&& deg, tsetup_DQ0_CENeg, Viol);
    $setup ( DQ15 , posedge WENeg &&& deg, tsetup_DQ0_CENeg, Viol);

    $hold ( posedge RESETNeg &&& (CENeg===1), CENeg ,
               thold_CENeg_RESETNeg, Viol);
    $hold ( posedge RESETNeg &&& (OENeg===1), OENeg ,
               thold_CENeg_RESETNeg, Viol);

    $hold ( negedge CENeg, A0 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A1 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A2 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A3 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A4 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A5 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A6 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A7 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A8 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A9 ,  thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A10 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A11 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A12 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A13 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A14 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A15 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A16 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A17 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A18 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A19 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A20 , thold_A0_CENeg, Viol);
    $hold ( negedge CENeg, A21 , thold_A0_CENeg, Viol);

    $hold ( negedge WENeg, A0 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A1 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A2 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A3 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A4 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A5 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A6 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A7 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A8 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A9 ,  thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A10 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A11 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A12 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A13 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A14 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A15 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A16 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A17 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A18 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A19 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A20 , thold_A0_CENeg, Viol);
    $hold ( negedge WENeg, A21 , thold_A0_CENeg, Viol);

    $hold ( negedge OENeg, A0 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A1 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A2 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A3 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A4 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A5 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A6 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A7 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A8 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A9 ,  thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A10 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A11 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A12 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A13 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A14 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A15 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A16 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A17 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A18 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A19 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A20 , thold_A0_CENeg, Viol);
    $hold ( negedge OENeg, A21 , thold_A0_CENeg, Viol);

    $hold ( negedge CENeg, DQ0 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ1 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ2 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ3 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ4 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ5 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ6 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ7 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ8 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ9 ,  thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ10 , thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ11 , thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ12 , thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ13 , thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ14 , thold_DQ0_CENeg, Viol);
    $hold ( negedge CENeg, DQ15 ,   thold_DQ0_CENeg, Viol);

    $hold ( negedge WENeg, DQ0  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ1  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ2  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ3  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ4  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ5  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ6  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ7  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ8  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ9  ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ10 ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ11 ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ12 ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ13 ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ14 ,   thold_DQ0_CENeg, Viol);
    $hold ( negedge WENeg, DQ15 ,   thold_DQ0_CENeg, Viol);

    $hold ( posedge WENeg, OENeg , thold_OENeg_WENeg, Viol);
    $hold ( posedge OENeg, WENeg , thold_WENeg_OENeg, Viol);

    $width (negedge RESETNeg, tpw_RESETNeg_negedge);

    $width (posedge OENeg, tpw_OENeg_posedge);
    $width (posedge WENeg, tpw_WENeg_posedge);
    $width (negedge WENeg, tpw_WENeg_negedge);
    $width (posedge CENeg &&& RY_EQU_1, tpw_CENeg_RY_EQ_1_posedge );
    $width (posedge CENeg &&& RY_EQU_0, tpw_CENeg_RY_EQ_0_posedge );
    $width (negedge CENeg, tpw_CENeg_negedge);

    $width (posedge A0, tpw_A0_negedge);
    $width (negedge A0, tpw_A0_negedge);

    endspecify

////////////////////////////////////////////////////////////////////////////////
// Main Behavior Block                                                        //
////////////////////////////////////////////////////////////////////////////////

    // FSM states
    parameter RESET           =8'd0;
    parameter Z001            =8'd1;
    parameter PREL_SETBWB     =8'd2;
    parameter PREL_ULBYPASS   =8'd3;
    parameter EXIT_ULBYPASS   =8'd4;
    parameter CFI             =8'd5;
    parameter AS              =8'd6;
    parameter LOCKREG_CMDSET  =8'd7;
    parameter LOCKREG_A0SEEN  =8'd8;
    parameter EXIT_LOCKREG    =8'd9;
    parameter PPB_CMDSET      =8'd10;
    parameter PPB_A0SEEN      =8'd11;
    parameter PPB_80SEEN      =8'd12;
    parameter EXIT_PPB        =8'd13;
    parameter DYB_CMDSET      =8'd14;
    parameter DYB_SETCLEAR    =8'd15;
    parameter EXIT_DYB        =8'd16;
    parameter PASS_CMDSET     =8'd17;
    parameter PASS_A0SEEN     =8'd18;
    parameter PASSUNLOCK1     =8'd19;
    parameter PASSUNLOCK2     =8'd20;
    parameter PASSUNLOCK3     =8'd21;
    parameter PASSUNLOCK4     =8'd22;
    parameter PASSUNLOCK5     =8'd23;
    parameter PASSUNLOCK6     =8'd24;
    parameter PASSUNLOCK7     =8'd25;
    parameter PASSUNLOCK8     =8'd26;
    parameter PASSUNLOCK9     =8'd27;
    parameter PASSUNLOCK10    =8'd28;
    parameter PASSUNLOCK      =8'd29;
    parameter EXIT_PASS       =8'd30;
    parameter PPBLOCK_CMDSET  =8'd31;
    parameter PPBLOCK_A0SEEN  =8'd32;
    parameter PPBLOCK_SET     =8'd33;
    parameter EXIT_PPBLOCK    =8'd34;
    parameter A0SEEN          =8'd35;
    parameter OTP             =8'd36;
    parameter OTP_Z001        =8'd37;
    parameter OTP_PREL        =8'd38;
    parameter OTP_AS          =8'd39;
    parameter OTP_A0SEEN      =8'd40;
    parameter C8              =8'd41;
    parameter C8_Z001         =8'd42;
    parameter C8_PREL         =8'd43;
    parameter ERS             =8'd44;
    parameter SERS            =8'd45;
    parameter ESPS            =8'd46;
    parameter WBPGMS_WBCNT    =8'd47;
    parameter WBPGMS_WBLSTA   =8'd48;
    parameter WBPGMS_WBLOAD   =8'd49;
    parameter WBPGMS_CONFB    =8'd50;
    parameter WBPGMS_WBABORT  =8'd51;
    parameter WBPGMS_Z001     =8'd52;
    parameter WBPGMS_PREL     =8'd53;
    parameter SERS_EXEC       =8'd54;
    parameter ESP             =8'd55;
    parameter ESP_Z001        =8'd56;
    parameter ESP_PREL        =8'd57;
    parameter ESP_CFI         =8'd58;
    parameter ESP_A0SEEN      =8'd59;
    parameter ESP_AS          =8'd60;
    parameter PGMS            =8'd61;
    parameter PSPS            =8'd62;
    parameter PSP             =8'd63;
    parameter PSP_CFI         =8'd64;
    parameter PSP_Z001        =8'd65;
    parameter PSP_PREL        =8'd66;
    parameter PSP_AS          =8'd67;

    reg [6:0] current_state;
    reg [6:0] next_state;

    reg deq;
    always @(DIn, DOut)
    begin
        if (DIn==DOut)
            deq=1'b1;
        else
            deq=1'b0;
    end
    // check when data is generated from model to avoid setuphold check in
    // those occasion
    assign deg=deq;

    // initialize memory and load preoload files if any
    initial
    begin: InitMemory
    integer i,j;
    reg     sector_prot[0:SecNum+1];
    integer secure_silicon[0:SecSiSize];

        for (i=0;i<(SecSize+1)*(SecNum+1);i=i+1)
        begin
            Mem[i]=MaxData;
        end

        for (i=0;i<=SecNum;i=i+1)
        begin
            sector_prot[i]=0;
        end
        for (i=0;i<=SecSiSize;i=i+1)
        begin
            secure_silicon[i]=MaxData;
        end

        if ((UserPreload) && !(prot_file_name == "none"))
        begin
           // Sector protection preload
           //s29gl064n01_prot  sector protect file
           //   //      - comment
           //   @aaa    - <aaa> stands for sector address
           //   (aaa is incremented at every load)
           //   b       - <b> is 1 for protected sector <aaa>, 0 for unprotect.
           //   If <aaa> > SecNum SecSi
           //   is protected/unprotected
           $readmemb(prot_file_name,sector_prot);
        end
        if ((UserPreload) && !(secsi_file_name == "none"))
        begin
           // Secure Silicon Sector Region preload
           // s29gl064n01_secsi memory file
           //   //       - comment
           //   @aa     - <aa> stands for address within last defined sector
           //   dd      - <dd> is byte to be written at SecSi(aa++)
           //  (aa is incremented at every load)
           $readmemh(secsi_file_name,secure_silicon);
        end

        FactoryProt = 1;

        if ((UserPreload) && !(mem_file_name == "none"))
        begin
           // Memory Preload
           //s29gl064n01.mem, memory preload file
           //  @aaaaaaa- <aaaaaaa> stands for address within last defined sector
           //  dd      - <dd> is byte to be written at Mem(nn)(aaaaaaa++)
           // (aaaaaaa is incremented at every load)
           $readmemh(mem_file_name,Mem);

            FactoryProt = 0;
            if (sector_prot[SecNum+1] == 1 || sector_prot[SecNum+1] == 0)
                FactoryProt = sector_prot[SecNum+1];
        end

        for (i=0;i<=SecNum;i=i+1)
        begin
            Ers_queue[i] = 0;
            PPB[i] = !sector_prot[i];
        end

        for (i=0;i<=SecSiSize;i=i+1)
        begin
            SecSi[i] = secure_silicon[i];
        end

        for (i=0;i<=31;i=i+1)
        begin
            WBData[i] = 0;
            WBAddr[i] = -1;
        end

        //TOP OR BOTTOM arch model is used
        //assumptions:
        //1. TimingModel has format as
        //S29GL064N70TAIR1
        //it is important that 16-th character from first one is "1", "2", "3"
        // or "4"

        //2. TimingModel does not have more then 20 characters
        tmp_timing = TimingModel;//copy of TimingModel

        i = 19;
        while ((i >= 0) && (found != 1'b1))//search for first non null character
        begin        //i keeps position of first non null character
            j = 7;
            while ((j >= 0) && (found != 1'b1))
            begin
                if (tmp_timing[i*8+j] != 1'd0)
                    found = 1'b1;
                else
                    j = j-1;
            end
            i = i - 1;
        end
        i = i +1;
        if (found)//if non null character is found
        begin
            for (j=0;j<=7;j=j+1)
            begin
            tmp_char[j] = TimingModel[(i-15)*8+j];//bottom/top character is 15
            end                             //characters right from first ("s")
        end

        if (tmp_char == "1")
        begin
            ProtSecNum = 127;
        end
        else if (tmp_char == "2")
        begin
            ProtSecNum = 0;
        end
        else if (tmp_char == "3")
        begin
            ProtSecNum = 133;
            ProtSecNum1 = 134;
        end
        else if (tmp_char == "4")
        begin
            ProtSecNum = 0;
            ProtSecNum1 = 1;
        end

        ///////////////////////////////////////////////////////////////////////
        //CFI array data
        ///////////////////////////////////////////////////////////////////////

        //CFI query identification string
        CFI_array[16'h10] = 16'h51;
        CFI_array[16'h11] = 16'h52;
        CFI_array[16'h12] = 16'h59;
        CFI_array[16'h13] = 16'h02;
        CFI_array[16'h14] = 16'h00;
        CFI_array[16'h15] = 16'h40;
        CFI_array[16'h16] = 16'h00;
        CFI_array[16'h17] = 16'h00;
        CFI_array[16'h18] = 16'h00;
        CFI_array[16'h19] = 16'h00;
        CFI_array[16'h1A] = 16'h00;
        //system interface string
        CFI_array[16'h1B] = 16'h27;
        CFI_array[16'h1C] = 16'h36;
        CFI_array[16'h1D] = 16'h00;
        CFI_array[16'h1E] = 16'h00;
        CFI_array[16'h1F] = 16'h07;
        CFI_array[16'h20] = 16'h07;
        CFI_array[16'h21] = 16'h0A;
        CFI_array[16'h22] = 16'h00;
        CFI_array[16'h23] = 16'h03;
        CFI_array[16'h24] = 16'h05;
        CFI_array[16'h25] = 16'h04;
        CFI_array[16'h26] = 16'h00;
        //device geometry definition
        CFI_array[16'h27] = 16'h17;
        CFI_array[16'h28] = 16'h02;
        CFI_array[16'h29] = 16'h00;
        CFI_array[16'h2A] = 16'h05;
        CFI_array[16'h2B] = 16'h00;
        if (tmp_char == "1" || tmp_char == "2")
        begin
            CFI_array[16'h2C] = 16'h01;
            CFI_array[16'h2D] = 16'h01;
            CFI_array[16'h2E] = 16'h00;
            CFI_array[16'h2F] = 16'h00;
            CFI_array[16'h30] = 16'h3F;
            CFI_array[16'h31] = 16'h00;
            CFI_array[16'h32] = 16'h00;
            CFI_array[16'h33] = 16'h00;
            CFI_array[16'h34] = 16'h00;
        end
        else if (tmp_char == "3" || tmp_char == "4")
        begin
            CFI_array[16'h2C] = 16'h02;
            CFI_array[16'h2D] = 16'h00;
            CFI_array[16'h2E] = 16'h20;
            CFI_array[16'h2F] = 16'h00;
            CFI_array[16'h30] = 16'h07;
            CFI_array[16'h31] = 16'h01;
            CFI_array[16'h32] = 16'h00;
            CFI_array[16'h33] = 16'h00;
            CFI_array[16'h34] = 16'h7E;
        end
        CFI_array[16'h35] = 16'h00;
        CFI_array[16'h36] = 16'h00;
        CFI_array[16'h37] = 16'h00;
        CFI_array[16'h38] = 16'h00;
        CFI_array[16'h39] = 16'h00;
        CFI_array[16'h3A] = 16'h00;
        CFI_array[16'h3B] = 16'h00;
        CFI_array[16'h3C] = 16'h00;
        //primary vendor-specific extended query
        CFI_array[16'h40] = 16'h50;
        CFI_array[16'h41] = 16'h52;
        CFI_array[16'h42] = 16'h49;
        CFI_array[16'h43] = 16'h31;
        CFI_array[16'h44] = 16'h33;
        CFI_array[16'h45] = 16'h08;
        CFI_array[16'h46] = 16'h02;
        CFI_array[16'h47] = 16'h01;
        CFI_array[16'h48] = 16'h00;
        CFI_array[16'h49] = 16'h08;
        CFI_array[16'h4A] = 16'h00;
        CFI_array[16'h4B] = 16'h00;
        CFI_array[16'h4C] = 16'h03;
        CFI_array[16'h4D] = 16'hB5;
        CFI_array[16'h4E] = 16'hC5;
        if (tmp_char == "1")
            CFI_array[16'h4F] = 16'h05;
        else if (tmp_char == "2")
            CFI_array[16'h4F] = 16'h04;
        else if (tmp_char == "3")
            CFI_array[16'h4F] = 16'h03;
        else if (tmp_char == "4")
            CFI_array[16'h4F] = 16'h02;
        CFI_array[16'h50] = 16'h01;

    end

    //Power Up time 100 ns
    initial
    begin
        PoweredUp = 1'b0;
        #100 PoweredUp = 1'b1;
    end

    always @(RESETNeg)
        begin
        RST <= #499 RESETNeg;
    end

    initial
    begin : Initialvalues
    integer i;
        write    = 1'b0;
        read     = 1'b0;
        Addr   = 0;

        WPage  = 0;
        RPage  = 0;
        RPchange  = 1'b1;

        ULBYPASS = 1'b0;
        OTP_ACT  = 1'b0 ;
        PSP_ACT  = 1'b0 ;
        ESP_ACT  = 1'b0 ;
        LOCK_ACT = 1'b0 ;
        PASS_ACT = 1'b0 ;
        PPB_ACT  = 1'b0 ;
        LCNT  = 0 ;

        PCNT  = 0;

        PDONE    = 1'b1;
        PSTART   = 1'b0;
        PSUSP    = 1'b0;
        PRES     = 1'b0;

        PERR     = 1'b0;

        EDONE    = 1'b1;
        ESTART   = 1'b0;
        ESUSP    = 1'b0;
        ERES     = 1'b0;

        EERR     = 1'b0;
        READY_in = 1'b0;
        READY    = 1'b0;

        for (i=0; i<= 15; i=i+1)
            LockReg[i] = 1;

        for (i=0; i<= SecNum; i=i+1)
            DYB[i] = 1;

        for(i=0;i<=7;i=i+1)
            Password[i] = MaxData;
        PPBLock = 1'b1;

    end

    always @(posedge START_T1_in)
    begin:TSTARTT1r
        #tdevice_START_T1 START_T1 = START_T1_in;
    end
    always @(negedge START_T1_in)
    begin:TSTARTT1f
        #1 START_T1 = START_T1_in;
    end

    always @(posedge CTMOUT_in)
    begin:TCTMOUTr
        #(tdevice_CTMOUT - 1) CTMOUT = CTMOUT_in;
    end
    always @(negedge CTMOUT_in)
    begin:TCTMOUTf
        #1 CTMOUT = CTMOUT_in;
    end

    always @(posedge READY_in)
    begin:TREADYr
        #tdevice_READY READY = READY_in;
    end
    always @(negedge READY_in)
    begin:TREADYf
        #1 READY = READY_in;
    end

    // Protection Bit Program
    always @(posedge PBPROG_in)
    begin : ProtProgTime
        #(tdevice_PPBLOCK - 1) PBPROG_out = 1'b1;
    end
    always @(negedge PBPROG_in)
    begin
        disable ProtProgTime;
        PBPROG_out = 1'b0;
    end

    // Password Unlock
    always @(posedge UNLOCKDONE_in)
    begin : UnlockTime
        #(tdevice_UNLOCK - 1) UNLOCKDONE_out = 1'b1;
    end
    always @(negedge UNLOCKDONE_in)
    begin
        disable UnlockTime;
        UNLOCKDONE_out = 1'b0;
    end

    ////////////////////////////////////////////////////////////////////////////
    ////     obtain 'LAST_EVENT information
    ////////////////////////////////////////////////////////////////////////////
    always @(negedge OENeg)
    begin
        OENeg_event = $time;
    end
    always @(negedge CENeg)
    begin
        CENeg_event = $time;
    end
    always @(A)
    begin
        ADDR_event = $time;
    end
    always @(DIn[15])
    begin
        if (~BYTENeg)
            ADDR_event = $time;
    end

    ////////////////////////////////////////////////////////////////////////////
    //// sequential process for reset control and FSM state transition
    ////////////////////////////////////////////////////////////////////////////
    reg R;
    reg E;

    always @(falling_edge_RESETNeg or PoweredUp or rising_edge_RESETNeg or
            RESETNeg or READY or next_state or RST)
    begin : StateTransition
        if (PoweredUp)
        begin
        //Hardware reset timing control
            if (falling_edge_RESETNeg)
            begin
                E = 1'b0;
                if (~PDONE || ~EDONE)
                begin
                    //if program or erase in progress
                    READY_in = 1'b1;
                    R = 1'b1;
                end
                else
                begin
                    READY_in = 1'b0;
                    R = 1'b0; //prog or erase not in progress
                end
            end
            else if (rising_edge_RESETNeg && RST)
            begin
                READY_in = 1'b0;
                R = 1'b0;
                E = 1'b1;
            end

            if (RESETNeg && (~R || (R && READY)))
            begin
                current_state = next_state;
                READY_in = 1'b0;
                E = 1'b0;
                R = 1'b0;
                reseted = 1'b1;
            end
            else if ((~R && ~RESETNeg && ~RST) ||
            (R && ~RESETNeg && ~RST && ~READY) ||
            (R && RESETNeg && ~RST && ~READY ))
            begin
                //no state transition while RESET# low
                current_state = RESET; //reset start
                reseted       = 1'b0;
            end
        end
        else
        begin
            current_state = RESET; // reset
            reseted = 1'b0;
            E = 1'b0;
            R = 1'b0;
        end
    end
    //////////////////////////////////////////////////////////////////////////
    //Glitch Protection: Inertial Delay does not propagate pulses < 3ns
    //////////////////////////////////////////////////////////////////////////
    assign #3 gWE_n = WENeg_ipd;
    assign #3 gCE_n = CENeg_ipd;
    assign #3 gOE_n = OENeg_ipd;

    //latch address on rising edge and data on falling edge  of write
    always @(gWE_n or gCE_n or gOE_n or RESETNeg or reseted)
    begin: write_dc
        if (RESETNeg!=1'b0 && reseted)
        begin
            if (~gWE_n && ~gCE_n && gOE_n)
                write = 1'b1;
            else if ((gWE_n || gCE_n) && gOE_n)
                write = 1'b0;
        end

        if (gWE_n && ~gCE_n && ~gOE_n)
            read = 1'b1;
        else
            read = 1'b0;
    end

    //////////////////////////////////////////////////////////////////////////
    //Process that reports warning when changes on signals WE#, CE#, OE# are
    //discarded
    //////////////////////////////////////////////////////////////////////////
    always @(WENeg)
    begin: PulseWatch1
        if (gWE_n == WENeg) $display("Glitch on WE#");
    end
    always @(CENeg)
    begin: PulseWatch2
        if (gCE_n == CENeg) $display("Glitch on CE#");
    end
    always @(OENeg)
    begin: PulseWatch3
        if (gOE_n == OENeg) $display("Glitch on OE#");
    end

    //////////////////////////////////////////////////////////////////////////
    //Latch address on falling edge of WE# or CE# what ever comes later
    //Latches data on rising edge of WE# or CE# what ever comes first
    // also Write cycle decode
    //////////////////////////////////////////////////////////////////////////
    always @(falling_edge_WENeg or falling_edge_CENeg or falling_edge_OENeg
            or rising_edge_WENeg or rising_edge_CENeg or rising_edge_write
            or rising_edge_read or A_event or DIn_15_event or BYTENeg_event)
    begin : BusCycleDecode
        if (reseted)
        begin
            if ((falling_edge_WENeg && ~CENeg && OENeg) ||
            (falling_edge_CENeg && WENeg !== OENeg) ||
            (falling_edge_OENeg && WENeg && ~CENeg) ||
            ((A_event || (DIn_15_event && ~BYTENeg) || BYTENeg_event) &&
            WENeg && ~CENeg && ~OENeg) )
            begin
                A_tmp = A[10:0];
                AddressLatched = A;
                sector = ReturnSectorID(AddressLatched);
                ADDRHILO(AddrLOW, AddrHIGH, sector);
                AddrTmp = AddressLatched - (AddrLOW / 2);

                if (~BYTENeg)
                    A_tmp1 = { AddrTmp[15:0],DIn[15] };
                else
                    A_tmp1 = { AddrTmp[15:0], 1'b0 };
            end
            else if ((rising_edge_WENeg || rising_edge_CENeg) && write)
            begin
                D_tmp0 = DIn[7:0];
                if (BYTENeg)
                    D_tmp1 = DIn[15:8];
            end

            if (rising_edge_write || rising_edge_read || falling_edge_OENeg ||
            (A_event || (DIn_15_event && ~BYTENeg) || BYTENeg_event) && WENeg
            && ~CENeg && ~OENeg)
            begin
                SecAddr = sector;
                Address = A_tmp1;
                WPage = A_tmp1 / 32;
                if ((RPage != (A_tmp1/16)) || (CENeg!=CE))
                    RPchange = 1'b1;
                else
                    RPchange = 1'b0;
                RPage = A_tmp1/16;
                CE = CENeg;
                Addr = A_tmp;
            end
        end
    end

    //////////////////////////////////////////////////////////////////////////
    // Timing control for the Program / Write Buffer Program Operations
    // start/ suspend/ resume
    //////////////////////////////////////////////////////////////////////////
    integer cnt_write = 0;
    time elapsed_write  ;
    time duration_write ;
    time start_write    ;
    event pdone_event;

    always @(rising_edge_reseted or rising_edge_PSTART or rising_edge_PSUSP
            or rising_edge_PRES)
    begin : ProgTime
        if (rising_edge_reseted)
        begin
            #1 PDONE = 1; // reset done, programming terminated
            disable pdone_process;
        end
        else if (reseted)
        begin
            if (rising_edge_PSTART && PDONE)
            begin
                if (~( ( (~DYB[SA] || ~PPB[SA]) && ~OTP_ACT && ~PPB_ACT
                && ~LOCK_ACT && ~PASS_ACT) ||
                (PASS_ACT && ~LockReg[2]) ||
                (Ers_queue[SA] && ESP_ACT) ||
                (FactoryProt && OTP_ACT) ||
                (~LockReg[0] && OTP_ACT) ||
                (~WPNeg && (SA == ProtSecNum || SA == ProtSecNum1 )) ) )
                begin
                    if (PCNT<32)  //buffer
                    begin
                        if (BYTENeg)
                            cnt_write = PCNT+2;
                        else
                            cnt_write = PCNT+1;
                        duration_write = cnt_write* tdevice_WBPB;
                    end
                    else   //Word/Byte program
                    begin
                        if (BYTENeg) duration_write =  tdevice_POW;
                        else duration_write =  tdevice_POW / 2;
                    end
                    elapsed_write = 0;
                    PDONE <= #1 1'b0;
                    ->pdone_event;
                    start_write = $time;
                end
                else
                begin
                    PERR = 1'b1;
                    PERR <= #1000 1'b0;
                end
            end
            else if (rising_edge_PSUSP && ~PDONE)
            begin
                elapsed_write = $time - start_write;
                duration_write = duration_write - elapsed_write;
                disable pdone_process;
                PDONE = 0;
            end
            else if (rising_edge_PRES && ~PDONE)
            begin
                start_write = $time;
                PDONE = 0;
                -> pdone_event;
            end
        end
    end

    always @(pdone_event)
    begin:pdone_process
        #duration_write PDONE = 1'b1;
    end

    //////////////////////////////////////////////////////////////////////////
    // Timing control for the Erase Operations
    //////////////////////////////////////////////////////////////////////////
    integer cnt_erase = 0;
    time elapsed_erase;
    time duration_erase;
    time start_erase;
    event edone_event;

    always @(posedge reseted)
    begin
        disable edone_process;
        EDONE = 1'b1;
    end

    always @(reseted or ESTART)
    begin: erase
    integer i;
        if (reseted)
        begin
            if (ESTART && EDONE)
            begin
                cnt_erase = 0;

                for (i=0;i<=SecNum;i=i+1)
                    if (Ers_queue[i] && DYB[i]==1'b1 && PPB[i]==1'b1 &&
                    ~( ~WPNeg && (i == ProtSecNum || i == ProtSecNum1 ))
                    && ~PPB_ACT )
                    begin
                        cnt_erase = cnt_erase + 1;
                    end

                if (PPB_ACT)
                    cnt_erase = 1;

                if (cnt_erase > 0)
                begin
                    elapsed_erase = 0;
                    duration_erase = cnt_erase* tdevice_SEO;
                    ->edone_event;
                    start_erase = $time;
                end
                else
                begin
                    EERR = 1'b1;
                    EERR <= #100000 1'b0;
                end
            end
        end
    end

    always @(edone_event)
    begin : edone_process
        EDONE = 1'b0;
        #duration_erase EDONE = 1'b1;
    end

    always @(reseted or ESUSP)
    begin
        if (reseted)
            if (ESUSP && ~EDONE)
            begin
                disable edone_process;
                elapsed_erase = $time - start_erase;
                duration_erase = duration_erase - elapsed_erase;
                EDONE = 1'b0;
            end
    end
    always @(reseted or ERES)
    begin
        if (reseted)
            if (ERES && ~EDONE)
            begin
                start_erase = $time;
                EDONE = 1'b0;
                ->edone_event;
            end
    end

    //////////////////////////////////////////////////////////////////////////
    // Main Behavior Process
    // combinational process for next state generation
    //////////////////////////////////////////////////////////////////////////
    reg PATTERN_1  = 1'b0;
    reg PATTERN_2  = 1'b0;
    reg A_PAT_1  = 1'b0;

    integer DataHi   ; //DATA  High Byte
    integer DataLo   ; //DATA Low Byte

    always @(falling_edge_write or reseted or falling_edge_RST or
            rising_edge_PBPROG_out or rising_edge_UNLOCKDONE_out or
            rising_edge_EDONE or falling_edge_EERR or rising_edge_sCTMOUT or
            rising_edge_sSTART_T1 or rising_edge_PDONE or
            falling_edge_PERR)
    begin: StateGen1

        if (falling_edge_write)
        begin
            DataLo    = D_tmp0;
            PATTERN_1 = (Addr==16'h555) && (DataLo==8'hAA) ;
            PATTERN_2 = (Addr==16'h2AA) && (DataLo==8'h55) ;
            A_PAT_1   = (Addr==16'h555);
        end

        if (falling_edge_RST && ~RESETNeg)
        begin
            LOCK_ACT = 0;
            PPB_ACT = 0;
        end

        if (reseted!=1'b1)
            next_state = current_state;
        else
        case (current_state)
            RESET :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_1)
                        next_state = Z001;
                    else if ((Addr==8'h55) && (DataLo==8'h98))
                        next_state = CFI;
                    else
                        next_state = RESET;
                end
            end

            Z001 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_2)
                        next_state = PREL_SETBWB;
                    else
                        next_state = RESET;
                end
            end

            PREL_SETBWB :
            begin
                if (falling_edge_write)
                begin
                    if (A_PAT_1 && (DataLo==16'h20))
                        next_state = PREL_ULBYPASS;
                    else if  (A_PAT_1 && (DataLo==16'h90))
                        next_state = AS;
                    else if (A_PAT_1 && (DataLo==16'hA0))
                        #1 next_state = A0SEEN;
                    else if (A_PAT_1 && (DataLo==16'h88))
                        next_state = OTP;
                    else if (A_PAT_1 && (DataLo==16'h40))
                    begin
                        next_state = LOCKREG_CMDSET;
                        LOCK_ACT = 1'b1;
                    end
                    else if (A_PAT_1 && (DataLo==16'h60))
                    begin
                        next_state = PASS_CMDSET;
                        PASS_ACT = 1'b1;
                    end
                    else if (A_PAT_1 && (DataLo==16'h50))
                        next_state = PPBLOCK_CMDSET;
                    else if (A_PAT_1 && (DataLo==16'hC0))
                    begin
                        next_state = PPB_CMDSET;
                        PPB_ACT = 1'b1;
                    end
                    else if (A_PAT_1 && (DataLo==16'hE0))
                        next_state = DYB_CMDSET;
                    else if (A_PAT_1 && (DataLo==16'h80))
                        next_state = C8;
                    else if (DataLo==16'h25)
                        //fix Sector Address SA
                        next_state = WBPGMS_WBCNT;
                    else
                        next_state = RESET;
                end
            end

            PREL_ULBYPASS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo==16'hA0)
                        next_state = A0SEEN;
                    else if (DataLo==16'h80)
                        next_state = C8_PREL;
                    else if (DataLo==16'h90)
                        next_state = EXIT_ULBYPASS;
                    else if (DataLo==16'h25)
                        //fix Sector Address  SA
                        next_state = WBPGMS_WBCNT;
                    else
                        next_state = PREL_ULBYPASS;
                end
            end

            EXIT_ULBYPASS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                        next_state = RESET;
                    else
                        next_state = PREL_ULBYPASS;
                end
            end

            CFI :
            begin
                if (falling_edge_write)
                begin
                    if ((Addr==16'h55) && (DataLo==16'h98))
                        next_state = CFI;
                    else if (DataLo==16'hF0)
                        next_state = RESET;
                    else
                        next_state =  CFI;
                end
            end

            AS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo==16'hF0)
                        next_state = RESET;
                    else
                        next_state = AS;
                end
            end

            LOCKREG_CMDSET :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hA0)
                        #1 next_state = LOCKREG_A0SEEN;
                    else if (DataLo == 16'h90)
                        next_state = EXIT_LOCKREG;
                end
            end

            LOCKREG_A0SEEN :
            begin
                if (falling_edge_write)
                begin
                    tempLR = DataLo;
                    if (~(tempLR[1] == 1'b0 && tempLR[2] == 1'b0))
                        #2 next_state = PGMS;
                    else
                        next_state = LOCKREG_CMDSET;
                end
            end

            EXIT_LOCKREG :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                    begin
                        next_state = RESET;
                        LOCK_ACT = 1'b0;
                    end
                    else
                        next_state = LOCKREG_CMDSET;
                end
            end

            PPB_CMDSET :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hA0)
                        next_state = PPB_A0SEEN;
                    else if (DataLo == 16'h80)
                        next_state = PPB_80SEEN;
                    else if (DataLo == 16'h90)
                        next_state = EXIT_PPB;
                end
            end

            PPB_A0SEEN :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                        #2 next_state = PGMS;
                    else
                        next_state = PPB_CMDSET;
                end
            end

            PPB_80SEEN :
            begin
                if (falling_edge_write)
                begin
                    if ((DataLo == 16'h30) && (Addr==16'h00))
                        next_state = SERS;
                    else
                        next_state = PPB_CMDSET;
                end
            end

            EXIT_PPB :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                    begin
                        next_state = RESET;
                        PPB_ACT = 1'b0;
                    end
                    else
                    begin
                         next_state = PPB_CMDSET;
                    end
                end
            end

            DYB_CMDSET :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hA0)
                        next_state = DYB_SETCLEAR;
                    else if (DataLo == 16'h90)
                        next_state = EXIT_DYB;
                end
            end

            DYB_SETCLEAR :
            begin
                if (falling_edge_write)
                    next_state = DYB_CMDSET;
            end

            EXIT_DYB :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                        next_state = RESET;
                    else
                        next_state = DYB_CMDSET;
                end
            end

            PPBLOCK_CMDSET :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hA0)
                        next_state = PPBLOCK_A0SEEN;
                    else if (DataLo == 16'h90)
                        next_state = EXIT_PPBLOCK;
                end
            end

            PPBLOCK_A0SEEN :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                        next_state = PPBLOCK_SET;
                    else
                        next_state = PPBLOCK_CMDSET;
                end
            end

            PPBLOCK_SET :
            begin
                if (rising_edge_PBPROG_out)
                    next_state = PPBLOCK_CMDSET;
            end

            EXIT_PPBLOCK :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                        next_state = RESET;
                    else
                        next_state = PPBLOCK_CMDSET;
                end
            end

            PASS_CMDSET :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hA0)
                        next_state = PASS_A0SEEN;
                    else if (DataLo == 16'h90)
                        next_state = EXIT_PASS;
                    else if ((DataLo == 16'h25) && (Addr==16'h00))
                        next_state = PASSUNLOCK1;
                end
            end

            PASS_A0SEEN :
            begin
                if (falling_edge_write)
                    #2 next_state = PGMS;
            end

            PASSUNLOCK1 :
            begin
                if (falling_edge_write)
                begin
                    if ((Addr % 16'h100 == 16'h00) && (DataLo == 16'h03))
                        next_state = PASSUNLOCK2;
                    else
                        next_state = PASS_CMDSET;
                end
            end

            PASSUNLOCK2 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK3;
            end

            PASSUNLOCK3 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK4;
            end

            PASSUNLOCK4 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK5;
            end

            PASSUNLOCK5 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK6;
            end

            PASSUNLOCK6 :
            begin
                if (falling_edge_write)
                begin
                    if (BYTENeg)
                    begin
                        if (( Addr % 16'h100 == 16'h00 ) && DataLo == 16'h29)
                            next_state = PASSUNLOCK;
                        else
                            next_state = PASS_CMDSET;
                    end
                    else
                        next_state = PASSUNLOCK7;
                end
            end

            PASSUNLOCK7 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK8;
            end

            PASSUNLOCK8 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK9;
            end

            PASSUNLOCK9 :
            begin
                if (falling_edge_write)
                    next_state = PASSUNLOCK10;
            end

            PASSUNLOCK10 :
            begin
                if (falling_edge_write)
                begin
                    if (( Addr % 16'h100 == 16'h00 ) && DataLo == 16'h29)
                        next_state = PASSUNLOCK;
                    else
                        next_state = PASS_CMDSET;
                end
            end

            PASSUNLOCK :
            begin
                if (rising_edge_UNLOCKDONE_out)
                    next_state = PASS_CMDSET;
            end

            EXIT_PASS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h00)
                    begin
                        next_state = RESET;
                        PASS_ACT = 1'b0;
                    end
                    else
                        next_state = PASS_CMDSET;
                end
            end

            A0SEEN :
            begin
                if (falling_edge_write)
                    #2 next_state = PGMS;
                else
                    next_state = A0SEEN;
            end

            OTP :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_1)
                        next_state = OTP_Z001;
                    else
                        next_state = OTP;
                end
            end

            OTP_Z001 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_2)
                        next_state = OTP_PREL;
                    else
                        next_state = OTP;
                end
            end

            OTP_PREL :
            begin
                if (falling_edge_write)
                begin
                    if (A_PAT_1 && (DataLo == 16'h90))
                        next_state = OTP_AS;
                    else if (DataLo == 16'h25)
                        //fix Sector Address  SA
                        next_state = WBPGMS_WBCNT;
                    else if (A_PAT_1 && (DataLo == 16'hA0))
                        next_state = OTP_A0SEEN;
                    else
                        next_state = OTP;
                end
            end

            OTP_AS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo==16'hF0)
                    begin
                        if (PSP_ACT)
                            next_state = PSP;
                        else if (ESP_ACT)
                            next_state = ESP;
                        else
                            next_state = RESET;
                    end
                    else if (DataLo==16'h00)
                    begin
                        if (PSP_ACT)
                            next_state = PSP;
                        else if (ESP_ACT)
                            next_state = ESP;
                        else
                            next_state = RESET;
                    end
                    else
                        next_state = OTP;
                end
            end

            OTP_A0SEEN :
            begin
                if (falling_edge_write)
                    #2 next_state = PGMS; //set OTP
                else
                    next_state = OTP_A0SEEN;
            end

            C8 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_1)
                        next_state = C8_Z001;
                    else
                        next_state = RESET;
                end
            end

            C8_Z001 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_2)
                        next_state = C8_PREL;
                    else
                        next_state = RESET;
                end
            end

            C8_PREL :
            begin
                if (falling_edge_write)
                begin
                    if ((A_PAT_1 || ULBYPASS == 1'b1) && (DataLo==16'h10))
                        #2 next_state = ERS;
                    else if (DataLo==16'h30)
                        #2 next_state = SERS;
                    else if (ULBYPASS)
                        next_state = PREL_ULBYPASS;
                    else
                        next_state = RESET;
                end
            end

            ERS :
            begin
                if (rising_edge_EDONE || falling_edge_EERR)
                begin
                    if (ULBYPASS)
                        next_state = PREL_ULBYPASS;
                    else
                        next_state = RESET;
                end
            end

            SERS :
            begin
                if ( rising_edge_sCTMOUT )
                    next_state = SERS_EXEC;
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hB0)
                        next_state = ESP; // ESP according to datasheet
                    else if (DataLo==16'h30)
                        next_state = SERS;
                    else if (ULBYPASS)
                        next_state = PREL_ULBYPASS;
                    else
                        next_state = RESET;
                end
            end

            ESPS :
            begin
                if (rising_edge_sSTART_T1)
                    next_state = ESP;
            end

            WBPGMS_WBCNT :
            begin
                if (falling_edge_write)
                begin
                    if ((SecAddr == SA) && ((~BYTENeg && DataLo < 32) ||
                    ( BYTENeg && DataLo < 16 )))
                        #1 next_state = WBPGMS_WBLSTA;
                    else
                        next_state = WBPGMS_WBABORT;
                end
            end

            WBPGMS_WBLSTA :
            begin
                if (falling_edge_write)
                begin
                    if (SecAddr == SA)   // fix WriteBufferPage  WBPage
                        if (LCNT > 0)
                            #1 next_state = WBPGMS_WBLOAD;
                        else
                            next_state = WBPGMS_CONFB;
                    else
                        next_state = WBPGMS_WBABORT;
                end
            end

            WBPGMS_WBLOAD :
            begin
                if (falling_edge_write)
                begin
                    if (WPage==WBPage)
                        if (LCNT>0)
                            next_state = WBPGMS_WBLOAD;
                        else
                            next_state = WBPGMS_CONFB;
                    else
                        next_state = WBPGMS_WBABORT;
                end
            end

            WBPGMS_CONFB :
            begin
                if (falling_edge_write)
                begin
                    if ((SecAddr == SA) && (DataLo == 16'h29))
                        next_state = PGMS; //WBPGMS
                    else
                        next_state = WBPGMS_WBABORT;
                end
            end

            WBPGMS_WBABORT :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_1)
                        next_state = WBPGMS_Z001;
                end
            end

            WBPGMS_Z001 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_2)
                        next_state = WBPGMS_PREL;
                    else
                        next_state = WBPGMS_WBABORT;
                end
            end

            WBPGMS_PREL :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hF0)
                    begin
                        if (ESP_ACT)
                            next_state = ESP;
                        else if (ULBYPASS)
                            next_state = PREL_ULBYPASS;
                        else if (OTP_ACT)
                            next_state = OTP;
                        else
                            next_state = RESET;
                    end
                    else
                        next_state = WBPGMS_WBABORT;
                end
            end

            SERS_EXEC :
            begin
                if (rising_edge_EDONE || falling_edge_EERR)
                begin
                    if (ULBYPASS)
                        next_state = PREL_ULBYPASS;
                    else if (PPB_ACT)
                        next_state = PPB_CMDSET;
                    else
                        next_state = RESET;
                end

                if (falling_edge_write)
                begin
                    if (EERR != 1'b1)
                    begin
                        if ( DataLo == 16'hB0 )
                            next_state = ESPS;
                    end
                end
            end

            ESP :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h30)
                        next_state = SERS_EXEC;
                    else
                    begin
                        if ((Addr == 16'h55) && (DataLo == 16'h98))
                            next_state = ESP_CFI;
                        else if (PATTERN_1)
                            next_state = ESP_Z001;
                    end
                end
            end

            ESP_Z001 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_2)
                        #1 next_state = ESP_PREL;
                    else
                        next_state = ESP;
                end
            end

            ESP_PREL :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h25)
                        //fix SA
                        next_state = WBPGMS_WBCNT; //set ESP
                    else if (A_PAT_1 && DataLo == 16'hA0)
                        #1 next_state = ESP_A0SEEN;
                    else if (A_PAT_1 && DataLo == 16'h88)
                        next_state = OTP; //set ESP
                    else if (A_PAT_1 && DataLo == 16'h90)
                        next_state = ESP_AS;
                    else
                        next_state = ESP;
                end
            end

            ESP_CFI :
            begin
                if (falling_edge_write)
                    if (DataLo == 16'hF0)
                        next_state = ESP;
            end

            ESP_A0SEEN :
            begin
                if (falling_edge_write)
                    #2 next_state = PGMS;
            end

            ESP_AS :
            begin
                if (falling_edge_write)
                    if (DataLo == 16'hF0)
                        next_state = ESP;
            end

            PGMS :
            begin
                if (rising_edge_PDONE || falling_edge_PERR)
                begin
                    if (ESP_ACT)
                        next_state = ESP;
                    else if (LOCK_ACT)
                        next_state = LOCKREG_CMDSET;
                    else if (PPB_ACT)
                        next_state = PPB_CMDSET;
                    else if (PASS_ACT)
                        next_state = PASS_CMDSET;
                    else if (ULBYPASS)
                        next_state = PREL_ULBYPASS;
                    else if (OTP_ACT)
                        next_state = OTP;
                    else
                        next_state = RESET;
                end
                else if (OTP_ACT)
                begin
                end
                else if (falling_edge_write && PERR != 1'b1)
                begin
                    if (DataLo==16'hB0)
                        #1 next_state = PSPS;
                end
            end

            PSPS :
            begin
                if (rising_edge_sSTART_T1)
                    next_state = PSP;
            end

            PSP :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h30)
                        next_state = PGMS;
                    else if ((Addr == 16'h55) && (DataLo == 16'h98))
                        next_state = PSP_CFI;
                    else if (PATTERN_1)
                        next_state = PSP_Z001;
                end
            end

            PSP_CFI :
            begin
                if (falling_edge_write)
                begin
                    if ((Addr == 16'h55) && (DataLo == 16'h98))
                    begin
                    end
                    else if (DataLo == 16'hF0)
                        next_state = PSP;
                end
            end

            PSP_Z001 :
            begin
                if (falling_edge_write)
                begin
                    if (PATTERN_2)
                        next_state = PSP_PREL;
                    else
                        next_state = PSP;
                end
            end

            PSP_PREL :
            begin
                if (falling_edge_write)
                begin
                    if (A_PAT_1 && (DataLo == 16'h90))
                        next_state = PSP_AS;
                    else if (A_PAT_1 && (DataLo ==16'h88))
                        next_state = OTP; //set PSP
                    else
                        next_state = PSP;
                end
            end

            PSP_AS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 16'hF0)
                        next_state = PSP;
                end
            end

        endcase

    end

    ///////////////////////////////////////////////////////////////////////////
    //FSM Output generation and general functionality
    ///////////////////////////////////////////////////////////////////////////
    reg [31:0] PassAddr;
    integer i,j;

    always @(falling_edge_write or rising_edge_read or
            falling_edge_RST or reseted or rising_edge_PBPROG_out or
            rising_edge_UNLOCKDONE_out or rising_edge_sCTMOUT or
            rising_edge_sSTART_T1 or gOE_n or gCE_n or RESETNeg or
            RST or BYTENeg or A_event or reseted or current_state or
            rising_edge_PDONE or rising_edge_EDONE or
            PERR or Address_event)
    begin : Functional
        if (falling_edge_write)
        begin
            DataLo = D_tmp0;
            DataHi = D_tmp1;
            PATTERN_1 = (Addr == 12'h555 && DataLo == 8'hAA);
            PATTERN_2 = (Addr == 12'h2AA && DataLo == 8'h55);
            A_PAT_1   = Addr == 12'h555;
        end
        oe = rising_edge_read || (read && Address_event);
        oe_toggle = rising_edge_read;

        if (falling_edge_RST && ~RESETNeg)
        begin
            ULBYPASS = 0;
            ESP_ACT = 0;
            PSP_ACT = 0;
            if ( ~LockReg[2] )
                PPBLock = 0;
            else
                PPBLock = 1;

            DYB = ~(0);
            UNLOCKDONE_in = 0;
            START_T1_in = 0;
        end

        if (reseted)
        begin
        case (current_state)
            RESET :
            begin
                OTP_ACT = 0;
                PSP_ACT = 0;
                ESP_ACT = 0;

                if (falling_edge_write)
                begin
                    if (Addr == 8'h55 && DataLo == 8'h98)
                        ULBYPASS = 0;
                end
                else if (oe)
                begin
                    DOut_zd[7:0] = READMEM(SecAddr, Address);
                    if (BYTENeg)
                        DOut_zd[15:8] = READMEM(SecAddr, Address+1);
                end

                RY_zd = 1;
            end

            Z001 :
            begin
            end

            PREL_SETBWB :
            begin
                if (falling_edge_write)
                begin
                    if (A_PAT_1 && DataLo == 8'h20)
                        ULBYPASS = 1;
                    else if (A_PAT_1 && DataLo == 8'h90)
                        ULBYPASS = 0;
                    else if (A_PAT_1 && DataLo == 8'h88)
                    begin
                        ULBYPASS = 0;
                        OTP_ACT = 1;
                    end
                    else if (DataLo == 8'h25)
                        SA = SecAddr;
                end
            end

            PREL_ULBYPASS:
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 8'h25)
                        SA = SecAddr;
                end
                if (oe)
                begin
                    DOut_zd[7:0] = READMEM(SecAddr, Address);
                    if (BYTENeg)
                        DOut_zd[15:8] = READMEM(SecAddr, Address+1);
                end
                RY_zd = 1;
            end

            EXIT_ULBYPASS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 8'h00)
                        ULBYPASS = 0;
                end
                RY_zd = 1;
            end

            CFI :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 8'hF0)
                        ULBYPASS = 0;
                end
                if (oe)
                begin
                    DOut_zd[15:0] = 16'b0;
                    if ((Addr >= 16'h10)&&(Addr <= 16'h50))
                    begin
                        if (~BYTENeg)
                            DOut_zd[15:8] = 8'bZ;
                        DOut_zd[7:0] = CFI_array[Addr];
                    end
                    else
                        $display ("Invalid CFI query address");
                end
            end

            AS :
            begin
                if (falling_edge_write)
                begin
                    if (DataLo == 8'hF0)
                        ULBYPASS = 0;
                end
                else if (oe)
                begin
                    if (BYTENeg)
                    begin
                        if (Address == 0)
                            DOut_zd[15:8] = 0;
                        else
                            DOut_zd[15:8] = 8'h22;
                    end
                    else
                        DOut_zd[15:8] = 8'bZ;

                    if (Addr == 0)
                        DOut_zd[7:0] = 1;
                    else if (Addr == 1)
                        DOut_zd[7:0] = 8'h7E;
                    else if (Addr == 2)
                    begin
                        DOut_zd[7:1] = 7'b0;
                        if (DYB[SecAddr] && PPB[SecAddr])
                            DOut_zd[0] = 1'b0;
                        else
                            DOut_zd[0] = 1'b1;
                    end
                    else if (Addr == 3)
                    begin
                        DOut_zd[7:0] = 10;
                        if (ProtSecNum > 0)
                            //Highest Address Sector Protected by WP#
                            DOut_zd[4] = 1'b1;

                        if (FactoryProt)
                            DOut_zd[7] = 1'b1;
                    end
                    else if (Addr == 16'hE)
                    begin
                        if (tmp_char == "1" || tmp_char == "2")
                            DOut_zd[7:0] = 8'h0C;
                        else if (tmp_char == "3" || tmp_char == "4")
                            DOut_zd[7:0] = 8'h10;
                    end
                    else if (Addr == 16'hF)
                    begin
                        if ( tmp_char == "1" || tmp_char == "2" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "3" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "4" )
                            DOut_zd[7:0] = 8'b00;
                    end
                end
            end

            LOCKREG_CMDSET:
            begin
                if (oe)
                begin
                    if (Addr == 16'h00)
                    begin
                        DOut_zd[7:0] = LockReg[7:0];
                        if (BYTENeg)
                            DOut_zd[15:8] = LockReg[15:8];
                    end
                end
                RY_zd = 1;
            end

            LOCKREG_A0SEEN :
            begin
                if (falling_edge_write)
                begin
                    tempLo = DataLo;
                    if ( ~(temp[1] === 1'b0 && temp[2] === 1'b0))
                    begin
                        PSTART = 1'b1;
                        PSTART <= #1 1'b0;
                        PSUSP = 1'b0;
                        PRES = 1'b0;
                        PCNT = 32;
                        if ( tempLo[1] == 1'b0 && LockReg[2] == 1'b0 )
                            // Can not program SPMLB if PPMLB programmed
                            tempLo[1] = 1'b1;
                        else if ( tempLo[2] == 1'b0 && LockReg[1] == 1'b0 )
                            // Can not program PPMLB if SPMLB programmed
                            tempLo[2] = 1'b1;
                        WBData[0] = tempLo;
                        WBData[1] = DataHi;
                        WBAddr[0] = 0;
                        PGMS_FLAG = LREG;
                        PR_FLAG = 0;
                        WBPage = WPage;
                        SA = SecAddr;
                        temp = DataLo;
                        Status[7] = ~temp[7];
                        if (BYTENeg)
                            WBAddr[1] = WBAddr[0] +1;
                        else
                            WBAddr[1] = -1;
                    end
                end
            end

            EXIT_LOCKREG :
            begin
            end

            PPB_CMDSET:
            begin
                if (oe)
                begin
                    DOut_zd[7:1] = 7'b0;
                    DOut_zd[0] = PPB[SecAddr];
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end
                RY_zd = 1;
            end

            PPB_A0SEEN :
            begin
                if ( falling_edge_write )
                begin
                    PSTART = 1'b1;
                    PSTART <= #1 1'b0;
                    PSUSP = 1'b0;
                    PRES = 1'b0;
                    PCNT = 32;

                    WBAddr[0] = 0;
                    WBAddr[1] = -1;
                    WBData[1] = -1;
                    WBData[0] = 1;

                    PGMS_FLAG = PPB_BIT;
                    PR_FLAG = 0;
                    WBPage = WPage;
                    SA = SecAddr;
                    temp = DataLo;
                    Status[7] = ~temp[7];
                end
            end

            PPB_80SEEN :
            begin
                if ( falling_edge_write && DataLo == 16'h30 && Addr==16'h00)
                begin
                    CTMOUT_in = 1'b0;
                    CTMOUT_in <= #1 1'b1;
                end
            end

            EXIT_PPB :
            begin
            end

            DYB_CMDSET:
            begin
                if (oe)
                begin
                    DOut_zd[7:1] = 7'b0;
                    DOut_zd[0] = DYB[SecAddr];
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end
            end

            DYB_SETCLEAR :
            begin
                if ( falling_edge_write )
                begin
                    if ( DataLo == 16'h00 )
                        DYB[SecAddr] = 1'b0;
                    else if ( DataLo == 16'h01 )
                        DYB[SecAddr] = 1'b1;
                end
            end

            EXIT_DYB :
            begin
            end

            PPBLOCK_CMDSET:
            begin
                if (oe)
                begin
                    DOut_zd[7:1] = 7'b0;
                    DOut_zd[0] = PPBLock;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end
            end

            PPBLOCK_A0SEEN :
            begin
                if ( falling_edge_write )
                begin
                    if ( DataLo == 16'h00 )
                    begin
                        PBPROG_in = 1'b0;
                        PBPROG_in <= #1 1'b1;
                    end
                end
            end

            PPBLOCK_SET :
            begin
                if (rising_edge_PBPROG_out)
                begin
                    PPBLock = 0;
                    PBPROG_in = 0;
                end
            end

            EXIT_PPBLOCK :
            begin
            end

            PASS_CMDSET:
            begin
                if (oe)
                begin
                    if (LockReg[2] != 1'b0)
                        DOut_zd[7:0] = Password[Address % 8];
                    else
                        DOut_zd[7:0] = 8'hFF;

                    if (BYTENeg)
                        if (LockReg[2] != 1'b0)
                            DOut_zd[15:8] = Password[(Address % 8)+1];
                        else
                            DOut_zd[15:8] = 8'hFF;
                end
                RY_zd = 1;
            end

            PASS_A0SEEN :
            begin
                if ( falling_edge_write )
                begin
                    PSTART = 1'b1;
                    PSTART <= #1 1'b0;
                    PSUSP = 1'b0;
                    PRES = 1'b0;
                    PCNT = 32;

                    WBData[0] = DataLo;
                    WBData[1] = DataHi;
                    WBAddr[0] = Address % 8;
                    PGMS_FLAG = PASSW;
                    PR_FLAG = 0;

                    SA = SecAddr;
                    temp = DataLo;
                    Status[7] = ~temp[7];

                    if (BYTENeg)
                        WBAddr[1] = WBAddr[0] +1;
                    else
                        WBAddr[1] = -1;
                end
            end

            PASSUNLOCK1 :
            begin
                PassMATCH = 0;
            end

            PASSUNLOCK2, PASSUNLOCK3, PASSUNLOCK4, PASSUNLOCK5 :
            begin
                if ( falling_edge_write )
                begin
                    PassAddr = ((Address % 16'h100) % 8 );
                    if (BYTENeg)
                    begin
                        PassMATCH[PassAddr] = ( Password[PassAddr] == DataLo );
                        PassMATCH[PassAddr+1] =(Password[PassAddr+1] == DataHi);
                    end
                    else
                        PassMATCH[PassAddr] = ( Password[PassAddr] == DataLo );
                end
            end

            PASSUNLOCK6 :
            begin
                if ( falling_edge_write )
                begin
                    if ((Addr % 16'h100) == 16'h00 && DataLo == 16'h29 &&
                    BYTENeg )
                    begin
                        UNLOCKDONE_in = 1'b0;
                        UNLOCKDONE_in <= #1 1'b1;
                    end
                    else if (~BYTENeg)
                    begin
                        PassAddr = ((Address % 16'h100)% 8 );
                        PassMATCH[PassAddr] = ( Password[PassAddr] == DataLo );
                    end
                end
            end

            PASSUNLOCK7, PASSUNLOCK8, PASSUNLOCK9 :
            begin
                if ( falling_edge_write )
                begin
                    PassAddr = ((Address % 16'h100) % 8 );
                    PassMATCH[PassAddr] = ( Password[PassAddr] == DataLo );
                end
            end

            PASSUNLOCK10 :
            begin
                if ( falling_edge_write )
                begin
                    if (( Addr % 16'h100) == 16'h00 && DataLo == 16'h29 )
                    begin
                        UNLOCKDONE_in = 1'b0;
                        UNLOCKDONE_in <= #1 1'b1;
                    end
                end
            end

            PASSUNLOCK :
            begin
                if ( rising_edge_UNLOCKDONE_out && PassMATCH == 8'b11111111 )
                    PPBLock = 1;
            end

            EXIT_PASS :
            begin
            end

            A0SEEN :
            begin
                if ( falling_edge_write )
                begin
                    PSUSP  = 1'b0;
                    PRES   = 1'b0;
                    PCNT   = 32;

                    PGMS_FLAG = MEMORY;
                    PR_FLAG = 0;

                    WBData[0] = DataLo;
                    WBData[1] = DataHi;
                    WBAddr[0] = Address % 32;
                    WBPage = WPage;
                    SA = SecAddr;
                    PSTART = 1'b1;
                    PSTART <= #1 1'b0;
                    temp = DataLo;
                    Status[7] = ~temp[7];

                    if (BYTENeg)
                        WBAddr[1] = WBAddr[0] +1;
                    else
                        WBAddr[1] = -1;
                 end
            end

            OTP :
            begin
                OTP_ACT = 1;
                if (oe)
                begin
                    //read SecSi Sector Region
                    if (SecSi[Address]==-1)
                        DOut_zd[7:0] = 8'bx;
                    else
                        DOut_zd[7:0] = SecSi[Address];

                    if ( BYTENeg )
                        if (SecSi[Address+1]==-1)
                            DOut_zd[15:8]= 8'bx;
                        else
                            DOut_zd[15:8] = SecSi[Address+1];
               end
               RY_zd = 1;
            end

            OTP_Z001 :
            begin
            end

            OTP_PREL :
            begin
                if ( falling_edge_write )
                begin
                    if (A_PAT_1 && (DataLo == 16'h90))
                        ULBYPASS = 1'b0;
                    else if (DataLo == 16'h25)
                    begin
                        //fix Sector Address  SA
                        SA = 0;
                        if (SecAddr!=0)
                            $display("Invalid sector address in SecSi mode");
                        //activate OTP
                        OTP_ACT = 1'b1;
                    end
                end
            end

            OTP_AS :
            begin
                if ( falling_edge_write )
                begin
                    if (DataLo==16'hF0 || DataLo==16'h00)
                    begin
                        OTP_ACT =1'b0;
                        if (PSP_ACT || ESP_ACT)
                            ULBYPASS  = 1'b0;
                    end
                end

                if (oe)
                begin
                    if ( BYTENeg )
                        if (Address == 0)
                            DOut_zd[15:8] = 0;
                        else
                            DOut_zd[15:8] = 8'h22;
                    else
                        DOut_zd[15:8] = 8'bZ;

                    if (Addr == 0)
                        DOut_zd[7:0] = 1;
                    else if (Addr == 1)
                        DOut_zd[7:0] = 8'h7E;
                    else if (Addr == 2)
                    begin
                        DOut_zd[7:1] = 7'b0;
                        if (DYB[SecAddr] && PPB[SecAddr])
                            DOut_zd[0] = 1'b0;
                        else
                            DOut_zd[0] = 1'b1;
                    end
                    else if (Addr == 3)
                    begin
                        DOut_zd[7:0] = 10;
                        if (ProtSecNum > 0)
                            //Highest Address Sector Protected by WP#
                            DOut_zd[4] = 1'b1;

                        if (FactoryProt)
                            DOut_zd[7] = 1'b1;
                    end
                    else if (Addr == 16'hE)
                    begin
                        if (tmp_char == "1" || tmp_char == "2")
                            DOut_zd[7:0] = 8'h0C;
                        else if (tmp_char == "3" || tmp_char == "4")
                            DOut_zd[7:0] = 8'h10;
                    end
                    else if (Addr == 16'hF)
                    begin
                        if ( tmp_char == "1" || tmp_char == "2" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "3" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "4" )
                            DOut_zd[7:0] = 8'b00;
                    end
                end
            end

            OTP_A0SEEN :
            begin
                if (falling_edge_write)
                begin
                    OTP_ACT = 1'b1;
                    ///////////////////////////////////////////
                    //SecSi programming: TBD
                    ///////////////////////////////////////////
                    PSTART = 1'b1;
                    PSTART <= #1 1'b0;
                    PSUSP  = 1'b0;
                    PRES   = 1'b0;
                    PCNT   = 32;

                    PGMS_FLAG = OTP_MEM;
                    PR_FLAG = 0;

                    WBData[0] = DataLo;
                    WBData[1] = DataHi;
                    WBAddr[0] = Address % 32;
                    WBPage = WPage % 8;

                    SA = 0;
                    if (SecAddr != 0)
                        $display("Invalid sector Address in SecSi");

                    if (Address >= 256)
                    begin
                        $display("Invalid program address in SecSi region. ");
                        $display("Adress= %d", Address);
                    end
                    temp = DataLo;
                    Status[7] = ~temp[7];

                    if (BYTENeg)
                        WBAddr[1] = WBAddr[0] +1;
                    else
                        WBAddr[1] = -1;
                end
            end

            C8 :
            begin
            end

            C8_Z001 :
            begin
            end

            C8_PREL :
            begin
                if ( falling_edge_write )
                    if ((A_PAT_1 || ULBYPASS) && (DataLo==16'h10))
                    begin
                        ESUSP  = 1'b0;
                        ERES   = 1'b0;
                        for (i=0; i<= SecNum; i=i+1)
                            Ers_queue[i] = 1;

                        Status = 8'b00001000;
                        ER_FLAG = 0;
                        //Start Chip Erase
                        ESTART = 1'b1;
                        ESTART <= #1 1'b0;
                    end
                    else if (DataLo==16'h30)
                    begin
                        //put selected sector to sec. ers. queue
                        //start timeout
                        for (i=0; i<= SecNum; i=i+1)
                            Ers_queue[i] = 0;

                        Ers_queue[SecAddr] = 1'b1;
                        disable TCTMOUTr;
                        ER_FLAG = 0;
                        CTMOUT_in = 1'b0;
                        #1 CTMOUT_in <= 1'b1;
                    end
            end

            ERS :
            begin
                if (oe_toggle)
                begin
                    ///////////////////////////////////////////////////////////
                    // read status / embeded erase algorithm - Chip Erase
                    ///////////////////////////////////////////////////////////
                    Status[7] = 1'b0;
                    Status[6] = ~Status[6]; //toggle
                    Status[5] = 1'b0;
                    Status[3] = 1'b1;
                    Status[2] = ~Status[2]; //toggle

                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end

                if (EERR != 1'b1 && ~falling_edge_EERR)
                begin
                    if (~ ER_FLAG)
                    begin
                        ER_FLAG = 1;
                        for (i=0;i<=SecNum;i=i+1)
                        begin
                            if (DYB[i] == 1'b1 && PPB[i] == 1'b1 &&
                            ~(WPNeg === 1'b0 && (i == ProtSecNum ||
                            i == ProtSecNum1 ) ) )
                            begin
                                ADDRHILO(AddrLOW, AddrHIGH, i);
                                for (j=0; j<=(AddrHIGH-AddrLOW); j=j+1)
                                    WRITEMEM(i,j, -1);
                            end
                        end
                    end

                    if ( rising_edge_EDONE )
                    begin
                        ER_FLAG = 0;
                        for (i=0;i<=SecNum;i=i+1)
                        begin
                            if (DYB[i] == 1'b1 && PPB[i] == 1'b1 &&
                            ~(WPNeg === 1'b0 && (i == ProtSecNum ||
                            i == ProtSecNum1 ) ) )
                            begin
                                ADDRHILO(AddrLOW, AddrHIGH, i);
                                for (j=0 ; j<= (AddrHIGH-AddrLOW); j=j+1)
                                    WRITEMEM(i,j, MaxData);
                            end
                        end
                    end
                end
                // busy signal active
                RY_zd = 1'b0;
            end

            SERS :
            begin
                if (rising_edge_sCTMOUT)
                begin
                    CTMOUT_in = 0;
                    START_T1_in = 0;
                    ESTART = 1;
                    ESTART <= #1 0;
                    ESUSP = 0;
                    ERES = 0;
                end

                if (oe)
                begin
                    ///////////////////////////////////////////////////////////
                    //read status - sector erase timeout
                    ///////////////////////////////////////////////////////////
                    Status[3] = 1'b0;

                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end

                if ( falling_edge_write )
                begin
                    if (DataLo == 16'hB0)
                    begin
                        //need to start erase process prior to suspend
                        ESTART = 1'b1;
                        ESTART <= #1 1'b0;
                        ESUSP = 1'b1;
                        ESUSP <= #1 1'b0;
                        ERES   = 1'b0;
                        //suspend timeout (should be 0 according to datasheet)
                    end
                    else if (DataLo==16'h30)
                    begin
                        disable TCTMOUTr;
                        CTMOUT_in = 1'b0;
                        #1 CTMOUT_in <= 1'b1;
                        Ers_queue[SecAddr] = 1'b1;
                    end
                end
                //ready signal active
                RY_zd = 1'b1;
            end

            ESPS :
            begin
                if (rising_edge_sSTART_T1)
                begin
                    ESP_ACT = 1'b1;
                    START_T1_in = 1'b0;
                end
                else if (oe_toggle)
                begin
                    ///////////////////////////////////////////////////////////
                    //read status / erase suspend timeout - stil erasing
                    ///////////////////////////////////////////////////////////
                    Status[7] = 1'b0;
                    Status[6] = ~Status[6]; //toggle
                    Status[5] = 1'b0;
                    Status[3] = 1'b1;
                    if ( Ers_queue[SecAddr] == 1'b1 )
                        Status[2] = ~Status[2]; //toggle

                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end
                RY_zd = 0;
            end

            WBPGMS_WBCNT :
            begin
                if ( falling_edge_write )
                begin
                    if (SecAddr == SA && ((~BYTENeg && DataLo<32) ||
                    (BYTENeg && DataLo<16 ) ) )
                    begin
                        cnt = DataLo;
                        if (BYTENeg)
                            cnt = cnt *2;

                        PCNT = cnt;
                        LCNT = cnt;
                    end
                end
            end

            WBPGMS_WBLSTA :
            begin
                if ( falling_edge_write )
                begin
                    if (SecAddr == SA) // fix WriteBufferPage WBPage
                    begin
                        WBData[cnt] = DataLo;
                        WBAddr[cnt] = Address % 32;
                        if (BYTENeg)
                        begin
                            WBData[cnt+1] = DataHi;
                            WBAddr[cnt+1] = (Address % 32) +1;
                            if (cnt>0)
                                cnt = cnt - 1;
                        end
                        if (cnt>0)
                            cnt = cnt -1;

                        //save last loaded data for data polling
                        temp = DataLo;
                        Status[7] = ~temp[7];
                        if (OTP_ACT)
                            WBPage = WPage % 8;
                        else
                            WBPage = WPage;
                        if (WPage>=8)
                        $display("Invalid Write Buffer Page selected in SecSi");
                    end
                    LCNT = cnt;
                end
            end

            WBPGMS_WBLOAD :
            begin
                if ( falling_edge_write )
                begin
                    if (WPage == WBPage)
                    begin
                        WBData[cnt] = DataLo;
                        WBAddr[cnt] = Address % 32;

                        if (BYTENeg)
                        begin
                            WBData[cnt+1] = DataHi;
                            WBAddr[cnt+1] = (Address % 32) +1;
                            if (cnt>0)
                                cnt = cnt -1;
                        end

                        if (cnt>0)
                            cnt = cnt -1;
                        //save last loaded data for data polling
                        temp = DataLo;
                        Status[7] = ~temp[7];
                    end
                    LCNT = cnt;
                end
            end

            WBPGMS_CONFB :
            begin
                if ( falling_edge_write )
                begin
                    if (SecAddr == SA && DataLo == 16'h29)
                    begin
                        PSTART = 1'b1;
                        PSTART <= #1 1'b0;
                        PSUSP  = 1'b0;
                        PRES   = 1'b0;
                        if (OTP_ACT)
                            PGMS_FLAG = OTP_MEM;
                        else
                            PGMS_FLAG = MEMORY;
                        PR_FLAG = 0;
                    end
                end
            end

            WBPGMS_WBABORT :
            begin
                if (oe_toggle)
                begin
                ///////////////////////////////////////////////////////////
                //read status / write buffer abort
                ///////////////////////////////////////////////////////////
                    Status[6] = ~Status[6]; //toggle
                    Status[5] = 1'b0;
                    Status[1] = 1'b1;

                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end
                RY_zd = 0;
            end

            WBPGMS_Z001 :
            begin
            end

            WBPGMS_PREL :
            begin
                if ( falling_edge_write )
                begin
                    if (DataLo == 16'hF0)
                        PSP_ACT = 1'b0;
                end
            end

            SERS_EXEC:
            begin
                if (oe_toggle)
                begin
                    ///////////////////////////////////////////////////
                    //read status erase HANG
                    ///////////////////////////////////////////////////
                    //model should never hang
                    Status[7] = 1'b0;
                    Status[6] = ~Status[6]; //toggle
                    Status[5] = 1'b0;
                    Status[3] = 1'b1;
                    if ( Ers_queue[SecAddr] == 1'b1 )
                        Status[2] = ~Status[2]; //toggle

                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end

                if (EERR != 1'b1 && ~falling_edge_EERR)
                begin
                    if (~ER_FLAG)
                    begin
                        ER_FLAG = 1;
                        if (~PPB_ACT)
                        begin
                            for (i=0;i<=SecNum;i=i+1)
                            begin
                                if (Ers_queue[i] && (DYB[i]==1'b1 &&
                                PPB[i]==1'b1 && ~(WPNeg === 1'b0 &&
                                (i == ProtSecNum || i == ProtSecNum1 ))))
                                begin
                                    ADDRHILO(AddrLOW, AddrHIGH, i);
                                    for (j=0; j<=(AddrHIGH-AddrLOW); j=j+1)
                                    begin
                                        WRITEMEM(i,j, -1);
                                    end
                                end
                            end
                        end
                        else
                        begin
                            if (PPBLock)
                                for (i=0;i<=SecNum;i=i+1)
                                    PPB[i] = 1'bx;
                        end
                    end

                    if (rising_edge_EDONE)
                    begin
                        ER_FLAG = 0;
                        if (~PPB_ACT)
                        begin
                            for (i=0; i<=SecNum; i=i+1)
                                if (Ers_queue[i] && (DYB[i] == 1'b1 &&
                                PPB[i] == 1'b1 && ~(WPNeg === 1'b0 &&
                                (i == ProtSecNum || i == ProtSecNum1 ))))
                                begin
                                    ADDRHILO(AddrLOW, AddrHIGH, i);
                                    for (j= 0; j<= (AddrHIGH-AddrLOW); j=j+1)
                                        WRITEMEM(i,j, MaxData);
                                end
                        end
                        else
                        begin
                            if (PPBLock)
                                for (i=0;i<=SecNum;i=i+1)
                                    PPB[i] = 1'b1;
                        end
                    end

                    if ( falling_edge_write )
                    begin
                        if (DataLo==16'hB0)
                        begin
                            START_T1_in = 1'b1;
                            ESUSP = 1'b1;
                            ESUSP <= #1 1'b0;
                        end
                    end
                end
                //busy signal active
                RY_zd = 1'b0;
            end

            ESP :
            begin
                ESUSP = 1'b0;
                if (falling_edge_write)
                begin
                    if (DataLo == 8'h30)
                    begin
                        ERES = 1'b1;
                        ERES <= #1 1'b0;
                    end
                end
                else if (oe)
                begin
                    //////////////////////////////////////////////
                    //read
                    //////////////////////////////////////////////
                    if (Ers_queue[SecAddr]!=1'b1)
                    begin
                        DOut_zd[7:0] = READMEM(SecAddr, Address);
                        if (BYTENeg)
                            DOut_zd[15:8] = READMEM(SecAddr, Address+1);
                    end
                    else
                    begin
                        //////////////////////////////////////////
                        //read status
                        //////////////////////////////////////////
                        Status[7] = 1'b1;
                        // Status[6) No toggle
                        Status[5] = 1'b0;
                        if (oe_toggle)
                            Status[2] = ~Status[2]; //toggle

                        DOut_zd[7:0] = Status;
                        if (BYTENeg)
                            DOut_zd[15:8] = 8'b0;
                    end
                end
                RY_zd = 1'b1;
            end

            ESP_Z001 :
            begin
            end

            ESP_PREL :
            begin
                if ( falling_edge_write )
                begin
                    if (DataLo == 16'h25)
                    begin
                        //fix SA
                        SA = SecAddr;
                        ESP_ACT = 1'b1;
                    end
                    else if (A_PAT_1 && (DataLo == 16'h88))
                        ESP_ACT = 1'b1;
                end
            end

            ESP_CFI :
            begin
                if (oe)
                begin
                    DOut_zd[15:0] = 16'b0;
                    if ((Addr >= 16'h10) && (Addr <= 16'h50))
                    begin
                        if (~BYTENeg)
                            DOut_zd[15:8] = 8'bZ;
                        DOut_zd[7:0] = CFI_array[Addr];
                    end
                    else
                        $display("Invalid CFI query address");
                end

                if ( falling_edge_write )
                begin
                    if ( Addr == 16'h55 && DataLo == 16'h98 )
                    begin
                    end
                    else if (DataLo == 16'hF0)
                        ESP_ACT = 1'b1;
                    else
                        ESP_ACT = 1'b1;
                end
            end

            ESP_A0SEEN :
            begin
                if ( falling_edge_write )
                begin
                    PRES   = 1'b0;
                    PSUSP  = 1'b0;
                    PCNT   = 32;
                    WBData[0] = DataLo;
                    WBData[1] = DataHi;
                    WBAddr[0] = Address % 32;
                    WBPage = WPage;
                    SA = SecAddr;
                    temp = DataLo;
                    PSTART = 1'b1;
                    PSTART <= #1 1'b0;
                    ESP_ACT = 1'b1;
                    PGMS_FLAG = MEMORY;
                    PR_FLAG = 0;
                    Status[7] = ~temp[7];
                    if (BYTENeg)
                        WBAddr[1] = WBAddr[0] +1;
                    else
                        WBAddr[1] = -1;
                end
            end

            ESP_AS :
            begin
                if ( falling_edge_write )
                begin
                    if (DataLo == 16'hF0)
                        // reset ULBYPASS
                        ULBYPASS = 1'b0;
                end
                else if (oe)
                begin
                    if (BYTENeg)
                        if (Address == 0)
                            DOut_zd[15:8] = 0;
                        else
                            DOut_zd[15:8] = 8'h22;
                    else
                        DOut_zd[15:8] = 8'bz;

                    if (Addr == 0)
                        DOut_zd[7:0] = 1;
                    else if (Addr == 1)
                        DOut_zd[7:0] = 8'h7E;
                    else if (Addr == 2)
                    begin
                        DOut_zd[7:1] = 7'b0;
                        if (DYB[SecAddr] && PPB[SecAddr])
                            DOut_zd[0] = 1'b0;
                        else
                            DOut_zd[0] = 1'b1;
                    end
                    else if (Addr == 3)
                    begin
                        DOut_zd[7:0] = 10;
                        if (ProtSecNum > 0)
                            //Highest Address Sector Protected by WP#
                            DOut_zd[4] = 1'b1;

                        if (FactoryProt)
                            DOut_zd[7] = 1'b1;
                    end
                    else if (Addr == 16'hE)
                    begin
                        if (tmp_char == "1" || tmp_char == "2")
                            DOut_zd[7:0] = 8'h0C;
                        else if (tmp_char == "3" || tmp_char == "4")
                            DOut_zd[7:0] = 8'h10;
                    end
                    else if (Addr == 16'hF)
                    begin
                        if ( tmp_char == "1" || tmp_char == "2" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "3" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "4" )
                            DOut_zd[7:0] = 8'b00;
                    end
                end
            end

            PGMS :
            begin
                if (oe_toggle)
                begin
                    ///////////////////////////////////////////
                    //read status
                    ///////////////////////////////////////////
                    Status[6] = ~Status[6]; //toggle
                    Status[5] = 1'b0;
                    //Status[2) no toggle
                    Status[1] = 1'b0;
                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                end

                if (PERR!=1'b1 && ~falling_edge_PERR)
                begin

                    if ( ~PR_FLAG )
                    begin
                        PR_FLAG = 1;
                        BaseLoc = WBPage * 32;

                        if (PCNT < 32)   //buffer
                        begin
                            wr_cnt = PCNT;
                            if (BYTENeg)
                                wr_cnt= wr_cnt+1;
                        end
                        else   //Word/Byte program
                        begin
                            if (WBAddr[1] < 0 )
                                wr_cnt = 0;
                            else
                                wr_cnt = 1;
                        end

                        for (i=wr_cnt; i >= 0; i=i-1)
                        begin
                            new_int = WBData[i];
                            if (WBAddr[i] < 0)
                                old_int = -1;
                            if (PGMS_FLAG == MEMORY)
                            begin
                                old_int = READMEMORY(SA, BaseLoc+WBAddr[i]);
                            end
                            else if (PGMS_FLAG == OTP_MEM)
                                old_int=SecSi[BaseLoc+WBAddr[i]];
                            else if (PGMS_FLAG == PASSW)
                                old_bit=Password[WBAddr[i]];
                            else if (PGMS_FLAG == LREG)
                            begin
                                if (i==0)
                                    old_bit=LockReg[7:0];
                                else
                                    old_bit=LockReg[15:8];
                            end
                            else if (PGMS_FLAG == PPB_BIT)
                                old_bit[0]=PPB[SA];

                            if (new_int > -1)
                            begin
                                new_bit = new_int;
                                if ((old_int>-1) && (PGMS_FLAG == OTP_MEM ||
                                PGMS_FLAG == MEMORY) )
                                begin
                                    old_bit = old_int;
                                    for(j=0;j<=7;j=j+1)
                                        if (~old_bit[j])
                                            new_bit[j]=1'b0;
                                end
                                else if (((PGMS_FLAG == PASSW) ||
                                (PGMS_FLAG == LREG)) && (old_bit[0] !== 1'bx ))
                                begin
                                    for(j=0;j<=7;j=j+1)
                                        if (~old_bit[j])
                                            new_bit[j]=1'b0;
                                end
                                else if (PGMS_FLAG == PPB_BIT)
                                begin
                                    if (old_bit[0]==1'b0)
                                        new_bit[0] = 1'b0;

                                    new_bit[7:1] = 7'b0;
                                end
                                else
                                begin
                                    new_bit[0] = 1'bx;
                                end

                                if ( new_bit[0] !== 1'bx )
                                begin
                                    new_int=new_bit;
                                    WBData[i]= new_int;
                                end
                                else
                                    WBData[i]= -1;
                            end
                            else
                                WBData[i]= -1;
                        end

                        for (i=wr_cnt;i>=0;i=i-1)
                        begin
                            if (PGMS_FLAG == MEMORY)
                            begin
                                WRITEMEM(SA, BaseLoc+WBAddr[i], -1);
                            end
                            else if (PGMS_FLAG == OTP_MEM)
                                SecSi[BaseLoc+WBAddr[i]]   = -1;
                            else if ( PGMS_FLAG == PASSW )
                                Password[WBAddr[i]] = 8'bx;
                            else if ( PGMS_FLAG == LREG )
                            begin
                                if (i==0)
                                    LockReg[7:0] = 8'bx;
                                else
                                    LockReg[15:8] = 8'bx;
                            end
                            else if (PGMS_FLAG == PPB_BIT)
                                PPB[SA] = 1'bx;
                        end
                    end

                    if (rising_edge_PDONE && ~PERR )
                    begin
                        PR_FLAG = 0;
                        for (i=wr_cnt; i>=0; i=i-1)
                        begin
                            if (WBAddr[i] > -1 && WBData[i] > -1)
                            begin
                                if (PGMS_FLAG == MEMORY)
                                begin
                                    WRITEMEM(SA, BaseLoc+WBAddr[i], WBData[i]);
                                end
                                else if (PGMS_FLAG == OTP_MEM)
                                    SecSi[BaseLoc+WBAddr[i]]   = WBData[i];
                                else if ( PGMS_FLAG == PASSW )
                                    Password[WBAddr[i]] =WBData[i];
                                else if ( PGMS_FLAG == LREG )
                                begin
                                    if (i==0)
                                        LockReg[7:0] = WBData[i];
                                    else
                                        LockReg[15:8] = WBData[i];
                                end
                                else if (PGMS_FLAG == PPB_BIT)
                                    if (PPBLock)
                                        PPB[SA] = 1'b0;
                                    else
                                        PPB[SA] = WBData[i];
                            end
                            WBData[i]= -1;
                        end
                    end
                    else if ( falling_edge_write )
                    begin
                        if (DataLo == 16'hB0)
                            START_T1_in = 1'b1;
                    end
                end
                //busy signal active
                RY_zd = 1'b0;
            end

            PSPS:
            begin
                PSUSP = 1;
                if (rising_edge_sSTART_T1)
                    START_T1_in = 0;
                if (oe_toggle)
                begin
                    ///////////////////////////////////////
                    //read status / stil programming
                    ///////////////////////////////////////
                    Status[6] = ~Status[6]; //toggle
                    Status[5] = 1'b0;
                    //Status[2) no toggle
                    Status[1] = 1'b0;

                    DOut_zd[7:0] = Status;
                    if (BYTENeg)
                        DOut_zd[15:8] = 8'b0;
                 end
                 RY_zd = 0;
            end

            PSP:
            begin
                PSUSP = 0;
                if (falling_edge_write)
                begin
                    if (DataLo == 16'h30)
                    begin
                        PRES = 1'b1;
                        PRES <= #1 1'b0;
                    end
                end
                if (oe)
                begin
                    ////////////////////////////////////////////
                    //read  - program suspend
                    ////////////////////////////////////////////
                    if (SecAddr == SA)
                        //read program suspended sector
                        //Invalid (not allowed)

                  $display("Read from program suspended sector is NOT allowed");

                    else if (ESP_ACT && Ers_queue[SecAddr])
                    begin
                        Status[7] = 1'b1;
                        // Status[6) No toggle
                        Status[5] = 1'b0;
                        if (oe_toggle)
                            Status[2] = ~Status[2]; //toggle

                        DOut_zd[7:0] = Status;
                        if (BYTENeg)
                            DOut_zd[15:8] = 8'b0;
                    end
                    else
                    begin
                        //read sector other than program suspended one
                        DOut_zd[7:0] = READMEM(SecAddr, Address);
                        if (BYTENeg)
                            DOut_zd[15:8] = READMEM(SecAddr, Address+1);
                    end
                end
                RY_zd = 1;
            end

            PSP_CFI:
            begin
                if (oe)
                begin
                    DOut_zd[15:0] = 16'b0;
                    if ((Addr >= 16'h10)&&(Addr <= 16'h50))
                    begin
                        if (~BYTENeg)
                            DOut_zd[15:8] = 8'bZ;
                        DOut_zd[7:0] = CFI_array[Addr];
                    end
                    else
                        $display("Invalid CFI query address");
                end
            end

            PSP_Z001 :
            begin
            end

            PSP_PREL :
            begin
                if ( falling_edge_write )
                    if ( A_PAT_1 && DataLo == 16'h88 )
                        PSP_ACT = 1'b1;
            end

            PSP_AS:
            begin
                if ( falling_edge_write )
                begin
                    if (DataLo == 16'hF0)
                        // reset ULBYPASS
                        ULBYPASS = 1'b0;
                end
                if (oe)
                begin
                    if (BYTENeg)
                        if (Address == 0)
                            DOut_zd[15:8] = 0;
                        else
                            DOut_zd[15:8] = 8'h22;
                    else
                        DOut_zd[15:8] = 8'bZ;

                    if (Addr == 0)
                        DOut_zd[7:0] = 1;
                    else if (Addr == 1)
                        DOut_zd[7:0] = 8'h7E;
                    else if (Addr == 2)
                    begin
                        DOut_zd[7:1] = 7'b0;
                        if (DYB[SecAddr] && PPB[SecAddr])
                            DOut_zd[0] = 1'b0;
                        else
                            DOut_zd[0] = 1'b1;
                    end
                    else if (Addr == 3)
                    begin
                        DOut_zd[7:0] = 10;
                        if (ProtSecNum > 0)
                            //Highest Address Sector Protected by WP#
                            DOut_zd[4] = 1'b1;

                        if (FactoryProt)
                            DOut_zd[7] = 1'b1;
                    end
                    else if (Addr == 16'hE)
                    begin
                        if (tmp_char == "1" || tmp_char == "2")
                            DOut_zd[7:0] = 8'h0C;
                        else if (tmp_char == "3" || tmp_char == "4")
                            DOut_zd[7:0] = 8'h10;
                    end
                    else if (Addr == 16'hF)
                    begin
                        if ( tmp_char == "1" || tmp_char == "2" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "3" )
                            DOut_zd[7:0] = 8'b01;
                        else if ( tmp_char == "4" )
                            DOut_zd[7:0] = 8'b00;
                    end
                end
            end
        endcase
        end

        //Output Disable Control
        if (gOE_n || gCE_n || (~RESETNeg && ~RST))
            DOut_zd = 16'bZ;
        else if (~BYTENeg)
            DOut_zd[15:8] = 8'bZ;
    end

    //Output timing control
    always @(DOut_zd)
    begin : OutputGen
        if (DOut_zd[0] !== 1'bz)
        begin
            CEDQ_t = CENeg_event  + CEDQ_01;
            OEDQ_t = OENeg_event  + OEDQ_01;
            if (RPchange)
                ADDRDQ_t = ADDR_event + ADDRDQ_01_LONG;
            else
                ADDRDQ_t = ADDR_event + ADDRDQ_01_SHORT;
            FROMCE = ((CEDQ_t >= OEDQ_t) && ( CEDQ_t >= $time));
            FROMOE = ((OEDQ_t >= CEDQ_t) && ( OEDQ_t >= $time));
            FROMADDR = 1'b1;
            if ((ADDRDQ_t > $time )&&
            (((ADDRDQ_t>OEDQ_t)&&FROMOE) || ((ADDRDQ_t>CEDQ_t) &&FROMCE)))
            begin
                TempData = DOut_zd;
                FROMADDR = 1'b0;
                if (~BYTENeg)
                    DOut_Pass[15:8] = 8'bz;
                else
                    DOut_Pass[15:8] = 8'bx;
                DOut_Pass[7:0] = 8'bx;
                DOut_Pass <= #( ADDRDQ_t - $time ) TempData;
            end
            else
            begin
                DOut_Pass = DOut_zd;
            end
        end
    end

    always @(DOut_zd)
    begin
        if (DOut_zd[0] === 1'bz)
        begin
            disable OutputGen;
            FROMCE = 1'b1;
            FROMOE = 1'b1;
            FROMADDR = 1'b0;
            DOut_Pass = DOut_zd;
        end
    end

    function integer READMEMORY;
    input integer sector;
    input integer Address;
    integer AddrBASE;
    begin
        if (tmp_char == "3")
        begin
            if (sector < 127)
                AddrBASE = sector * 20'h10000;
            else
                AddrBASE = 24'h7F0000 + (sector - 127) * 20'h2000;
        end
        else if (tmp_char == "4")
        begin
            if (sector < 8)
                AddrBASE = sector * 20'h2000;
            else
                AddrBASE = (sector - 7) * 20'h10000;
        end
        else
            AddrBASE  = sector * 20'h10000;
        READMEMORY = Mem[AddrBASE + Address];
    end
    endfunction

    task WRITEMEM;
    input integer sector;
    input integer Address;
    input integer Data;
    integer AddrBASE;
    begin
        if (tmp_char == "3")
        begin
            if (sector < 127)
                AddrBASE = sector * 20'h10000;
            else
                AddrBASE = 24'h7F0000 + (sector - 127) * 20'h2000;
        end
        else if (tmp_char == "4")
        begin
            if (sector < 8)
                AddrBASE = sector * 20'h2000;
            else
                AddrBASE = (sector - 7) * 20'h10000;
        end
        else
            AddrBASE  = sector * 20'h10000;
        Mem[AddrBASE + Address] = Data;
    end
    endtask

    function[7:0] READMEM;
    input integer sector;
    input integer Address;
    integer AddrBASE;
    integer Data;
    begin
        if (tmp_char == "3")
        begin
            if (sector < 127)
                AddrBASE = sector * 20'h10000;
            else
                AddrBASE = 24'h7F0000 + (sector - 127) * 20'h2000;
        end
        else if (tmp_char == "4")
        begin
            if (sector < 8)
                AddrBASE = sector * 20'h2000;
            else
                AddrBASE = (sector - 7) * 20'h10000;
        end
        else if (tmp_char == "1" || tmp_char == "2")
            AddrBASE  = sector * 20'h10000;

        Data = Mem[AddrBASE + Address];

        if ( Data == -1 )
            READMEM = 8'bx;
        else
            READMEM = Data;
    end
    endfunction

    function [7:0] ReturnSectorID;
    input [HiAddrBit:0] ADDR;
    integer conv;
    begin
        conv = ADDR / 16'h8000;
        if (tmp_char == "3")
        begin
            if ( conv < 127 )
                ReturnSectorID = conv;
            else
                ReturnSectorID = 127 + (ADDR - 24'h3F8000)/16'h1000;
        end
        else if (tmp_char == "4")
        begin
            if ( conv == 0 )
                ReturnSectorID = ADDR / 16'h1000;
            else
                ReturnSectorID = 7 + conv;
        end
        else if (tmp_char == "1" || tmp_char == "2")
            ReturnSectorID = conv;
    end
    endfunction

    task ADDRHILO;
        inout integer AddrLOW;
        inout integer AddrHIGH;
        input integer  sector;
    begin
        if (tmp_char == "3")
        begin
            if (sector < 127)
            begin
                AddrLOW  = sector*20'h10000;
                AddrHIGH = sector*20'h10000 + 20'h0FFFF;
            end
            else
            begin
                AddrLOW  = 24'h7F0000 + (sector-127)*16'h2000;
                AddrHIGH = 24'h7F0000 + (sector-127)*16'h2000 + 20'h01FFF;
            end
        end
        else if (tmp_char == "4")
        begin
            if (sector <= 7)
            begin
                AddrLOW  = sector * 20'h02000;
                AddrHIGH = sector * 20'h02000 + 20'h01FFF;
            end
            else
            begin
                AddrLOW = (sector-7) * 20'h10000;
                AddrHIGH = (sector-7) * 20'h10000 + 20'h0FFFF;
            end
        end
        else if ( tmp_char == "1" || tmp_char == "2" )
        begin
            AddrLOW = sector * 20'h10000;
            AddrHIGH = sector * 20'h10000 + 20'h0FFFF;
        end
    end
    endtask

    always @(negedge RESETNeg)
    begin
        falling_edge_RESETNeg = 1;
        #1 falling_edge_RESETNeg = 0;
    end

    always @(posedge RESETNeg)
    begin
        rising_edge_RESETNeg = 1;
        #1 rising_edge_RESETNeg = 0;
    end

    always @(negedge WENeg)
    begin
        falling_edge_WENeg = 1;
        #1 falling_edge_WENeg = 0;
    end

    always @(negedge CENeg)
    begin
        falling_edge_CENeg = 1;
        #1 falling_edge_CENeg = 0;
    end

    always @(negedge OENeg)
    begin
        falling_edge_OENeg = 1;
        #1 falling_edge_OENeg = 0;
    end

    always @(posedge WENeg)
    begin
        rising_edge_WENeg = 1;
        #1 rising_edge_WENeg = 0;
    end

    always @(posedge CENeg)
    begin
        rising_edge_CENeg = 1;
        #1 rising_edge_CENeg = 0;
    end

    always @(posedge write)
    begin
        rising_edge_write = 1;
        #1 rising_edge_write = 0;
    end

    always @(negedge write)
    begin
        falling_edge_write = 1;
        #1 falling_edge_write = 0;
    end

    always @(posedge read)
    begin
        rising_edge_read = 1;
        #1 rising_edge_read = 0;
    end

    always @(negedge RST)
    begin
        falling_edge_RST = 1;
        #1 falling_edge_RST = 0;
    end

    always @(PBPROG_out)
    begin
        rising_edge_PBPROG_out = 1;
        #1 rising_edge_PBPROG_out = 0;
    end

    always @(posedge UNLOCKDONE_out)
    begin
        rising_edge_UNLOCKDONE_out = 1;
        #1 rising_edge_UNLOCKDONE_out = 0;
    end

    always @(posedge EDONE)
    begin
        rising_edge_EDONE = 1;
        #1 rising_edge_EDONE = 0;
    end

    always @(negedge EERR)
    begin
        falling_edge_EERR = 1;
        #1 falling_edge_EERR = 0;
    end

    always @(posedge CTMOUT)
    begin
        rising_edge_sCTMOUT = 1;
        #1 rising_edge_sCTMOUT = 0;
    end

    always @(posedge START_T1)
    begin
        rising_edge_sSTART_T1 = 1;
        #1 rising_edge_sSTART_T1 = 0;
    end

    always @(posedge PDONE)
    begin
        rising_edge_PDONE = 1;
        #1 rising_edge_PDONE = 0;
    end

    always @(negedge PERR)
    begin
        falling_edge_PERR = 1;
        #1 falling_edge_PERR = 0;
    end

    always @(PERR)
    begin
        PERR_event = 1;
        #1 PERR_event = 0;
    end

    always @(A)
    begin
        A_event = 1;
        #1 A_event = 0;
    end

    always @(Address)
    begin
        Address_event = 1;
        #1 Address_event = 0;
    end

    always @(DIn[15])
    begin
        DIn_15_event = 1;
        #1 DIn_15_event = 0;
    end

    always @(BYTENeg)
    begin
        BYTENeg_event = 1;
        #1 BYTENeg_event = 0;
    end

    always @(posedge reseted)
    begin
        rising_edge_reseted = 1;
        #1 rising_edge_reseted = 0;
    end

    always @(posedge PSUSP)
    begin
        rising_edge_PSUSP = 1;
        #1 rising_edge_PSUSP = 0;
    end

    always @(posedge PRES)
    begin
        rising_edge_PRES = 1;
        #1 rising_edge_PRES = 0;
    end

    always @(posedge PSTART)
    begin
        rising_edge_PSTART = 1;
        #1 rising_edge_PSTART = 0;
    end

    always @(posedge ESTART)
    begin
        rising_edge_ESTART = 1;
        #1 rising_edge_ESTART = 0;
    end

    always @(posedge ESUSP)
    begin
        rising_edge_ESUSP = 1;
        #1 rising_edge_ESUSP = 0;
    end

    always @(posedge ERES)
    begin
        rising_edge_ERES = 1;
        #1 rising_edge_ERES = 0;
    end

    reg  BuffInOE, BuffInCE, BuffInADDR_S, BuffInADDR_L;
    wire BuffOutOE, BuffOutCE, BuffOutADDR_S, BuffOutADDR_L;

    BUFFER    BUFOE   (BuffOutOE, BuffInOE);
    BUFFER    BUFCE   (BuffOutCE, BuffInCE);
    BUFFER    BUFADDR_SHORT (BuffOutADDR_S, BuffInADDR_S);
    BUFFER    BUFADDR_LONG  (BuffOutADDR_L, BuffInADDR_L);
    initial
    begin
        BuffInOE   = 1'b1;
        BuffInCE   = 1'b1;
        BuffInADDR_S = 1'b1;
        BuffInADDR_L = 1'b1;
    end

    always @(posedge BuffOutOE)
    begin
        OEDQ_01 = $time;
    end
    always @(posedge BuffOutCE)
    begin
        CEDQ_01 = $time;
    end
    always @(posedge BuffOutADDR_S)
    begin
        ADDRDQ_01_SHORT = $time;
    end
    always @(posedge BuffOutADDR_L)
    begin
        ADDRDQ_01_LONG = $time;
    end
endmodule

module BUFFER (OUT,IN);
    input IN;
    output OUT;
    buf   ( OUT, IN);
endmodule
