// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_STACK                                                **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_STACK( DEEP,
                      MCLK,
                      NEXT_12_0,
                      RET_12_0,
                      SC3,
                      SC4,
                      SCLKN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        MCLK;
   input [12:0] NEXT_12_0;
   input        SC3;
   input        SC4;
   input        SCLKN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        DEEP;
   output [12:0] RET_12_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [12:0] s_logisimBus37;
   wire [12:0] s_logisimBus41;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
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
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet42;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus41[12:0] = NEXT_12_0;
   assign s_logisimNet22       = SC4;
   assign s_logisimNet4        = MCLK;
   assign s_logisimNet5        = SCLKN;
   assign s_logisimNet8        = SC3;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DEEP     = s_logisimNet17;
   assign RET_12_0 = s_logisimBus37[12:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet39 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet32 = ~s_logisimNet22;

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet39;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet38;

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet40;

   // NOT Gate
   assign s_logisimNet0 = ~s_logisimNet42;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet6),
               .input2(s_logisimNet22),
               .result(s_logisimNet38));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet6),
               .input2(s_logisimNet32),
               .result(s_logisimNet40));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet32),
               .result(s_logisimNet42));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_MIC_STACK_BIT   Bit11 (.CLK(s_logisimNet4),
                              .CLKN(s_logisimNet5),
                              .LOAD(s_logisimNet0),
                              .S3(s_logisimNet2),
                              .S3N(s_logisimNet6),
                              .S4NS3N(s_logisimNet3),
                              .S4S3N(s_logisimNet11),
                              .STIN(s_logisimBus41[11]),
                              .STOUT(s_logisimBus37[11]));

   CGA_MIC_STACK_BIT   Bit10 (.CLK(s_logisimNet4),
                              .CLKN(s_logisimNet5),
                              .LOAD(s_logisimNet0),
                              .S3(s_logisimNet2),
                              .S3N(s_logisimNet6),
                              .S4NS3N(s_logisimNet3),
                              .S4S3N(s_logisimNet11),
                              .STIN(s_logisimBus41[10]),
                              .STOUT(s_logisimBus37[10]));

   CGA_MIC_STACK_BIT   Bit9 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[9]),
                             .STOUT(s_logisimBus37[9]));

   CGA_MIC_STACK_BIT   Bit8 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[8]),
                             .STOUT(s_logisimBus37[8]));

   CGA_MIC_STACK_BIT   Bit7 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[7]),
                             .STOUT(s_logisimBus37[7]));

   CGA_MIC_STACK_BIT   Bit6 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[6]),
                             .STOUT(s_logisimBus37[6]));

   CGA_MIC_STACK_BIT   Bit5 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[5]),
                             .STOUT(s_logisimBus37[5]));

   CGA_MIC_STACK_BIT   Bit4 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[4]),
                             .STOUT(s_logisimBus37[4]));

   CGA_MIC_STACK_BIT   Bit3 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[3]),
                             .STOUT(s_logisimBus37[3]));

   CGA_MIC_STACK_BIT   Bit2 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[2]),
                             .STOUT(s_logisimBus37[2]));

   CGA_MIC_STACK_BIT   Bit1 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[1]),
                             .STOUT(s_logisimBus37[1]));

   CGA_MIC_STACK_BIT   Bit0 (.CLK(s_logisimNet4),
                             .CLKN(s_logisimNet5),
                             .LOAD(s_logisimNet0),
                             .S3(s_logisimNet2),
                             .S3N(s_logisimNet6),
                             .S4NS3N(s_logisimNet3),
                             .S4S3N(s_logisimNet11),
                             .STIN(s_logisimBus41[0]),
                             .STOUT(s_logisimBus37[0]));

   CGA_MIC_STACK_BIT12   Bit12 (.DEEP(s_logisimNet17),
                                .LOAD(s_logisimNet0),
                                .MCLK(s_logisimNet4),
                                .S3(s_logisimNet2),
                                .S3N(s_logisimNet6),
                                .S4NS3N(s_logisimNet3),
                                .S4S3N(s_logisimNet11),
                                .SCLKN(s_logisimNet5),
                                .STIN(s_logisimBus41[12]),
                                .STOUT(s_logisimBus37[12]));

endmodule
