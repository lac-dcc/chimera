// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC                                                      **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC( ACONDN,
                ALUCLK,
                CD_15_0,
                CFETCH,
                CLFFN,
                COND,
                CRY,
                CSALUI8,
                CSBIT20,
                CSBIT_15_0,
                CSCOND,
                CSECOND,
                CSLOOP,
                CSMIS0,
                CSRASEL_1_0,
                CSRBSEL_1_0,
                CSRB_3_0,
                CSTS_6_3,
                CSVECT,
                CSXRF3,
                DEEP,
                DZD,
                EWCAN,
                F11,
                F15,
                ILCSN,
                IRQ,
                LAA_3_0,
                LBA_3_0,
                LCZ,
                LCZN,
                LDIRV,
                LDLCN,
                LWCAN,
                MAPN,
                MA_12_0,
                MCLK,
                MI,
                MRN,
                OOD,
                OVF,
                PIL_3_0,
                PN,
                RESTR,
                RF_1_0,
                SC_6_3,
                SPARE,
                STP,
                TN,
                TRAPN,
                TVEC_3_0,
                UPN,
                WCSN,
                ZF );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] CD_15_0;
   input        CFETCH;
   input        CLFFN;
   input        CRY;
   input        CSALUI8;
   input        CSBIT20;
   input [15:0] CSBIT_15_0;
   input        CSCOND;
   input        CSECOND;
   input        CSLOOP;
   input        CSMIS0;
   input [1:0]  CSRASEL_1_0;
   input [1:0]  CSRBSEL_1_0;
   input [3:0]  CSRB_3_0;
   input [3:0]  CSTS_6_3;
   input        CSVECT;
   input        CSXRF3;
   input        EWCAN;
   input        F11;
   input        F15;
   input        ILCSN;
   input        IRQ;
   input        LCZ;
   input        LDIRV;
   input        LDLCN;
   input        LWCAN;
   input        MAPN;
   input        MCLK;
   input        MI;
   input        MRN;
   input        OVF;
   input [3:0]  PIL_3_0;
   input        RESTR;
   input        SPARE;
   input        STP;
   input        TRAPN;
   input [3:0]  TVEC_3_0;
   input        ZF;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        ACONDN;
   output        COND;
   output        DEEP;
   output        DZD;
   output [3:0]  LAA_3_0;
   output [3:0]  LBA_3_0;
   output        LCZN;
   output [12:0] MA_12_0;
   output        OOD;
   output        PN;
   output [1:0]  RF_1_0;
   output [3:0]  SC_6_3;
   output        TN;
   output        UPN;
   output        WCSN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [12:0] s_logisimBus118;
   wire [3:0]  s_logisimBus126;
   wire [1:0]  s_logisimBus138;
   wire [1:0]  s_logisimBus142;
   wire [15:0] s_logisimBus147;
   wire [11:0] s_logisimBus150;
   wire [1:0]  s_logisimBus153;
   wire [12:0] s_logisimBus159;
   wire [3:0]  s_logisimBus176;
   wire [6:0]  s_logisimBus195;
   wire [15:0] s_logisimBus20;
   wire [3:0]  s_logisimBus201;
   wire [3:0]  s_logisimBus204;
   wire [12:0] s_logisimBus21;
   wire [1:0]  s_logisimBus216;
   wire [3:0]  s_logisimBus222;
   wire [3:0]  s_logisimBus225;
   wire [3:0]  s_logisimBus231;
   wire [3:0]  s_logisimBus232;
   wire [3:0]  s_logisimBus236;
   wire [3:0]  s_logisimBus240;
   wire [3:0]  s_logisimBus251;
   wire [12:0] s_logisimBus32;
   wire [3:0]  s_logisimBus41;
   wire [12:0] s_logisimBus57;
   wire [3:0]  s_logisimBus6;
   wire [3:0]  s_logisimBus73;
   wire [12:0] s_logisimBus77;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
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
   wire        s_logisimNet11;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
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
   wire        s_logisimNet125;
   wire        s_logisimNet127;
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
   wire        s_logisimNet143;
   wire        s_logisimNet144;
   wire        s_logisimNet145;
   wire        s_logisimNet146;
   wire        s_logisimNet148;
   wire        s_logisimNet149;
   wire        s_logisimNet15;
   wire        s_logisimNet151;
   wire        s_logisimNet152;
   wire        s_logisimNet154;
   wire        s_logisimNet155;
   wire        s_logisimNet156;
   wire        s_logisimNet157;
   wire        s_logisimNet158;
   wire        s_logisimNet16;
   wire        s_logisimNet160;
   wire        s_logisimNet161;
   wire        s_logisimNet162;
   wire        s_logisimNet163;
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
   wire        s_logisimNet189;
   wire        s_logisimNet19;
   wire        s_logisimNet190;
   wire        s_logisimNet191;
   wire        s_logisimNet192;
   wire        s_logisimNet193;
   wire        s_logisimNet194;
   wire        s_logisimNet196;
   wire        s_logisimNet197;
   wire        s_logisimNet198;
   wire        s_logisimNet199;
   wire        s_logisimNet2;
   wire        s_logisimNet200;
   wire        s_logisimNet202;
   wire        s_logisimNet203;
   wire        s_logisimNet205;
   wire        s_logisimNet206;
   wire        s_logisimNet207;
   wire        s_logisimNet208;
   wire        s_logisimNet209;
   wire        s_logisimNet210;
   wire        s_logisimNet211;
   wire        s_logisimNet212;
   wire        s_logisimNet213;
   wire        s_logisimNet214;
   wire        s_logisimNet215;
   wire        s_logisimNet217;
   wire        s_logisimNet218;
   wire        s_logisimNet219;
   wire        s_logisimNet22;
   wire        s_logisimNet220;
   wire        s_logisimNet221;
   wire        s_logisimNet223;
   wire        s_logisimNet224;
   wire        s_logisimNet226;
   wire        s_logisimNet227;
   wire        s_logisimNet228;
   wire        s_logisimNet229;
   wire        s_logisimNet23;
   wire        s_logisimNet230;
   wire        s_logisimNet233;
   wire        s_logisimNet234;
   wire        s_logisimNet235;
   wire        s_logisimNet237;
   wire        s_logisimNet238;
   wire        s_logisimNet239;
   wire        s_logisimNet24;
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
   wire        s_logisimNet252;
   wire        s_logisimNet253;
   wire        s_logisimNet254;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
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
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet72;
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
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
   assign s_logisimBus150[0]  = s_logisimNet76;
   assign s_logisimBus150[10] = s_logisimNet46;
   assign s_logisimBus150[11] = s_logisimNet156;
   assign s_logisimBus150[1]  = s_logisimNet179;
   assign s_logisimBus150[2]  = s_logisimNet107;
   assign s_logisimBus150[3]  = s_logisimNet139;
   assign s_logisimBus150[4]  = s_logisimNet106;
   assign s_logisimBus150[5]  = s_logisimNet187;
   assign s_logisimBus150[6]  = s_logisimNet239;
   assign s_logisimBus150[7]  = s_logisimNet79;
   assign s_logisimBus150[8]  = s_logisimNet173;
   assign s_logisimBus150[9]  = s_logisimNet226;
   assign s_logisimBus231[0]  = s_logisimNet76;
   assign s_logisimBus231[1]  = s_logisimNet179;
   assign s_logisimBus231[2]  = s_logisimNet107;
   assign s_logisimBus231[3]  = s_logisimNet139;
   assign s_logisimBus251[0]  = s_logisimNet242;
   assign s_logisimBus251[1]  = s_logisimNet82;
   assign s_logisimBus251[2]  = s_logisimNet175;
   assign s_logisimBus251[3]  = s_logisimNet228;
   assign s_logisimNet106     = s_logisimBus147[4];
   assign s_logisimNet107     = s_logisimBus147[2];
   assign s_logisimNet139     = s_logisimBus147[3];
   assign s_logisimNet156     = s_logisimBus147[11];
   assign s_logisimNet173     = s_logisimBus147[8];
   assign s_logisimNet175     = s_logisimBus147[14];
   assign s_logisimNet179     = s_logisimBus147[1];
   assign s_logisimNet187     = s_logisimBus147[5];
   assign s_logisimNet226     = s_logisimBus147[9];
   assign s_logisimNet228     = s_logisimBus147[15];
   assign s_logisimNet239     = s_logisimBus147[6];
   assign s_logisimNet242     = s_logisimBus147[12];
   assign s_logisimNet46      = s_logisimBus147[10];
   assign s_logisimNet76      = s_logisimBus147[0];
   assign s_logisimNet79      = s_logisimBus147[7];
   assign s_logisimNet82      = s_logisimBus147[13];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus126[3:0]  = CSTS_6_3;
   assign s_logisimBus138[1:0]  = CSRASEL_1_0;
   assign s_logisimBus142[1:0]  = CSRBSEL_1_0;
   assign s_logisimBus147[15:0] = CSBIT_15_0;
   assign s_logisimBus204[3:0]  = PIL_3_0;
   assign s_logisimBus20[15:0]  = CD_15_0;
   assign s_logisimBus225[3:0]  = CSRB_3_0;
   assign s_logisimBus236[3:0]  = TVEC_3_0;
   assign s_logisimNet100       = CSECOND;
   assign s_logisimNet113       = LCZ;
   assign s_logisimNet114       = EWCAN;
   assign s_logisimNet120       = ALUCLK;
   assign s_logisimNet124       = CSXRF3;
   assign s_logisimNet129       = CLFFN;
   assign s_logisimNet143       = F15;
   assign s_logisimNet155       = LDLCN;
   assign s_logisimNet162       = OVF;
   assign s_logisimNet168       = MAPN;
   assign s_logisimNet172       = MCLK;
   assign s_logisimNet183       = CSBIT20;
   assign s_logisimNet189       = IRQ;
   assign s_logisimNet192       = CSMIS0;
   assign s_logisimNet206       = CSCOND;
   assign s_logisimNet219       = CRY;
   assign s_logisimNet230       = SPARE;
   assign s_logisimNet248       = RESTR;
   assign s_logisimNet253       = STP;
   assign s_logisimNet254       = ILCSN;
   assign s_logisimNet26        = ZF;
   assign s_logisimNet27        = F11;
   assign s_logisimNet44        = CSALUI8;
   assign s_logisimNet53        = MI;
   assign s_logisimNet56        = MRN;
   assign s_logisimNet69        = TRAPN;
   assign s_logisimNet70        = CSLOOP;
   assign s_logisimNet8         = LDIRV;
   assign s_logisimNet81        = LWCAN;
   assign s_logisimNet92        = CFETCH;
   assign s_logisimNet93        = CSVECT;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ACONDN  = s_logisimNet37;
   assign COND    = s_logisimNet116;
   assign DEEP    = s_logisimNet148;
   assign DZD     = s_logisimNet2;
   assign LAA_3_0 = s_logisimBus6[3:0];
   assign LBA_3_0 = s_logisimBus222[3:0];
   assign LCZN    = s_logisimNet43;
   assign MA_12_0 = s_logisimBus77[12:0];
   assign OOD     = s_logisimNet29;
   assign PN      = s_logisimNet99;
   assign RF_1_0  = s_logisimBus153[1:0];
   assign SC_6_3  = s_logisimBus73[3:0];
   assign TN      = s_logisimNet90;
   assign UPN     = s_logisimNet17;
   assign WCSN    = s_logisimNet221;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet188  =  1'b1;


   // Power
   assign  s_logisimNet68  =  1'b1;


   // Ground
   assign  s_logisimNet31  =  1'b0;


   // Ground
   assign  s_logisimNet13  =  1'b0;


   // Ground
   assign  s_logisimNet45  =  1'b0;


   // NOT Gate
   assign s_logisimNet48 = ~s_logisimNet70;

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimNet59;

   // NOT Gate
   assign s_logisimNet146 = ~s_logisimNet100;

   // NOT Gate
   assign s_logisimNet34 = ~s_logisimNet17;

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimNet172;

   // NOT Gate
   assign s_logisimNet137 = ~s_logisimNet172;

   // NOT Gate
   assign s_logisimNet224 = ~s_logisimNet43;

   // NOT Gate
   assign s_logisimBus73[3] = ~s_logisimNet196;

   // NOT Gate
   assign s_logisimBus73[2] = ~s_logisimNet243;

   // NOT Gate
   assign s_logisimBus73[1] = ~s_logisimNet60;

   // NOT Gate
   assign s_logisimNet154 = ~s_logisimNet129;

   // NOT Gate
   assign s_logisimBus6[0] = ~s_logisimNet161;

   // NOT Gate
   assign s_logisimBus6[1] = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimBus6[2] = ~s_logisimNet212;

   // NOT Gate
   assign s_logisimBus6[3] = ~s_logisimNet128;

   // NOT Gate
   assign s_logisimBus222[0] = ~s_logisimNet197;

   // NOT Gate
   assign s_logisimBus222[1] = ~s_logisimNet109;

   // NOT Gate
   assign s_logisimBus222[2] = ~s_logisimNet244;

   // NOT Gate
   assign s_logisimBus222[3] = ~s_logisimNet177;

   // NOT Gate
   assign s_logisimNet28 = ~s_logisimNet129;

   // NOT Gate
   assign s_logisimNet38 = ~s_logisimNet200;

   // NOT Gate
   assign s_logisimNet223 = ~s_logisimBus138[1];

   // NOT Gate
   assign s_logisimNet247 = ~s_logisimNet124;

   // NOT Gate
   assign s_logisimNet123 = ~s_logisimNet93;

   // NOT Gate
   assign s_logisimNet61 = ~s_logisimNet254;

   // NOT Gate
   assign s_logisimNet200 = ~s_logisimNet61;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus216[1]),
               .input2(s_logisimBus216[0]),
               .result(s_logisimNet47));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet47),
               .input2(s_logisimNet38),
               .input3(s_logisimNet188),
               .result(s_logisimNet205));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet22),
               .input2(s_logisimNet202),
               .input3(s_logisimNet28),
               .result(s_logisimNet95));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet55),
               .input2(s_logisimNet34),
               .result(s_logisimNet164));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_5 (.input1(s_logisimNet200),
               .input2(s_logisimNet48),
               .input3(s_logisimNet146),
               .result(s_logisimNet121));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_6 (.input1(s_logisimNet23),
               .input2(s_logisimNet48),
               .input3(s_logisimNet200),
               .input4(s_logisimNet100),
               .result(s_logisimNet103));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_7 (.input1(s_logisimNet164),
               .input2(s_logisimNet171),
               .input3(s_logisimNet68),
               .result(s_logisimNet99));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet23),
               .input2(s_logisimNet121),
               .result(s_logisimNet15));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet15),
               .input2(s_logisimBus126[3]),
               .result(s_logisimNet132));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet103),
                .input2(s_logisimBus201[3]),
                .result(s_logisimNet252));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet15),
                .input2(s_logisimBus126[2]),
                .result(s_logisimNet191));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet103),
                .input2(s_logisimBus201[2]),
                .result(s_logisimNet98));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet15),
                .input2(s_logisimBus126[1]),
                .result(s_logisimNet235));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet103),
                .input2(s_logisimBus201[1]),
                .result(s_logisimNet166));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet15),
                .input2(s_logisimBus126[0]),
                .result(s_logisimNet33));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet103),
                .input2(s_logisimBus201[0]),
                .result(s_logisimNet214));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet95),
                .input2(s_logisimNet74),
                .result(s_logisimNet43));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_18 (.input1(s_logisimNet200),
                .input2(s_logisimNet23),
                .input3(s_logisimNet70),
                .result(s_logisimNet4));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_19 (.input1(s_logisimNet132),
                .input2(s_logisimNet252),
                .result(s_logisimNet101));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimNet191),
                .input2(s_logisimNet98),
                .result(s_logisimNet169));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_21 (.input1(s_logisimNet235),
                .input2(s_logisimNet166),
                .result(s_logisimNet127));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_22 (.input1(s_logisimNet33),
                .input2(s_logisimNet214),
                .result(s_logisimNet67));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_23 (.input1(s_logisimNet200),
                .input2(s_logisimNet101),
                .result(s_logisimNet196));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_24 (.input1(s_logisimNet4),
                .input2(s_logisimNet169),
                .result(s_logisimNet243));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_25 (.input1(s_logisimNet51),
                .input2(s_logisimNet26),
                .result(s_logisimNet112));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_26 (.input1(s_logisimNet112),
                .input2(s_logisimNet2),
                .input3(s_logisimNet31),
                .result(s_logisimNet193));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_27 (.input1(s_logisimNet29),
                .input2(s_logisimNet53),
                .result(s_logisimNet157));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimBus138[0]),
                .input2(s_logisimNet124),
                .result(s_logisimNet217));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_29 (.input1(s_logisimNet124),
                .input2(s_logisimNet223),
                .result(s_logisimNet135));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_30 (.input1(s_logisimNet247),
                .input2(s_logisimBus195[6]),
                .result(s_logisimNet234));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_logisimNet200),
                .input2(s_logisimNet114),
                .result(s_logisimNet186));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_32 (.clock(s_logisimNet172),
                 .d(s_logisimNet23),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet116),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_33 (.clock(s_logisimNet172),
                 .d(s_logisimNet70),
                 .preset(1'b0),
                 .q(s_logisimNet171),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(1))
      MEMORY_34 (.clock(s_logisimNet172),
                 .d(s_logisimNet67),
                 .preset(1'b0),
                 .q(s_logisimNet60),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_35 (.clock(s_logisimNet172),
                 .d(s_logisimNet26),
                 .preset(1'b0),
                 .q(s_logisimNet51),
                 .qBar(),
                 .reset(s_logisimNet154),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_36 (.clock(s_logisimNet172),
                 .d(s_logisimNet44),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet149),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(1))
      MEMORY_37 (.clock(s_logisimNet172),
                 .d(s_logisimNet127),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimBus73[0]),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_38 (.clock(s_logisimNet172),
                 .d(s_logisimNet135),
                 .preset(1'b0),
                 .q(s_logisimNet208),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_39 (.clock(s_logisimNet172),
                 .d(s_logisimNet217),
                 .preset(1'b0),
                 .q(s_logisimNet185),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_MIC_INCOUNT   MIC_INCOUNT (.CD0(s_logisimBus20[0]),
                                  .CD1(s_logisimBus20[1]),
                                  .CSWAN0(s_logisimBus216[0]),
                                  .CSWAN1(s_logisimBus216[1]),
                                  .EC(s_logisimNet38),
                                  .LWCAN(s_logisimNet81),
                                  .MCLK(s_logisimNet172),
                                  .MRN(s_logisimNet56));

   M169C   LC_HI (.A(s_logisimBus20[4]),
                  .B(s_logisimBus20[5]),
                  .C(s_logisimBus20[5]),
                  .CON(s_logisimNet55),
                  .CP(s_logisimNet172),
                  .D(s_logisimBus20[5]),
                  .NL(s_logisimNet155),
                  .PN(s_logisimNet99),
                  .QA(s_logisimNet22),
                  .QB(s_logisimNet202),
                  .QC(s_logisimNet215),
                  .QD(s_logisimNet59),
                  .TN(s_logisimNet90),
                  .UP(s_logisimNet34));

   M169C   LC_LO (.A(s_logisimBus20[0]),
                  .B(s_logisimBus20[1]),
                  .C(s_logisimBus20[2]),
                  .CON(s_logisimNet90),
                  .CP(s_logisimNet172),
                  .D(s_logisimBus20[3]),
                  .NL(s_logisimNet155),
                  .PN(s_logisimNet99),
                  .QA(s_logisimBus240[0]),
                  .QB(s_logisimBus240[1]),
                  .QC(s_logisimBus240[2]),
                  .QD(s_logisimBus240[3]),
                  .TN(s_logisimNet45),
                  .UP(s_logisimNet34));

   MUX21L   M_RF1 (.A(s_logisimNet208),
                   .B(s_logisimBus216[1]),
                   .S(s_logisimNet186),
                   .ZN(s_logisimBus153[1]));

   MUX21L   M_RF0 (.A(s_logisimNet185),
                   .B(s_logisimBus216[0]),
                   .S(s_logisimNet186),
                   .ZN(s_logisimBus153[0]));

   MUX34P   ILC_MUX (.A(s_logisimNet192),
                     .B(s_logisimNet123),
                     .D00(s_logisimBus195[0]),
                     .D01(s_logisimBus195[1]),
                     .D02(s_logisimBus195[2]),
                     .D03(s_logisimBus195[3]),
                     .D10(s_logisimBus6[0]),
                     .D11(s_logisimBus6[1]),
                     .D12(s_logisimBus6[2]),
                     .D13(s_logisimBus6[3]),
                     .D20(s_logisimBus231[0]),
                     .D21(s_logisimBus231[1]),
                     .D22(s_logisimBus231[2]),
                     .D23(s_logisimBus231[3]),
                     .Z0(s_logisimBus232[0]),
                     .Z1(s_logisimBus232[1]),
                     .Z2(s_logisimBus232[2]),
                     .Z3(s_logisimBus232[3]));

   L8   IRLATCH (.A(s_logisimBus20[0]),
                 .B(s_logisimBus20[1]),
                 .C(s_logisimBus20[2]),
                 .D(s_logisimBus20[3]),
                 .E(s_logisimBus20[4]),
                 .F(s_logisimBus20[5]),
                 .G(s_logisimBus20[6]),
                 .H(1'b0),
                 .L(s_logisimNet8),
                 .QA(s_logisimBus195[0]),
                 .QAN(),
                 .QB(s_logisimBus195[1]),
                 .QBN(),
                 .QC(s_logisimBus195[2]),
                 .QCN(),
                 .QD(s_logisimBus195[3]),
                 .QDN(),
                 .QE(s_logisimBus195[4]),
                 .QEN(),
                 .QF(s_logisimBus195[5]),
                 .QFN(),
                 .QG(s_logisimBus195[6]),
                 .QGN(),
                 .QH(),
                 .QHN());

   CGA_MIC_CONDREG   CONDREG (.ACONDN(s_logisimNet37),
                              .CSBIT_11_0(s_logisimBus150[11:0]),
                              .CSSCOND(s_logisimNet206),
                              .FS_6_3(s_logisimBus201[3:0]),
                              .LCC_3_0(s_logisimBus176[3:0]),
                              .LCSN(s_logisimNet200),
                              .MCLK(s_logisimNet172),
                              .TSEL_3_0(s_logisimBus41[3:0]));

   MUX41P   M_LAA_2 (.A(s_logisimBus138[0]),
                     .B(s_logisimBus138[1]),
                     .D0(s_logisimBus251[1]),
                     .D1(s_logisimBus204[1]),
                     .D2(s_logisimBus195[5]),
                     .D3(s_logisimBus240[2]),
                     .Z(s_logisimNet71));

   CMP4   LC_CMP (.A0(s_logisimBus176[0]),
                  .A1(s_logisimBus176[1]),
                  .A2(s_logisimBus176[2]),
                  .A3(s_logisimBus176[3]),
                  .AEB(s_logisimNet74),
                  .AGB(),
                  .ALB(),
                  .B0(s_logisimBus240[0]),
                  .B1(s_logisimBus240[1]),
                  .B2(s_logisimBus240[2]),
                  .B3(s_logisimBus240[3]));

   CGA_MIC_IINC   MIC_IINC (.CIN(s_logisimNet205),
                            .IW_12_0(s_logisimBus57[12:0]),
                            .NEXT_12_0(s_logisimBus118[12:0]));

   MUX41P   M_LAA_1 (.A(s_logisimBus138[0]),
                     .B(s_logisimBus138[1]),
                     .D0(s_logisimBus251[2]),
                     .D1(s_logisimBus204[2]),
                     .D2(s_logisimBus195[4]),
                     .D3(s_logisimBus240[1]),
                     .Z(s_logisimNet40));

   CGA_MIC_STACK   MIC_STACK (.DEEP(s_logisimNet148),
                              .MCLK(s_logisimNet172),
                              .NEXT_12_0(s_logisimBus118[12:0]),
                              .RET_12_0(s_logisimBus32[12:0]),
                              .SC3(1'b0),
                              .SC4(1'b0),
                              .SCLKN(s_logisimNet137));

   MUX41P   M_LAA_0 (.A(s_logisimBus138[0]),
                     .B(s_logisimBus138[1]),
                     .D0(s_logisimBus251[3]),
                     .D1(s_logisimBus204[3]),
                     .D2(s_logisimBus195[3]),
                     .D3(s_logisimBus240[0]),
                     .Z(s_logisimNet65));

   R41P   LAA_REG (.A(s_logisimNet65),
                   .B(s_logisimNet40),
                   .C(s_logisimNet71),
                   .CP(s_logisimNet172),
                   .D(s_logisimNet190),
                   .QA(),
                   .QAN(s_logisimNet161),
                   .QB(),
                   .QBN(s_logisimNet25),
                   .QC(),
                   .QCN(s_logisimNet212),
                   .QD(),
                   .QDN(s_logisimNet128));

   CGA_MIC_MASEL   MIC_MASEL (.CSBIT20(s_logisimNet183),
                              .CSBIT_11_0(s_logisimBus150[11:0]),
                              .IW_12_0(s_logisimBus57[12:0]),
                              .JMP_3_0(s_logisimBus232[3:0]),
                              .MCLK(s_logisimNet172),
                              .MCLKN(s_logisimNet16),
                              .MRN(s_logisimNet56),
                              .NEXT_12_0(s_logisimBus118[12:0]),
                              .RET_12_0(s_logisimBus32[12:0]),
                              .SC5(s_logisimBus73[2]),
                              .SC6(s_logisimBus73[3]),
                              .W_12_0(s_logisimBus159[12:0]));

   SCAN_WITH_SET_N   OOD_FF (.CLK(s_logisimNet172),
                             .D(s_logisimNet157),
                             .Q(s_logisimNet97),
                             .QN(s_logisimNet29),
                             .S(s_logisimNet129),
                             .TE(s_logisimNet149),
                             .TI(s_logisimNet97));

   SCAN_WITH_SET_N   DZD_FF (.CLK(s_logisimNet172),
                             .D(s_logisimNet193),
                             .Q(s_logisimNet83),
                             .QN(s_logisimNet2),
                             .S(s_logisimNet129),
                             .TE(s_logisimNet149),
                             .TI(s_logisimNet83));

   MUX41P   M_LBA_3 (.A(s_logisimBus142[0]),
                     .B(s_logisimBus142[1]),
                     .D0(s_logisimBus225[3]),
                     .D1(s_logisimNet13),
                     .D2(s_logisimNet13),
                     .D3(s_logisimBus240[3]),
                     .Z(s_logisimNet3));

   MUX41P   M_LBA_2 (.A(s_logisimBus142[0]),
                     .B(s_logisimBus142[1]),
                     .D0(s_logisimBus225[2]),
                     .D1(s_logisimBus195[2]),
                     .D2(s_logisimBus195[5]),
                     .D3(s_logisimBus240[2]),
                     .Z(s_logisimNet63));

   CGA_MIC_WCAREG   MIC_WCAREG (.CD_15_0(s_logisimBus20[15:0]),
                                .LCSN(s_logisimNet200),
                                .LWCAN(s_logisimNet81),
                                .MCLK(s_logisimNet172),
                                .WCA_12_0(s_logisimBus21[12:0]),
                                .WCSN(s_logisimNet221));

   MUX41P   M_LBA_1 (.A(s_logisimBus142[0]),
                     .B(s_logisimBus142[1]),
                     .D0(s_logisimBus225[1]),
                     .D1(s_logisimBus195[1]),
                     .D2(s_logisimBus195[4]),
                     .D3(s_logisimBus240[1]),
                     .Z(s_logisimNet0));

   CGA_MIC_IPOS   MIC_IPOS (.CD_15_0(s_logisimBus20[15:0]),
                            .EWCAN(s_logisimNet114),
                            .MAPN(s_logisimNet168),
                            .MA_12_0(s_logisimBus77[12:0]),
                            .TRAPN(s_logisimNet69),
                            .TVEC_3_0(s_logisimBus236[3:0]),
                            .WCA_12_0(s_logisimBus21[12:0]),
                            .W_12_0(s_logisimBus159[12:0]));

   MUX41P   M_LBA_0 (.A(s_logisimBus142[0]),
                     .B(s_logisimBus142[1]),
                     .D0(s_logisimBus225[0]),
                     .D1(s_logisimBus195[0]),
                     .D2(s_logisimBus195[3]),
                     .D3(s_logisimBus240[0]),
                     .Z(s_logisimNet24));

   R41P   LBA_REG (.A(s_logisimNet24),
                   .B(s_logisimNet0),
                   .C(s_logisimNet63),
                   .CP(s_logisimNet172),
                   .D(s_logisimNet3),
                   .QA(),
                   .QAN(s_logisimNet197),
                   .QB(),
                   .QBN(s_logisimNet109),
                   .QC(),
                   .QCN(s_logisimNet244),
                   .QD(),
                   .QDN(s_logisimNet177));

   CGA_MIC_CSEL   CSEL (.ALUCLK(s_logisimNet120),
                        .CFETCH(s_logisimNet92),
                        .COND(s_logisimNet116),
                        .CONDN(s_logisimNet23),
                        .CRY(s_logisimNet219),
                        .DZD(s_logisimNet2),
                        .F11(s_logisimNet27),
                        .F15(s_logisimNet143),
                        .IRQ(s_logisimNet189),
                        .LCZ(s_logisimNet113),
                        .OOD(s_logisimNet29),
                        .OVF(s_logisimNet162),
                        .RESTR(s_logisimNet248),
                        .SPARE(s_logisimNet230),
                        .STP(s_logisimNet253),
                        .TSEL_3_0(s_logisimBus41[3:0]),
                        .ZF(s_logisimNet26));

   MUX41P   M_LAA_3 (.A(s_logisimBus138[0]),
                     .B(s_logisimBus138[1]),
                     .D0(s_logisimBus251[0]),
                     .D1(s_logisimBus204[0]),
                     .D2(s_logisimNet234),
                     .D3(s_logisimBus240[3]),
                     .Z(s_logisimNet190));

endmodule
