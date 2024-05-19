// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_IPOS                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_IPOS( CD_15_0,
                     EWCAN,
                     MAPN,
                     MA_12_0,
                     TRAPN,
                     TVEC_3_0,
                     WCA_12_0,
                     W_12_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] CD_15_0;
   input        EWCAN;
   input        MAPN;
   input        TRAPN;
   input [3:0]  TVEC_3_0;
   input [12:0] WCA_12_0;
   input [12:0] W_12_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [12:0] MA_12_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [12:0] s_logisimBus11;
   wire [1:0]  s_logisimBus3;
   wire [15:0] s_logisimBus32;
   wire [3:0]  s_logisimBus47;
   wire [12:0] s_logisimBus66;
   wire [1:0]  s_logisimBus72;
   wire [12:0] s_logisimBus81;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
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
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet73;
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
   wire        s_logisimNet77;
   wire        s_logisimNet78;
   wire        s_logisimNet79;
   wire        s_logisimNet8;
   wire        s_logisimNet80;
   wire        s_logisimNet82;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus32[15:0] = CD_15_0;
   assign s_logisimBus47[3:0]  = TVEC_3_0;
   assign s_logisimBus66[12:0] = W_12_0;
   assign s_logisimBus81[12:0] = WCA_12_0;
   assign s_logisimNet20       = MAPN;
   assign s_logisimNet26       = TRAPN;
   assign s_logisimNet33       = EWCAN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign MA_12_0 = s_logisimBus11[12:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet44  =  1'b1;


   // Ground
   assign  s_logisimNet30  =  1'b0;


   // Ground
   assign  s_logisimNet29  =  1'b0;


   // Ground
   assign  s_logisimNet74  =  1'b0;


   // Ground
   assign  s_logisimNet68  =  1'b0;


   // Ground
   assign  s_logisimNet62  =  1'b0;


   // Ground
   assign  s_logisimNet15  =  1'b0;


   // Ground
   assign  s_logisimNet61  =  1'b0;


   // Power
   assign  s_logisimNet55  =  1'b1;


   // Ground
   assign  s_logisimNet78  =  1'b0;


   // Power
   assign  s_logisimNet58  =  1'b1;


   // Ground
   assign  s_logisimNet77  =  1'b0;


   // NOT Gate
   assign s_logisimNet36 = ~s_logisimNet33;

   // NOT Gate
   assign s_logisimBus3[1] = ~s_logisimNet79;

   // NOT Gate
   assign s_logisimBus3[0] = ~s_logisimNet82;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet20),
               .input2(s_logisimNet36),
               .result(s_logisimNet64));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet20),
               .input2(s_logisimNet26),
               .result(s_logisimNet79));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet26),
               .input2(s_logisimNet64),
               .result(s_logisimNet82));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_4 (.input1(s_logisimNet26),
               .input2(s_logisimNet33),
               .input3(s_logisimNet20),
               .result(s_logisimBus72[0]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet20),
               .input2(s_logisimNet26),
               .result(s_logisimBus72[1]));

   Multiplexer_4   PLEXERS_6 (
                              .muxIn_0(s_logisimBus66[10]),
                              .muxIn_1(s_logisimBus81[10]),
                              .muxIn_2(s_logisimNet44),
                              .muxIn_3(s_logisimNet30),
                              .muxOut(s_logisimBus11[10]),
                              .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_7 (
                              .muxIn_0(s_logisimBus66[9]),
                              .muxIn_1(s_logisimBus81[9]),
                              .muxIn_2(s_logisimBus32[15]),
                              .muxIn_3(s_logisimNet29),
                              .muxOut(s_logisimBus11[9]),
                              .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_8 (
                              .muxIn_0(s_logisimBus66[8]),
                              .muxIn_1(s_logisimBus81[8]),
                              .muxIn_2(s_logisimBus32[14]),
                              .muxIn_3(s_logisimNet74),
                              .muxOut(s_logisimBus11[8]),
                              .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_9 (
                              .muxIn_0(s_logisimBus66[7]),
                              .muxIn_1(s_logisimBus81[7]),
                              .muxIn_2(s_logisimBus32[13]),
                              .muxIn_3(s_logisimNet68),
                              .muxOut(s_logisimBus11[7]),
                              .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_10 (
                               .muxIn_0(s_logisimBus66[6]),
                               .muxIn_1(s_logisimBus81[6]),
                               .muxIn_2(s_logisimBus32[12]),
                               .muxIn_3(s_logisimNet62),
                               .muxOut(s_logisimBus11[6]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_11 (
                               .muxIn_0(s_logisimBus66[5]),
                               .muxIn_1(s_logisimBus81[5]),
                               .muxIn_2(s_logisimBus32[11]),
                               .muxIn_3(s_logisimNet15),
                               .muxOut(s_logisimBus11[5]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_12 (
                               .muxIn_0(s_logisimBus66[4]),
                               .muxIn_1(s_logisimBus81[4]),
                               .muxIn_2(s_logisimBus32[10]),
                               .muxIn_3(s_logisimNet61),
                               .muxOut(s_logisimBus11[4]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_13 (
                               .muxIn_0(s_logisimBus66[3]),
                               .muxIn_1(s_logisimBus81[3]),
                               .muxIn_2(s_logisimBus32[9]),
                               .muxIn_3(s_logisimBus47[3]),
                               .muxOut(s_logisimBus11[3]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_14 (
                               .muxIn_0(s_logisimBus66[2]),
                               .muxIn_1(s_logisimBus81[2]),
                               .muxIn_2(s_logisimBus32[8]),
                               .muxIn_3(s_logisimBus47[2]),
                               .muxOut(s_logisimBus11[2]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_15 (
                               .muxIn_0(s_logisimBus66[1]),
                               .muxIn_1(s_logisimBus81[1]),
                               .muxIn_2(s_logisimBus32[7]),
                               .muxIn_3(s_logisimBus47[1]),
                               .muxOut(s_logisimBus11[1]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_16 (
                               .muxIn_0(s_logisimBus66[0]),
                               .muxIn_1(s_logisimBus81[0]),
                               .muxIn_2(s_logisimBus32[6]),
                               .muxIn_3(s_logisimBus47[0]),
                               .muxOut(s_logisimBus11[0]),
                               .sel(s_logisimBus3[1:0]));

   Multiplexer_4   PLEXERS_17 (
                               .muxIn_0(s_logisimBus66[12]),
                               .muxIn_1(s_logisimBus81[12]),
                               .muxIn_2(s_logisimNet55),
                               .muxIn_3(s_logisimNet78),
                               .muxOut(s_logisimBus11[12]),
                               .sel(s_logisimBus72[1:0]));

   Multiplexer_4   PLEXERS_18 (
                               .muxIn_0(s_logisimBus66[11]),
                               .muxIn_1(s_logisimBus81[11]),
                               .muxIn_2(s_logisimNet58),
                               .muxIn_3(s_logisimNet77),
                               .muxOut(s_logisimBus11[11]),
                               .sel(s_logisimBus3[1:0]));


endmodule
