// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** CPU GATE ARRAY - CGA - DELILAH                                        **
**                                                                       **
** CGA/DCD - Decoder
**                                                                       **
** Sheet 1-10 of 10                                                      **
** PDF page 65-73+75 of 108                                              **
**                                                                       ** 
** Last reviewed: 23-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module CGA_DCD( BRKN,
                CBRKN,
                CFETCH,
                CLFFN,
                CLIRQN,
                CRY,
                CSCOMM_4_0,
                CSIDBS_4_0,
                CSMIS_1_0,
                CSMREQ,
                DSTOPN,
                EPCRN,
                EPGSN,
                EPIC,
                EPICSN,
                EPICVN,
                ERFN,
                F15,
                FETCHN,
                FIDBO,
                ILCSN,
                INDN,
                INTRQN,
                LDDBRN,
                LDGPRN,
                LDIRV,
                LDLCN,
                LDPILN,
                LSHADOW,
                LWCAN,
                MCLK,
                MRN,
                PONI,
                SGR,
                VACCN,
                VEX,
                WPN,
                WRITEN,
                WRTRF,
                XFETCHN,
                ZF );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       BRKN;
   input       CRY;
   input [4:0] CSCOMM_4_0;
   input [4:0] CSIDBS_4_0;
   input [1:0] CSMIS_1_0;
   input       F15;
   input       FIDBO;
   input       ILCSN;
   input       INTRQN;
   input       LSHADOW;
   input       MCLK;
   input       MRN;
   input       PONI;
   input       SGR;
   input       VEX;
   input       WPN;
   input       ZF;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output CBRKN;
   output CFETCH;
   output CLFFN;
   output CLIRQN;
   output CSMREQ;
   output DSTOPN;
   output EPCRN;
   output EPGSN;
   output EPIC;
   output EPICSN;
   output EPICVN;
   output ERFN;
   output FETCHN;
   output INDN;
   output LDDBRN;
   output LDGPRN;
   output LDIRV;
   output LDLCN;
   output LDPILN;
   output LWCAN;
   output VACCN;
   output WRITEN;
   output WRTRF;
   output XFETCHN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus162;
   wire [1:0] s_logisimBus174;
   wire [4:0] s_logisimBus197;
   wire [4:0] s_logisimBus222;
   wire [4:0] s_logisimBus224;
   wire [1:0] s_logisimBus241;
   wire [1:0] s_logisimBus247;
   wire [4:0] s_logisimBus251;
   wire [4:0] s_logisimBus262;
   wire [1:0] s_logisimBus265;
   wire [4:0] s_logisimBus267;
   wire [4:0] s_logisimBus268;
   wire [4:0] s_logisimBus59;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet100;
   wire       s_logisimNet101;
   wire       s_logisimNet102;
   wire       s_logisimNet103;
   wire       s_logisimNet104;
   wire       s_logisimNet105;
   wire       s_logisimNet106;
   wire       s_logisimNet107;
   wire       s_logisimNet108;
   wire       s_logisimNet109;
   wire       s_logisimNet11;
   wire       s_logisimNet110;
   wire       s_logisimNet111;
   wire       s_logisimNet112;
   wire       s_logisimNet113;
   wire       s_logisimNet114;
   wire       s_logisimNet115;
   wire       s_logisimNet116;
   wire       s_logisimNet117;
   wire       s_logisimNet118;
   wire       s_logisimNet119;
   wire       s_logisimNet12;
   wire       s_logisimNet120;
   wire       s_logisimNet121;
   wire       s_logisimNet122;
   wire       s_logisimNet123;
   wire       s_logisimNet124;
   wire       s_logisimNet125;
   wire       s_logisimNet126;
   wire       s_logisimNet127;
   wire       s_logisimNet128;
   wire       s_logisimNet129;
   wire       s_logisimNet13;
   wire       s_logisimNet130;
   wire       s_logisimNet131;
   wire       s_logisimNet132;
   wire       s_logisimNet133;
   wire       s_logisimNet134;
   wire       s_logisimNet135;
   wire       s_logisimNet136;
   wire       s_logisimNet137;
   wire       s_logisimNet138;
   wire       s_logisimNet139;
   wire       s_logisimNet14;
   wire       s_logisimNet140;
   wire       s_logisimNet141;
   wire       s_logisimNet142;
   wire       s_logisimNet143;
   wire       s_logisimNet144;
   wire       s_logisimNet145;
   wire       s_logisimNet146;
   wire       s_logisimNet147;
   wire       s_logisimNet148;
   wire       s_logisimNet149;
   wire       s_logisimNet15;
   wire       s_logisimNet150;
   wire       s_logisimNet151;
   wire       s_logisimNet152;
   wire       s_logisimNet153;
   wire       s_logisimNet154;
   wire       s_fidbo;
   wire       s_logisimNet156;
   wire       s_logisimNet157;
   wire       s_logisimNet158;
   wire       s_logisimNet159;
   wire       s_logisimNet16;
   wire       s_logisimNet160;
   wire       s_logisimNet161;
   wire       s_logisimNet163;
   wire       s_logisimNet164;
   wire       s_logisimNet165;
   wire       s_logisimNet166;
   wire       s_logisimNet167;
   wire       s_logisimNet168;
   wire       s_logisimNet169;
   wire       s_logisimNet17;
   wire       s_logisimNet170;
   wire       s_logisimNet171;
   wire       s_logisimNet172;
   wire       s_logisimNet173;
   wire       s_logisimNet175;
   wire       s_logisimNet176;
   wire       s_logisimNet177;
   wire       s_logisimNet178;
   wire       s_logisimNet179;
   wire       s_logisimNet18;
   wire       s_logisimNet180;
   wire       s_logisimNet181;
   wire       s_logisimNet182;
   wire       s_logisimNet183;
   wire       s_logisimNet184;
   wire       s_logisimNet185;
   wire       s_logisimNet186;
   wire       s_logisimNet187;
   wire       s_logisimNet188;
   wire       s_logisimNet189;
   wire       s_logisimNet19;
   wire       s_logisimNet190;
   wire       s_logisimNet191;
   wire       s_logisimNet192;
   wire       s_logisimNet193;
   wire       s_logisimNet194;
   wire       s_logisimNet195;
   wire       s_logisimNet196;
   wire       s_logisimNet198;
   wire       s_logisimNet199;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet200;
   wire       s_logisimNet201;
   wire       s_logisimNet202;
   wire       s_logisimNet203;
   wire       s_logisimNet204;
   wire       s_logisimNet205;
   wire       s_logisimNet206;
   wire       s_logisimNet207;
   wire       s_logisimNet208;
   wire       s_logisimNet209;
   wire       s_logisimNet21;
   wire       s_logisimNet210;
   wire       s_logisimNet211;
   wire       s_logisimNet212;
   wire       s_logisimNet213;
   wire       s_logisimNet214;
   wire       s_logisimNet215;
   wire       s_logisimNet216;
   wire       s_logisimNet217;
   wire       s_logisimNet218;
   wire       s_logisimNet219;
   wire       s_logisimNet22;
   wire       s_logisimNet220;
   wire       s_logisimNet221;
   wire       s_logisimNet223;
   wire       s_logisimNet225;
   wire       s_logisimNet226;
   wire       s_logisimNet227;
   wire       s_logisimNet228;
   wire       s_logisimNet229;
   wire       s_logisimNet23;
   wire       s_logisimNet230;
   wire       s_logisimNet231;
   wire       s_logisimNet232;
   wire       s_logisimNet233;
   wire       s_logisimNet234;
   wire       s_logisimNet235;
   wire       s_logisimNet236;
   wire       s_logisimNet237;
   wire       s_logisimNet238;
   wire       s_logisimNet239;
   wire       s_logisimNet24;
   wire       s_logisimNet240;
   wire       s_logisimNet242;
   wire       s_logisimNet243;
   wire       s_logisimNet244;
   wire       s_logisimNet245;
   wire       s_logisimNet246;
   wire       s_logisimNet248;
   wire       s_logisimNet249;
   wire       s_logisimNet25;
   wire       s_logisimNet250;
   wire       s_logisimNet252;
   wire       s_logisimNet253;
   wire       s_logisimNet254;
   wire       s_logisimNet255;
   wire       s_logisimNet256;
   wire       s_logisimNet257;
   wire       s_logisimNet258;
   wire       s_logisimNet259;
   wire       s_logisimNet26;
   wire       s_logisimNet260;
   wire       s_logisimNet261;
   wire       s_logisimNet263;
   wire       s_logisimNet264;
   wire       s_logisimNet266;
   wire       s_logisimNet269;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet5;
   wire       s_logisimNet50;
   wire       s_logisimNet51;
   wire       s_logisimNet52;
   wire       s_logisimNet53;
   wire       s_logisimNet54;
   wire       s_logisimNet55;
   wire       s_logisimNet56;
   wire       s_logisimNet57;
   wire       s_logisimNet58;
   wire       s_logisimNet6;
   wire       s_logisimNet60;
   wire       s_logisimNet61;
   wire       s_logisimNet62;
   wire       s_logisimNet63;
   wire       s_logisimNet64;
   wire       s_logisimNet65;
   wire       s_logisimNet66;
   wire       s_logisimNet67;
   wire       s_logisimNet68;
   wire       s_logisimNet69;
   wire       s_logisimNet7;
   wire       s_logisimNet70;
   wire       s_logisimNet71;
   wire       s_logisimNet72;
   wire       s_logisimNet73;
   wire       s_logisimNet74;
   wire       s_logisimNet75;
   wire       s_logisimNet76;
   wire       s_logisimNet77;
   wire       s_logisimNet78;
   wire       s_logisimNet79;
   wire       s_logisimNet8;
   wire       s_logisimNet80;
   wire       s_logisimNet81;
   wire       s_logisimNet82;
   wire       s_logisimNet83;
   wire       s_logisimNet84;
   wire       s_logisimNet85;
   wire       s_logisimNet86;
   wire       s_logisimNet87;
   wire       s_logisimNet88;
   wire       s_logisimNet89;
   wire       s_logisimNet9;
   wire       s_logisimNet90;
   wire       s_logisimNet91;
   wire       s_logisimNet92;
   wire       s_logisimNet93;
   wire       s_logisimNet94;
   wire       s_logisimNet95;
   wire       s_logisimNet96;
   wire       s_logisimNet97;
   wire       s_logisimNet98;
   wire       s_logisimNet99;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus262[4:0] = CSCOMM_4_0;
   assign s_logisimBus265[1:0] = CSMIS_1_0;
   assign s_logisimBus59[4:0]  = CSIDBS_4_0;
   assign s_logisimNet121      = PONI;
   assign s_logisimNet123      = MCLK;
   assign s_logisimNet143      = WPN;
   assign s_logisimNet153      = MRN;
   assign s_fidbo              = FIDBO;
   assign s_logisimNet163      = CRY;
   assign s_logisimNet178      = F15;
   assign s_logisimNet220      = BRKN;
   assign s_logisimNet248      = VEX;
   assign s_logisimNet250      = ZF;
   assign s_logisimNet41       = ILCSN;
   assign s_logisimNet75       = INTRQN;
   assign s_logisimNet8        = SGR;
   assign s_logisimNet99       = LSHADOW;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CBRKN   = s_logisimNet193;
   assign CFETCH  = s_logisimNet263;
   assign CLFFN   = s_logisimNet191;
   assign CLIRQN  = s_logisimNet187;
   assign CSMREQ  = s_logisimNet18;
   assign DSTOPN  = s_logisimNet258;
   assign EPCRN   = s_logisimNet204;
   assign EPGSN   = s_logisimNet256;
   assign EPIC    = s_logisimNet172;
   assign EPICSN  = s_logisimNet259;
   assign EPICVN  = s_logisimNet242;
   assign ERFN    = s_logisimNet130;
   assign FETCHN  = s_logisimNet154;
   assign INDN    = s_logisimNet179;
   assign LDDBRN  = s_logisimNet129;
   assign LDGPRN  = s_logisimNet238;
   assign LDIRV   = s_logisimNet240;
   assign LDLCN   = s_logisimNet165;
   assign LDPILN  = s_logisimNet76;
   assign LWCAN   = s_logisimNet133;
   assign VACCN   = s_logisimNet173;
   assign WRITEN  = s_logisimNet217;
   assign WRTRF   = s_logisimNet125;
   assign XFETCHN = s_logisimNet246;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet173 = ~s_logisimNet62;

   // NOT Gate
   assign s_logisimNet246 = ~s_logisimNet103;

   // NOT Gate
   assign s_logisimBus268[0] = ~s_logisimNet260;

   // NOT Gate
   assign s_logisimBus267[0] = ~s_logisimNet139;

   // NOT Gate
   assign s_logisimBus268[1] = ~s_logisimNet211;

   // NOT Gate
   assign s_logisimBus267[1] = ~s_logisimNet252;

   // NOT Gate
   assign s_logisimBus268[2] = ~s_logisimNet117;

   // NOT Gate
   assign s_logisimBus267[2] = ~s_logisimNet201;

   // NOT Gate
   assign s_logisimBus268[3] = ~s_logisimBus267[3];

   // NOT Gate
   assign s_logisimBus267[4] = ~s_logisimNet185;

   // NOT Gate
   assign s_logisimBus268[4] = ~s_logisimNet234;

   // NOT Gate
   assign s_logisimBus241[0] = ~s_logisimNet46;

   // NOT Gate
   assign s_logisimBus247[0] = ~s_logisimNet171;

   // NOT Gate
   assign s_logisimBus241[1] = ~s_logisimNet225;

   // NOT Gate
   assign s_logisimBus247[1] = ~s_logisimNet269;

   // NOT Gate
   assign s_logisimBus222[4] = ~s_logisimBus262[4];

   // NOT Gate
   assign s_logisimBus222[3] = ~s_logisimBus262[3];

   // NOT Gate
   assign s_logisimBus222[2] = ~s_logisimBus262[2];

   // NOT Gate
   assign s_logisimBus222[1] = ~s_logisimBus262[1];

   // NOT Gate
   assign s_logisimBus222[0] = ~s_logisimBus262[0];

   // NOT Gate
   assign s_logisimBus162[1] = ~s_logisimBus265[1];

   // NOT Gate
   assign s_logisimBus162[0] = ~s_logisimBus265[0];

   // NOT Gate
   assign s_logisimBus174[1] = ~s_logisimBus162[1];

   // NOT Gate
   assign s_logisimBus174[0] = ~s_logisimBus162[0];

   // NOT Gate
   assign s_logisimNet129 = ~s_logisimNet43;

   // NOT Gate
   assign s_logisimBus197[4] = ~s_logisimBus222[4];

   // NOT Gate
   assign s_logisimBus197[3] = ~s_logisimBus222[3];

   // NOT Gate
   assign s_logisimBus197[2] = ~s_logisimBus222[2];

   // NOT Gate
   assign s_logisimBus197[1] = ~s_logisimBus222[1];

   // NOT Gate
   assign s_logisimBus197[0] = ~s_logisimBus222[0];

   // NOT Gate
   assign s_logisimNet150 = ~s_logisimNet220;

   // NOT Gate
   assign s_logisimNet154 = ~s_logisimNet202;

   // NOT Gate
   assign s_logisimNet140 = ~s_logisimNet178;

   // NOT Gate
   assign s_logisimNet50 = ~s_logisimNet250;

   // NOT Gate
   assign s_logisimNet160 = ~s_logisimNet163;

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimNet143;

   // NOT Gate
   assign s_logisimNet217 = ~s_logisimNet135;

   // NOT Gate
   assign s_logisimNet244 = ~s_logisimNet41;

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet140;

   // NOT Gate
   assign s_logisimNet134 = ~s_logisimNet50;

   // NOT Gate
   assign s_logisimNet151 = ~s_logisimNet160;

   // NOT Gate
   assign s_logisimNet212 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet127 = ~s_logisimNet14;

   // NOT Gate
   assign s_logisimNet82 = ~s_logisimNet244;

   // NOT Gate
   assign s_logisimNet193 = ~s_logisimNet229;

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimNet153;

   // NOT Gate
   assign s_logisimBus251[0] = ~s_logisimBus59[0];

   // NOT Gate
   assign s_logisimBus251[1] = ~s_logisimBus59[1];

   // NOT Gate
   assign s_logisimBus251[2] = ~s_logisimBus59[2];

   // NOT Gate
   assign s_logisimBus251[3] = ~s_logisimBus59[3];

   // NOT Gate
   assign s_logisimBus251[4] = ~s_logisimBus59[4];

   // NOT Gate
   assign s_logisimNet172 = ~s_logisimNet28;

   // NOT Gate
   assign s_logisimBus224[0] = ~s_logisimBus251[0];

   // NOT Gate
   assign s_logisimBus224[1] = ~s_logisimBus251[1];

   // NOT Gate
   assign s_logisimBus224[2] = ~s_logisimBus251[2];

   // NOT Gate
   assign s_logisimBus224[3] = ~s_logisimBus251[3];

   // NOT Gate
   assign s_logisimBus224[4] = ~s_logisimBus251[4];

   // NOT Gate
   assign s_logisimNet136 = ~s_logisimNet121;

   // NOT Gate
   assign s_logisimNet66 = ~s_logisimNet248;

   // NOT Gate
   assign s_logisimNet37 = ~s_logisimNet99;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet79),
               .input2(s_logisimNet93),
               .result(s_logisimNet62));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_2 (.input1(s_logisimBus268[4]),
               .input2(s_logisimBus267[3]),
               .input3(s_logisimBus267[2]),
               .input4(s_logisimBus268[1]),
               .input5(s_logisimBus268[0]),
               .input6(s_logisimNet82),
               .result(s_logisimNet167));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_3 (.input1(s_logisimBus267[4]),
               .input2(s_logisimBus268[3]),
               .input3(s_logisimBus267[1]),
               .input4(s_logisimBus247[1]),
               .input5(s_logisimNet82),
               .result(s_logisimNet91));

   OR_GATE_6_INPUTS #(.BubblesMask({2'b11, 4'hF}))
      GATES_4 (.input1(s_logisimNet213),
               .input2(s_logisimNet113),
               .input3(s_logisimNet112),
               .input4(s_logisimNet94),
               .input5(s_logisimNet142),
               .input6(s_logisimNet176),
               .result(s_logisimNet103));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_5 (.input1(s_logisimNet82),
               .input2(s_logisimBus224[4]),
               .input3(s_logisimBus251[3]),
               .input4(s_logisimBus224[2]),
               .input5(s_logisimBus251[1]),
               .input6(s_logisimBus224[0]),
               .result(s_logisimNet96));

   NOR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_6 (.input1(s_logisimNet89),
               .input2(s_logisimNet91),
               .input3(s_logisimNet170),
               .input4(s_logisimNet4),
               .result(s_logisimNet56));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_7 (.input1(s_logisimBus267[4]),
               .input2(s_logisimBus268[3]),
               .input3(s_logisimBus268[2]),
               .input4(s_logisimBus267[1]),
               .input5(s_logisimBus267[0]),
               .input6(s_logisimBus241[1]),
               .input7(s_logisimBus247[0]),
               .input8(s_logisimNet140),
               .result(s_logisimNet94));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_8 (.input1(s_logisimBus267[4]),
               .input2(s_logisimBus268[3]),
               .input3(s_logisimBus267[1]),
               .input4(s_logisimBus267[0]),
               .input5(s_logisimNet82),
               .result(s_logisimNet170));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_9 (.input1(s_logisimBus267[4]),
               .input2(s_logisimBus268[3]),
               .input3(s_logisimBus267[2]),
               .input4(s_logisimNet82),
               .result(s_logisimNet4));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet56),
                .input2(s_logisimNet123),
                .result(s_logisimNet240));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_11 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimBus247[1]),
                .input7(s_logisimNet134),
                .input8(s_logisimBus241[0]),
                .result(s_logisimNet142));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_12 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimBus247[1]),
                .input7(s_logisimBus247[0]),
                .input8(s_logisimNet50),
                .result(s_logisimNet176));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_13 (.input1(s_logisimBus268[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus268[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimNet82),
                .result(s_logisimNet76));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_14 (.input1(s_logisimNet82),
                .input2(s_logisimBus224[4]),
                .input3(s_logisimBus224[3]),
                .input4(s_logisimBus251[2]),
                .input5(s_logisimBus251[1]),
                .input6(s_logisimBus224[0]),
                .result(s_logisimNet3));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_15 (.input1(s_logisimBus268[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus267[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimNet82),
                .result(s_logisimNet175));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_16 (.input1(s_logisimBus267[1]),
                .input2(s_logisimBus268[2]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[4]),
                .result(s_logisimNet137));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_17 (.input1(s_logisimNet82),
                .input2(s_logisimBus251[4]),
                .input3(s_logisimBus224[3]),
                .input4(s_logisimBus224[2]),
                .input5(s_logisimBus251[1]),
                .input6(s_logisimBus224[0]),
                .result(s_logisimNet87));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_18 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus268[1]),
                .input5(s_logisimNet82),
                .result(s_logisimNet219));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_19 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus268[1]),
                .input4(s_logisimBus268[0]),
                .input5(s_logisimNet82),
                .result(s_logisimNet97));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimNet0),
                .input2(s_logisimNet157),
                .result(s_logisimNet179));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_21 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[2]),
                .input3(s_logisimBus267[1]),
                .input4(s_logisimBus267[0]),
                .input5(s_logisimBus247[1]),
                .input6(s_logisimNet82),
                .result(s_logisimNet21));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_22 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus267[1]),
                .input4(s_logisimBus267[0]),
                .input5(s_logisimNet82),
                .result(s_logisimNet207));

   OR_GATE_7_INPUTS #(.BubblesMask({3'b111, 4'hF}))
      GATES_23 (.input1(s_logisimNet219),
                .input2(s_logisimNet97),
                .input3(s_logisimNet21),
                .input4(s_logisimNet207),
                .input5(s_logisimNet200),
                .input6(s_logisimNet156),
                .input7(s_logisimNet254),
                .result(s_logisimNet159));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_24 (.input1(s_logisimNet14),
                .input2(s_logisimNet67),
                .result(s_logisimNet51));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_25 (.input1(s_logisimNet140),
                .input2(s_logisimNet206),
                .result(s_logisimNet60));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_26 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus267[2]),
                .result(s_logisimNet200));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_27 (.input1(s_logisimNet82),
                .input2(s_logisimBus251[4]),
                .input3(s_logisimBus251[3]),
                .input4(s_logisimBus224[2]),
                .input5(s_logisimBus251[1]),
                .input6(s_logisimBus224[0]),
                .result(s_logisimNet239));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimNet5),
                .input2(s_logisimNet158),
                .result(s_logisimNet166));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_29 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus267[1]),
                .input4(s_logisimBus241[1]),
                .result(s_logisimNet156));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_30 (.input1(s_logisimNet239),
                .input2(s_logisimNet236),
                .result(s_logisimNet227));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_logisimNet50),
                .input2(s_logisimNet110),
                .result(s_logisimNet215));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_32 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus267[1]),
                .input4(s_logisimBus247[0]),
                .result(s_logisimNet254));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_33 (.input1(s_logisimNet134),
                .input2(s_logisimNet100),
                .result(s_logisimNet198));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_34 (.input1(s_logisimNet60),
                .input2(s_logisimNet166),
                .input3(s_logisimNet215),
                .input4(s_logisimNet198),
                .result(s_logisimNet52));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_35 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus247[1]),
                .input6(s_logisimBus247[0]),
                .result(s_logisimNet232));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_36 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .result(s_logisimNet231));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_37 (.input1(s_logisimNet232),
                .input2(s_logisimNet231),
                .input3(s_logisimNet120),
                .result(s_logisimNet205));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_38 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[2]),
                .result(s_logisimNet120));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_39 (.input1(s_logisimBus268[1]),
                .input2(s_logisimBus267[2]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[4]),
                .result(s_logisimNet253));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_40 (.input1(s_logisimNet212),
                .input2(s_logisimNet102),
                .result(s_logisimNet209));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_41 (.input1(s_logisimNet8),
                .input2(s_logisimNet145),
                .result(s_logisimNet107));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_42 (.input1(s_logisimNet160),
                .input2(s_logisimNet131),
                .result(s_logisimNet54));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_43 (.input1(s_logisimNet151),
                .input2(s_logisimNet223),
                .result(s_logisimNet63));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_44 (.input1(s_logisimNet209),
                .input2(s_logisimNet107),
                .input3(s_logisimNet54),
                .input4(s_logisimNet63),
                .result(s_logisimNet80));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_45 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimNet82),
                .result(s_logisimNet105));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_46 (.input1(s_logisimNet105),
                .input2(s_logisimNet29),
                .result(s_logisimNet116));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_47 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus267[2]),
                .input4(s_logisimBus268[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimNet82),
                .result(s_logisimNet29));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_48 (.input1(s_logisimNet140),
                .input2(s_logisimNet214),
                .result(s_logisimNet245));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_49 (.input1(s_logisimNet5),
                .input2(s_logisimNet228),
                .result(s_logisimNet188));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_50 (.input1(s_logisimNet50),
                .input2(s_logisimNet266),
                .result(s_logisimNet237));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_51 (.input1(s_logisimNet82),
                .input2(s_logisimBus268[4]),
                .input3(s_logisimBus267[3]),
                .input4(s_logisimBus267[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus268[0]),
                .result(s_logisimNet71));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_52 (.input1(s_logisimNet134),
                .input2(s_logisimNet261),
                .result(s_logisimNet235));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_53 (.input1(s_logisimNet245),
                .input2(s_logisimNet188),
                .input3(s_logisimNet237),
                .input4(s_logisimNet235),
                .result(s_logisimNet95));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_54 (.input1(s_logisimNet80),
                .input2(s_logisimNet95),
                .input3(s_logisimNet51),
                .input4(s_logisimNet52),
                .result(s_logisimNet229));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_55 (.input1(s_logisimNet82),
                .input2(s_logisimBus268[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[2]),
                .input5(s_logisimBus268[1]),
                .input6(s_logisimBus268[0]),
                .result(s_logisimNet85));

/*
   NOR_GATE #(.BubblesMask(2'b00))
      GATES_56 (.input1(s_logisimNet184),
                .input2(s_logisimNet7),
                .result(s_logisimNet187));
*/

   assign s_logisimNet187 = ~(s_logisimNet184 |s_logisimNet7 );

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_57 (.input1(s_logisimNet82),
                .input2(s_logisimBus268[4]),
                .input3(s_logisimBus267[3]),
                .input4(s_logisimBus268[2]),
                .input5(s_logisimBus268[1]),
                .input6(s_logisimBus267[0]),
                .result(s_logisimNet195));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_58 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus267[3]),
                .input4(s_logisimBus267[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus268[0]),
                .input7(s_logisimBus241[1]),
                .input8(s_logisimBus241[0]),
                .result(s_logisimNet146));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_59 (.input1(s_logisimNet82),
                .input2(s_logisimBus224[4]),
                .input3(s_logisimBus251[3]),
                .input4(s_logisimBus251[2]),
                .input5(s_logisimBus224[1]),
                .input6(s_logisimBus224[0]),
                .result(s_logisimNet92));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_60 (.input1(s_logisimBus262[4]),
                .input2(s_logisimNet82),
                .result(s_logisimNet181));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_61 (.input1(s_logisimNet82),
                .input2(s_logisimBus268[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus268[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus268[0]),
                .result(s_logisimNet58));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_62 (.input1(s_logisimNet58),
                .input2(s_logisimNet124),
                .result(s_logisimNet177));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_63 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus267[2]),
                .result(s_logisimNet213));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_64 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus268[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus268[0]),
                .input7(s_logisimBus247[1]),
                .input8(s_logisimBus241[0]),
                .result(s_logisimNet124));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_65 (.input1(s_logisimBus268[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus267[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimNet82),
                .result(s_logisimNet165));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_66 (.input1(s_logisimNet82),
                .input2(s_logisimBus268[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus268[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus267[0]),
                .result(s_logisimNet119));

   NAND_GATE_7_INPUTS #(.BubblesMask({3'b000, 4'h0}))
      GATES_67 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus268[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus268[0]),
                .input7(s_logisimBus241[1]),
                .result(s_logisimNet70));

   NAND_GATE_7_INPUTS #(.BubblesMask({3'b000, 4'h0}))
      GATES_68 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus268[2]),
                .input5(s_logisimBus267[1]),
                .input6(s_logisimBus268[0]),
                .input7(s_logisimBus247[0]),
                .result(s_logisimNet161));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_69 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .result(s_logisimNet168));

   OR_GATE_6_INPUTS #(.BubblesMask({2'b11, 4'hF}))
      GATES_70 (.input1(s_logisimNet70),
                .input2(s_logisimNet161),
                .input3(s_logisimNet168),
                .input4(s_logisimNet31),
                .input5(s_logisimNet78),
                .input6(s_logisimNet32),
                .result(s_logisimNet18));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_71 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus268[3]),
                .input4(s_logisimBus267[2]),
                .result(s_logisimNet31));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_72 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus268[0]),
                .input6(s_logisimBus247[1]),
                .input7(s_logisimBus247[0]),
                .input8(s_logisimNet127),
                .result(s_logisimNet113));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_73 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus267[3]),
                .input4(s_logisimBus268[2]),
                .result(s_logisimNet78));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_74 (.input1(s_logisimNet82),
                .input2(s_logisimBus267[4]),
                .input3(s_logisimBus267[3]),
                .input4(s_logisimBus268[1]),
                .result(s_logisimNet32));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_75 (.input1(s_logisimNet136),
                .input2(s_logisimNet82),
                .result(s_logisimNet147));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_76 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus267[2]),
                .input4(s_logisimBus268[1]),
                .input5(s_logisimBus247[1]),
                .input6(s_logisimBus247[0]),
                .input7(s_logisimNet66),
                .input8(s_logisimNet82),
                .result(s_logisimNet230));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_77 (.input1(s_logisimNet147),
                .input2(s_logisimNet230),
                .input3(s_logisimNet39),
                .result(s_logisimNet210));

   NAND_GATE_7_INPUTS #(.BubblesMask({3'b000, 4'h0}))
      GATES_78 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus267[3]),
                .input3(s_logisimBus267[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimBus247[1]),
                .input7(s_logisimNet82),
                .result(s_logisimNet39));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_79 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus268[0]),
                .input4(s_logisimBus247[1]),
                .input5(s_logisimBus247[0]),
                .input6(s_logisimNet82),
                .result(s_logisimNet89));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_80 (.input1(s_logisimBus267[4]),
                .input2(s_logisimBus268[3]),
                .input3(s_logisimBus268[2]),
                .input4(s_logisimBus267[1]),
                .input5(s_logisimBus267[0]),
                .input6(s_logisimBus241[1]),
                .input7(s_logisimBus241[0]),
                .input8(s_logisimNet5),
                .result(s_logisimNet112));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_81 (.input1(s_logisimNet81),
                .input2(s_logisimNet37),
                .input3(s_logisimNet218),
                .input4(s_logisimNet16),
                .input5(s_logisimNet66),
                .input6(s_logisimNet154),
                .result(s_logisimNet79));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_82 (.input1(s_logisimNet81),
                .input2(s_logisimNet37),
                .input3(s_logisimNet218),
                .input4(s_logisimNet16),
                .input5(s_logisimNet66),
                .input6(s_logisimNet75),
                .result(s_logisimNet93));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_83 (.clock(s_logisimNet123),
                 .d(s_logisimNet167),
                 .preset(1'b0),
                 .q(s_logisimNet26),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_84 (.clock(s_logisimNet123),
                 .d(s_logisimNet26),
                 .preset(1'b0),
                 .q(s_logisimNet258),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_85 (.clock(s_logisimNet123),
                 .d(s_logisimNet96),
                 .preset(1'b0),
                 .q(s_logisimNet204),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_86 (.clock(s_logisimNet123),
                 .d(s_logisimNet3),
                 .preset(1'b0),
                 .q(s_logisimNet242),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_87 (.clock(s_logisimNet123),
                 .d(s_logisimNet87),
                 .preset(1'b0),
                 .q(s_logisimNet259),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_88 (.clock(s_logisimNet123),
                 .d(s_logisimNet159),
                 .preset(1'b0),
                 .q(s_logisimNet43),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_89 (.clock(s_logisimNet123),
                 .d(s_logisimNet227),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet130),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_90 (.clock(s_logisimNet123),
                 .d(s_logisimNet205),
                 .preset(1'b0),
                 .q(s_logisimNet202),
                 .qBar(s_logisimNet84),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_91 (.clock(s_logisimNet123),
                 .d(s_logisimNet116),
                 .preset(1'b0),
                 .q(s_logisimNet135),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_92 (.clock(s_logisimNet123),
                 .d(s_logisimNet71),
                 .preset(1'b0),
                 .q(s_logisimNet191),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_93 (.clock(s_logisimNet123),
                 .d(s_logisimNet85),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet184),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_94 (.clock(s_logisimNet123),
                 .d(s_logisimNet195),
                 .preset(1'b0),
                 .q(s_logisimNet28),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_95 (.clock(s_logisimNet123),
                 .d(s_logisimNet146),
                 .preset(1'b0),
                 .q(s_logisimNet133),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_96 (.clock(s_logisimNet123),
                 .d(s_logisimNet177),
                 .preset(1'b0),
                 .q(s_logisimNet238),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_97 (.clock(s_logisimNet123),
                 .d(s_logisimNet92),
                 .preset(1'b0),
                 .q(s_logisimNet256),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_98 (.clock(s_logisimNet123),
                 .d(s_logisimNet119),
                 .preset(1'b0),
                 .q(s_logisimNet236),
                 .qBar(s_logisimNet125),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_99 (.clock(s_logisimNet123),
                 .d(s_logisimNet18),
                 .preset(1'b0),
                 .q(s_logisimNet218),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_100 (.clock(s_logisimNet123),
                  .d(s_logisimNet210),
                  .preset(1'b0),
                  .q(),
                  .qBar(s_logisimNet81),
                  .reset(1'b0),
                  .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   R81P   COMM_MIS_REG (.A(s_logisimBus262[0]),
                        .B(s_logisimBus262[1]),
                        .C(s_logisimBus262[2]),
                        .CP(s_logisimNet123),
                        .D(s_logisimBus262[3]),
                        .E(s_logisimNet181),
                        .F(s_logisimBus265[0]),
                        .G(s_logisimBus265[1]),
                        .H(1'b0),
                        .QA(s_logisimNet260),
                        .QAN(s_logisimNet139),
                        .QB(s_logisimNet211),
                        .QBN(s_logisimNet252),
                        .QC(s_logisimNet117),
                        .QCN(s_logisimNet201),
                        .QD(s_logisimBus267[3]),
                        .QDN(),
                        .QE(s_logisimNet185),
                        .QEN(s_logisimNet234),
                        .QF(s_logisimNet46),
                        .QFN(s_logisimNet171),
                        .QG(s_logisimNet225),
                        .QGN(s_logisimNet269),
                        .QH(),
                        .QHN());

   ND38GHP   C22 (.A(s_logisimBus247[0]),
                  .B(s_logisimBus247[1]),
                  .C(s_logisimBus267[0]),
                  .G(s_logisimNet137),
                  .Z0(s_logisimNet0),
                  .Z1(s_logisimNet157),
                  .Z2(),
                  .Z3(s_logisimNet67),
                  .Z4(s_logisimNet206),
                  .Z5(s_logisimNet158),
                  .Z6(s_logisimNet110),
                  .Z7(s_logisimNet100));

   SCAN_FF   CFETCH_FF (.CLK(s_logisimNet123),
                        .D(s_logisimNet57),
                        .Q(s_logisimNet57),
                        .QN(s_logisimNet263),
                        .TE(s_logisimNet150),
                        .TI(s_logisimNet84));

   ND38GHP   C24 (.A(s_logisimBus247[0]),
                  .B(s_logisimBus247[1]),
                  .C(s_logisimBus267[0]),
                  .G(s_logisimNet253),
                  .Z0(s_logisimNet102),
                  .Z1(s_logisimNet145),
                  .Z2(s_logisimNet131),
                  .Z3(s_logisimNet223),
                  .Z4(s_logisimNet214),
                  .Z5(s_logisimNet228),
                  .Z6(s_logisimNet266),
                  .Z7(s_logisimNet261));

   SCAN_WITH_RESET_N   FD25 (.CLK(s_logisimNet123),
                             .D(s_fidbo),
                             .Q(s_logisimNet16),
                             .QN(),
                             .R(s_logisimNet153),
                             .TE(s_logisimNet175),
                             .TI(s_logisimNet16));

endmodule
