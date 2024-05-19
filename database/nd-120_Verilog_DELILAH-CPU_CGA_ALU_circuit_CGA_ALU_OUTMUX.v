// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_OUTMUX                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_OUTMUX( AARG0,
                       ALUCLK,
                       ALUD2N,
                       ARG_15_0,
                       A_15_0,
                       CSIDBS_4_0,
                       DBR_15_0,
                       D_15_0,
                       EA_15_0,
                       FIDBI_15_0,
                       F_15_0,
                       GPR_15_0,
                       G_15_0,
                       LAA_3_1,
                       LBA_2_0,
                       STS_15_0,
                       SW_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        AARG0;
   input        ALUCLK;
   input        ALUD2N;
   input [15:0] ARG_15_0;
   input [15:0] A_15_0;
   input [4:0]  CSIDBS_4_0;
   input [15:0] DBR_15_0;
   input [15:0] EA_15_0;
   input [15:0] FIDBI_15_0;
   input [15:0] F_15_0;
   input [15:0] GPR_15_0;
   input [2:0]  LAA_3_1;
   input [2:0]  LBA_2_0;
   input [15:0] STS_15_0;
   input [15:0] SW_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] D_15_0;
   output [15:0] G_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0]  s_logisimBus0;
   wire [7:0]  s_logisimBus1;
   wire [7:0]  s_logisimBus10;
   wire [7:0]  s_logisimBus11;
   wire [7:0]  s_logisimBus12;
   wire [7:0]  s_logisimBus13;
   wire [15:0] s_logisimBus14;
   wire [7:0]  s_logisimBus15;
   wire [15:0] s_logisimBus164;
   wire [15:0] s_logisimBus165;
   wire [15:0] s_logisimBus17;
   wire [15:0] s_logisimBus18;
   wire [7:0]  s_logisimBus19;
   wire [15:0] s_logisimBus2;
   wire [15:0] s_logisimBus20;
   wire [7:0]  s_logisimBus214;
   wire [7:0]  s_logisimBus216;
   wire [7:0]  s_logisimBus218;
   wire [2:0]  s_logisimBus22;
   wire [7:0]  s_logisimBus220;
   wire [6:0]  s_logisimBus222;
   wire [7:0]  s_logisimBus224;
   wire [7:0]  s_logisimBus226;
   wire [7:0]  s_logisimBus228;
   wire [7:0]  s_logisimBus23;
   wire [7:0]  s_logisimBus230;
   wire [7:0]  s_logisimBus232;
   wire [7:0]  s_logisimBus234;
   wire [7:0]  s_logisimBus236;
   wire [7:0]  s_logisimBus238;
   wire [7:0]  s_logisimBus24;
   wire [7:0]  s_logisimBus240;
   wire [7:0]  s_logisimBus242;
   wire [15:0] s_logisimBus25;
   wire [15:0] s_logisimBus27;
   wire [7:0]  s_logisimBus28;
   wire [2:0]  s_logisimBus29;
   wire [15:0] s_logisimBus3;
   wire [7:0]  s_logisimBus30;
   wire [15:0] s_logisimBus31;
   wire [4:0]  s_logisimBus4;
   wire [7:0]  s_logisimBus5;
   wire [7:0]  s_logisimBus6;
   wire [6:0]  s_logisimBus7;
   wire [7:0]  s_logisimBus8;
   wire [7:0]  s_logisimBus9;
   wire        s_logisimNet100;
   wire        s_logisimNet101;
   wire        s_logisimNet102;
   wire        s_logisimNet103;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet116;
   wire        s_logisimNet117;
   wire        s_logisimNet118;
   wire        s_logisimNet119;
   wire        s_logisimNet120;
   wire        s_logisimNet121;
   wire        s_logisimNet122;
   wire        s_logisimNet123;
   wire        s_logisimNet124;
   wire        s_logisimNet125;
   wire        s_logisimNet126;
   wire        s_logisimNet127;
   wire        s_logisimNet128;
   wire        s_logisimNet129;
   wire        s_logisimNet130;
   wire        s_logisimNet131;
   wire        s_logisimNet132;
   wire        s_logisimNet133;
   wire        s_logisimNet134;
   wire        s_logisimNet135;
   wire        s_logisimNet136;
   wire        s_logisimNet137;
   wire        s_logisimNet138;
   wire        s_logisimNet139;
   wire        s_logisimNet140;
   wire        s_logisimNet141;
   wire        s_logisimNet142;
   wire        s_logisimNet143;
   wire        s_logisimNet144;
   wire        s_logisimNet145;
   wire        s_logisimNet146;
   wire        s_logisimNet147;
   wire        s_logisimNet148;
   wire        s_logisimNet149;
   wire        s_logisimNet150;
   wire        s_logisimNet151;
   wire        s_logisimNet152;
   wire        s_logisimNet153;
   wire        s_logisimNet154;
   wire        s_logisimNet155;
   wire        s_logisimNet156;
   wire        s_logisimNet157;
   wire        s_logisimNet158;
   wire        s_logisimNet159;
   wire        s_logisimNet16;
   wire        s_logisimNet160;
   wire        s_logisimNet161;
   wire        s_logisimNet162;
   wire        s_logisimNet163;
   wire        s_logisimNet166;
   wire        s_logisimNet167;
   wire        s_logisimNet168;
   wire        s_logisimNet169;
   wire        s_logisimNet170;
   wire        s_logisimNet171;
   wire        s_logisimNet172;
   wire        s_logisimNet173;
   wire        s_logisimNet174;
   wire        s_logisimNet175;
   wire        s_logisimNet176;
   wire        s_logisimNet177;
   wire        s_logisimNet178;
   wire        s_logisimNet179;
   wire        s_logisimNet180;
   wire        s_logisimNet181;
   wire        s_logisimNet182;
   wire        s_logisimNet183;
   wire        s_logisimNet184;
   wire        s_logisimNet185;
   wire        s_logisimNet186;
   wire        s_logisimNet187;
   wire        s_logisimNet188;
   wire        s_logisimNet189;
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
   wire        s_logisimNet200;
   wire        s_logisimNet201;
   wire        s_logisimNet202;
   wire        s_logisimNet203;
   wire        s_logisimNet204;
   wire        s_logisimNet205;
   wire        s_logisimNet206;
   wire        s_logisimNet207;
   wire        s_logisimNet208;
   wire        s_logisimNet209;
   wire        s_logisimNet21;
   wire        s_logisimNet210;
   wire        s_logisimNet211;
   wire        s_logisimNet212;
   wire        s_logisimNet213;
   wire        s_logisimNet215;
   wire        s_logisimNet217;
   wire        s_logisimNet219;
   wire        s_logisimNet221;
   wire        s_logisimNet223;
   wire        s_logisimNet225;
   wire        s_logisimNet227;
   wire        s_logisimNet229;
   wire        s_logisimNet231;
   wire        s_logisimNet233;
   wire        s_logisimNet235;
   wire        s_logisimNet237;
   wire        s_logisimNet239;
   wire        s_logisimNet241;
   wire        s_logisimNet243;
   wire        s_logisimNet244;
   wire        s_logisimNet26;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
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
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_logisimNet89;
   wire        s_logisimNet90;
   wire        s_logisimNet91;
   wire        s_logisimNet92;
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
   assign s_logisimBus0[0]   = s_logisimNet41;
   assign s_logisimBus0[1]   = s_logisimNet42;
   assign s_logisimBus0[2]   = s_logisimNet43;
   assign s_logisimBus0[3]   = s_logisimNet44;
   assign s_logisimBus0[4]   = s_logisimNet45;
   assign s_logisimBus0[5]   = s_logisimNet46;
   assign s_logisimBus0[6]   = s_logisimNet47;
   assign s_logisimBus0[7]   = s_logisimNet48;
   assign s_logisimBus10[0]  = s_logisimNet87;
   assign s_logisimBus10[1]  = s_logisimNet88;
   assign s_logisimBus10[2]  = s_logisimNet89;
   assign s_logisimBus10[3]  = s_logisimNet90;
   assign s_logisimBus10[4]  = s_logisimNet91;
   assign s_logisimBus10[5]  = s_logisimNet92;
   assign s_logisimBus10[6]  = s_logisimNet93;
   assign s_logisimBus10[7]  = s_logisimNet94;
   assign s_logisimBus11[0]  = s_logisimNet156;
   assign s_logisimBus11[1]  = s_logisimNet157;
   assign s_logisimBus11[2]  = s_logisimNet158;
   assign s_logisimBus11[3]  = s_logisimNet159;
   assign s_logisimBus11[4]  = s_logisimNet160;
   assign s_logisimBus11[5]  = s_logisimNet161;
   assign s_logisimBus11[6]  = s_logisimNet162;
   assign s_logisimBus11[7]  = s_logisimNet163;
   assign s_logisimBus12[0]  = s_logisimNet116;
   assign s_logisimBus12[1]  = s_logisimNet117;
   assign s_logisimBus12[2]  = s_logisimNet118;
   assign s_logisimBus12[3]  = s_logisimNet119;
   assign s_logisimBus12[4]  = s_logisimNet120;
   assign s_logisimBus12[5]  = s_logisimNet121;
   assign s_logisimBus12[6]  = s_logisimNet122;
   assign s_logisimBus12[7]  = s_logisimNet151;
   assign s_logisimBus13[0]  = s_logisimNet130;
   assign s_logisimBus13[1]  = s_logisimNet131;
   assign s_logisimBus13[2]  = s_logisimNet132;
   assign s_logisimBus13[3]  = s_logisimNet133;
   assign s_logisimBus13[4]  = s_logisimNet134;
   assign s_logisimBus13[5]  = s_logisimNet135;
   assign s_logisimBus13[6]  = s_logisimNet136;
   assign s_logisimBus13[7]  = s_logisimNet151;
   assign s_logisimBus15[0]  = s_logisimNet102;
   assign s_logisimBus15[1]  = s_logisimNet103;
   assign s_logisimBus15[2]  = s_logisimNet104;
   assign s_logisimBus15[3]  = s_logisimNet105;
   assign s_logisimBus15[4]  = s_logisimNet106;
   assign s_logisimBus15[5]  = s_logisimNet107;
   assign s_logisimBus15[6]  = s_logisimNet108;
   assign s_logisimBus15[7]  = s_logisimNet151;
   assign s_logisimBus19[0]  = s_logisimNet123;
   assign s_logisimBus19[1]  = s_logisimNet124;
   assign s_logisimBus19[2]  = s_logisimNet125;
   assign s_logisimBus19[3]  = s_logisimNet126;
   assign s_logisimBus19[4]  = s_logisimNet127;
   assign s_logisimBus19[5]  = s_logisimNet128;
   assign s_logisimBus19[6]  = s_logisimNet129;
   assign s_logisimBus19[7]  = s_logisimNet151;
   assign s_logisimBus1[0]   = s_logisimNet57;
   assign s_logisimBus1[1]   = s_logisimNet58;
   assign s_logisimBus1[2]   = s_logisimNet59;
   assign s_logisimBus1[3]   = s_logisimNet60;
   assign s_logisimBus1[4]   = s_logisimNet61;
   assign s_logisimBus1[5]   = s_logisimNet62;
   assign s_logisimBus1[6]   = s_logisimNet63;
   assign s_logisimBus1[7]   = s_logisimNet64;
   assign s_logisimBus214[0] = s_logisimNet156;
   assign s_logisimBus214[1] = s_logisimNet157;
   assign s_logisimBus214[2] = s_logisimNet158;
   assign s_logisimBus214[3] = s_logisimNet159;
   assign s_logisimBus214[4] = s_logisimNet160;
   assign s_logisimBus214[5] = s_logisimNet161;
   assign s_logisimBus214[6] = s_logisimNet154;
   assign s_logisimBus216[0] = s_logisimNet156;
   assign s_logisimBus216[1] = s_logisimNet157;
   assign s_logisimBus216[2] = s_logisimNet158;
   assign s_logisimBus216[3] = s_logisimNet159;
   assign s_logisimBus216[4] = s_logisimNet160;
   assign s_logisimBus216[5] = s_logisimNet161;
   assign s_logisimBus216[6] = s_logisimNet154;
   assign s_logisimBus216[7] = s_logisimNet153;
   assign s_logisimBus218[0] = s_logisimNet156;
   assign s_logisimBus218[1] = s_logisimNet157;
   assign s_logisimBus218[2] = s_logisimNet158;
   assign s_logisimBus218[3] = s_logisimNet159;
   assign s_logisimBus218[4] = s_logisimNet160;
   assign s_logisimBus218[5] = s_logisimNet161;
   assign s_logisimBus218[6] = s_logisimNet154;
   assign s_logisimBus218[7] = s_logisimNet153;
   assign s_logisimBus220[0] = s_logisimNet156;
   assign s_logisimBus220[1] = s_logisimNet157;
   assign s_logisimBus220[2] = s_logisimNet158;
   assign s_logisimBus220[3] = s_logisimNet159;
   assign s_logisimBus220[4] = s_logisimNet160;
   assign s_logisimBus220[5] = s_logisimNet161;
   assign s_logisimBus220[6] = s_logisimNet154;
   assign s_logisimBus220[7] = s_logisimNet153;
   assign s_logisimBus222[0] = s_logisimNet156;
   assign s_logisimBus222[1] = s_logisimNet157;
   assign s_logisimBus222[2] = s_logisimNet158;
   assign s_logisimBus222[3] = s_logisimNet159;
   assign s_logisimBus222[4] = s_logisimNet160;
   assign s_logisimBus222[5] = s_logisimNet161;
   assign s_logisimBus222[6] = s_logisimNet154;
   assign s_logisimBus224[0] = s_logisimNet156;
   assign s_logisimBus224[1] = s_logisimNet157;
   assign s_logisimBus224[2] = s_logisimNet158;
   assign s_logisimBus224[3] = s_logisimNet159;
   assign s_logisimBus224[4] = s_logisimNet160;
   assign s_logisimBus224[5] = s_logisimNet161;
   assign s_logisimBus224[6] = s_logisimNet154;
   assign s_logisimBus224[7] = s_logisimNet155;
   assign s_logisimBus226[0] = s_logisimNet156;
   assign s_logisimBus226[1] = s_logisimNet157;
   assign s_logisimBus226[2] = s_logisimNet158;
   assign s_logisimBus226[3] = s_logisimNet159;
   assign s_logisimBus226[4] = s_logisimNet160;
   assign s_logisimBus226[5] = s_logisimNet161;
   assign s_logisimBus226[6] = s_logisimNet154;
   assign s_logisimBus226[7] = s_logisimNet155;
   assign s_logisimBus228[0] = s_logisimNet156;
   assign s_logisimBus228[1] = s_logisimNet157;
   assign s_logisimBus228[2] = s_logisimNet158;
   assign s_logisimBus228[3] = s_logisimNet159;
   assign s_logisimBus228[4] = s_logisimNet160;
   assign s_logisimBus228[5] = s_logisimNet161;
   assign s_logisimBus228[6] = s_logisimNet154;
   assign s_logisimBus228[7] = s_logisimNet155;
   assign s_logisimBus230[0] = s_logisimNet156;
   assign s_logisimBus230[1] = s_logisimNet157;
   assign s_logisimBus230[2] = s_logisimNet158;
   assign s_logisimBus230[3] = s_logisimNet159;
   assign s_logisimBus230[4] = s_logisimNet160;
   assign s_logisimBus230[5] = s_logisimNet161;
   assign s_logisimBus230[6] = s_logisimNet162;
   assign s_logisimBus230[7] = s_logisimNet163;
   assign s_logisimBus232[0] = s_logisimNet156;
   assign s_logisimBus232[1] = s_logisimNet157;
   assign s_logisimBus232[2] = s_logisimNet158;
   assign s_logisimBus232[3] = s_logisimNet159;
   assign s_logisimBus232[4] = s_logisimNet160;
   assign s_logisimBus232[5] = s_logisimNet161;
   assign s_logisimBus232[6] = s_logisimNet162;
   assign s_logisimBus232[7] = s_logisimNet163;
   assign s_logisimBus234[0] = s_logisimNet156;
   assign s_logisimBus234[1] = s_logisimNet157;
   assign s_logisimBus234[2] = s_logisimNet158;
   assign s_logisimBus234[3] = s_logisimNet159;
   assign s_logisimBus234[4] = s_logisimNet160;
   assign s_logisimBus234[5] = s_logisimNet161;
   assign s_logisimBus234[6] = s_logisimNet162;
   assign s_logisimBus234[7] = s_logisimNet163;
   assign s_logisimBus236[0] = s_logisimNet156;
   assign s_logisimBus236[1] = s_logisimNet157;
   assign s_logisimBus236[2] = s_logisimNet158;
   assign s_logisimBus236[3] = s_logisimNet159;
   assign s_logisimBus236[4] = s_logisimNet160;
   assign s_logisimBus236[5] = s_logisimNet161;
   assign s_logisimBus236[6] = s_logisimNet162;
   assign s_logisimBus236[7] = s_logisimNet163;
   assign s_logisimBus238[0] = s_logisimNet156;
   assign s_logisimBus238[1] = s_logisimNet157;
   assign s_logisimBus238[2] = s_logisimNet158;
   assign s_logisimBus238[3] = s_logisimNet159;
   assign s_logisimBus238[4] = s_logisimNet160;
   assign s_logisimBus238[5] = s_logisimNet161;
   assign s_logisimBus238[6] = s_logisimNet162;
   assign s_logisimBus238[7] = s_logisimNet163;
   assign s_logisimBus23[0]  = s_logisimNet144;
   assign s_logisimBus23[1]  = s_logisimNet145;
   assign s_logisimBus23[2]  = s_logisimNet146;
   assign s_logisimBus23[3]  = s_logisimNet147;
   assign s_logisimBus23[4]  = s_logisimNet148;
   assign s_logisimBus23[5]  = s_logisimNet149;
   assign s_logisimBus23[6]  = s_logisimNet150;
   assign s_logisimBus23[7]  = s_logisimNet151;
   assign s_logisimBus240[0] = s_logisimNet156;
   assign s_logisimBus240[1] = s_logisimNet157;
   assign s_logisimBus240[2] = s_logisimNet158;
   assign s_logisimBus240[3] = s_logisimNet159;
   assign s_logisimBus240[4] = s_logisimNet160;
   assign s_logisimBus240[5] = s_logisimNet161;
   assign s_logisimBus240[6] = s_logisimNet162;
   assign s_logisimBus240[7] = s_logisimNet163;
   assign s_logisimBus242[0] = s_logisimNet156;
   assign s_logisimBus242[1] = s_logisimNet157;
   assign s_logisimBus242[2] = s_logisimNet158;
   assign s_logisimBus242[3] = s_logisimNet159;
   assign s_logisimBus242[4] = s_logisimNet160;
   assign s_logisimBus242[5] = s_logisimNet161;
   assign s_logisimBus242[6] = s_logisimNet162;
   assign s_logisimBus242[7] = s_logisimNet163;
   assign s_logisimBus24[0]  = s_logisimNet79;
   assign s_logisimBus24[1]  = s_logisimNet80;
   assign s_logisimBus24[2]  = s_logisimNet81;
   assign s_logisimBus24[3]  = s_logisimNet82;
   assign s_logisimBus24[4]  = s_logisimNet83;
   assign s_logisimBus24[5]  = s_logisimNet84;
   assign s_logisimBus24[6]  = s_logisimNet85;
   assign s_logisimBus24[7]  = s_logisimNet86;
   assign s_logisimBus28[0]  = s_logisimNet71;
   assign s_logisimBus28[1]  = s_logisimNet72;
   assign s_logisimBus28[2]  = s_logisimNet73;
   assign s_logisimBus28[3]  = s_logisimNet74;
   assign s_logisimBus28[4]  = s_logisimNet75;
   assign s_logisimBus28[5]  = s_logisimNet76;
   assign s_logisimBus28[6]  = s_logisimNet77;
   assign s_logisimBus28[7]  = s_logisimNet78;
   assign s_logisimBus30[0]  = s_logisimNet49;
   assign s_logisimBus30[1]  = s_logisimNet50;
   assign s_logisimBus30[2]  = s_logisimNet51;
   assign s_logisimBus30[3]  = s_logisimNet52;
   assign s_logisimBus30[4]  = s_logisimNet53;
   assign s_logisimBus30[5]  = s_logisimNet54;
   assign s_logisimBus30[6]  = s_logisimNet55;
   assign s_logisimBus30[7]  = s_logisimNet56;
   assign s_logisimBus5[0]   = s_logisimNet109;
   assign s_logisimBus5[1]   = s_logisimNet110;
   assign s_logisimBus5[2]   = s_logisimNet111;
   assign s_logisimBus5[3]   = s_logisimNet112;
   assign s_logisimBus5[4]   = s_logisimNet113;
   assign s_logisimBus5[5]   = s_logisimNet114;
   assign s_logisimBus5[6]   = s_logisimNet115;
   assign s_logisimBus5[7]   = s_logisimNet151;
   assign s_logisimBus6[0]   = s_logisimNet95;
   assign s_logisimBus6[1]   = s_logisimNet96;
   assign s_logisimBus6[2]   = s_logisimNet97;
   assign s_logisimBus6[3]   = s_logisimNet98;
   assign s_logisimBus6[4]   = s_logisimNet99;
   assign s_logisimBus6[5]   = s_logisimNet100;
   assign s_logisimBus6[6]   = s_logisimNet101;
   assign s_logisimBus6[7]   = s_logisimNet151;
   assign s_logisimBus7[0]   = s_logisimNet65;
   assign s_logisimBus7[1]   = s_logisimNet66;
   assign s_logisimBus7[2]   = s_logisimNet67;
   assign s_logisimBus7[3]   = s_logisimNet68;
   assign s_logisimBus7[4]   = s_logisimNet69;
   assign s_logisimBus7[5]   = s_logisimNet70;
   assign s_logisimBus7[6]   = s_logisimNet151;
   assign s_logisimBus8[0]   = s_logisimNet137;
   assign s_logisimBus8[1]   = s_logisimNet138;
   assign s_logisimBus8[2]   = s_logisimNet139;
   assign s_logisimBus8[3]   = s_logisimNet140;
   assign s_logisimBus8[4]   = s_logisimNet141;
   assign s_logisimBus8[5]   = s_logisimNet142;
   assign s_logisimBus8[6]   = s_logisimNet143;
   assign s_logisimBus8[7]   = s_logisimNet151;
   assign s_logisimBus9[0]   = s_logisimNet33;
   assign s_logisimBus9[1]   = s_logisimNet34;
   assign s_logisimBus9[2]   = s_logisimNet35;
   assign s_logisimBus9[3]   = s_logisimNet36;
   assign s_logisimBus9[4]   = s_logisimNet37;
   assign s_logisimBus9[5]   = s_logisimNet38;
   assign s_logisimBus9[6]   = s_logisimNet39;
   assign s_logisimNet100    = s_logisimBus31[14];
   assign s_logisimNet101    = s_logisimBus14[14];
   assign s_logisimNet102    = s_logisimBus17[13];
   assign s_logisimNet103    = s_logisimBus18[13];
   assign s_logisimNet104    = s_logisimBus20[13];
   assign s_logisimNet105    = s_logisimBus2[13];
   assign s_logisimNet106    = s_logisimBus25[13];
   assign s_logisimNet107    = s_logisimBus31[13];
   assign s_logisimNet108    = s_logisimBus14[13];
   assign s_logisimNet109    = s_logisimBus17[12];
   assign s_logisimNet110    = s_logisimBus18[12];
   assign s_logisimNet111    = s_logisimBus20[12];
   assign s_logisimNet112    = s_logisimBus2[12];
   assign s_logisimNet113    = s_logisimBus25[12];
   assign s_logisimNet114    = s_logisimBus31[12];
   assign s_logisimNet115    = s_logisimBus14[12];
   assign s_logisimNet116    = s_logisimBus17[11];
   assign s_logisimNet117    = s_logisimBus18[11];
   assign s_logisimNet118    = s_logisimBus20[11];
   assign s_logisimNet119    = s_logisimBus2[11];
   assign s_logisimNet120    = s_logisimBus25[11];
   assign s_logisimNet121    = s_logisimBus31[11];
   assign s_logisimNet122    = s_logisimBus14[11];
   assign s_logisimNet123    = s_logisimBus17[10];
   assign s_logisimNet124    = s_logisimBus18[10];
   assign s_logisimNet125    = s_logisimBus20[10];
   assign s_logisimNet126    = s_logisimBus2[10];
   assign s_logisimNet127    = s_logisimBus25[10];
   assign s_logisimNet128    = s_logisimBus31[10];
   assign s_logisimNet129    = s_logisimBus14[10];
   assign s_logisimNet130    = s_logisimBus17[9];
   assign s_logisimNet131    = s_logisimBus18[9];
   assign s_logisimNet132    = s_logisimBus20[9];
   assign s_logisimNet133    = s_logisimBus2[9];
   assign s_logisimNet134    = s_logisimBus25[9];
   assign s_logisimNet135    = s_logisimBus31[9];
   assign s_logisimNet136    = s_logisimBus14[9];
   assign s_logisimNet137    = s_logisimBus17[8];
   assign s_logisimNet138    = s_logisimBus18[8];
   assign s_logisimNet139    = s_logisimBus20[8];
   assign s_logisimNet140    = s_logisimBus2[8];
   assign s_logisimNet141    = s_logisimBus25[8];
   assign s_logisimNet142    = s_logisimBus31[8];
   assign s_logisimNet143    = s_logisimBus14[8];
   assign s_logisimNet144    = s_logisimBus17[15];
   assign s_logisimNet145    = s_logisimBus18[15];
   assign s_logisimNet146    = s_logisimBus20[15];
   assign s_logisimNet147    = s_logisimBus2[15];
   assign s_logisimNet148    = s_logisimBus25[15];
   assign s_logisimNet149    = s_logisimBus31[15];
   assign s_logisimNet150    = s_logisimBus14[15];
   assign s_logisimNet151    = s_logisimBus14[7];
   assign s_logisimNet33     = s_logisimBus17[3];
   assign s_logisimNet34     = s_logisimBus18[3];
   assign s_logisimNet35     = s_logisimBus20[3];
   assign s_logisimNet36     = s_logisimBus2[3];
   assign s_logisimNet37     = s_logisimBus25[3];
   assign s_logisimNet38     = s_logisimBus31[3];
   assign s_logisimNet39     = s_logisimBus14[3];
   assign s_logisimNet41     = s_logisimBus17[2];
   assign s_logisimNet42     = s_logisimBus18[2];
   assign s_logisimNet43     = s_logisimBus20[2];
   assign s_logisimNet44     = s_logisimBus2[2];
   assign s_logisimNet45     = s_logisimBus25[2];
   assign s_logisimNet46     = s_logisimBus31[2];
   assign s_logisimNet47     = s_logisimBus14[2];
   assign s_logisimNet48     = s_logisimBus22[2];
   assign s_logisimNet49     = s_logisimBus17[1];
   assign s_logisimNet50     = s_logisimBus18[1];
   assign s_logisimNet51     = s_logisimBus20[1];
   assign s_logisimNet52     = s_logisimBus2[1];
   assign s_logisimNet53     = s_logisimBus25[1];
   assign s_logisimNet54     = s_logisimBus31[1];
   assign s_logisimNet55     = s_logisimBus14[1];
   assign s_logisimNet56     = s_logisimBus22[1];
   assign s_logisimNet57     = s_logisimBus17[0];
   assign s_logisimNet58     = s_logisimBus18[0];
   assign s_logisimNet59     = s_logisimBus20[0];
   assign s_logisimNet60     = s_logisimBus2[0];
   assign s_logisimNet61     = s_logisimBus25[0];
   assign s_logisimNet62     = s_logisimBus31[0];
   assign s_logisimNet63     = s_logisimBus14[0];
   assign s_logisimNet64     = s_logisimBus22[0];
   assign s_logisimNet65     = s_logisimBus17[7];
   assign s_logisimNet66     = s_logisimBus18[7];
   assign s_logisimNet67     = s_logisimBus20[7];
   assign s_logisimNet68     = s_logisimBus2[7];
   assign s_logisimNet69     = s_logisimBus25[7];
   assign s_logisimNet70     = s_logisimBus31[7];
   assign s_logisimNet71     = s_logisimBus17[6];
   assign s_logisimNet72     = s_logisimBus18[6];
   assign s_logisimNet73     = s_logisimBus20[6];
   assign s_logisimNet74     = s_logisimBus2[6];
   assign s_logisimNet75     = s_logisimBus25[6];
   assign s_logisimNet76     = s_logisimBus31[6];
   assign s_logisimNet77     = s_logisimBus14[6];
   assign s_logisimNet78     = s_logisimBus29[2];
   assign s_logisimNet79     = s_logisimBus17[5];
   assign s_logisimNet80     = s_logisimBus18[5];
   assign s_logisimNet81     = s_logisimBus20[5];
   assign s_logisimNet82     = s_logisimBus2[5];
   assign s_logisimNet83     = s_logisimBus25[5];
   assign s_logisimNet84     = s_logisimBus31[5];
   assign s_logisimNet85     = s_logisimBus14[5];
   assign s_logisimNet86     = s_logisimBus29[1];
   assign s_logisimNet87     = s_logisimBus17[4];
   assign s_logisimNet88     = s_logisimBus18[4];
   assign s_logisimNet89     = s_logisimBus20[4];
   assign s_logisimNet90     = s_logisimBus2[4];
   assign s_logisimNet91     = s_logisimBus25[4];
   assign s_logisimNet92     = s_logisimBus31[4];
   assign s_logisimNet93     = s_logisimBus14[4];
   assign s_logisimNet94     = s_logisimBus29[0];
   assign s_logisimNet95     = s_logisimBus17[14];
   assign s_logisimNet96     = s_logisimBus18[14];
   assign s_logisimNet97     = s_logisimBus20[14];
   assign s_logisimNet98     = s_logisimBus2[14];
   assign s_logisimNet99     = s_logisimBus25[14];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus14[15:0]  = GPR_15_0;
   assign s_logisimBus164[15:0] = F_15_0;
   assign s_logisimBus165[15:0] = A_15_0;
   assign s_logisimBus17[15:0]  = EA_15_0;
   assign s_logisimBus18[15:0]  = DBR_15_0;
   assign s_logisimBus20[15:0]  = ARG_15_0;
   assign s_logisimBus22[2:0]   = LBA_2_0;
   assign s_logisimBus25[15:0]  = SW_15_0;
   assign s_logisimBus29[2:0]   = LAA_3_1;
   assign s_logisimBus2[15:0]   = STS_15_0;
   assign s_logisimBus31[15:0]  = FIDBI_15_0;
   assign s_logisimBus4[4:0]    = CSIDBS_4_0;
   assign s_logisimBus9[7]      = AARG0;
   assign s_logisimNet16        = ALUCLK;
   assign s_logisimNet26        = ALUD2N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign D_15_0 = s_logisimBus27[15:0];
   assign G_15_0 = s_logisimBus3[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX31LP   GMUX14 (.A(s_logisimNet21),
                     .B(s_logisimNet32),
                     .D0(s_logisimBus27[14]),
                     .D1(s_logisimBus165[14]),
                     .D2(s_logisimBus164[14]),
                     .ZN(s_logisimBus3[14]));

   MUX31LP   GMUX13 (.A(s_logisimNet21),
                     .B(s_logisimNet32),
                     .D0(s_logisimBus27[13]),
                     .D1(s_logisimBus165[13]),
                     .D2(s_logisimBus164[13]),
                     .ZN(s_logisimBus3[13]));

   MUX31LP   GMUX12 (.A(s_logisimNet21),
                     .B(s_logisimNet32),
                     .D0(s_logisimBus27[12]),
                     .D1(s_logisimBus165[12]),
                     .D2(s_logisimBus164[12]),
                     .ZN(s_logisimBus3[12]));

   MUX31LP   GMUX11 (.A(s_logisimNet21),
                     .B(s_logisimNet32),
                     .D0(s_logisimBus27[11]),
                     .D1(s_logisimBus165[11]),
                     .D2(s_logisimBus164[11]),
                     .ZN(s_logisimBus3[11]));

   MUX31LP   GMUX10 (.A(s_logisimNet21),
                     .B(s_logisimNet32),
                     .D0(s_logisimBus27[10]),
                     .D1(s_logisimBus165[10]),
                     .D2(s_logisimBus164[10]),
                     .ZN(s_logisimBus3[10]));

   MUX31LP   GMUX9 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[9]),
                    .D1(s_logisimBus165[9]),
                    .D2(s_logisimBus164[9]),
                    .ZN(s_logisimBus3[9]));

   MUX31LP   GMUX8 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[8]),
                    .D1(s_logisimBus165[8]),
                    .D2(s_logisimBus164[8]),
                    .ZN(s_logisimBus3[8]));

   MUX31LP   GMUX7 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[7]),
                    .D1(s_logisimBus165[7]),
                    .D2(s_logisimBus164[7]),
                    .ZN(s_logisimBus3[7]));

   MUX31LP   GMUX6 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[6]),
                    .D1(s_logisimBus165[6]),
                    .D2(s_logisimBus164[6]),
                    .ZN(s_logisimBus3[6]));

   MUX31LP   GMUX5 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[5]),
                    .D1(s_logisimBus165[5]),
                    .D2(s_logisimBus164[5]),
                    .ZN(s_logisimBus3[5]));

   MUX31LP   GMUX4 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[4]),
                    .D1(s_logisimBus165[4]),
                    .D2(s_logisimBus164[4]),
                    .ZN(s_logisimBus3[4]));

   MUX31LP   GMUX3 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[3]),
                    .D1(s_logisimBus165[3]),
                    .D2(s_logisimBus164[3]),
                    .ZN(s_logisimBus3[3]));

   MUX31LP   GMUX2 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[2]),
                    .D1(s_logisimBus165[2]),
                    .D2(s_logisimBus164[2]),
                    .ZN(s_logisimBus3[2]));

   MUX31LP   GMUX1 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[1]),
                    .D1(s_logisimBus165[1]),
                    .D2(s_logisimBus164[1]),
                    .ZN(s_logisimBus3[1]));

   MUX31LP   GMUX0 (.A(s_logisimNet21),
                    .B(s_logisimNet32),
                    .D0(s_logisimBus27[0]),
                    .D1(s_logisimBus165[0]),
                    .D2(s_logisimBus164[0]),
                    .ZN(s_logisimBus3[0]));

   MUX31LP   GMUX15 (.A(s_logisimNet21),
                     .B(s_logisimNet32),
                     .D0(s_logisimBus27[15]),
                     .D1(s_logisimBus165[15]),
                     .D2(s_logisimBus164[15]),
                     .ZN(s_logisimBus3[15]));

   CGA_ALU_OUTMUX_SEL8   DMUX3 (.D(s_logisimBus27[3]),
                                .E_7_0(s_logisimBus214[7:0]),
                                .SI_7_0(s_logisimBus9[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX2 (.D(s_logisimBus27[2]),
                                .E_7_0(s_logisimBus216[7:0]),
                                .SI_7_0(s_logisimBus0[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX1 (.D(s_logisimBus27[1]),
                                .E_7_0(s_logisimBus218[7:0]),
                                .SI_7_0(s_logisimBus30[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX0 (.D(s_logisimBus27[0]),
                                .E_7_0(s_logisimBus220[7:0]),
                                .SI_7_0(s_logisimBus1[7:0]));

   CGA_CPU_ALU_OUTMUX_SEL7   DMUX7 (.D(s_logisimBus27[7]),
                                    .E_6_0(s_logisimBus222[6:0]),
                                    .SI_6_0(s_logisimBus7[6:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX6 (.D(s_logisimBus27[6]),
                                .E_7_0(s_logisimBus224[7:0]),
                                .SI_7_0(s_logisimBus28[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX5 (.D(s_logisimBus27[5]),
                                .E_7_0(s_logisimBus226[7:0]),
                                .SI_7_0(s_logisimBus24[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX4 (.D(s_logisimBus27[4]),
                                .E_7_0(s_logisimBus228[7:0]),
                                .SI_7_0(s_logisimBus10[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX14 (.D(s_logisimBus27[14]),
                                 .E_7_0(s_logisimBus230[7:0]),
                                 .SI_7_0(s_logisimBus6[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX13 (.D(s_logisimBus27[13]),
                                 .E_7_0(s_logisimBus232[7:0]),
                                 .SI_7_0(s_logisimBus15[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX12 (.D(s_logisimBus27[12]),
                                 .E_7_0(s_logisimBus234[7:0]),
                                 .SI_7_0(s_logisimBus5[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX11 (.D(s_logisimBus27[11]),
                                 .E_7_0(s_logisimBus236[7:0]),
                                 .SI_7_0(s_logisimBus12[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX10 (.D(s_logisimBus27[10]),
                                 .E_7_0(s_logisimBus238[7:0]),
                                 .SI_7_0(s_logisimBus19[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX9 (.D(s_logisimBus27[9]),
                                .E_7_0(s_logisimBus240[7:0]),
                                .SI_7_0(s_logisimBus13[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX8 (.D(s_logisimBus27[8]),
                                .E_7_0(s_logisimBus242[7:0]),
                                .SI_7_0(s_logisimBus8[7:0]));

   CGA_ALU_OUTMUX_SEL8   DMUX15 (.D(s_logisimBus27[15]),
                                 .E_7_0(s_logisimBus11[7:0]),
                                 .SI_7_0(s_logisimBus23[7:0]));

   CGA_ALU_OUTMUX_IDBS   OUTMUX_IDBS (.ALUCLK(s_logisimNet16),
                                      .ALUD2N(s_logisimNet26),
                                      .CSIDBS_4_0(s_logisimBus4[4:0]),
                                      .EA(s_logisimNet21),
                                      .EAARG(s_logisimNet155),
                                      .EABARG(s_logisimBus214[7]),
                                      .EARG(s_logisimNet158),
                                      .EBARG(s_logisimNet153),
                                      .EBMG(s_logisimNet156),
                                      .EDBR(s_logisimNet157),
                                      .EF(s_logisimNet32),
                                      .EFIDB(s_logisimNet161),
                                      .EGPRH(s_logisimNet162),
                                      .EGPRL(s_logisimNet154),
                                      .EGPRS(s_logisimNet163),
                                      .ESTS(s_logisimNet159),
                                      .ESWAP(s_logisimNet160));

endmodule
