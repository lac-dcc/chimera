// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 DGA (Decode Gate Array)                                         **
** DGA (Decode Gate Array)                                               **
**                                                                       ** 
** Page 16 DECODE - DECODE_DGA_COMM - Sheet 1 of 4                       **                   
** Page 17 DECODE - DECODE_DGA_COMM - Sheet 2 of 4                       ** 
** Page 18 DECODE - DECODE_DGA_COMM - Sheet 3 of 4                       ** 
** Page 19 DECODE - DECODE_DGA_COMM - Sheet 4 of 4                       ** 
**                                                                       ** 
** Last reviewed: 11-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/

module DECODE_DGA_COMM( 
   input       BRKN,
   input       CLEAR,
   input       CLK1,
   input       CLK2,
   input       CLK3,
   input [4:0] CSCOMM_4_0,
   input [1:0] CSMIS_1_0,
   input       DAPN,
   input       EORFN,
   input       HITN,
   input       IDBI2,
   input       IDBI5,
   input       IDBI7,
   input       LCSN,
   input       LSHADOW,
   input       PONI,
   input       UCLK,

   output CA10,
   output CCLRN,
   output CEUARTN,
   output CLRTIN,
   output DTN,
   output DVACCN,
   output ECREQ,
   output EMCLN,
   output EMPIDN,
   output ESTOFN,
   output FETCH,
   output FMISS,
   output FORMN,
   output IORQN,
   output LDPANCN,
   output LHIT,
   output MREQ,
   output RESET,
   output RTN,
   output RWCSN,
   output SHORTN,
   output SIOCN,
   output SLOWN,
   output SSEMAN,
   output SSTOPN,
   output STARTN,
   output STOCN,
   output WCHIMN,
   output WRITE   
);

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
 
   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus1;
   wire [4:0] s_cscomm_4_0;
   wire       s_logisimNet0;
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
   
   wire       s_logisimNet113;
   wire       s_logisimNet114;
   wire       s_logisimNet115;
   wire       s_logisimNet116;
   wire       s_logisimNet117;
   wire       s_logisimNet118;
   wire       s_logisimNet119;
   wire       s_logisimNet12;
   wire       s_logisimNet120;
   
   wire       s_logisimNet122;
   wire       s_logisimNet123;
   wire       s_logisimNet124;
   wire       s_logisimNet125;
   wire       s_logisimNet126;
   wire       s_logisimNet127;
   wire       s_logisimNet128;
   
   wire       s_logisimNet13;
   wire       s_logisimNet130;
   wire       s_logisimNet131;
   wire       s_logisimNet132;
   wire       s_logisimNet133;
   wire       s_logisimNet134;
   wire       s_logisimNet135;
   wire       s_logisimNet136;
   
   
   wire       s_logisimNet139;
   wire       s_logisimNet14;
   wire       s_logisimNet140;
   wire       s_logisimNet141;
   wire       s_logisimNet142;
   wire       s_logisimNet143;
   wire       s_logisimNet144;
   wire       s_logisimNet145;
   
   wire       s_logisimNet147;
   wire       s_logisimNet148;
   wire       s_logisimNet149;
   wire       s_logisimNet15;
   wire       s_logisimNet150;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
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
   wire       s_logisimNet59;
   wire       s_logisimNet6;
   wire       s_logisimNet60;
   wire       s_logisimNet61;
   wire       s_logisimNet62;
   wire       s_logisimNet63;
   wire       s_logisimNet64;
   wire       s_logisimNet65;
   wire       s_logisimNet66;
   wire       s_logisimNet67;
   wire       s_logisimNet69;
   wire       s_logisimNet7;
   
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
   assign s_logisimBus1[1:0]  = CSMIS_1_0;
   assign s_cscomm_4_0[4:0] = CSCOMM_4_0;
   assign s_logisimNet114     = EORFN;
   assign s_logisimNet135     = DAPN;
   assign s_logisimNet139     = CLK1;
   assign s_logisimNet141     = LCSN;
   assign s_logisimNet23      = BRKN;
   assign s_logisimNet28      = CLK3;
   assign s_logisimNet30      = CLK2;
   assign s_logisimNet4       = LSHADOW;
   assign s_logisimNet48      = PONI;
   assign s_logisimNet71      = UCLK;
   assign s_logisimNet72      = IDBI7;
   assign s_logisimNet83      = CLEAR;
   assign s_logisimNet86      = IDBI2;
   assign s_logisimNet94      = HITN;
   assign s_logisimNet99      = IDBI5;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CA10    = s_logisimNet124;
   assign CCLRN   = s_logisimNet147;
   assign CEUARTN = s_logisimNet96;
   assign CLRTIN  = s_logisimNet103;
   assign DTN     = s_logisimNet34;
   assign DVACCN  = s_logisimNet26;
   assign ECREQ   = s_logisimNet67;
   assign EMCLN   = s_logisimNet53;
   assign EMPIDN  = s_logisimNet128;
   assign ESTOFN  = s_logisimNet116;
   assign FETCH   = s_logisimNet57;
   assign FMISS   = s_logisimNet49;
   assign FORMN   = s_logisimNet91;
   assign IORQN   = s_logisimNet117;
   assign LDPANCN = s_logisimNet126;
   assign LHIT    = s_logisimNet110;
   assign MREQ    = s_logisimNet130;
   assign RESET   = s_logisimNet29;
   assign RTN     = s_logisimNet102;
   assign RWCSN   = s_logisimNet82;
   assign SHORTN  = s_logisimNet52;
   assign SIOCN   = s_logisimNet123;
   assign SLOWN   = s_logisimNet111;
   assign SSEMAN  = s_logisimNet65;
   assign SSTOPN  = s_logisimNet85;
   assign STARTN  = s_logisimNet144;
   assign STOCN   = s_logisimNet14;
   assign WCHIMN  = s_logisimNet122;
   assign WRITE   = s_logisimNet148;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet73  =  1'b1;


   // Power
   assign  s_logisimNet120  =  1'b1;


   // Ground
   assign  s_logisimNet88  =  1'b0;


   // Ground
   assign  s_logisimNet105  =  1'b0;


   // Ground
   assign  s_logisimNet22  =  1'b0;


   // Ground
   assign  s_logisimNet75  =  1'b0;


   // Power
   assign  s_logisimNet87  =  1'b1;


   // Ground
   assign  s_logisimNet66  =  1'b0;


   // NOT Gate: A241
   assign s_logisimNet100 = ~s_logisimNet4;

   // NOT Gate: A240
   assign s_logisimNet50 = ~s_logisimNet135;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet114;

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet44;

   // NOT Gate
   assign s_logisimNet62 = ~s_logisimNet83;

   // NOT Gate
   assign s_logisimNet118 = ~s_cscomm_4_0[0];

   // NOT Gate
   assign s_logisimNet140 = ~s_cscomm_4_0[1];

   // NOT Gate
   assign s_logisimNet134 = ~s_cscomm_4_0[2];

   // NOT Gate
   assign s_logisimNet143 = ~s_cscomm_4_0[3];

   // NOT Gate
   assign s_logisimNet132 = ~s_cscomm_4_0[4];

   // NOT Gate
   assign s_logisimNet145 = ~s_logisimBus1[0];

   // NOT Gate
   assign s_logisimNet109 = ~s_logisimBus1[1];

   // NOT Gate: A230
   assign s_logisimNet78 = ~s_logisimNet48;

   // NOT Gate
   assign s_logisimNet40 = ~s_logisimNet28;

   // NOT Gate
   assign s_logisimNet131 = ~s_logisimNet83;

   // NOT Gate: A197
   assign s_logisimNet21 = ~s_logisimNet28;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      A206 (.input1(s_logisimNet133),
            .input2(s_logisimNet6),
            .result(s_logisimNet47));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A212 (.input1(s_logisimNet51),
            .input2(s_logisimBus1[1]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_cscomm_4_0[3]),
            .input5(s_cscomm_4_0[2]),
            .input6(s_cscomm_4_0[1]),
            .input7(s_cscomm_4_0[0]),
            .input8(s_logisimNet141),
            .result(s_logisimNet9));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A193 (.input1(s_logisimNet109),
            .input2(s_logisimBus1[0]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_logisimNet140),
            .input7(s_cscomm_4_0[0]),
            .input8(s_logisimNet141),
            .result(s_logisimNet6));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A156 (.input1(s_cscomm_4_0[4]),
            .input2(s_logisimNet143),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet141),
            .result(s_logisimNet36));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A149 (.input1(s_logisimNet36),
            .input2(s_logisimNet58),
            .input3(s_logisimNet64),
            .input4(s_logisimNet39),
            .input5(s_logisimNet16),
            .input6(s_logisimNet20),
            .result(s_logisimNet25));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A150 (.input1(s_cscomm_4_0[4]),
            .input2(s_logisimNet143),
            .input3(s_cscomm_4_0[1]),
            .input4(s_cscomm_4_0[0]),
            .input5(s_logisimNet141),
            .result(s_logisimNet16));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A211 (.input1(s_logisimNet109),
            .input2(s_logisimBus1[0]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_cscomm_4_0[3]),
            .input5(s_cscomm_4_0[2]),
            .input6(s_cscomm_4_0[1]),
            .input7(s_logisimNet118),
            .input8(s_logisimNet141),
            .result(s_logisimNet41));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A199 (.input1(s_logisimNet132),
            .input2(s_logisimNet143),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet140),
            .input5(s_cscomm_4_0[0]),
            .input6(s_logisimNet141),
            .result(s_logisimNet115));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A155 (.input1(s_cscomm_4_0[4]),
            .input2(s_cscomm_4_0[3]),
            .input3(s_logisimNet134),
            .input4(s_logisimNet140),
            .input5(s_logisimNet141),
            .result(s_logisimNet20));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A191 (.input1(s_logisimNet132),
            .input2(s_cscomm_4_0[3]),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet140),
            .input5(s_logisimNet118),
            .input6(s_logisimNet141),
            .result(s_logisimNet17));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A152 (.input1(s_cscomm_4_0[4]),
            .input2(s_cscomm_4_0[3]),
            .input3(s_logisimNet140),
            .input4(s_logisimNet118),
            .input5(s_logisimNet141),
            .result(s_logisimNet39));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A222 (.input1(s_logisimBus1[0]),
            .input2(s_logisimNet132),
            .input3(s_cscomm_4_0[2]),
            .input4(s_cscomm_4_0[1]),
            .input5(s_logisimNet141),
            .result(s_logisimNet3));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A158 (.input1(s_logisimNet24),
            .input2(s_logisimNet13),
            .input3(s_logisimNet64),
            .result(s_logisimNet101));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A185 (.input1(s_cscomm_4_0[4]),
            .input2(s_cscomm_4_0[3]),
            .input3(s_cscomm_4_0[2]),
            .input4(s_cscomm_4_0[1]),
            .input5(s_logisimNet118),
            .input6(s_logisimBus1[0]),
            .result(s_logisimNet11));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A242 (.input1(s_logisimNet23),
            .input2(s_logisimNet100),
            .input3(s_logisimNet19),
            .result(s_logisimNet55));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A147 (.input1(s_cscomm_4_0[4]),
            .input2(s_cscomm_4_0[3]),
            .input3(s_logisimNet134),
            .input4(s_cscomm_4_0[1]),
            .input5(s_logisimNet141),
            .result(s_logisimNet24));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A223 (.input1(s_logisimBus1[0]),
            .input2(s_logisimNet143),
            .input3(s_logisimNet134),
            .input4(s_logisimNet140),
            .input5(s_logisimNet141),
            .result(s_logisimNet108));

   NAND_GATE #(.BubblesMask(2'b00))
      A237 (.input1(s_logisimNet148),
            .input2(s_logisimNet71),
            .result(s_logisimNet44));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A198 (.input1(s_logisimNet132),
            .input2(s_logisimNet143),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet140),
            .input5(s_cscomm_4_0[0]),
            .result(s_logisimNet125));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A200 (.input1(s_logisimNet11),
            .input2(s_logisimNet125),
            .input3(s_logisimNet141),
            .result(s_logisimNet60));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A141 (.input1(s_cscomm_4_0[4]),
            .input2(s_cscomm_4_0[3]),
            .input3(s_logisimNet140),
            .input4(s_logisimNet141),
            .result(s_logisimNet13));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A228 (.input1(s_logisimBus1[1]),
            .input2(s_logisimNet143),
            .input3(s_logisimNet134),
            .input4(s_logisimNet140),
            .input5(s_logisimNet141),
            .result(s_logisimNet79));

   AND_GATE #(.BubblesMask(2'b00))
      A246 (.input1(s_logisimNet4),
            .input2(s_logisimNet43),
            .result(s_logisimNet116));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A233 (.input1(s_logisimNet43),
            .input2(s_logisimNet94),
            .input3(s_logisimNet55),
            .result(s_logisimNet89));

   NAND_GATE #(.BubblesMask(2'b00))
      A238 (.input1(s_logisimNet148),
            .input2(s_logisimNet55),
            .result(s_logisimNet107));

   NAND_GATE #(.BubblesMask(2'b00))
      A235 (.input1(s_logisimNet19),
            .input2(s_logisimNet113),
            .result(s_logisimNet97));

   NAND_GATE #(.BubblesMask(2'b00))
      A245 (.input1(s_logisimNet43),
            .input2(s_logisimNet100),
            .result(s_logisimNet38));

   NAND_GATE #(.BubblesMask(2'b00))
      A243 (.input1(s_logisimNet113),
            .input2(s_logisimNet50),
            .result(s_logisimNet59));

   NAND_GATE #(.BubblesMask(2'b00))
      A209 (.input1(s_logisimNet19),
            .input2(s_logisimNet90),
            .result(s_logisimNet128));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A162 (.input1(s_logisimNet36),
            .input2(s_logisimNet16),
            .input3(s_logisimNet58),
            .result(s_logisimNet33));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A239 (.input1(s_logisimNet89),
            .input2(s_logisimNet107),
            .input3(s_logisimNet97),
            .result(s_logisimNet67));

   NAND_GATE #(.BubblesMask(2'b00))
      A244 (.input1(s_logisimNet38),
            .input2(s_logisimNet59),
            .result(s_logisimNet14));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A183 (.input1(s_logisimNet132),
            .input2(s_cscomm_4_0[3]),
            .input3(s_logisimNet134),
            .input4(s_cscomm_4_0[1]),
            .input5(s_logisimNet118),
            .input6(s_logisimNet141),
            .result(s_logisimNet0));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A145 (.input1(s_logisimNet77),
            .input2(s_logisimNet109),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_cscomm_4_0[1]),
            .input7(s_logisimNet118),
            .input8(s_logisimNet141),
            .result(s_logisimNet64));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A216 (.input1(s_logisimNet51),
            .input2(s_logisimNet3),
            .input3(s_logisimNet108),
            .input4(s_logisimNet79),
            .input5(s_logisimNet35),
            .input6(s_logisimNet106),
            .input7(s_logisimNet10),
            .input8(s_logisimNet93),
            .result(s_logisimNet12));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A229 (.input1(s_logisimNet132),
            .input2(s_cscomm_4_0[2]),
            .input3(s_logisimNet140),
            .input4(s_logisimNet118),
            .input5(s_logisimNet141),
            .result(s_logisimNet35));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A182 (.input1(s_logisimNet132),
            .input2(s_logisimNet143),
            .input3(s_cscomm_4_0[2]),
            .input4(s_cscomm_4_0[1]),
            .input5(s_cscomm_4_0[0]),
            .input6(s_logisimNet141),
            .result(s_logisimNet42));

   NAND_GATE #(.BubblesMask(2'b00))
      A167 (.input1(s_logisimNet24),
            .input2(s_logisimNet84),
            .result(s_logisimNet150));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A217 (.input1(s_logisimNet143),
            .input2(s_logisimNet134),
            .input3(s_logisimNet140),
            .input4(s_logisimNet118),
            .input5(s_logisimNet141),
            .result(s_logisimNet106));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A142 (.input1(s_logisimBus1[0]),
            .input2(s_logisimBus1[1]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_cscomm_4_0[1]),
            .input7(s_logisimNet118),
            .input8(s_logisimNet141),
            .result(s_logisimNet58));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A184 (.input1(s_logisimNet132),
            .input2(s_cscomm_4_0[3]),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet140),
            .input5(s_cscomm_4_0[0]),
            .input6(s_logisimNet141),
            .result(s_logisimNet54));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A148 (.input1(s_logisimNet64),
            .input2(s_logisimNet58),
            .input3(s_logisimNet36),
            .input4(s_logisimNet16),
            .input5(s_logisimNet13),
            .input6(s_logisimNet24),
            .result(s_logisimNet69));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A218 (.input1(s_logisimNet132),
            .input2(s_logisimNet143),
            .input3(s_logisimNet134),
            .input4(s_logisimNet141),
            .result(s_logisimNet10));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A143 (.input1(s_logisimNet77),
            .input2(s_logisimBus1[1]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_cscomm_4_0[1]),
            .input7(s_logisimNet118),
            .input8(s_logisimNet141),
            .result(s_logisimNet63));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A180 (.input1(s_logisimNet145),
            .input2(s_logisimNet109),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_logisimNet140),
            .input7(s_cscomm_4_0[0]),
            .input8(s_logisimNet141),
            .result(s_logisimNet127));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A219 (.input1(s_logisimNet132),
            .input2(s_cscomm_4_0[3]),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet141),
            .result(s_logisimNet93));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A166 (.input1(s_logisimNet63),
            .input2(s_logisimNet36),
            .input3(s_logisimNet16),
            .result(s_logisimNet80));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A144 (.input1(s_cscomm_4_0[4]),
            .input2(s_cscomm_4_0[3]),
            .input3(s_cscomm_4_0[2]),
            .input4(s_logisimNet140),
            .input5(s_cscomm_4_0[0]),
            .input6(s_logisimNet141),
            .result(s_logisimNet84));

   NAND_GATE #(.BubblesMask(2'b00))
      A195 (.input1(s_logisimNet19),
            .input2(s_logisimNet95),
            .result(s_logisimNet126));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A186 (.input1(s_logisimNet145),
            .input2(s_logisimBus1[1]),
            .input3(s_logisimNet132),
            .input4(s_logisimNet143),
            .input5(s_cscomm_4_0[2]),
            .input6(s_cscomm_4_0[1]),
            .input7(s_logisimNet118),
            .input8(s_logisimNet141),
            .result(s_logisimNet15));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A213 (.input1(s_logisimBus1[1]),
            .input2(s_logisimBus1[0]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_logisimNet140),
            .input7(s_cscomm_4_0[0]),
            .input8(s_logisimNet141),
            .result(s_logisimNet98));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A153 (.input1(s_logisimNet58),
            .input2(s_logisimNet16),
            .input3(s_logisimNet84),
            .input4(s_logisimNet36),
            .input5(s_logisimNet24),
            .result(s_logisimNet32));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A190 (.input1(s_logisimNet132),
            .input2(s_cscomm_4_0[3]),
            .input3(s_logisimNet134),
            .input4(s_cscomm_4_0[1]),
            .input5(s_cscomm_4_0[0]),
            .input6(s_logisimNet141),
            .result(s_logisimNet76));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A177 (.input1(s_logisimNet141),
            .input2(s_logisimNet130),
            .input3(s_logisimNet49),
            .result(s_logisimNet18));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A215 (.input1(s_logisimNet8),
            .input2(s_logisimBus1[1]),
            .input3(s_logisimBus1[0]),
            .input4(s_cscomm_4_0[4]),
            .input5(s_cscomm_4_0[3]),
            .input6(s_cscomm_4_0[2]),
            .input7(s_logisimNet140),
            .input8(s_logisimNet141),
            .result(s_logisimNet142));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A220 (.input1(s_logisimNet9),
            .input2(s_logisimNet142),
            .input3(s_logisimNet61),
            .result(s_logisimNet31));

   NAND_GATE #(.BubblesMask(2'b00))
      A171 (.input1(s_logisimNet18),
            .input2(s_logisimNet136),
            .result(s_logisimNet45));

   NAND_GATE #(.BubblesMask(2'b00))
      A172 (.input1(s_logisimNet141),
            .input2(s_logisimNet74),
            .result(s_logisimNet136));

   NAND_GATE #(.BubblesMask(2'b00))
      A224 (.input1(s_logisimNet78),
            .input2(s_logisimNet141),
            .result(s_logisimNet61));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A189 (.input1(s_logisimNet145),
            .input2(s_logisimBus1[1]),
            .input3(s_cscomm_4_0[4]),
            .input4(s_logisimNet143),
            .input5(s_logisimNet134),
            .input6(s_logisimNet140),
            .input7(s_cscomm_4_0[0]),
            .input8(s_logisimNet141),
            .result(s_logisimNet81));

   NOR_GATE #(.BubblesMask(2'b00))
      A196 (.input1(s_logisimNet56),
            .input2(s_logisimNet21),
            .result(s_logisimNet7));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A192 (.input1(s_logisimNet74),
            .input2(s_logisimNet130),
            .input3(s_logisimNet141),
            .result(s_logisimNet133));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_63 (.clock(s_logisimNet139),
                 .d(s_logisimNet32),
                 .preset(s_logisimNet22),
                 .q(s_logisimNet124),
                 .qBar(),
                 .reset(s_logisimNet5),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A226 (.clock(s_logisimNet30),
            .d(s_logisimNet104),
            .preset(1'b0),
            .q(s_logisimNet46),
            .qBar(s_logisimNet8),
            .reset(1'b0),
            .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A232 (.clock(s_logisimNet139),
            .d(s_logisimNet119),
            .preset(1'b0),
            .q(s_logisimNet37),
            .qBar(s_logisimNet110),
            .reset(1'b0),
            .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_66 (.clock(s_logisimNet28),
                 .d(s_logisimNet149),
                 .preset(1'b0),
                 .q(s_logisimNet53),
                 .qBar(),
                 .reset(s_logisimNet62),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A227 (.clock(s_logisimNet30),
            .d(s_logisimNet31),
            .preset(1'b0),
            .q(),
            .qBar(s_logisimNet26),
            .reset(1'b0),
            .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_68 (.clock(s_logisimNet28),
                 .d(s_logisimNet92),
                 .preset(1'b0),
                 .q(s_logisimNet29),
                 .qBar(),
                 .reset(s_logisimNet131),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      A204 (.clock(s_logisimNet40),
            .d(s_logisimNet81),
            .preset(1'b0),
            .q(s_logisimNet56),
            .qBar(),
            .reset(1'b0),
            .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   F924   A181 (.C_H05(s_logisimNet28),
                .D0_H01(s_logisimNet73),
                .D1_H02(s_logisimNet17),
                .D2_H03(s_logisimNet115),
                .D3_H04(s_logisimNet47),
                .N01_Q0(),
                .N02_Q1(s_logisimNet85),
                .N03_Q2(s_logisimNet96),
                .N04_Q3(s_logisimNet74),
                .N05_Q0B(),
                .N06_Q1B(),
                .N07_Q2B(),
                .N08_Q3B(s_logisimNet65));

   F924   A214 (.C_H05(s_logisimNet30),
                .D0_H01(s_logisimNet98),
                .D1_H02(s_logisimNet12),
                .D2_H03(s_logisimNet41),
                .D3_H04(s_logisimNet9),
                .N01_Q0(s_logisimNet2),
                .N02_Q1(),
                .N03_Q2(s_logisimNet82),
                .N04_Q3(s_logisimNet117),
                .N05_Q0B(),
                .N06_Q1B(s_logisimNet52),
                .N07_Q2B(),
                .N08_Q3B(s_logisimNet113));

   F924   A140 (.C_H05(s_logisimNet30),
                .D0_H01(s_logisimNet33),
                .D1_H02(s_logisimNet120),
                .D2_H03(s_logisimNet101),
                .D3_H04(s_logisimNet25),
                .N01_Q0(s_logisimNet57),
                .N02_Q1(),
                .N03_Q2(),
                .N04_Q3(s_logisimNet43),
                .N05_Q0B(),
                .N06_Q1B(),
                .N07_Q2B(s_logisimNet34),
                .N08_Q3B(s_logisimNet102));

   F091   A178 (.N01(s_logisimNet77),
                .N02());

   F571   A221 (.A(s_logisimNet2),
                .D0(s_logisimNet86),
                .D1(s_logisimNet46),
                .ENB_N(s_logisimNet88),
                .Y(s_logisimNet104));

   F571   A236 (.A(s_logisimNet43),
                .D0(s_logisimNet37),
                .D1(s_logisimNet94),
                .ENB_N(s_logisimNet105),
                .Y(s_logisimNet119));

   F924   A187 (.C_H05(s_logisimNet28),
                .D0_H01(s_logisimNet54),
                .D1_H02(s_logisimNet42),
                .D2_H03(s_logisimNet0),
                .D3_H04(s_logisimNet60),
                .N01_Q0(s_logisimNet103),
                .N02_Q1(s_logisimNet123),
                .N03_Q2(),
                .N04_Q3(s_logisimNet111),
                .N05_Q0B(),
                .N06_Q1B(),
                .N07_Q2B(s_logisimNet90),
                .N08_Q3B());

   F924   A160 (.C_H05(s_logisimNet30),
                .D0_H01(s_logisimNet45),
                .D1_H02(s_logisimNet80),
                .D2_H03(s_logisimNet69),
                .D3_H04(s_logisimNet150),
                .N01_Q0(s_logisimNet49),
                .N02_Q1(),
                .N03_Q2(),
                .N04_Q3(s_logisimNet148),
                .N05_Q0B(),
                .N06_Q1B(s_logisimNet91),
                .N07_Q2B(s_logisimNet130),
                .N08_Q3B());

   F571   A208 (.A(s_logisimNet123),
                .D0(s_logisimNet99),
                .D1(s_logisimNet53),
                .ENB_N(s_logisimNet75),
                .Y(s_logisimNet149));

   F924   A188 (.C_H05(s_logisimNet28),
                .D0_H01(s_logisimNet87),
                .D1_H02(s_logisimNet76),
                .D2_H03(s_logisimNet15),
                .D3_H04(s_logisimNet127),
                .N01_Q0(),
                .N02_Q1(s_logisimNet144),
                .N03_Q2(),
                .N04_Q3(s_logisimNet122),
                .N05_Q0B(),
                .N06_Q1B(),
                .N07_Q2B(s_logisimNet95),
                .N08_Q3B());

   F571   A201 (.A(1'b0),
                .D0(s_logisimNet72),
                .D1(s_logisimNet29),
                .ENB_N(s_logisimNet66),
                .Y(s_logisimNet92));

   F091   A194 (.N01(s_logisimNet27),
                .N02());

   F595   A207 (.H01_S(s_logisimNet7),
                .H02_R(s_logisimNet21),
                .H03_G(s_logisimNet27),
                .N01_Q(),
                .N02_QB(s_logisimNet147));

   F091   A225 (.N01(s_logisimNet51),
                .N02());

endmodule
