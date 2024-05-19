// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_WRF_RBLOCK                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_WRF_RBLOCK( ALUCLK,
                       ALUCLKN,
                       A_15_0,
                       BR_15_0,
                       B_15_0,
                       EA_15_0,
                       EB_15_0,
                       NLCA_15_0,
                       PR_15_0,
                       RB_15_0,
                       WR_15_0,
                       XFETCHN,
                       XR_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input        ALUCLKN;
   input [15:0] EA_15_0;
   input [15:0] EB_15_0;
   input [15:0] NLCA_15_0;
   input [15:0] RB_15_0;
   input [15:0] WR_15_0;
   input        XFETCHN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] A_15_0;
   output [15:0] BR_15_0;
   output [15:0] B_15_0;
   output [15:0] PR_15_0;
   output [15:0] XR_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus0;
   wire [15:0] s_logisimBus1;
   wire [15:0] s_logisimBus102;
   wire [15:0] s_logisimBus106;
   wire [15:0] s_logisimBus107;
   wire [15:0] s_logisimBus11;
   wire [15:0] s_logisimBus116;
   wire [15:0] s_logisimBus118;
   wire [15:0] s_logisimBus119;
   wire [15:0] s_logisimBus120;
   wire [15:0] s_logisimBus121;
   wire [15:0] s_logisimBus13;
   wire [15:0] s_logisimBus133;
   wire [15:0] s_logisimBus145;
   wire [15:0] s_logisimBus146;
   wire [15:0] s_logisimBus149;
   wire [15:0] s_logisimBus155;
   wire [15:0] s_logisimBus163;
   wire [15:0] s_logisimBus189;
   wire [15:0] s_logisimBus20;
   wire [15:0] s_logisimBus208;
   wire [15:0] s_logisimBus23;
   wire [15:0] s_logisimBus272;
   wire [15:0] s_logisimBus276;
   wire [15:0] s_logisimBus282;
   wire [15:0] s_logisimBus283;
   wire [15:0] s_logisimBus32;
   wire [15:0] s_logisimBus320;
   wire [15:0] s_logisimBus33;
   wire [15:0] s_logisimBus334;
   wire [15:0] s_logisimBus342;
   wire [15:0] s_logisimBus38;
   wire [15:0] s_logisimBus44;
   wire [15:0] s_logisimBus47;
   wire [15:0] s_logisimBus5;
   wire [15:0] s_logisimBus50;
   wire [15:0] s_logisimBus55;
   wire [15:0] s_logisimBus6;
   wire [15:0] s_logisimBus60;
   wire [15:0] s_logisimBus71;
   wire [15:0] s_logisimBus72;
   wire [15:0] s_logisimBus90;
   wire        s_logisimNet10;
   wire        s_logisimNet100;
   wire        s_logisimNet101;
   wire        s_logisimNet103;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet117;
   wire        s_logisimNet12;
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
   wire        s_logisimNet134;
   wire        s_logisimNet135;
   wire        s_logisimNet136;
   wire        s_logisimNet137;
   wire        s_logisimNet138;
   wire        s_logisimNet139;
   wire        s_logisimNet14;
   wire        s_logisimNet140;
   wire        s_logisimNet141;
   wire        s_logisimNet142;
   wire        s_logisimNet143;
   wire        s_logisimNet144;
   wire        s_logisimNet147;
   wire        s_logisimNet148;
   wire        s_logisimNet15;
   wire        s_logisimNet150;
   wire        s_logisimNet151;
   wire        s_logisimNet152;
   wire        s_logisimNet153;
   wire        s_logisimNet154;
   wire        s_logisimNet156;
   wire        s_logisimNet157;
   wire        s_logisimNet158;
   wire        s_logisimNet159;
   wire        s_logisimNet16;
   wire        s_logisimNet160;
   wire        s_logisimNet161;
   wire        s_logisimNet162;
   wire        s_logisimNet164;
   wire        s_logisimNet165;
   wire        s_logisimNet166;
   wire        s_logisimNet167;
   wire        s_logisimNet168;
   wire        s_logisimNet169;
   wire        s_logisimNet17;
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
   wire        s_logisimNet18;
   wire        s_logisimNet180;
   wire        s_logisimNet181;
   wire        s_logisimNet182;
   wire        s_logisimNet183;
   wire        s_logisimNet184;
   wire        s_logisimNet185;
   wire        s_logisimNet186;
   wire        s_logisimNet187;
   wire        s_logisimNet188;
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
   wire        s_logisimNet200;
   wire        s_logisimNet201;
   wire        s_logisimNet202;
   wire        s_logisimNet203;
   wire        s_logisimNet204;
   wire        s_logisimNet205;
   wire        s_logisimNet206;
   wire        s_logisimNet207;
   wire        s_logisimNet209;
   wire        s_logisimNet21;
   wire        s_logisimNet210;
   wire        s_logisimNet211;
   wire        s_logisimNet212;
   wire        s_logisimNet213;
   wire        s_logisimNet214;
   wire        s_logisimNet215;
   wire        s_logisimNet216;
   wire        s_logisimNet217;
   wire        s_logisimNet218;
   wire        s_logisimNet219;
   wire        s_logisimNet22;
   wire        s_logisimNet220;
   wire        s_logisimNet221;
   wire        s_logisimNet222;
   wire        s_logisimNet223;
   wire        s_logisimNet224;
   wire        s_logisimNet225;
   wire        s_logisimNet226;
   wire        s_logisimNet227;
   wire        s_logisimNet228;
   wire        s_logisimNet229;
   wire        s_logisimNet230;
   wire        s_logisimNet231;
   wire        s_logisimNet232;
   wire        s_logisimNet233;
   wire        s_logisimNet234;
   wire        s_logisimNet235;
   wire        s_logisimNet236;
   wire        s_logisimNet237;
   wire        s_logisimNet238;
   wire        s_logisimNet239;
   wire        s_logisimNet24;
   wire        s_logisimNet240;
   wire        s_logisimNet241;
   wire        s_logisimNet242;
   wire        s_logisimNet243;
   wire        s_logisimNet244;
   wire        s_logisimNet245;
   wire        s_logisimNet246;
   wire        s_logisimNet247;
   wire        s_logisimNet248;
   wire        s_logisimNet249;
   wire        s_logisimNet25;
   wire        s_logisimNet250;
   wire        s_logisimNet251;
   wire        s_logisimNet252;
   wire        s_logisimNet253;
   wire        s_logisimNet254;
   wire        s_logisimNet255;
   wire        s_logisimNet256;
   wire        s_logisimNet257;
   wire        s_logisimNet258;
   wire        s_logisimNet259;
   wire        s_logisimNet26;
   wire        s_logisimNet260;
   wire        s_logisimNet261;
   wire        s_logisimNet262;
   wire        s_logisimNet263;
   wire        s_logisimNet264;
   wire        s_logisimNet265;
   wire        s_logisimNet266;
   wire        s_logisimNet267;
   wire        s_logisimNet268;
   wire        s_logisimNet269;
   wire        s_logisimNet27;
   wire        s_logisimNet270;
   wire        s_logisimNet271;
   wire        s_logisimNet273;
   wire        s_logisimNet274;
   wire        s_logisimNet275;
   wire        s_logisimNet277;
   wire        s_logisimNet278;
   wire        s_logisimNet279;
   wire        s_logisimNet28;
   wire        s_logisimNet280;
   wire        s_logisimNet281;
   wire        s_logisimNet284;
   wire        s_logisimNet285;
   wire        s_logisimNet286;
   wire        s_logisimNet287;
   wire        s_logisimNet288;
   wire        s_logisimNet289;
   wire        s_logisimNet29;
   wire        s_logisimNet290;
   wire        s_logisimNet291;
   wire        s_logisimNet292;
   wire        s_logisimNet293;
   wire        s_logisimNet294;
   wire        s_logisimNet295;
   wire        s_logisimNet296;
   wire        s_logisimNet297;
   wire        s_logisimNet298;
   wire        s_logisimNet299;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet300;
   wire        s_logisimNet301;
   wire        s_logisimNet302;
   wire        s_logisimNet303;
   wire        s_logisimNet304;
   wire        s_logisimNet305;
   wire        s_logisimNet306;
   wire        s_logisimNet307;
   wire        s_logisimNet308;
   wire        s_logisimNet309;
   wire        s_logisimNet31;
   wire        s_logisimNet310;
   wire        s_logisimNet311;
   wire        s_logisimNet312;
   wire        s_logisimNet313;
   wire        s_logisimNet314;
   wire        s_logisimNet315;
   wire        s_logisimNet316;
   wire        s_logisimNet317;
   wire        s_logisimNet318;
   wire        s_logisimNet319;
   wire        s_logisimNet321;
   wire        s_logisimNet322;
   wire        s_logisimNet323;
   wire        s_logisimNet324;
   wire        s_logisimNet325;
   wire        s_logisimNet326;
   wire        s_logisimNet327;
   wire        s_logisimNet328;
   wire        s_logisimNet329;
   wire        s_logisimNet330;
   wire        s_logisimNet331;
   wire        s_logisimNet332;
   wire        s_logisimNet333;
   wire        s_logisimNet335;
   wire        s_logisimNet336;
   wire        s_logisimNet337;
   wire        s_logisimNet338;
   wire        s_logisimNet339;
   wire        s_logisimNet34;
   wire        s_logisimNet340;
   wire        s_logisimNet341;
   wire        s_logisimNet343;
   wire        s_logisimNet344;
   wire        s_logisimNet345;
   wire        s_logisimNet346;
   wire        s_logisimNet347;
   wire        s_logisimNet348;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
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
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_logisimNet89;
   wire        s_logisimNet9;
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
   assign s_logisimBus106[0]  = s_logisimNet93;
   assign s_logisimBus106[10] = s_logisimNet295;
   assign s_logisimBus106[11] = s_logisimNet203;
   assign s_logisimBus106[12] = s_logisimNet37;
   assign s_logisimBus106[13] = s_logisimNet231;
   assign s_logisimBus106[14] = s_logisimNet179;
   assign s_logisimBus106[15] = s_logisimNet281;
   assign s_logisimBus106[1]  = s_logisimNet329;
   assign s_logisimBus106[2]  = s_logisimNet180;
   assign s_logisimBus106[3]  = s_logisimNet160;
   assign s_logisimBus106[4]  = s_logisimNet224;
   assign s_logisimBus106[5]  = s_logisimNet286;
   assign s_logisimBus106[6]  = s_logisimNet196;
   assign s_logisimBus106[7]  = s_logisimNet78;
   assign s_logisimBus106[8]  = s_logisimNet161;
   assign s_logisimBus106[9]  = s_logisimNet212;
   assign s_logisimBus116[0]  = s_logisimNet27;
   assign s_logisimBus116[10] = s_logisimNet316;
   assign s_logisimBus116[11] = s_logisimNet103;
   assign s_logisimBus116[12] = s_logisimNet252;
   assign s_logisimBus116[13] = s_logisimNet123;
   assign s_logisimBus116[14] = s_logisimNet187;
   assign s_logisimBus116[15] = s_logisimNet298;
   assign s_logisimBus116[1]  = s_logisimNet195;
   assign s_logisimBus116[2]  = s_logisimNet84;
   assign s_logisimBus116[3]  = s_logisimNet172;
   assign s_logisimBus116[4]  = s_logisimNet242;
   assign s_logisimBus116[5]  = s_logisimNet164;
   assign s_logisimBus116[6]  = s_logisimNet95;
   assign s_logisimBus116[7]  = s_logisimNet73;
   assign s_logisimBus116[8]  = s_logisimNet131;
   assign s_logisimBus116[9]  = s_logisimNet225;
   assign s_logisimBus11[0]   = s_logisimNet153;
   assign s_logisimBus11[10]  = s_logisimNet165;
   assign s_logisimBus11[11]  = s_logisimNet256;
   assign s_logisimBus11[12]  = s_logisimNet273;
   assign s_logisimBus11[13]  = s_logisimNet289;
   assign s_logisimBus11[14]  = s_logisimNet218;
   assign s_logisimBus11[15]  = s_logisimNet100;
   assign s_logisimBus11[1]   = s_logisimNet265;
   assign s_logisimBus11[2]   = s_logisimNet220;
   assign s_logisimBus11[3]   = s_logisimNet184;
   assign s_logisimBus11[4]   = s_logisimNet199;
   assign s_logisimBus11[5]   = s_logisimNet347;
   assign s_logisimBus11[6]   = s_logisimNet238;
   assign s_logisimBus11[7]   = s_logisimNet340;
   assign s_logisimBus11[8]   = s_logisimNet206;
   assign s_logisimBus11[9]   = s_logisimNet152;
   assign s_logisimBus133[0]  = s_logisimNet75;
   assign s_logisimBus133[10] = s_logisimNet337;
   assign s_logisimBus133[11] = s_logisimNet198;
   assign s_logisimBus133[12] = s_logisimNet57;
   assign s_logisimBus133[13] = s_logisimNet217;
   assign s_logisimBus133[14] = s_logisimNet201;
   assign s_logisimBus133[15] = s_logisimNet323;
   assign s_logisimBus133[1]  = s_logisimNet311;
   assign s_logisimBus133[2]  = s_logisimNet167;
   assign s_logisimBus133[3]  = s_logisimNet191;
   assign s_logisimBus133[4]  = s_logisimNet261;
   assign s_logisimBus133[5]  = s_logisimNet271;
   assign s_logisimBus133[6]  = s_logisimNet183;
   assign s_logisimBus133[7]  = s_logisimNet89;
   assign s_logisimBus133[8]  = s_logisimNet151;
   assign s_logisimBus133[9]  = s_logisimNet247;
   assign s_logisimBus13[0]   = s_logisimNet326;
   assign s_logisimBus13[10]  = s_logisimNet115;
   assign s_logisimBus13[11]  = s_logisimNet210;
   assign s_logisimBus13[12]  = s_logisimNet292;
   assign s_logisimBus13[13]  = s_logisimNet45;
   assign s_logisimBus13[14]  = s_logisimNet36;
   assign s_logisimBus13[15]  = s_logisimNet138;
   assign s_logisimBus13[1]   = s_logisimNet277;
   assign s_logisimBus13[2]   = s_logisimNet21;
   assign s_logisimBus13[3]   = s_logisimNet31;
   assign s_logisimBus13[4]   = s_logisimNet68;
   assign s_logisimBus13[5]   = s_logisimNet159;
   assign s_logisimBus13[6]   = s_logisimNet221;
   assign s_logisimBus13[7]   = s_logisimNet305;
   assign s_logisimBus13[8]   = s_logisimNet18;
   assign s_logisimBus13[9]   = s_logisimNet62;
   assign s_logisimBus145[0]  = s_logisimNet192;
   assign s_logisimBus145[10] = s_logisimNet230;
   assign s_logisimBus145[11] = s_logisimNet344;
   assign s_logisimBus145[12] = s_logisimNet64;
   assign s_logisimBus145[13] = s_logisimNet148;
   assign s_logisimBus145[14] = s_logisimNet306;
   assign s_logisimBus145[15] = s_logisimNet343;
   assign s_logisimBus145[1]  = s_logisimNet59;
   assign s_logisimBus145[2]  = s_logisimNet307;
   assign s_logisimBus145[3]  = s_logisimNet255;
   assign s_logisimBus145[4]  = s_logisimNet284;
   assign s_logisimBus145[5]  = s_logisimNet16;
   assign s_logisimBus145[6]  = s_logisimNet330;
   assign s_logisimBus145[7]  = s_logisimNet178;
   assign s_logisimBus145[8]  = s_logisimNet287;
   assign s_logisimBus145[9]  = s_logisimNet267;
   assign s_logisimBus155[0]  = s_logisimNet301;
   assign s_logisimBus155[10] = s_logisimNet4;
   assign s_logisimBus155[11] = s_logisimNet29;
   assign s_logisimBus155[12] = s_logisimNet126;
   assign s_logisimBus155[13] = s_logisimNet158;
   assign s_logisimBus155[14] = s_logisimNet229;
   assign s_logisimBus155[15] = s_logisimNet127;
   assign s_logisimBus155[1]  = s_logisimNet80;
   assign s_logisimBus155[2]  = s_logisimNet122;
   assign s_logisimBus155[3]  = s_logisimNet209;
   assign s_logisimBus155[4]  = s_logisimNet302;
   assign s_logisimBus155[5]  = s_logisimNet61;
   assign s_logisimBus155[6]  = s_logisimNet43;
   assign s_logisimBus155[7]  = s_logisimNet291;
   assign s_logisimBus155[8]  = s_logisimNet176;
   assign s_logisimBus155[9]  = s_logisimNet346;
   assign s_logisimBus20[0]   = s_logisimNet188;
   assign s_logisimBus20[10]  = s_logisimNet132;
   assign s_logisimBus20[11]  = s_logisimNet227;
   assign s_logisimBus20[12]  = s_logisimNet318;
   assign s_logisimBus20[13]  = s_logisimNet66;
   assign s_logisimBus20[14]  = s_logisimNet49;
   assign s_logisimBus20[15]  = s_logisimNet181;
   assign s_logisimBus20[1]   = s_logisimNet300;
   assign s_logisimBus20[2]   = s_logisimNet35;
   assign s_logisimBus20[3]   = s_logisimNet41;
   assign s_logisimBus20[4]   = s_logisimNet86;
   assign s_logisimBus20[5]   = s_logisimNet174;
   assign s_logisimBus20[6]   = s_logisimNet244;
   assign s_logisimBus20[7]   = s_logisimNet3;
   assign s_logisimBus20[8]   = s_logisimNet28;
   assign s_logisimBus20[9]   = s_logisimNet74;
   assign s_logisimBus23[0]   = s_logisimNet228;
   assign s_logisimBus23[10]  = s_logisimNet288;
   assign s_logisimBus23[11]  = s_logisimNet246;
   assign s_logisimBus23[12]  = s_logisimNet336;
   assign s_logisimBus23[13]  = s_logisimNet25;
   assign s_logisimBus23[14]  = s_logisimNet56;
   assign s_logisimBus23[15]  = s_logisimNet135;
   assign s_logisimBus23[1]   = s_logisimNet322;
   assign s_logisimBus23[2]   = s_logisimNet10;
   assign s_logisimBus23[3]   = s_logisimNet313;
   assign s_logisimBus23[4]   = s_logisimNet333;
   assign s_logisimBus23[5]   = s_logisimNet190;
   assign s_logisimBus23[6]   = s_logisimNet260;
   assign s_logisimBus23[7]   = s_logisimNet219;
   assign s_logisimBus23[8]   = s_logisimNet348;
   assign s_logisimBus23[9]   = s_logisimNet270;
   assign s_logisimBus276[0]  = s_logisimNet69;
   assign s_logisimBus276[10] = s_logisimNet76;
   assign s_logisimBus276[11] = s_logisimNet150;
   assign s_logisimBus276[12] = s_logisimNet327;
   assign s_logisimBus276[13] = s_logisimNet278;
   assign s_logisimBus276[14] = s_logisimNet124;
   assign s_logisimBus276[15] = s_logisimNet328;
   assign s_logisimBus276[1]  = s_logisimNet253;
   assign s_logisimBus276[2]  = s_logisimNet222;
   assign s_logisimBus276[3]  = s_logisimNet96;
   assign s_logisimBus276[4]  = s_logisimNet104;
   assign s_logisimBus276[5]  = s_logisimNet214;
   assign s_logisimBus276[6]  = s_logisimNet140;
   assign s_logisimBus276[7]  = s_logisimNet211;
   assign s_logisimBus276[8]  = s_logisimNet293;
   assign s_logisimBus276[9]  = s_logisimNet65;
   assign s_logisimBus38[0]   = s_logisimNet251;
   assign s_logisimBus38[10]  = s_logisimNet303;
   assign s_logisimBus38[11]  = s_logisimNet299;
   assign s_logisimBus38[12]  = s_logisimNet94;
   assign s_logisimBus38[13]  = s_logisimNet40;
   assign s_logisimBus38[14]  = s_logisimNet85;
   assign s_logisimBus38[15]  = s_logisimNet173;
   assign s_logisimBus38[1]   = s_logisimNet53;
   assign s_logisimBus38[2]   = s_logisimNet22;
   assign s_logisimBus38[3]   = s_logisimNet331;
   assign s_logisimBus38[4]   = s_logisimNet345;
   assign s_logisimBus38[5]   = s_logisimNet226;
   assign s_logisimBus38[6]   = s_logisimNet317;
   assign s_logisimBus38[7]   = s_logisimNet233;
   assign s_logisimBus38[8]   = s_logisimNet48;
   assign s_logisimBus38[9]   = s_logisimNet285;
   assign s_logisimBus47[0]   = s_logisimNet263;
   assign s_logisimBus47[10]  = s_logisimNet202;
   assign s_logisimBus47[11]  = s_logisimNet325;
   assign s_logisimBus47[12]  = s_logisimNet193;
   assign s_logisimBus47[13]  = s_logisimNet77;
   assign s_logisimBus47[14]  = s_logisimNet99;
   assign s_logisimBus47[15]  = s_logisimNet194;
   assign s_logisimBus47[1]   = s_logisimNet139;
   assign s_logisimBus47[2]   = s_logisimNet46;
   assign s_logisimBus47[3]   = s_logisimNet92;
   assign s_logisimBus47[4]   = s_logisimNet144;
   assign s_logisimBus47[5]   = s_logisimNet249;
   assign s_logisimBus47[6]   = s_logisimNet339;
   assign s_logisimBus47[7]   = s_logisimNet26;
   assign s_logisimBus47[8]   = s_logisimNet58;
   assign s_logisimBus47[9]   = s_logisimNet137;
   assign s_logisimBus55[0]   = s_logisimNet275;
   assign s_logisimBus55[10]  = s_logisimNet207;
   assign s_logisimBus55[11]  = s_logisimNet341;
   assign s_logisimBus55[12]  = s_logisimNet309;
   assign s_logisimBus55[13]  = s_logisimNet166;
   assign s_logisimBus55[14]  = s_logisimNet113;
   assign s_logisimBus55[15]  = s_logisimNet310;
   assign s_logisimBus55[1]   = s_logisimNet237;
   assign s_logisimBus55[2]   = s_logisimNet114;
   assign s_logisimBus55[3]   = s_logisimNet101;
   assign s_logisimBus55[4]   = s_logisimNet156;
   assign s_logisimBus55[5]   = s_logisimNet266;
   assign s_logisimBus55[6]   = s_logisimNet128;
   assign s_logisimBus55[7]   = s_logisimNet34;
   assign s_logisimBus55[8]   = s_logisimNet105;
   assign s_logisimBus55[9]   = s_logisimNet147;
   assign s_logisimBus5[0]    = s_logisimNet143;
   assign s_logisimBus5[10]   = s_logisimNet177;
   assign s_logisimBus5[11]   = s_logisimNet268;
   assign s_logisimBus5[12]   = s_logisimNet259;
   assign s_logisimBus5[13]   = s_logisimNet304;
   assign s_logisimBus5[14]   = s_logisimNet232;
   assign s_logisimBus5[15]   = s_logisimNet88;
   assign s_logisimBus5[1]    = s_logisimNet245;
   assign s_logisimBus5[2]    = s_logisimNet335;
   assign s_logisimBus5[3]    = s_logisimNet197;
   assign s_logisimBus5[4]    = s_logisimNet204;
   assign s_logisimBus5[5]    = s_logisimNet134;
   assign s_logisimBus5[6]    = s_logisimNet254;
   assign s_logisimBus5[7]    = s_logisimNet321;
   assign s_logisimBus5[8]    = s_logisimNet215;
   assign s_logisimBus5[9]    = s_logisimNet162;
   assign s_logisimBus6[0]    = s_logisimNet175;
   assign s_logisimBus6[10]   = s_logisimNet216;
   assign s_logisimBus6[11]   = s_logisimNet332;
   assign s_logisimBus6[12]   = s_logisimNet262;
   assign s_logisimBus6[13]   = s_logisimNet8;
   assign s_logisimBus6[14]   = s_logisimNet290;
   assign s_logisimBus6[15]   = s_logisimNet91;
   assign s_logisimBus6[1]    = s_logisimNet248;
   assign s_logisimBus6[2]    = s_logisimNet338;
   assign s_logisimBus6[3]    = s_logisimNet239;
   assign s_logisimBus6[4]    = s_logisimNet257;
   assign s_logisimBus6[5]    = s_logisimNet136;
   assign s_logisimBus6[6]    = s_logisimNet312;
   assign s_logisimBus6[7]    = s_logisimNet324;
   assign s_logisimBus6[8]    = s_logisimNet269;
   assign s_logisimBus6[9]    = s_logisimNet205;
   assign s_logisimBus71[0]   = s_logisimNet315;
   assign s_logisimBus71[10]  = s_logisimNet241;
   assign s_logisimBus71[11]  = s_logisimNet97;
   assign s_logisimBus71[12]  = s_logisimNet235;
   assign s_logisimBus71[13]  = s_logisimNet112;
   assign s_logisimBus71[14]  = s_logisimNet130;
   assign s_logisimBus71[15]  = s_logisimNet236;
   assign s_logisimBus71[1]   = s_logisimNet182;
   assign s_logisimBus71[2]   = s_logisimNet67;
   assign s_logisimBus71[3]   = s_logisimNet117;
   assign s_logisimBus71[4]   = s_logisimNet186;
   assign s_logisimBus71[5]   = s_logisimNet297;
   assign s_logisimBus71[6]   = s_logisimNet81;
   assign s_logisimBus71[7]   = s_logisimNet39;
   assign s_logisimBus71[8]   = s_logisimNet83;
   assign s_logisimBus71[9]   = s_logisimNet171;
   assign s_logisimNet10      = s_logisimBus119[7];
   assign s_logisimNet100     = s_logisimBus283[3];
   assign s_logisimNet101     = s_logisimBus1[15];
   assign s_logisimNet103     = s_logisimBus118[8];
   assign s_logisimNet104     = s_logisimBus72[2];
   assign s_logisimNet105     = s_logisimBus90[15];
   assign s_logisimNet112     = s_logisimBus146[5];
   assign s_logisimNet113     = s_logisimBus102[15];
   assign s_logisimNet114     = s_logisimBus119[15];
   assign s_logisimNet115     = s_logisimBus60[4];
   assign s_logisimNet117     = s_logisimBus1[5];
   assign s_logisimNet122     = s_logisimBus119[1];
   assign s_logisimNet123     = s_logisimBus146[8];
   assign s_logisimNet124     = s_logisimBus102[2];
   assign s_logisimNet126     = s_logisimBus282[1];
   assign s_logisimNet127     = s_logisimBus283[1];
   assign s_logisimNet128     = s_logisimBus107[15];
   assign s_logisimNet130     = s_logisimBus102[5];
   assign s_logisimNet131     = s_logisimBus90[8];
   assign s_logisimNet132     = s_logisimBus60[11];
   assign s_logisimNet134     = s_logisimBus189[6];
   assign s_logisimNet135     = s_logisimBus283[7];
   assign s_logisimNet136     = s_logisimBus189[13];
   assign s_logisimNet137     = s_logisimBus50[14];
   assign s_logisimNet138     = s_logisimBus283[4];
   assign s_logisimNet139     = s_logisimBus208[14];
   assign s_logisimNet140     = s_logisimBus107[2];
   assign s_logisimNet143     = s_logisimBus32[6];
   assign s_logisimNet144     = s_logisimBus72[14];
   assign s_logisimNet147     = s_logisimBus50[15];
   assign s_logisimNet148     = s_logisimBus146[0];
   assign s_logisimNet150     = s_logisimBus118[2];
   assign s_logisimNet151     = s_logisimBus90[9];
   assign s_logisimNet152     = s_logisimBus50[3];
   assign s_logisimNet153     = s_logisimBus32[3];
   assign s_logisimNet156     = s_logisimBus72[15];
   assign s_logisimNet158     = s_logisimBus146[1];
   assign s_logisimNet159     = s_logisimBus189[4];
   assign s_logisimNet16      = s_logisimBus189[0];
   assign s_logisimNet160     = s_logisimBus1[12];
   assign s_logisimNet161     = s_logisimBus90[12];
   assign s_logisimNet162     = s_logisimBus50[6];
   assign s_logisimNet164     = s_logisimBus189[8];
   assign s_logisimNet165     = s_logisimBus60[3];
   assign s_logisimNet166     = s_logisimBus146[15];
   assign s_logisimNet167     = s_logisimBus119[9];
   assign s_logisimNet171     = s_logisimBus50[5];
   assign s_logisimNet172     = s_logisimBus1[8];
   assign s_logisimNet173     = s_logisimBus283[10];
   assign s_logisimNet174     = s_logisimBus189[11];
   assign s_logisimNet175     = s_logisimBus32[13];
   assign s_logisimNet176     = s_logisimBus90[1];
   assign s_logisimNet177     = s_logisimBus60[6];
   assign s_logisimNet178     = s_logisimBus44[0];
   assign s_logisimNet179     = s_logisimBus102[12];
   assign s_logisimNet18      = s_logisimBus90[4];
   assign s_logisimNet180     = s_logisimBus119[12];
   assign s_logisimNet181     = s_logisimBus283[11];
   assign s_logisimNet182     = s_logisimBus208[5];
   assign s_logisimNet183     = s_logisimBus107[9];
   assign s_logisimNet184     = s_logisimBus1[3];
   assign s_logisimNet186     = s_logisimBus72[5];
   assign s_logisimNet187     = s_logisimBus102[8];
   assign s_logisimNet188     = s_logisimBus32[11];
   assign s_logisimNet190     = s_logisimBus189[7];
   assign s_logisimNet191     = s_logisimBus1[9];
   assign s_logisimNet192     = s_logisimBus32[0];
   assign s_logisimNet193     = s_logisimBus282[14];
   assign s_logisimNet194     = s_logisimBus283[14];
   assign s_logisimNet195     = s_logisimBus208[8];
   assign s_logisimNet196     = s_logisimBus107[12];
   assign s_logisimNet197     = s_logisimBus1[6];
   assign s_logisimNet198     = s_logisimBus118[9];
   assign s_logisimNet199     = s_logisimBus72[3];
   assign s_logisimNet201     = s_logisimBus102[9];
   assign s_logisimNet202     = s_logisimBus60[14];
   assign s_logisimNet203     = s_logisimBus118[12];
   assign s_logisimNet204     = s_logisimBus72[6];
   assign s_logisimNet205     = s_logisimBus50[13];
   assign s_logisimNet206     = s_logisimBus90[3];
   assign s_logisimNet207     = s_logisimBus60[15];
   assign s_logisimNet209     = s_logisimBus1[1];
   assign s_logisimNet21      = s_logisimBus119[4];
   assign s_logisimNet210     = s_logisimBus118[4];
   assign s_logisimNet211     = s_logisimBus44[2];
   assign s_logisimNet212     = s_logisimBus50[12];
   assign s_logisimNet214     = s_logisimBus189[2];
   assign s_logisimNet215     = s_logisimBus90[6];
   assign s_logisimNet216     = s_logisimBus60[13];
   assign s_logisimNet217     = s_logisimBus146[9];
   assign s_logisimNet218     = s_logisimBus102[3];
   assign s_logisimNet219     = s_logisimBus44[7];
   assign s_logisimNet22      = s_logisimBus119[10];
   assign s_logisimNet220     = s_logisimBus119[3];
   assign s_logisimNet221     = s_logisimBus107[4];
   assign s_logisimNet222     = s_logisimBus119[2];
   assign s_logisimNet224     = s_logisimBus72[12];
   assign s_logisimNet225     = s_logisimBus50[8];
   assign s_logisimNet226     = s_logisimBus189[10];
   assign s_logisimNet227     = s_logisimBus118[11];
   assign s_logisimNet228     = s_logisimBus32[7];
   assign s_logisimNet229     = s_logisimBus102[1];
   assign s_logisimNet230     = s_logisimBus60[0];
   assign s_logisimNet231     = s_logisimBus146[12];
   assign s_logisimNet232     = s_logisimBus102[6];
   assign s_logisimNet233     = s_logisimBus44[10];
   assign s_logisimNet235     = s_logisimBus282[5];
   assign s_logisimNet236     = s_logisimBus283[5];
   assign s_logisimNet237     = s_logisimBus208[15];
   assign s_logisimNet238     = s_logisimBus107[3];
   assign s_logisimNet239     = s_logisimBus1[13];
   assign s_logisimNet241     = s_logisimBus60[5];
   assign s_logisimNet242     = s_logisimBus72[8];
   assign s_logisimNet244     = s_logisimBus107[11];
   assign s_logisimNet245     = s_logisimBus208[6];
   assign s_logisimNet246     = s_logisimBus118[7];
   assign s_logisimNet247     = s_logisimBus50[9];
   assign s_logisimNet248     = s_logisimBus208[13];
   assign s_logisimNet249     = s_logisimBus189[14];
   assign s_logisimNet25      = s_logisimBus146[7];
   assign s_logisimNet251     = s_logisimBus32[10];
   assign s_logisimNet252     = s_logisimBus282[8];
   assign s_logisimNet253     = s_logisimBus208[2];
   assign s_logisimNet254     = s_logisimBus107[6];
   assign s_logisimNet255     = s_logisimBus1[0];
   assign s_logisimNet256     = s_logisimBus118[3];
   assign s_logisimNet257     = s_logisimBus72[13];
   assign s_logisimNet259     = s_logisimBus282[6];
   assign s_logisimNet26      = s_logisimBus44[14];
   assign s_logisimNet260     = s_logisimBus107[7];
   assign s_logisimNet261     = s_logisimBus72[9];
   assign s_logisimNet262     = s_logisimBus282[13];
   assign s_logisimNet263     = s_logisimBus32[14];
   assign s_logisimNet265     = s_logisimBus208[3];
   assign s_logisimNet266     = s_logisimBus189[15];
   assign s_logisimNet267     = s_logisimBus50[0];
   assign s_logisimNet268     = s_logisimBus118[6];
   assign s_logisimNet269     = s_logisimBus90[13];
   assign s_logisimNet27      = s_logisimBus32[8];
   assign s_logisimNet270     = s_logisimBus50[7];
   assign s_logisimNet271     = s_logisimBus189[9];
   assign s_logisimNet273     = s_logisimBus282[3];
   assign s_logisimNet275     = s_logisimBus32[15];
   assign s_logisimNet277     = s_logisimBus208[4];
   assign s_logisimNet278     = s_logisimBus146[2];
   assign s_logisimNet28      = s_logisimBus90[11];
   assign s_logisimNet281     = s_logisimBus283[12];
   assign s_logisimNet284     = s_logisimBus72[0];
   assign s_logisimNet285     = s_logisimBus50[10];
   assign s_logisimNet286     = s_logisimBus189[12];
   assign s_logisimNet287     = s_logisimBus90[0];
   assign s_logisimNet288     = s_logisimBus60[7];
   assign s_logisimNet289     = s_logisimBus146[3];
   assign s_logisimNet29      = s_logisimBus118[1];
   assign s_logisimNet290     = s_logisimBus102[13];
   assign s_logisimNet291     = s_logisimBus44[1];
   assign s_logisimNet292     = s_logisimBus282[4];
   assign s_logisimNet293     = s_logisimBus90[2];
   assign s_logisimNet295     = s_logisimBus60[12];
   assign s_logisimNet297     = s_logisimBus189[5];
   assign s_logisimNet298     = s_logisimBus283[8];
   assign s_logisimNet299     = s_logisimBus118[10];
   assign s_logisimNet3       = s_logisimBus44[11];
   assign s_logisimNet300     = s_logisimBus208[11];
   assign s_logisimNet301     = s_logisimBus32[1];
   assign s_logisimNet302     = s_logisimBus72[1];
   assign s_logisimNet303     = s_logisimBus60[10];
   assign s_logisimNet304     = s_logisimBus146[6];
   assign s_logisimNet305     = s_logisimBus44[4];
   assign s_logisimNet306     = s_logisimBus102[0];
   assign s_logisimNet307     = s_logisimBus119[0];
   assign s_logisimNet309     = s_logisimBus282[15];
   assign s_logisimNet31      = s_logisimBus1[4];
   assign s_logisimNet310     = s_logisimBus283[15];
   assign s_logisimNet311     = s_logisimBus208[9];
   assign s_logisimNet312     = s_logisimBus107[13];
   assign s_logisimNet313     = s_logisimBus1[7];
   assign s_logisimNet315     = s_logisimBus32[5];
   assign s_logisimNet316     = s_logisimBus60[8];
   assign s_logisimNet317     = s_logisimBus107[10];
   assign s_logisimNet318     = s_logisimBus282[11];
   assign s_logisimNet321     = s_logisimBus44[6];
   assign s_logisimNet322     = s_logisimBus208[7];
   assign s_logisimNet323     = s_logisimBus283[9];
   assign s_logisimNet324     = s_logisimBus44[13];
   assign s_logisimNet325     = s_logisimBus118[14];
   assign s_logisimNet326     = s_logisimBus32[4];
   assign s_logisimNet327     = s_logisimBus282[2];
   assign s_logisimNet328     = s_logisimBus283[2];
   assign s_logisimNet329     = s_logisimBus208[12];
   assign s_logisimNet330     = s_logisimBus107[0];
   assign s_logisimNet331     = s_logisimBus1[10];
   assign s_logisimNet332     = s_logisimBus118[13];
   assign s_logisimNet333     = s_logisimBus72[7];
   assign s_logisimNet335     = s_logisimBus119[6];
   assign s_logisimNet336     = s_logisimBus282[7];
   assign s_logisimNet337     = s_logisimBus60[9];
   assign s_logisimNet338     = s_logisimBus119[13];
   assign s_logisimNet339     = s_logisimBus107[14];
   assign s_logisimNet34      = s_logisimBus44[15];
   assign s_logisimNet340     = s_logisimBus44[3];
   assign s_logisimNet341     = s_logisimBus118[15];
   assign s_logisimNet343     = s_logisimBus283[0];
   assign s_logisimNet344     = s_logisimBus118[0];
   assign s_logisimNet345     = s_logisimBus72[10];
   assign s_logisimNet346     = s_logisimBus50[1];
   assign s_logisimNet347     = s_logisimBus189[3];
   assign s_logisimNet348     = s_logisimBus90[7];
   assign s_logisimNet35      = s_logisimBus119[11];
   assign s_logisimNet36      = s_logisimBus102[4];
   assign s_logisimNet37      = s_logisimBus282[12];
   assign s_logisimNet39      = s_logisimBus44[5];
   assign s_logisimNet4       = s_logisimBus60[1];
   assign s_logisimNet40      = s_logisimBus146[10];
   assign s_logisimNet41      = s_logisimBus1[11];
   assign s_logisimNet43      = s_logisimBus107[1];
   assign s_logisimNet45      = s_logisimBus146[4];
   assign s_logisimNet46      = s_logisimBus119[14];
   assign s_logisimNet48      = s_logisimBus90[10];
   assign s_logisimNet49      = s_logisimBus102[11];
   assign s_logisimNet53      = s_logisimBus208[10];
   assign s_logisimNet56      = s_logisimBus102[7];
   assign s_logisimNet57      = s_logisimBus282[9];
   assign s_logisimNet58      = s_logisimBus90[14];
   assign s_logisimNet59      = s_logisimBus208[0];
   assign s_logisimNet61      = s_logisimBus189[1];
   assign s_logisimNet62      = s_logisimBus50[4];
   assign s_logisimNet64      = s_logisimBus282[0];
   assign s_logisimNet65      = s_logisimBus50[2];
   assign s_logisimNet66      = s_logisimBus146[11];
   assign s_logisimNet67      = s_logisimBus119[5];
   assign s_logisimNet68      = s_logisimBus72[4];
   assign s_logisimNet69      = s_logisimBus32[2];
   assign s_logisimNet73      = s_logisimBus44[8];
   assign s_logisimNet74      = s_logisimBus50[11];
   assign s_logisimNet75      = s_logisimBus32[9];
   assign s_logisimNet76      = s_logisimBus60[2];
   assign s_logisimNet77      = s_logisimBus146[14];
   assign s_logisimNet78      = s_logisimBus44[12];
   assign s_logisimNet8       = s_logisimBus146[13];
   assign s_logisimNet80      = s_logisimBus208[1];
   assign s_logisimNet81      = s_logisimBus107[5];
   assign s_logisimNet83      = s_logisimBus90[5];
   assign s_logisimNet84      = s_logisimBus119[8];
   assign s_logisimNet85      = s_logisimBus102[10];
   assign s_logisimNet86      = s_logisimBus72[11];
   assign s_logisimNet88      = s_logisimBus283[6];
   assign s_logisimNet89      = s_logisimBus44[9];
   assign s_logisimNet91      = s_logisimBus283[13];
   assign s_logisimNet92      = s_logisimBus1[14];
   assign s_logisimNet93      = s_logisimBus32[12];
   assign s_logisimNet94      = s_logisimBus282[10];
   assign s_logisimNet95      = s_logisimBus107[8];
   assign s_logisimNet96      = s_logisimBus1[2];
   assign s_logisimNet97      = s_logisimBus118[5];
   assign s_logisimNet99      = s_logisimBus102[14];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus0[15:0]   = RB_15_0;
   assign s_logisimBus121[15:0] = NLCA_15_0;
   assign s_logisimBus320[15:0] = WR_15_0;
   assign s_logisimBus334[15:0] = EB_15_0;
   assign s_logisimBus342[15:0] = EA_15_0;
   assign s_logisimNet108       = XFETCHN;
   assign s_logisimNet129       = ALUCLKN;
   assign s_logisimNet2         = ALUCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign A_15_0  = s_logisimBus272[15:0];
   assign BR_15_0 = s_logisimBus149[15:0];
   assign B_15_0  = s_logisimBus120[15:0];
   assign PR_15_0 = s_logisimBus33[15:0];
   assign XR_15_0 = s_logisimBus163[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_WRF_RBLOCK_DR16   Z_REG_0 (.ALUCLK(s_logisimNet2),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .REG_15_0(s_logisimBus32[15:0]),
                                  .WR(s_logisimBus320[0]));

   CGA_WRF_RBLOCK_DR16   D_REG_1 (.ALUCLK(s_logisimNet2),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .REG_15_0(s_logisimBus208[15:0]),
                                  .WR(s_logisimBus320[1]));

   CGA_WRF_RBLOCK_PREG   P_REG_2 (.ALUCLK(s_logisimNet2),
                                  .ALUCLKN(s_logisimNet129),
                                  .NLCA_15_0(s_logisimBus121[15:0]),
                                  .PR_15_0(s_logisimBus33[15:0]),
                                  .P_15_0(s_logisimBus119[15:0]),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .WR2(s_logisimBus320[2]),
                                  .XFETCHN(s_logisimNet108));

   CGA_WRF_RBLOCK_LR16   B_REG_3 (.ALUCLK(s_logisimNet2),
                                  .LR_15_0(s_logisimBus149[15:0]),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .R_15_0(s_logisimBus1[15:0]),
                                  .WR(s_logisimBus320[3]));

   CGA_WRF_RBLOCK_DR16   L_REG_4 (.ALUCLK(s_logisimNet2),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .REG_15_0(s_logisimBus72[15:0]),
                                  .WR(s_logisimBus320[4]));

   CGA_WRF_RBLOCK_DR16   A_REG_5 (.ALUCLK(s_logisimNet2),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .REG_15_0(s_logisimBus189[15:0]),
                                  .WR(s_logisimBus320[5]));

   CGA_WRF_RBLOCK_DR16   T_REG_6 (.ALUCLK(s_logisimNet2),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .REG_15_0(s_logisimBus107[15:0]),
                                  .WR(s_logisimBus320[6]));

   CGA_WRF_RBLOCK_LR16   X_REG_7 (.ALUCLK(s_logisimNet2),
                                  .LR_15_0(s_logisimBus163[15:0]),
                                  .RB_15_0(s_logisimBus0[15:0]),
                                  .R_15_0(s_logisimBus44[15:0]),
                                  .WR(s_logisimBus320[7]));

   CGA_WRF_RBLOCK_DR16   STS_REG_8 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus90[15:0]),
                                    .WR(s_logisimBus320[8]));

   CGA_WRF_RBLOCK_DR16   R1_REG_9 (.ALUCLK(s_logisimNet2),
                                   .RB_15_0(s_logisimBus0[15:0]),
                                   .REG_15_0(s_logisimBus50[15:0]),
                                   .WR(s_logisimBus320[9]));

   CGA_WRF_RBLOCK_DR16   R2_REG_10 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus60[15:0]),
                                    .WR(s_logisimBus320[10]));

   CGA_WRF_RBLOCK_DR16   R3_REG_11 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus118[15:0]),
                                    .WR(s_logisimBus320[11]));

   CGA_WRF_RBLOCK_DR16   R4_REG_12 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus282[15:0]),
                                    .WR(s_logisimBus320[12]));

   CGA_WRF_RBLOCK_DR16   R5_REG_13 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus146[15:0]),
                                    .WR(s_logisimBus320[13]));

   CGA_WRF_RBLOCK_DR16   R6_REG_14 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus102[15:0]),
                                    .WR(s_logisimBus320[14]));

   CGA_WRF_RBLOCK_DR16   R7_REG_15 (.ALUCLK(s_logisimNet2),
                                    .RB_15_0(s_logisimBus0[15:0]),
                                    .REG_15_0(s_logisimBus283[15:0]),
                                    .WR(s_logisimBus320[15]));

   CGA_WRF_RBLOCK_SEL16   SEL_0 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[0]),
                                 .PB(s_logisimBus120[0]),
                                 .SI_15_0(s_logisimBus145[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_1 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[1]),
                                 .PB(s_logisimBus120[1]),
                                 .SI_15_0(s_logisimBus155[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_4 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[4]),
                                 .PB(s_logisimBus120[4]),
                                 .SI_15_0(s_logisimBus13[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_5 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[5]),
                                 .PB(s_logisimBus120[5]),
                                 .SI_15_0(s_logisimBus71[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_6 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[6]),
                                 .PB(s_logisimBus120[6]),
                                 .SI_15_0(s_logisimBus5[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_2 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[2]),
                                 .PB(s_logisimBus120[2]),
                                 .SI_15_0(s_logisimBus276[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_7 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[7]),
                                 .PB(s_logisimBus120[7]),
                                 .SI_15_0(s_logisimBus23[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_8 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[8]),
                                 .PB(s_logisimBus120[8]),
                                 .SI_15_0(s_logisimBus116[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_9 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[9]),
                                 .PB(s_logisimBus120[9]),
                                 .SI_15_0(s_logisimBus133[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_10 (.EA_15_0(s_logisimBus342[15:0]),
                                  .EB_15_0(s_logisimBus334[15:0]),
                                  .PA(s_logisimBus272[10]),
                                  .PB(s_logisimBus120[10]),
                                  .SI_15_0(s_logisimBus38[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_3 (.EA_15_0(s_logisimBus342[15:0]),
                                 .EB_15_0(s_logisimBus334[15:0]),
                                 .PA(s_logisimBus272[3]),
                                 .PB(s_logisimBus120[3]),
                                 .SI_15_0(s_logisimBus11[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_11 (.EA_15_0(s_logisimBus342[15:0]),
                                  .EB_15_0(s_logisimBus334[15:0]),
                                  .PA(s_logisimBus272[11]),
                                  .PB(s_logisimBus120[11]),
                                  .SI_15_0(s_logisimBus20[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_12 (.EA_15_0(s_logisimBus342[15:0]),
                                  .EB_15_0(s_logisimBus334[15:0]),
                                  .PA(s_logisimBus272[12]),
                                  .PB(s_logisimBus120[12]),
                                  .SI_15_0(s_logisimBus106[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_13 (.EA_15_0(s_logisimBus342[15:0]),
                                  .EB_15_0(s_logisimBus334[15:0]),
                                  .PA(s_logisimBus272[13]),
                                  .PB(s_logisimBus120[13]),
                                  .SI_15_0(s_logisimBus6[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_14 (.EA_15_0(s_logisimBus342[15:0]),
                                  .EB_15_0(s_logisimBus334[15:0]),
                                  .PA(s_logisimBus272[14]),
                                  .PB(s_logisimBus120[14]),
                                  .SI_15_0(s_logisimBus47[15:0]));

   CGA_WRF_RBLOCK_SEL16   SEL_15 (.EA_15_0(s_logisimBus342[15:0]),
                                  .EB_15_0(s_logisimBus334[15:0]),
                                  .PA(s_logisimBus272[15]),
                                  .PB(s_logisimBus120[15]),
                                  .SI_15_0(s_logisimBus55[15:0]));

endmodule
