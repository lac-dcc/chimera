// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/PROC                                                              **
** PROCESSOR TOP LEVEL                                                   **
** SHEET 32 of 50                                                        **
**                                                                       ** 
** Last reviewed: 13-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module CPU_PROC_32( 
                    sysclk, // System clock in FPGA
                    sys_rst_n, // System reset in FPGA

                    ACOND_n,
                    ALUCLK,
                    BEDO_n,
                    BEMPID_n,
                    BRK_n,
                    BSTP,
                    CA_9_0,
                    CD_15_0_IN,
                    CLK,
                    CSA_12_0,
                    CSBITS,
                    CSCA_9_0,
                    CUP,
                    CWR,
                    DOUBLE,
                    ECCR,
                    ESTOF_n,
                    ETRAP_n,
                    EWCA_n,
                    IBINT10_n,
                    IBINT11_n,
                    IBINT12_n,
                    IBINT13_n,
                    IBINT15_n,
                    IDB_15_0_IN,
                    IDB_15_0_OUT,
                    IONI,
                    IOXERR_n,
                    LA_23_10,
                    LBA_3_0,
                    LCS_n,
                    LEV0,
                    LSHADOW,
                    MAP_n,
                    MCLK,
                    MOR_n,
                    MREQ_n,
                    MR_n,
                    OPCLCS,
                    PAN_n,
                    PARERR_n,
                    PCR_1_0,
                    PD1,
                    PIL_3_0,
                    PONI,
                    POWFAIL_n,
                    PT_15_9,
                    RF_1_0,
                    RRF_n,
                    RT_n,     // Use signal from DGA
                    LDEXM_n,  // use signal from DGA
                    RWCS_n,
                    TERM_n,                    
                    TEST_4_0,
                    TP1_INTRQ_n,
                    TRAP,
                    UCLK,
                    VEX,
                    WCA_n,
                    WCS_n,
                    WRFSTB,
                    SEL_TESTMUX
                    );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input sysclk;      // System clock in FPGA
   input sys_rst_n;   // System reset in FPGA

   input        ALUCLK;
   input        BEDO_n;
   input        BEMPID_n;
   input        BSTP;
   input [15:0] CD_15_0_IN;
   input        CLK;
   input [63:0] CSBITS;
   input        ESTOF_n;
   input        ETRAP_n;
   input        EWCA_n;
   input        IBINT10_n;
   input        IBINT11_n;
   input        IBINT12_n;
   input        IBINT13_n;
   input        IBINT15_n;
   input        IOXERR_n;
   input        LCS_n;
   input        MAP_n;
   input        MCLK;
   input        MOR_n;
   input        MREQ_n;
   input        MR_n;
   input        PAN_n;
   input        PARERR_n;
   input        PD1;
   input        POWFAIL_n;
   input [6:0]  PT_15_9;
   input        TERM_n;
   input        UCLK;
   input        WCA_n;
   input        WRFSTB;
   input [2:0]  SEL_TESTMUX; // Selects testmux signals to output on TEST_4_0

   /*******************************************************************************
   ** The IN and OUT are define here                                            **
   *******************************************************************************/
   
   // TODO: Give correct IDB signals to the chips
   input  [15:0] IDB_15_0_IN;
   output [15:0] IDB_15_0_OUT;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        ACOND_n;
   output        BRK_n;
   output [9:0]  CA_9_0;
   output [12:0] CSA_12_0;
   output [9:0]  CSCA_9_0;
   output        CUP;
   output        CWR;
   output        DOUBLE;
   output        ECCR;   
   output        IONI;
   output [13:0] LA_23_10;
   output [3:0]  LBA_3_0;
   output        LEV0;
   output        LSHADOW;
   output        OPCLCS;
   output [1:0]  PCR_1_0;
   output [3:0]  PIL_3_0;
   output        PONI;
   output [1:0]  RF_1_0;
   output        RRF_n;
   output        RT_n;  // This signal is not in the PAL 44408B, but in the PAL 444608 (VXFIX). Use  RT_n signal from DGA until we find out what the 44608A does with this signal.
   output        LDEXM_n;
   output        RWCS_n;
   output [4:0]  TEST_4_0;
   output        TP1_INTRQ_n;
   output        TRAP;
   output        VEX;
   output        WCS_n;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0]  s_logisimBus103;
   wire [4:0]  s_logisimBus114;
   wire [63:0] s_logisimBus119;
   wire [1:0]  s_logisimBus127;
   
   wire [15:0] s_fidb_cga_IN;  // Out from B side of CHIP32 and 33, and IN to CGA
   wire [15:0] s_fidb_cga_OUT; // Input signal to B side of CHIP32 and 33, and OUT from CGA

   wire [15:0] s_fidb_A_IN; // Input signal to A side of CHIP32 and 33
   wire [15:0] s_fidb_A_OUT; // Out from A side of CHIP32 and 33
   wire [15:0] s_fidb_B_OUT; // Out from B side of CHIP32 and 33

   wire [15:0] s_idb_erf_in; // 16 bit-input signal from RAM Chip34 and 35, controlled by ERF_n
   wire [15:0] s_idb_erf_out; // 16 bit-output signal from RAM Chip34 and 35, controlled by ERF_n

   wire [15:0] s_IDB_15_0_OUT;
   wire IDB2; //IDB2 input signal to CMDDEC


   wire [6:0]  s_logisimBus144;
   
   wire [1:0]  s_logisimBus151;
   wire [1:0]  s_logisimBus152;
   wire [1:0]  s_logisimBus153;
   wire [9:0]  s_logisimBus163;
   wire [13:0] s_logisimBus168;
   wire [1:0]  s_logisimBus171;
   wire [12:0] s_logisimBus21;
   wire [9:0]  s_logisimBus24;
   wire [15:0] s_logisimBus25;
   wire [1:0]  s_logisimBus30;
   wire [1:0]  s_logisimBus38;
   wire [15:0] s_logisimBus4;
   wire [3:0]  s_logisimBus64;
   wire [3:0]  s_logisimBus77;
   wire [8:0]  s_logisimBus78;
   wire [3:0]  s_logisimBus84;
   wire [1:0]  s_logisimBus86;
   wire [4:0]  s_logisimBus90;
   wire [10:0] s_logisimBus92;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet100;
   wire        s_logisimNet101;
   wire        s_logisimNet102;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet11;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
   wire        s_logisimNet115;
   wire        s_logisimNet116;
   wire        s_logisimNet117;
   wire        s_logisimNet118;
   wire        s_logisimNet12;
   wire        s_logisimNet120;
   wire        s_logisimNet121;
   wire        s_twrf_n;
   wire        s_logisimNet125;
   wire        s_logisimNet126;
   wire        s_logisimNet128;
   wire        s_logisimNet129;
   wire        s_logisimNet13;
   wire        s_logisimNet130;
   wire        s_logisimNet131;
   wire        s_logisimNet132;
   wire        s_logisimNet133;
   wire        s_logisimNet134;
   wire        s_logisimNet135;
   wire        s_logisimNet136;
   wire        s_logisimNet137;
   wire        s_logisimNet139;
   wire        s_logisimNet14;
   wire        s_logisimNet140;
   wire        s_logisimNet141;
   wire        s_logisimNet142;
   wire        s_logisimNet143;
   wire        s_logisimNet145;
   wire        s_logisimNet146;
   wire        s_logisimNet147;
   wire        s_logisimNet148;
   wire        s_logisimNet149;
   wire        s_logisimNet150;
   wire        s_logisimNet154;
   wire        s_logisimNet155;
   wire        s_logisimNet156;
   wire        s_MCLK;
   wire        s_logisimNet159;
   wire        s_logisimNet16;
   wire        s_logisimNet160;
   wire        s_ledexm;
   wire        s_logisimNet161;
   wire        s_logisimNet162;
   wire        s_logisimNet164;
   wire        s_logisimNet165;
   wire        s_logisimNet166;
   wire        s_logisimNet167;
   wire        s_logisimNet169;
   wire        s_logisimNet17;
   wire        s_logisimNet170;
   wire        s_logisimNet172;
   wire        s_logisimNet173;
   wire        s_logisimNet174;
   wire        s_logisimNet175;
   wire        s_logisimNet176;
   wire        s_logisimNet177;
   wire        s_logisimNet178;
   wire        s_logisimNet179;
   wire        s_logisimNet181;
   wire        s_logisimNet182;
   wire        s_logisimNet183;
   wire        s_logisimNet184;
   wire        s_logisimNet185;
   wire        s_logisimNet186;
   wire        s_logisimNet187;
   wire        s_logisimNet188;
   wire        s_logisimNet189;
   wire        s_logisimNet19;
   wire        s_logisimNet190;
   wire        s_logisimNet191;
   wire        s_logisimNet192;
   wire        s_logisimNet193;
   wire        s_logisimNet194;
   wire        s_logisimNet195;
   wire        s_logisimNet196;
   wire        s_logisimNet197;
   wire        s_logisimNet198;
   wire        s_logisimNet199;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet200;
   wire        s_logisimNet201;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet31;
   wire        s_wrtrf;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet37;
   wire        s_logisimNet39;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_erf_n;
   
   wire        s_erf_n_org; // Original signal from CGA. Not used after fix has been applied

   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_PD1;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_CLK;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet72;
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
   wire        s_logisimNet79;
   wire        s_logisimNet8;
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet85;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_logisimNet89;
   wire        s_logisimNet9;
   wire        s_logisimNet91;
   wire        s_logisimNet93;
   wire        s_logisimNet94;
   wire        s_logisimNet95;
   wire        s_logisimNet96;
   wire        s_logisimNet97;
   wire        s_logisimNet98;
   wire        s_logisimNet99;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus114[0] = s_logisimNet185;
   assign s_logisimBus114[1] = s_logisimNet184;
   assign s_logisimBus114[2] = s_logisimNet183;
   assign s_logisimBus114[3] = s_logisimNet182;
   assign s_logisimBus114[4] = s_logisimNet181;
   assign s_logisimBus127[0] = s_logisimNet107;
   assign s_logisimBus127[1] = s_logisimNet63;
   assign s_logisimBus151[0] = s_logisimNet111;
   assign s_logisimBus151[1] = s_logisimNet68;
   assign s_logisimBus152[0] = s_logisimNet150;
   assign s_logisimBus152[1] = s_logisimNet113;
   assign s_logisimBus153[0] = s_logisimNet29;
   assign s_logisimBus153[1] = s_logisimNet161;
   assign s_logisimBus30[0]  = s_logisimNet71;
   assign s_logisimBus30[1]  = s_logisimNet23;
   assign s_logisimBus38[0]  = s_logisimNet26;
   assign s_logisimBus38[1]  = s_logisimNet72;
   assign s_logisimBus4[0]   = s_logisimNet201;
   assign s_logisimBus4[10]  = s_logisimNet191;
   assign s_logisimBus4[11]  = s_logisimNet190;
   assign s_logisimBus4[12]  = s_logisimNet189;
   assign s_logisimBus4[13]  = s_logisimNet188;
   assign s_logisimBus4[14]  = s_logisimNet187;
   assign s_logisimBus4[15]  = s_logisimNet186;
   assign s_logisimBus4[1]   = s_logisimNet200;
   assign s_logisimBus4[2]   = s_logisimNet199;
   assign s_logisimBus4[3]   = s_logisimNet198;
   assign s_logisimBus4[4]   = s_logisimNet197;
   assign s_logisimBus4[5]   = s_logisimNet196;
   assign s_logisimBus4[6]   = s_logisimNet195;
   assign s_logisimBus4[7]   = s_logisimNet194;
   assign s_logisimBus4[8]   = s_logisimNet193;
   assign s_logisimBus4[9]   = s_logisimNet192;
   assign s_logisimBus64[0]  = s_logisimNet19;
   assign s_logisimBus64[1]  = s_logisimNet149;
   assign s_logisimBus64[2]  = s_logisimNet112;
   assign s_logisimBus64[3]  = s_logisimNet69;
   assign s_logisimBus77[0]  = s_logisimNet46;
   assign s_logisimBus77[1]  = s_logisimNet174;
   assign s_logisimBus77[2]  = s_logisimNet130;
   assign s_logisimBus77[3]  = s_logisimNet89;
   assign s_logisimBus78[0]  = s_logisimNet133;
   assign s_logisimBus78[1]  = s_logisimNet94;
   assign s_logisimBus78[2]  = s_logisimNet49;
   assign s_logisimBus78[3]  = s_logisimNet176;
   assign s_logisimBus78[4]  = s_logisimNet132;
   assign s_logisimBus78[5]  = s_logisimNet93;
   assign s_logisimBus78[6]  = s_logisimNet48;
   assign s_logisimBus78[7]  = s_logisimNet175;
   assign s_logisimBus78[8]  = s_logisimNet131;
   assign s_logisimBus86[0]  = s_logisimNet16;
   assign s_logisimBus86[1]  = s_logisimNet148;
   assign s_logisimBus90[0]  = s_logisimNet116;
   assign s_logisimBus90[1]  = s_logisimNet70;
   assign s_logisimBus90[2]  = s_logisimNet22;
   assign s_logisimBus90[3]  = s_logisimNet156;
   assign s_logisimBus90[4]  = s_logisimNet115;
   assign s_logisimNet107    = s_logisimBus119[51];
   assign s_logisimNet111    = s_logisimBus119[42];
   assign s_logisimNet112    = s_logisimBus119[18];
   assign s_logisimNet113    = s_logisimBus119[54];
   assign s_logisimNet115    = s_logisimBus119[41];
   assign s_logisimNet116    = s_logisimBus119[37];
   assign s_logisimNet130    = s_logisimBus119[30];
   assign s_logisimNet131    = s_logisimBus119[63];
   assign s_logisimNet132    = s_logisimBus119[59];
   assign s_logisimNet133    = s_logisimBus119[55];
   assign s_logisimNet148    = s_logisimBus119[47];
   assign s_logisimNet149    = s_logisimBus119[17];
   assign s_logisimNet150    = s_logisimBus119[53];
   assign s_logisimNet156    = s_logisimBus119[40];
   assign s_logisimNet16     = s_logisimBus119[46];
   assign s_logisimNet161    = s_logisimBus119[49];
   assign s_logisimNet174    = s_logisimBus119[29];
   assign s_logisimNet175    = s_logisimBus119[62];
   assign s_logisimNet176    = s_logisimBus119[58];
   assign s_logisimNet181    = s_logisimBus119[36];
   assign s_logisimNet182    = s_logisimBus119[35];
   assign s_logisimNet183    = s_logisimBus119[34];
   assign s_logisimNet184    = s_logisimBus119[33];
   assign s_logisimNet185    = s_logisimBus119[32];
   assign s_logisimNet186    = s_logisimBus119[15];
   assign s_logisimNet187    = s_logisimBus119[14];
   assign s_logisimNet188    = s_logisimBus119[13];
   assign s_logisimNet189    = s_logisimBus119[12];
   assign s_logisimNet19     = s_logisimBus119[16];
   assign s_logisimNet190    = s_logisimBus119[11];
   assign s_logisimNet191    = s_logisimBus119[10];
   assign s_logisimNet192    = s_logisimBus119[9];
   assign s_logisimNet193    = s_logisimBus119[8];
   assign s_logisimNet194    = s_logisimBus119[7];
   assign s_logisimNet195    = s_logisimBus119[6];
   assign s_logisimNet196    = s_logisimBus119[5];
   assign s_logisimNet197    = s_logisimBus119[4];
   assign s_logisimNet198    = s_logisimBus119[3];
   assign s_logisimNet199    = s_logisimBus119[2];
   assign s_logisimNet200    = s_logisimBus119[1];
   assign s_logisimNet201    = s_logisimBus119[0];
   assign s_logisimNet22     = s_logisimBus119[39];
   assign s_logisimNet23     = s_logisimBus119[27];
   assign s_logisimNet26     = s_logisimBus119[44];
   assign s_logisimNet29     = s_logisimBus119[48];
   assign s_logisimNet46     = s_logisimBus119[28];
   assign s_logisimNet48     = s_logisimBus119[61];
   assign s_logisimNet49     = s_logisimBus119[57];
   assign s_logisimNet63     = s_logisimBus119[52];
   assign s_logisimNet68     = s_logisimBus119[43];
   assign s_logisimNet69     = s_logisimBus119[19];
   assign s_logisimNet70     = s_logisimBus119[38];
   assign s_logisimNet71     = s_logisimBus119[26];
   assign s_logisimNet72     = s_logisimBus119[45];
   assign s_logisimNet89     = s_logisimBus119[31];
   assign s_logisimNet93     = s_logisimBus119[60];
   assign s_logisimNet94     = s_logisimBus119[56];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus119[63:0] = CSBITS;
   assign s_logisimBus144[6:0]  = PT_15_9;
   assign s_logisimBus25[15:0]  = CD_15_0_IN;
   assign s_logisimNet108       = IBINT11_n;
   assign s_logisimNet109       = UCLK;
   assign s_logisimNet11        = IOXERR_n;
   assign s_logisimNet110       = ETRAP_n;
   assign s_logisimNet12        = ALUCLK;
   assign s_logisimNet13        = MAP_n;
   assign s_logisimNet14        = IBINT13_n;
   assign s_logisimNet143       = IBINT10_n;
   assign s_logisimNet145       = BEMPID_n;
   assign s_logisimNet146       = BSTP;
   assign s_logisimNet147       = IBINT15_n;
   assign s_logisimNet154       = LCS_n;
   assign s_MCLK                = MCLK;
   assign s_logisimNet162       = POWFAIL_n;
   assign s_logisimNet17        = PARERR_n;
   assign s_logisimNet3         = WRFSTB;
   assign s_logisimNet37        = PAN_n;
   assign s_logisimNet43        = BEDO_n;
   assign s_PD1                 = PD1;
   assign s_logisimNet53        = MREQ_n;
   assign s_logisimNet56        = TERM_n;
   assign s_CLK                 = CLK;
   assign s_logisimNet65        = MR_n;
   assign s_logisimNet66        = EWCA_n;
   assign s_logisimNet67        = IBINT12_n;
   assign s_logisimNet83        = MOR_n;
   assign s_logisimNet91        = ESTOF_n;
   assign s_logisimNet97        = WCA_n;

   

   // s_twrf_n = low, write to memory from IDB
   wire ram_read; // boolean to know if we are reading from RAM
   assign ram_read = !s_erf_n & s_wrtrf & s_twrf_n; // Read from RAM

   
   assign s_fidb_A_IN = IDB_15_0_IN | (ram_read) ? s_idb_erf_out : 0;


   assign s_fidb_cga_IN = s_fidb_B_OUT;

   assign IDB2 = s_fidb_A_IN[2];   

   assign s_idb_erf_in = IDB_15_0_IN | ((!ESTOF_n & !BEDO_n) ? s_fidb_A_OUT : 0); // Not 100% sure where data to the RAM may come from, so expect it to com from IDB and via Chip32F/33F
   // LOGIC
   assign IDB_15_0_OUT = ram_read ? s_idb_erf_out[15:0] : ( (!ESTOF_n & !BEDO_n) ? s_fidb_A_OUT[15:0] : 16'b0);
   // OR
   //assign IDB_15_0_OUT =  s_idb_erf_inout[15:0] |  s_fidb_A_OUT[15:0];

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ACOND_n     = s_logisimNet40;
   assign BRK_n       = s_logisimNet159;
   assign CA_9_0      = s_logisimBus163[9:0];
   assign CSA_12_0    = s_logisimBus21[12:0];
   assign CSCA_9_0    = s_logisimBus24[9:0];
   assign CUP         = s_logisimNet28;
   assign CWR         = s_logisimNet76;
   assign DOUBLE      = s_logisimNet125;
   assign ECCR        = s_logisimNet85;
   
   assign IONI        = s_logisimNet41;
   assign LA_23_10    = s_logisimBus168[13:0];
   assign LBA_3_0     = s_logisimBus92[7:4];
   assign LEV0        = s_logisimNet118;
   assign LSHADOW     = s_logisimNet126;
   assign OPCLCS      = s_logisimNet74;
   assign PCR_1_0     = s_logisimBus171[1:0];
   assign PIL_3_0     = s_logisimBus84[3:0];
   assign PONI        = s_logisimNet170;
   assign RF_1_0      = s_logisimBus92[9:8];
   assign RRF_n       = s_logisimNet75;
   assign RT_n        = s_logisimNet160;
   assign LDEXM_n     = s_ledexm;
   assign RWCS_n      = s_logisimNet117;
   assign TEST_4_0    = s_logisimBus103[4:0];
   assign TP1_INTRQ_n = s_logisimNet20;
   assign TRAP        = s_logisimNet39;
   assign VEX         = s_logisimNet27;
   assign WCS_n       = s_logisimNet169;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimBus92[10]  =  1'b0;


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_1 (.input1(s_wrtrf),
               .input2(s_logisimNet3),
               .input3(s_logisimNet56),
               .result(s_twrf_n));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   AM29841   CHIP_25F (.D(s_logisimBus24),           
                       .LE(s_MCLK),
                       .OE_n(s_PD1),
                       .Y(s_logisimBus163));

   CPU_PROC_CMDDEC_34   CMDDEC (.BRK_n(s_logisimNet159),
                                .CGABRK_n(s_logisimNet10),
                                .CLK(s_CLK),
                                .CSCOMM_4_0(s_logisimBus114[4:0]),
                                .CSIDBS_4_0(s_logisimBus90[4:0]),
                                .CSMIS_1_0(s_logisimBus151[1:0]),
                                .CUP(s_logisimNet28),
                                .CWR(s_logisimNet76),
                                .ERF_n(s_erf_n), // output from PAL_44407_UERFIX
                                .IDB2(IDB2),
                                .LCS_n(s_logisimNet154),
                                .LEV0(s_logisimNet118),
                                .MREQ_n(s_logisimNet53),
                                .OPCLCS(s_logisimNet74),
                                .PD1(s_PD1),
                                .PIL_3_0(s_logisimBus84[3:0]),
                                .RRF_n(s_logisimNet75),
                                .RT_n(s_logisimNet160),
                                .RWCS_n(s_logisimNet117),
                                .LDEXM_n(s_ledexm),
                                .VEX(s_logisimNet27),
                                .WCA_n(s_logisimNet97),
                                .WRTRF(s_wrtrf));

   TTL_74245   CHIP_32F (.A(s_fidb_A_IN[7:0]), // 
                         .A_OUT(s_fidb_A_OUT[7:0]),
                         .B(s_fidb_cga_OUT[7:0]),
                         .B_OUT(s_fidb_B_OUT[7:0]),
                         .DIR(s_logisimNet43),
                         .OE_n(s_logisimNet91));


   TTL_74245   CHIP_33F (.A(s_fidb_A_IN[15:8]),   
                         .A_OUT(s_fidb_A_OUT[15:8]),
                         .B(s_fidb_cga_OUT[15:8]),
                         .B_OUT(s_fidb_B_OUT[15:8]),
                         .DIR(s_logisimNet43),
                         .OE_n(s_logisimNet91));


   TMM2018D_25   CHIP_34F (
                           .clk(sysclk), // System clock in FPGA
                           .reset_n(sys_rst_n), // System reset in FPGA
  
                           .ADDRESS(s_logisimBus92[10:0]),
                           .CS_n(s_erf_n),
                           .D(s_idb_erf_in[7:0]),       // IN
                           .D_OUT(s_idb_erf_out[7:0]),  // OUT
                           .OE_n(s_wrtrf),
                           .W_n(s_twrf_n));


   TMM2018D_25   CHIP_35F (
                           .clk(sysclk), // System clock in FPGA
                           .reset_n(sys_rst_n), // System reset in FPGA

                           .ADDRESS(s_logisimBus92[10:0]),
                           .CS_n(s_erf_n),
                           .D(s_idb_erf_in[15:8]),       // IN
                           .D_OUT(s_idb_erf_out[15:8]),  // OUT
                           .OE_n(s_wrtrf),
                           .W_n(s_twrf_n));




   CPU_PROC_CGA_33   CGA (.ACOND_n(s_logisimNet40),
                          .ALUCLK(s_logisimNet12),
                          .BEDO_n(s_logisimNet43),
                          .BEMPID_n(s_logisimNet145),
                          .BSTP(s_logisimNet146),
                          .CD_15_0(s_logisimBus25[15:0]),
                          .CGABRK_n(s_logisimNet10),
                          .CSA_12_0(s_logisimBus21[12:0]),
                          .CSBITS(s_logisimBus119[63:0]),
                          .CSCA_9_0(s_logisimBus24[9:0]),
                          .DOUBLE(s_logisimNet125),
                          .ECCR(s_logisimNet85),
                          .ETRAP_n(s_logisimNet110),
                          .EWCA_n(s_logisimNet66),
                          .FIDB_15_0_IN(s_fidb_cga_IN[15:0]),
                          .FIDB_15_0_OUT(s_fidb_cga_OUT[15:0]),
                          .IBINT10_n(s_logisimNet143),
                          .IBINT11_n(s_logisimNet108),
                          .IBINT12_n(s_logisimNet67),
                          .IBINT13_n(s_logisimNet14),
                          .IBINT15_n(s_logisimNet147),
                          .INTRQ_n_tp1(s_logisimNet20),
                          .ERF_n(s_erf_n_org),  // original ERF_N from CGA (submodule DCD), fixed with PAL_44407_UERFIX (signal replaced, so wire is not used)
                          .IONI(s_logisimNet41),
                          .IOXERR_n(s_logisimNet11),
                          .LAA_3_0(s_logisimBus92[3:0]),
                          .LA_23_10(s_logisimBus168[13:0]),
                          .LBA_3_0(s_logisimBus92[7:4]),
                          .LCS_n(s_logisimNet154),
                          .LSHADOW(s_logisimNet126),
                          .MAP_n(s_logisimNet13),
                          .MCLK(s_MCLK),
                          .MOR_n(s_logisimNet83),
                          .MR_n(s_logisimNet65),
                          .PAN_n(s_logisimNet37),
                          .PARERR_n(s_logisimNet17),
                          .PCR_1_0(s_logisimBus171[1:0]),
                          .PIL_3_0(s_logisimBus84[3:0]),
                          .PONI(s_logisimNet170),
                          .POWFAIL_n(s_logisimNet162),
                          .PT_15_9(s_logisimBus144[6:0]),
                          .RF_1_0(s_logisimBus92[9:8]),
                          .SEL_TESTMUX(SEL_TESTMUX),
                          .TEST_4_0(s_logisimBus103[4:0]),
                          .TRAP_n(s_logisimNet39),
                          .UCLK(s_logisimNet109),
                          .WCS_n(s_logisimNet169),
                          .WRTRF(s_wrtrf));

endmodule
