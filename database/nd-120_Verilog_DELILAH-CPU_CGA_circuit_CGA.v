// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA                                                          **
 **                                                                          **
 *****************************************************************************/

module CGA( 
            XACONDN,
            XALUCLK,
            XBINT10N,
            XBINT11N,
            XBINT12N,
            XBINT13N,
            XBINT15N,
            XBRKN,
            XCD_15_0,
            XCSALUI_8_0,
            XCSALUM_1_0,
            XCSBIT20,
            XCSBIT_15_0,
            XCSCINSEL_1_0,
            XCSCOMM_4_0,
            XCSECOND,
            XCSIDBS_4_0,
            XCSLOOP,
            XCSMIS_1_0,
            XCSRASEL_1_0,
            XCSRBSEL_1_0,
            XCSRB_3_0,
            XCSSCOND,
            XCSSST_1_0,
            XCSTS_6_3,
            XCSVECT,
            XCSXRF3,
            XDOUBLE,
            XECCR,
            XEDON,
            XEMPIDN,
            XERFN,
            XETRAPN,
            XEWCAN,
            XFIDB_15_0_IN,
            XFIDB_15_0_OUT,
            XFTRAPN,
            XILCSN,
            XINTRQN,
            XIONI,
            XIOXERRN,
            XLAA_3_0,
            XLA_23_10,
            XLBA_3_0,
            XLSHADOW,
            XMAPN,
            XMA_12_0,
            XMCA_9_0,
            XMCLK,
            XMORN,
            XMRN,
            XPANN,
            XPARERRN,
            XPCR_1_0,
            XPIL_3_0,
            XPONI,
            XPOWFAILN,
            XPTSTN,
            XPT_9_15,
            XRF_1_0,
            XSPARE,
            XSTP,
            XTCLK,
            XTEST_4_0,
            XTRAPN,
            XTSEL_2_0,
            XVTRAPN,
            XWCSN,
            XWRTRF );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        XALUCLK;
   input        XBINT10N;
   input        XBINT11N;
   input        XBINT12N;
   input        XBINT13N;
   input        XBINT15N;
   input [15:0] XCD_15_0;
   input [8:0]  XCSALUI_8_0;
   input [1:0]  XCSALUM_1_0;
   input        XCSBIT20;
   input [15:0] XCSBIT_15_0;
   input [1:0]  XCSCINSEL_1_0;
   input [4:0]  XCSCOMM_4_0;
   input        XCSECOND;
   input [4:0]  XCSIDBS_4_0;
   input        XCSLOOP;
   input [1:0]  XCSMIS_1_0;
   input [1:0]  XCSRASEL_1_0;
   input [1:0]  XCSRBSEL_1_0;
   input [3:0]  XCSRB_3_0;
   input        XCSSCOND;
   input [1:0]  XCSSST_1_0;
   input [3:0]  XCSTS_6_3;
   input        XCSVECT;
   input        XCSXRF3;
   input        XEDON;
   input        XEMPIDN;
   input        XETRAPN;
   input        XEWCAN;
   
   input        XFTRAPN;
   input        XILCSN;
   input        XIOXERRN;
   input        XMAPN;
   input        XMCLK;
   input        XMORN;
   input        XMRN;
   input        XPANN;
   input        XPARERRN;
   input        XPOWFAILN;
   input        XPTSTN;
   input [6:0]  XPT_9_15;
   input        XSPARE;
   input        XSTP;
   input        XTCLK;
   input [2:0]  XTSEL_2_0;
   input        XVTRAPN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   input  [15:0] XFIDB_15_0_IN;
   output [15:0] XFIDB_15_0_OUT;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        XACONDN;
   output        XBRKN;
   output        XDOUBLE;
   output        XECCR;
   output        XERFN;   
   output        XINTRQN;
   output        XIONI;
   output [3:0]  XLAA_3_0;
   output [13:0] XLA_23_10;
   output [3:0]  XLBA_3_0;
   output        XLSHADOW;
   output [12:0] XMA_12_0;
   output [9:0]  XMCA_9_0;
   output [1:0]  XPCR_1_0;
   output [3:0]  XPIL_3_0;
   output        XPONI;
   output [1:0]  XRF_1_0;
   output [4:0]  XTEST_4_0;
   output        XTRAPN;
   output        XWCSN;
   output        XWRTRF;


   // IDB BUS
   wire [15:0] FIDBI_15_0;
   wire [15:0] FIDBO_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [6:0]  s_logisimBus100;
   wire [1:0]  s_logisimBus101;
   wire [15:0] s_logisimBus112;
   wire [6:0]  s_logisimBus118;
   wire [1:0]  s_logisimBus125;
   wire [15:0] s_logisimBus127;
   wire [3:0]  s_logisimBus129;
   wire [15:0] s_logisimBus132;
   wire [3:0]  s_logisimBus134;
   wire [3:0]  s_logisimBus136;
   wire [2:0]  s_logisimBus142;
   wire [8:0]  s_logisimBus144;
   wire [3:0]  s_logisimBus149;
   
   wire [3:0]  s_logisimBus152;   
   wire [15:0] s_logisimBus161;
   wire [15:0] s_logisimBus164;
   wire [15:0] s_logisimBus166;
   wire [1:0]  s_logisimBus168;
   wire [15:0] s_logisimBus175;
   wire [1:0]  s_logisimBus180;
   wire [1:0]  s_logisimBus181;
   wire [4:0]  s_logisimBus186;
   wire [4:0]  s_logisimBus187;
   wire [3:0]  s_logisimBus190;
   
   wire [15:0] s_xfidbi_15_0;
   wire [2:0]  s_logisimBus197;
   wire [15:0] s_logisimBus198;
   wire [3:0]  s_logisimBus201;
   wire [1:0]  s_logisimBus207;
   wire [1:0]  s_logisimBus209;
   wire [4:0]  s_logisimBus212;
   wire [15:0] s_logisimBus213;
   wire [9:0]  s_logisimBus215;
   wire [15:0] s_logisimBus221;
   wire [13:0] s_logisimBus222;
   wire [12:0] s_logisimBus227;
   wire [1:0]  s_logisimBus228;
   wire [1:0]  s_logisimBus229;
   wire [3:0]  s_logisimBus233;
   wire [4:0]  s_logisimBus234;
   wire [1:0]  s_logisimBus235;
   wire [1:0]  s_logisimBus24;
   wire [3:0]  s_logisimBus30;
   wire [8:0]  s_logisimBus35;
   wire [1:0]  s_logisimBus47;
   wire [15:0] s_logisimBus52;
   wire [1:0]  s_logisimBus57;
   wire [15:0] s_logisimBus62;
   wire [15:0] s_logisimBus64;
   wire [2:0]  s_logisimBus67;
   
   wire [2:0]  s_logisimBus88;
   wire [15:0] s_logisimBus9;
   wire [4:0]  s_logisimBus93;
   wire [1:0]  s_logisimBus99;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet102;
   wire        s_logisimNet103;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet11;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet113;
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet116;
   wire        s_logisimNet117;
   wire        s_logisimNet119;
   wire        s_logisimNet12;
   wire        s_logisimNet120;
   wire        s_logisimNet121;
   wire        s_logisimNet122;
   wire        s_logisimNet123;
   wire        s_logisimNet124;
   wire        s_PTSTN;
   wire        s_logisimNet128;
   wire        s_logisimNet13;
   wire        s_logisimNet130;
   wire        s_logisimNet131;
   wire        s_logisimNet133;
   wire        s_logisimNet135;
   wire        s_logisimNet137;
   wire        s_logisimNet138;
   wire        s_logisimNet139;
   wire        s_logisimNet14;
   wire        s_logisimNet140;
   wire        s_logisimNet141;
   wire        s_logisimNet143;
   wire        s_BDEST;
   wire        s_logisimNet146;
   wire        s_logisimNet147;
   wire        s_logisimNet148;
   wire        s_logisimNet150;
   wire        s_logisimNet151;
   wire        s_logisimNet153;
   wire        s_logisimNet154;
   wire        s_logisimNet155;
   wire        s_logisimNet156;
   wire        s_logisimNet157;
   wire        s_logisimNet158;
   wire        s_logisimNet16;
   wire        s_logisimNet160;
   wire        s_logisimNet162;
   wire        s_logisimNet163;
   wire        s_logisimNet165;
   wire        s_logisimNet167;
   wire        s_logisimNet169;
   wire        s_logisimNet17;
   wire        s_logisimNet170;
   wire        s_logisimNet171;
   wire        s_logisimNet172;
   wire        s_x_erf_n;
   wire        s_logisimNet174;
   wire        s_logisimNet176;
   wire        s_logisimNet177;
   wire        s_logisimNet178;
   wire        s_logisimNet179;
   wire        s_logisimNet18;
   wire        s_logisimNet182;
   wire        s_logisimNet183;
   wire        s_logisimNet184;
   wire        s_logisimNet185;
   wire        s_logisimNet188;
   wire        s_logisimNet189;
   wire        s_logisimNet19;
   wire        s_logisimNet192;
   wire        s_logisimNet194;
   wire        s_logisimNet195;
   wire        s_logisimNet196;
   wire        s_logisimNet199;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet200;
   wire        s_logisimNet202;
   wire        s_logisimNet203;
   wire        s_logisimNet204;
   wire        s_logisimNet205;
   wire        s_logisimNet206;
   wire        s_logisimNet208;
   wire        s_logisimNet21;
   wire        s_logisimNet210;
   wire        s_logisimNet211;
   wire        s_logisimNet214;
   wire        s_logisimNet217;
   wire        s_logisimNet218;
   wire        s_logisimNet219;
   wire        s_logisimNet22;
   wire        s_logisimNet220;
   wire        s_logisimNet223;
   wire        s_logisimNet224;
   wire        s_logisimNet225;
   wire        s_logisimNet226;
   wire        s_logisimNet23;
   wire        s_logisimNet230;
   wire        s_logisimNet232;
   wire        s_logisimNet236;
   wire        s_logisimNet237;
   wire        s_logisimNet238;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet63;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet72;
   wire        s_logisimNet73;
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
   wire        s_logisimNet77;
   wire        s_logisimNet78;
   wire        s_logisimNet79;
   wire        s_logisimNet8;
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet89;
   wire        s_logisimNet90;
   wire        s_logisimNet91;
   wire        s_logisimNet92;
   wire        s_logisimNet94;
   wire        s_logisimNet95;
   wire        s_logisimNet96;
   wire        s_logisimNet97;
   wire        s_logisimNet98;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus101[0]  = s_logisimNet50;
   assign s_logisimBus101[1]  = s_logisimNet98;
   assign s_logisimBus118[0]  = s_logisimNet55;
   assign s_logisimBus118[1]  = s_logisimNet14;
   assign s_logisimBus118[2]  = s_logisimNet51;
   assign s_logisimBus118[3]  = s_logisimNet5;
   assign s_logisimBus118[4]  = s_logisimNet113;
   assign s_logisimBus118[5]  = s_logisimNet0;
   assign s_logisimBus118[6]  = s_logisimNet17;
   assign s_logisimBus136[0]  = s_logisimNet11;
   assign s_logisimBus136[1]  = s_logisimNet39;
   assign s_logisimBus136[2]  = s_logisimNet87;
   assign s_logisimBus136[3]  = s_logisimNet74;
   assign s_logisimBus144[0]  = s_logisimNet106;
   assign s_logisimBus144[1]  = s_logisimNet86;
   assign s_logisimBus144[2]  = s_logisimNet6;
   assign s_logisimBus144[3]  = s_logisimNet75;
   assign s_logisimBus144[4]  = s_logisimNet56;
   assign s_logisimBus144[5]  = s_logisimNet4;
   assign s_logisimBus144[6]  = s_logisimNet41;
   assign s_logisimBus144[7]  = s_logisimNet10;
   assign s_logisimBus144[8]  = s_logisimNet107;
   assign s_logisimBus166[0]  = s_logisimNet2;
   assign s_logisimBus166[10] = s_logisimNet85;
   assign s_logisimBus166[11] = s_logisimNet109;
   assign s_logisimBus166[12] = s_logisimNet49;
   assign s_logisimBus166[13] = s_logisimNet54;
   assign s_logisimBus166[14] = s_logisimNet77;
   assign s_logisimBus166[15] = s_logisimNet115;
   assign s_logisimBus166[1]  = s_logisimNet42;
   assign s_logisimBus166[2]  = s_logisimNet84;
   assign s_logisimBus166[3]  = s_logisimNet108;
   assign s_logisimBus166[4]  = s_logisimNet48;
   assign s_logisimBus166[5]  = s_logisimNet53;
   assign s_logisimBus166[6]  = s_logisimNet76;
   assign s_logisimBus166[7]  = s_logisimNet114;
   assign s_logisimBus166[8]  = s_logisimNet3;
   assign s_logisimBus166[9]  = s_logisimNet43;
   assign s_logisimBus168[0]  = s_logisimNet89;
   assign s_logisimBus168[1]  = s_logisimNet26;
   assign s_logisimBus175[0]  = s_logisimNet59;
   assign s_logisimBus175[10] = s_logisimNet124;
   assign s_logisimBus175[11] = s_logisimNet13;
   assign s_logisimBus175[12] = s_logisimNet69;
   assign s_logisimBus175[13] = s_logisimNet91;
   assign s_logisimBus175[14] = s_logisimNet25;
   assign s_logisimBus175[15] = s_logisimNet37;
   assign s_logisimBus175[1]  = s_logisimNet104;
   assign s_logisimBus175[2]  = s_logisimNet123;
   assign s_logisimBus175[3]  = s_logisimNet12;
   assign s_logisimBus175[4]  = s_logisimNet70;
   assign s_logisimBus175[5]  = s_logisimNet90;
   assign s_logisimBus175[6]  = s_logisimNet27;
   assign s_logisimBus175[7]  = s_logisimNet36;
   assign s_logisimBus175[8]  = s_logisimNet60;
   assign s_logisimBus175[9]  = s_logisimNet103;
   assign s_logisimBus180[0]  = s_logisimNet237;
   assign s_logisimBus180[1]  = s_logisimNet238;
   assign s_logisimBus181[0]  = s_logisimNet82;
   assign s_logisimBus181[1]  = s_logisimNet66;
   assign s_logisimBus190[0]  = s_logisimNet16;
   assign s_logisimBus190[1]  = s_logisimNet80;
   assign s_logisimBus190[2]  = s_logisimNet95;
   assign s_logisimBus190[3]  = s_logisimNet34;
   assign s_logisimBus209[0]  = s_logisimNet31;
   assign s_logisimBus209[1]  = s_logisimNet81;
   assign s_logisimBus212[0]  = s_logisimNet92;
   assign s_logisimBus212[1]  = s_logisimNet20;
   assign s_logisimBus212[2]  = s_logisimNet38;
   assign s_logisimBus212[3]  = s_logisimNet61;
   assign s_logisimBus212[4]  = s_logisimNet72;
   assign s_logisimBus228[0]  = s_logisimNet40;
   assign s_logisimBus228[1]  = s_logisimNet117;
   assign s_logisimBus234[0]  = s_logisimNet19;
   assign s_logisimBus234[1]  = s_logisimNet32;
   assign s_logisimBus234[2]  = s_logisimNet97;
   assign s_logisimBus234[3]  = s_logisimNet65;
   assign s_logisimBus234[4]  = s_logisimNet153;
   assign s_logisimBus235[0]  = s_logisimNet7;
   assign s_logisimBus235[1]  = s_logisimNet22;
   assign s_logisimBus88[0]   = s_logisimNet23;
   assign s_logisimBus88[1]   = s_logisimNet45;
   assign s_logisimBus88[2]   = s_logisimNet18;
   assign s_logisimNet0       = s_logisimBus100[5];
   assign s_logisimNet10      = s_logisimBus35[7];
   assign s_logisimNet103     = s_logisimBus164[9];
   assign s_logisimNet104     = s_logisimBus164[1];
   assign s_logisimNet106     = s_logisimBus35[0];
   assign s_logisimNet107     = s_logisimBus35[8];
   assign s_logisimNet108     = s_logisimBus213[3];
   assign s_logisimNet109     = s_logisimBus213[11];
   assign s_logisimNet11      = s_logisimBus30[0];
   assign s_logisimNet113     = s_logisimBus100[4];
   assign s_logisimNet114     = s_logisimBus213[7];
   assign s_logisimNet115     = s_logisimBus213[15];
   assign s_logisimNet117     = s_logisimBus47[1];
   assign s_logisimNet12      = s_logisimBus164[3];
   assign s_logisimNet123     = s_logisimBus164[2];
   assign s_logisimNet124     = s_logisimBus164[10];
   assign s_logisimNet13      = s_logisimBus164[11];
   assign s_logisimNet14      = s_logisimBus100[1];
   assign s_logisimNet153     = s_logisimBus187[4];
   assign s_logisimNet16      = s_logisimBus152[0];
   assign s_logisimNet17      = s_logisimBus100[6];
   assign s_logisimNet18      = s_logisimBus197[2];
   assign s_logisimNet19      = s_logisimBus187[0];
   assign s_logisimNet2       = s_logisimBus213[0];
   assign s_logisimNet20      = s_logisimBus186[1];
   assign s_logisimNet22      = s_logisimBus24[1];
   assign s_logisimNet23      = s_logisimBus197[0];
   assign s_logisimNet237     = s_logisimBus198[0];
   assign s_logisimNet238     = s_logisimBus198[1];
   assign s_logisimNet25      = s_logisimBus164[14];
   assign s_logisimNet26      = s_logisimBus57[1];
   assign s_logisimNet27      = s_logisimBus164[6];
   assign s_logisimNet3       = s_logisimBus213[8];
   assign s_logisimNet31      = s_logisimBus207[0];
   assign s_logisimNet32      = s_logisimBus187[1];
   assign s_logisimNet34      = s_logisimBus152[3];
   assign s_logisimNet36      = s_logisimBus164[7];
   assign s_logisimNet37      = s_logisimBus164[15];
   assign s_logisimNet38      = s_logisimBus186[2];
   assign s_logisimNet39      = s_logisimBus30[1];
   assign s_logisimNet4       = s_logisimBus35[5];
   assign s_logisimNet40      = s_logisimBus47[0];
   assign s_logisimNet41      = s_logisimBus35[6];
   assign s_logisimNet42      = s_logisimBus213[1];
   assign s_logisimNet43      = s_logisimBus213[9];
   assign s_logisimNet45      = s_logisimBus197[1];
   assign s_logisimNet48      = s_logisimBus213[4];
   assign s_logisimNet49      = s_logisimBus213[12];
   assign s_logisimNet5       = s_logisimBus100[3];
   assign s_logisimNet50      = s_logisimBus99[0];
   assign s_logisimNet51      = s_logisimBus100[2];
   assign s_logisimNet53      = s_logisimBus213[5];
   assign s_logisimNet54      = s_logisimBus213[13];
   assign s_logisimNet55      = s_logisimBus100[0];
   assign s_logisimNet56      = s_logisimBus35[4];
   assign s_logisimNet59      = s_logisimBus164[0];
   assign s_logisimNet6       = s_logisimBus35[2];
   assign s_logisimNet60      = s_logisimBus164[8];
   assign s_logisimNet61      = s_logisimBus186[3];
   assign s_logisimNet65      = s_logisimBus187[3];
   assign s_logisimNet66      = s_logisimBus229[1];
   assign s_logisimNet69      = s_logisimBus164[12];
   assign s_logisimNet7       = s_logisimBus24[0];
   assign s_logisimNet70      = s_logisimBus164[4];
   assign s_logisimNet72      = s_logisimBus186[4];
   assign s_logisimNet74      = s_logisimBus30[3];
   assign s_logisimNet75      = s_logisimBus35[3];
   assign s_logisimNet76      = s_logisimBus213[6];
   assign s_logisimNet77      = s_logisimBus213[14];
   assign s_logisimNet80      = s_logisimBus152[1];
   assign s_logisimNet81      = s_logisimBus207[1];
   assign s_logisimNet82      = s_logisimBus229[0];
   assign s_logisimNet84      = s_logisimBus213[2];
   assign s_logisimNet85      = s_logisimBus213[10];
   assign s_logisimNet86      = s_logisimBus35[1];
   assign s_logisimNet87      = s_logisimBus30[2];
   assign s_logisimNet89      = s_logisimBus57[0];
   assign s_logisimNet90      = s_logisimBus164[5];
   assign s_logisimNet91      = s_logisimBus164[13];
   assign s_logisimNet92      = s_logisimBus186[0];
   assign s_logisimNet95      = s_logisimBus152[2];
   assign s_logisimNet97      = s_logisimBus187[2];
   assign s_logisimNet98      = s_logisimBus99[1];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus100[6:0]  = XPT_9_15;
   assign s_logisimBus152[3:0]  = XCSTS_6_3;
   assign s_logisimBus164[15:0] = XCD_15_0;
   assign s_logisimBus186[4:0]  = XCSIDBS_4_0;
   assign s_logisimBus187[4:0]  = XCSCOMM_4_0;
   assign s_logisimBus197[2:0]  = XTSEL_2_0;
   assign s_logisimBus207[1:0]  = XCSRASEL_1_0;
   assign s_logisimBus213[15:0] = XCSBIT_15_0;
   assign s_logisimBus229[1:0]  = XCSRBSEL_1_0;
   assign s_logisimBus24[1:0]   = XCSCINSEL_1_0;
   assign s_logisimBus30[3:0]   = XCSRB_3_0;
   assign s_logisimBus35[8:0]   = XCSALUI_8_0;
   assign s_logisimBus47[1:0]   = XCSALUM_1_0;
   assign s_logisimBus57[1:0]   = XCSMIS_1_0;
   
   assign s_logisimBus99[1:0]   = XCSSST_1_0;
   assign s_logisimNet102       = XMRN;
   assign s_logisimNet110       = XSTP;
   assign s_logisimNet111       = XVTRAPN;
   assign s_logisimNet116       = XMORN;
   assign s_logisimNet119       = XPOWFAILN;
   assign s_PTSTN               = XPTSTN;
   assign s_logisimNet130       = XMCLK;
   assign s_logisimNet131       = XIOXERRN;
   assign s_logisimNet137       = XCSSCOND;
   assign s_logisimNet138       = XFTRAPN;
   assign s_logisimNet139       = XSPARE;
   assign s_logisimNet143       = XPANN;   
   assign s_logisimNet148       = XCSBIT20;
   assign s_logisimNet157       = XILCSN;
   assign s_logisimNet160       = XBINT12N;
   assign s_logisimNet170       = XETRAPN;
   assign s_logisimNet171       = XBINT11N;
   assign s_logisimNet172       = XPARERRN;
   assign s_logisimNet178       = XTCLK;
   assign s_logisimNet189       = XCSXRF3;
   assign s_logisimNet194       = XALUCLK;
   assign s_logisimNet199       = XEMPIDN;
   assign s_logisimNet208       = XEDON;
   assign s_logisimNet217       = XEWCAN;
   assign s_logisimNet218       = XCSECOND;
   assign s_logisimNet219       = XCSVECT;
   assign s_logisimNet225       = XBINT13N;
   assign s_logisimNet226       = XMAPN;
   assign s_logisimNet46        = XCSLOOP;
   assign s_logisimNet68        = XBINT15N;
   assign s_logisimNet73        = XBINT10N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign XACONDN        = s_logisimNet206;
   assign XBRKN          = s_logisimNet135;
   assign XDOUBLE        = s_logisimNet128;
   assign XECCR          = s_logisimNet140;
   assign XERFN          = s_x_erf_n;
   
   assign XINTRQN        = s_logisimNet165;
   assign XIONI          = s_logisimNet214;
   assign XLAA_3_0       = s_logisimBus201[3:0];
   assign XLA_23_10      = s_logisimBus222[13:0];
   assign XLBA_3_0       = s_logisimBus134[3:0];
   assign XLSHADOW       = s_logisimNet167;
   assign XMA_12_0       = s_logisimBus227[12:0];
   assign XMCA_9_0       = s_logisimBus215[9:0];
   assign XPCR_1_0       = s_logisimBus180[1:0];
   assign XPIL_3_0       = s_logisimBus149[3:0];
   assign XPONI          = s_logisimNet184;
   assign XRF_1_0        = s_logisimBus125[1:0];
   assign XTEST_4_0      = s_logisimBus93[4:0];
   assign XTRAPN         = s_logisimNet196;
   assign XWCSN          = s_logisimNet163;
   assign XWRTRF         = s_logisimNet223;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet96  =  1'b1;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_ALU   ALU (.ALUCLK(s_logisimNet194),
                  .A_15_0(s_logisimBus161[15:0]),
                  .BDEST(s_BDEST),
                  .B_15_0(s_logisimBus112[15:0]),
                  .CD_15_0(s_logisimBus175[15:0]),
                  .CRY(s_logisimNet155),
                  .CSALUI_8_0(s_logisimBus144[8:0]),
                  .CSALUM_1_0(s_logisimBus228[1:0]),
                  .CSBIT_15_0(s_logisimBus166[15:0]),
                  .CSCINSEL_1_0(s_logisimBus235[1:0]),
                  .CSIDBS_4_0(s_logisimBus212[4:0]),
                  .CSMIS_1_0(s_logisimBus168[1:0]),
                  .CSSST_1_0(s_logisimBus101[1:0]),
                  .DOUBLE(s_logisimNet128),
                  .EA_15_0(s_logisimBus221[15:0]),
                  .F11(s_logisimNet158),
                  .F15(s_logisimNet220),
                  .FIDBI_15_0(FIDBI_15_0[15:0]),
                  .FIDBO_15_0_OUT(FIDBO_15_0[15:0]),
                  .IONI(s_logisimNet214),
                  .LAA_3_0(s_logisimBus201[3:0]),
                  .LBA_3_0(s_logisimBus134[3:0]),
                  .LCZN(s_logisimNet211),
                  .LDDBRN(s_logisimNet183),
                  .LDGPRN(s_logisimNet150),
                  .LDIRV(s_logisimNet224),
                  .LDPILN(s_logisimNet182),
                  .MI(s_logisimNet203),
                  .OVF(s_logisimNet169),
                  .PIL_3_0(s_logisimBus149[3:0]),
                  .PONI(s_logisimNet184),
                  .PTM(s_logisimNet185),
                  .RB_15_0(s_logisimBus62[15:0]),
                  .SGR(s_logisimNet188),
                  .UPN(s_logisimNet204),
                  .XFETCHN(s_logisimNet205),
                  .Z(s_logisimNet192),
                  .ZF(s_logisimNet177));

   CGA_TRAP   TRAP (.BRKN(s_logisimNet135),
                    .CBRKN(s_logisimNet94),
                    .DSTOPN(s_logisimNet63),
                    .ETRAPN(s_logisimNet170),
                    .FETCHN(s_logisimNet122),
                    .FTRAPN(s_logisimNet138),
                    .INDN(s_logisimNet120),
                    .INTRQN(s_logisimNet165),
                    .PANN(s_logisimNet143),
                    .PCR_1_0(s_logisimBus180[1:0]),
                    .PONI(s_logisimNet184),
                    .PT_15_9(s_logisimBus118[6:0]),
                    .PVIOL(s_logisimNet71),
                    .RESTR(s_logisimNet210),
                    .TCLK(s_logisimNet178),
                    .TRAPN(s_logisimNet196),
                    .TVEC_3_0(s_logisimBus129[3:0]),
                    .VACCN(s_logisimNet146),
                    .VTRAPN(s_logisimNet111),
                    .WRITEN(s_logisimNet58));

   CGA_IDBCTL   IDBCTL (.EPCRN(s_logisimNet33),
                        .EPGSN(s_logisimNet21),
                        .EPICMASKN(s_logisimNet105),
                        .EPICSN(s_logisimNet1),
                        .EPICVN(s_logisimNet78),
                        .FETCHN(s_logisimNet122),
                        .FIDBI_15_0_OUT(FIDBI_15_0[15:0]),
                        .HIGSN(s_logisimNet44),
                        .LA_21_10(s_logisimBus222[11:0]),
                        .LOGSN(s_logisimNet8),
                        .MCLK(s_logisimNet130),
                        .PCR_15_0(s_logisimBus198[15:0]),
                        .PD(s_logisimNet29),
                        .PICMASK_15_0(s_logisimBus132[15:0]),
                        .PICS_2_0(s_logisimBus67[2:0]),
                        .PICV_2_0(s_logisimBus142[2:0]),
                        .PVIOL(s_logisimNet71),
                        .VACCN(s_logisimNet146),
                        .XFIDBI_15_0(s_xfidbi_15_0[15:0]));

   CGA_WRF   WRF (.ALUCLK(s_logisimNet194),
                  .A_15_0(s_logisimBus161[15:0]),
                  .BDEST(s_BDEST),
                  .BR_15_0(s_logisimBus9[15:0]),
                  .B_15_0(s_logisimBus112[15:0]),
                  .EA_15_0(s_logisimBus221[15:0]),
                  .LAA_3_0(s_logisimBus201[3:0]),
                  .LBA_3_0(s_logisimBus134[3:0]),
                  .NLCA_15_0(s_logisimBus127[15:0]),
                  .PR_15_0(s_logisimBus52[15:0]),
                  .RB_15_0(s_logisimBus62[15:0]),
                  .WPN(s_logisimNet230),
                  .WR3(s_logisimNet151),
                  .WR7(s_logisimNet156),
                  .XFETCHN(s_logisimNet205),
                  .XR_15_0(s_logisimBus64[15:0]));

   CGA_DCD   DCD (.BRKN(s_logisimNet135),
                  .CBRKN(s_logisimNet94),
                  .CFETCH(s_logisimNet121),
                  .CLFFN(s_logisimNet236),
                  .CLIRQN(s_logisimNet28),
                  .CRY(s_logisimNet177),
                  .CSCOMM_4_0(s_logisimBus234[4:0]),
                  .CSIDBS_4_0(s_logisimBus212[4:0]),
                  .CSMIS_1_0(s_logisimBus168[1:0]),
                  .CSMREQ(s_logisimNet133),
                  .DSTOPN(s_logisimNet63),
                  .EPCRN(s_logisimNet33),
                  .EPGSN(s_logisimNet21),
                  .EPIC(s_logisimNet79),
                  .EPICSN(s_logisimNet1),
                  .EPICVN(s_logisimNet78),
                  .ERFN(s_x_erf_n),
                  .F15(s_logisimNet220),
                  .FETCHN(s_logisimNet122),
                  .FIDBO(FIDBO_15_0[5]),
                  .ILCSN(s_logisimNet157),
                  .INDN(s_logisimNet120),
                  .INTRQN(s_logisimNet165),
                  .LDDBRN(s_logisimNet183),
                  .LDGPRN(s_logisimNet150),
                  .LDIRV(s_logisimNet224),
                  .LDLCN(s_logisimNet141),
                  .LDPILN(s_logisimNet182),
                  .LSHADOW(s_logisimNet167),
                  .LWCAN(s_logisimNet200),
                  .MCLK(s_logisimNet130),
                  .MRN(s_logisimNet102),
                  .PONI(s_logisimNet184),
                  .SGR(s_logisimNet188),
                  .VACCN(s_logisimNet146),
                  .VEX(s_logisimNet195),
                  .WPN(s_logisimNet230),
                  .WRITEN(s_logisimNet58),
                  .WRTRF(s_logisimNet223),
                  .XFETCHN(s_logisimNet205),
                  .ZF(s_logisimNet155));

   BusDriver16   BD_FIDBO (
                           .EN(s_logisimNet208),      // Enable = FALSE => A to IO, Enable=TRUE => IO to ZI
                           .TN(s_PTSTN),              // Test enable when LOW
                           .A_15_0(FIDBO_15_0),       // Data inputA (Connect to internal FIDBO data bus))     
                           .IO_15_0_IN(XFIDB_15_0_IN),     // IN and OUT to XFIDB data bus (Connect to EXTERNAL _XFIDB_ data bus)                                                      
                           .IO_15_0_OUT(XFIDB_15_0_OUT),   // 
                           .ZI_15_0(s_xfidbi_15_0)         // Z output  (Connect to internal XFIDBI data bus)
                           );

   CGA_INTR   INTR (.BINT10N(s_logisimNet73),
                    .BINT11N(s_logisimNet171),
                    .BINT12N(s_logisimNet160),
                    .BINT13N(s_logisimNet225),
                    .BINT15N(s_logisimNet68),
                    .CLIRQN(s_logisimNet28),
                    .EMPIDN(s_logisimNet199),
                    .EPIC(s_logisimNet79),
                    .EPICMASKN(s_logisimNet105),
                    .FIDBO_15_0(FIDBO_15_0[15:0]),
                    .HIGSN(s_logisimNet44),
                    .INTRQN(s_logisimNet165),
                    .IOXERRN(s_logisimNet131),
                    .IRQ(s_logisimNet174),
                    .LAA_3_0(s_logisimBus201[3:0]),
                    .LOGSN(s_logisimNet8),
                    .MCLK(s_logisimNet130),
                    .NORN(s_logisimNet116),
                    .PANN(s_logisimNet143),
                    .PARERRN(s_logisimNet172),
                    .PD(s_logisimNet29),
                    .PICMASK_15_0(s_logisimBus132[15:0]),
                    .PICS_2_0(s_logisimBus67[2:0]),
                    .PICV_2_0(s_logisimBus142[2:0]),
                    .POWFAILN(s_logisimNet119),
                    .Z(s_logisimNet192));

   CGA_MAC   MAC (.BR_15_0(s_logisimBus9[15:0]),
                  .CD_15_0(s_logisimBus175[15:0]),
                  .CMIS_1_0(s_logisimBus168[1:0]),
                  .CSCOMM_4_0(s_logisimBus234[4:0]),
                  .CSMREQ(s_logisimNet133),
                  .DOUBLE(s_logisimNet128),
                  .ECCR(s_logisimNet140),
                  .FIDBO_15_0(FIDBO_15_0[15:0]),
                  .ILCSN(s_logisimNet157),
                  .LA_23_10(s_logisimBus222[13:0]),
                  .LSHADOW(s_logisimNet167),
                  .MCA_9_0(s_logisimBus215[9:0]),
                  .MCLK(s_logisimNet130),
                  .NLCA_15_0(s_logisimBus127[15:0]),
                  .PCR_15_0(s_logisimBus198[15:0]),
                  .PONI(s_logisimNet184),
                  .PR_15_0(s_logisimBus52[15:0]),
                  .PTM(s_logisimNet185),
                  .RB_15_0(s_logisimBus62[15:0]),
                  .VEX(s_logisimNet195),
                  .WR3(s_logisimNet151),
                  .WR7(s_logisimNet156),
                  .XR_15_0(s_logisimBus64[15:0]));

   CGA_MIC   MIC (.ACONDN(s_logisimNet206),
                  .ALUCLK(s_logisimNet194),
                  .CD_15_0(s_logisimBus175[15:0]),
                  .CFETCH(s_logisimNet121),
                  .CLFFN(s_logisimNet236),
                  .COND(s_logisimNet176),
                  .CRY(s_logisimNet177),
                  .CSALUI8(s_logisimNet107),
                  .CSBIT20(s_logisimNet148),
                  .CSBIT_15_0(s_logisimBus166[15:0]),
                  .CSCOND(s_logisimNet137),
                  .CSECOND(s_logisimNet218),
                  .CSLOOP(s_logisimNet46),
                  .CSMIS0(s_logisimNet89),
                  .CSRASEL_1_0(s_logisimBus209[1:0]),
                  .CSRBSEL_1_0(s_logisimBus181[1:0]),
                  .CSRB_3_0(s_logisimBus136[3:0]),
                  .CSTS_6_3(s_logisimBus190[3:0]),
                  .CSVECT(s_logisimNet219),
                  .CSXRF3(s_logisimNet189),
                  .DEEP(s_logisimNet179),
                  .DZD(s_logisimNet202),
                  .EWCAN(s_logisimNet217),
                  .F11(s_logisimNet158),
                  .F15(s_logisimNet220),
                  .ILCSN(s_logisimNet157),
                  .IRQ(s_logisimNet174),
                  .LAA_3_0(s_logisimBus201[3:0]),
                  .LBA_3_0(s_logisimBus134[3:0]),
                  .LCZ(1'b0),
                  .LCZN(s_logisimNet211),
                  .LDIRV(s_logisimNet224),
                  .LDLCN(s_logisimNet141),
                  .LWCAN(s_logisimNet200),
                  .MAPN(s_logisimNet226),
                  .MA_12_0(s_logisimBus227[12:0]),
                  .MCLK(s_logisimNet130),
                  .MI(s_logisimNet203),
                  .MRN(s_logisimNet102),
                  .OOD(s_logisimNet147),
                  .OVF(s_logisimNet169),
                  .PIL_3_0(s_logisimBus149[3:0]),
                  .PN(s_logisimNet162),
                  .RESTR(s_logisimNet210),
                  .RF_1_0(s_logisimBus125[1:0]),
                  .SC_6_3(s_logisimBus233[3:0]),
                  .SPARE(s_logisimNet139),
                  .STP(s_logisimNet110),
                  .TN(s_logisimNet232),
                  .TRAPN(s_logisimNet196),
                  .TVEC_3_0(s_logisimBus129[3:0]),
                  .UPN(s_logisimNet204),
                  .WCSN(s_logisimNet163),
                  .ZF(s_logisimNet155));

   CGA_TESTMUX   TESTMUX (.CBRKN(s_logisimNet94),
                          .CFETCH(s_logisimNet121),
                          .COND(s_logisimNet176),
                          .CRY(s_logisimNet177),
                          .CSMREQ(s_logisimNet133),
                          .DEEP(s_logisimNet179),
                          .DSTOPN(s_logisimNet63),
                          .DZD(s_logisimNet202),
                          .F15(s_logisimNet220),
                          .INDN(s_logisimNet120),
                          .LCZN(s_logisimNet211),
                          .LDIRV(s_logisimNet224),
                          .MI(s_logisimNet203),
                          .OOD(s_logisimNet147),
                          .OVF(s_logisimNet169),
                          .PN(s_logisimNet162),
                          .PTM(s_logisimNet185),
                          .PTREEOUT(s_logisimNet96),
                          .PTSTN(s_PTSTN),
                          .RESTR(s_logisimNet210),
                          .SC_6_3(s_logisimBus233[3:0]),
                          .SGR(s_logisimNet188),
                          .TEST_4_0(s_logisimBus93[4:0]),
                          .TN(s_logisimNet232),
                          .TSEL_2_0(s_logisimBus88[2:0]),
                          .TVEC_3_0(s_logisimBus129[3:0]),
                          .UPN(s_logisimNet204),
                          .VACCN(s_logisimNet146),
                          .VEX(s_logisimNet195),
                          .WPN(s_logisimNet230),
                          .WRITEN(s_logisimNet58),
                          .XFETCHN(s_logisimNet205),
                          .ZF(s_logisimNet155));

endmodule
