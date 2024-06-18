// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_TRAP_TVGEN_P2                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_TRAP_TVGEN_P2( DSTOPN,
                          FTRAPN,
                          IFETCH,
                          INTRQ,
                          LEV1,
                          LEV2,
                          PAN,
                          PGF,
                          PGU,
                          PGUN,
                          PVIOL,
                          RD,
                          RV,
                          TCLK,
                          TVEC_3_0,
                          VACC,
                          VTRAPN,
                          WIP,
                          WIPN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input DSTOPN;
   input FTRAPN;
   input IFETCH;
   input INTRQ;
   input LEV1;
   input LEV2;
   input PAN;
   input PGF;
   input PGU;
   input PGUN;
   input PVIOL;
   input RD;
   input RV;
   input TCLK;
   input VACC;
   input VTRAPN;
   input WIP;
   input WIPN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] TVEC_3_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus21;
   wire [3:0] s_logisimBus33;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
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
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus21[0] = LEV2;
   assign s_logisimBus21[1] = LEV1;
   assign s_logisimNet10    = DSTOPN;
   assign s_logisimNet13    = WIP;
   assign s_logisimNet14    = PAN;
   assign s_logisimNet18    = WIPN;
   assign s_logisimNet19    = PVIOL;
   assign s_logisimNet20    = RV;
   assign s_logisimNet23    = IFETCH;
   assign s_logisimNet34    = PGU;
   assign s_logisimNet38    = VACC;
   assign s_logisimNet4     = TCLK;
   assign s_logisimNet40    = PGUN;
   assign s_logisimNet44    = INTRQ;
   assign s_logisimNet45    = VTRAPN;
   assign s_logisimNet5     = FTRAPN;
   assign s_logisimNet7     = RD;
   assign s_logisimNet8     = PGF;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign TVEC_3_0 = s_logisimBus33[3:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet26  =  1'b1;


   // Ground
   assign  s_logisimNet17  =  1'b0;


   // NOT Gate
   assign s_logisimNet30 = ~s_logisimBus21[0];

   // NOT Gate
   assign s_logisimNet31 = ~s_logisimBus21[1];

   // NOT Gate
   assign s_logisimBus33[1] = ~s_logisimNet46;

   // NOT Gate
   assign s_logisimBus33[3] = ~s_logisimNet35;

   // NOT Gate
   assign s_logisimBus33[2] = ~s_logisimNet22;

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet45;

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimNet27 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet28 = ~s_logisimNet25;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet30),
               .input2(s_logisimNet31),
               .result(s_logisimBus33[0]));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet38),
               .input2(s_logisimNet12),
               .input3(s_logisimNet23),
               .result(s_logisimNet11));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet38),
               .result(s_logisimNet49));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet19),
               .input2(s_logisimNet20),
               .result(s_logisimNet25));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet49),
               .input2(s_logisimNet11),
               .result(s_logisimNet24));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_6 (.input1(s_logisimNet49),
               .input2(s_logisimNet23),
               .input3(s_logisimNet44),
               .input4(s_logisimNet14),
               .input5(s_logisimNet10),
               .result(s_logisimNet41));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet13),
               .input2(s_logisimNet34),
               .result(s_logisimNet37));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_8 (.input1(s_logisimNet7),
               .input2(s_logisimNet18),
               .input3(s_logisimNet40),
               .result(s_logisimNet29));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet27),
               .input2(s_logisimNet28),
               .result(s_logisimNet47));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet11),
                .input2(s_logisimNet41),
                .result(s_logisimNet48));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet18),
                .input2(s_logisimNet34),
                .result(s_logisimNet50));

   Multiplexer_4   PLEXERS_12 (
                               .muxIn_0(s_logisimNet39),
                               .muxIn_1(s_logisimNet32),
                               .muxIn_2(s_logisimNet2),
                               .muxIn_3(1'b0),
                               .muxOut(s_logisimNet35),
                               .sel(s_logisimBus21[1:0]));

   Multiplexer_4   PLEXERS_13 (
                               .muxIn_0(s_logisimNet17),
                               .muxIn_1(s_logisimNet42),
                               .muxIn_2(s_logisimNet26),
                               .muxIn_3(1'b0),
                               .muxOut(s_logisimNet46),
                               .sel(s_logisimBus21[1:0]));

   Multiplexer_4   PLEXERS_14 (
                               .muxIn_0(s_logisimNet9),
                               .muxIn_1(s_logisimNet1),
                               .muxIn_2(s_logisimNet51),
                               .muxIn_3(1'b0),
                               .muxOut(s_logisimNet22),
                               .sel(s_logisimBus21[1:0]));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_15 (.clock(s_logisimNet4),
                 .d(s_logisimNet47),
                 .preset(1'b0),
                 .q(s_logisimNet2),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_16 (.clock(s_logisimNet4),
                 .d(s_logisimNet29),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet42),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_17 (.clock(s_logisimNet4),
                 .d(s_logisimNet24),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet9),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_18 (.clock(s_logisimNet4),
                 .d(s_logisimNet37),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet1),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_19 (.clock(s_logisimNet4),
                 .d(s_logisimNet8),
                 .preset(1'b0),
                 .q(s_logisimNet51),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_20 (.clock(s_logisimNet4),
                 .d(s_logisimNet48),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet39),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_21 (.clock(s_logisimNet4),
                 .d(s_logisimNet50),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet32),
                 .reset(1'b0),
                 .tick(1'b1));


endmodule
