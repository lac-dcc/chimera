// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR                                                     **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR( BINT10N,
                 BINT11N,
                 BINT12N,
                 BINT13N,
                 BINT15N,
                 CLIRQN,
                 EMPIDN,
                 EPIC,
                 EPICMASKN,
                 FIDBO_15_0,
                 HIGSN,
                 INTRQN,
                 IOXERRN,
                 IRQ,
                 LAA_3_0,
                 LOGSN,
                 MCLK,
                 NORN,
                 PANN,
                 PARERRN,
                 PD,
                 PICMASK_15_0,
                 PICS_2_0,
                 PICV_2_0,
                 POWFAILN,
                 Z );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        BINT10N;
   input        BINT11N;
   input        BINT12N;
   input        BINT13N;
   input        BINT15N;
   input        CLIRQN;
   input        EMPIDN;
   input        EPIC;
   input [15:0] FIDBO_15_0;
   input        IOXERRN;
   input [3:0]  LAA_3_0;
   input        MCLK;
   input        NORN;
   input        PANN;
   input        PARERRN;
   input        POWFAILN;
   input        Z;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        EPICMASKN;
   output        HIGSN;
   output        INTRQN;
   output        IRQ;
   output        LOGSN;
   output        PD;
   output [15:0] PICMASK_15_0;
   output [2:0]  PICS_2_0;
   output [2:0]  PICV_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus1;
   wire [15:0] s_logisimBus22;
   wire [2:0]  s_logisimBus25;
   wire [2:0]  s_logisimBus27;
   wire [3:0]  s_logisimBus3;
   wire [15:0] s_logisimBus8;
   wire        s_logisimNet0;
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
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet26;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus1[15:0] = FIDBO_15_0;
   assign s_logisimBus3[3:0]  = LAA_3_0;
   assign s_logisimNet10      = PANN;
   assign s_logisimNet11      = NORN;
   assign s_logisimNet12      = EMPIDN;
   assign s_logisimNet13      = BINT15N;
   assign s_logisimNet14      = POWFAILN;
   assign s_logisimNet15      = PARERRN;
   assign s_logisimNet16      = IOXERRN;
   assign s_logisimNet17      = Z;
   assign s_logisimNet18      = BINT13N;
   assign s_logisimNet19      = BINT12N;
   assign s_logisimNet20      = BINT11N;
   assign s_logisimNet21      = BINT10N;
   assign s_logisimNet4       = MCLK;
   assign s_logisimNet5       = CLIRQN;
   assign s_logisimNet9       = EPIC;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign EPICMASKN    = s_logisimNet28;
   assign HIGSN        = s_logisimNet23;
   assign INTRQN       = s_logisimNet29;
   assign IRQ          = s_logisimNet7;
   assign LOGSN        = s_logisimNet26;
   assign PD           = s_logisimNet24;
   assign PICMASK_15_0 = s_logisimBus22[15:0];
   assign PICS_2_0     = s_logisimBus27[2:0];
   assign PICV_2_0     = s_logisimBus25[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet5;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet10),
               .input2(s_logisimNet0),
               .result(s_logisimNet6));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet4),
                .d(s_logisimNet6),
                .preset(1'b0),
                .q(),
                .qBar(s_logisimNet29),
                .reset(s_logisimNet2),
                .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR   CNTLR (.EPIC(s_logisimNet9),
                           .EPICMASKN(s_logisimNet28),
                           .FIDBO_15_0(s_logisimBus1[15:0]),
                           .HIGSN(s_logisimNet23),
                           .IREQ_15_0_N(s_logisimBus8[15:0]),
                           .IRQN(s_logisimNet0),
                           .LAA_3_0(s_logisimBus3[3:0]),
                           .LOGSN(s_logisimNet26),
                           .MCLK(s_logisimNet4),
                           .PD(s_logisimNet24),
                           .PICMASK_15_0(s_logisimBus22[15:0]),
                           .PICS_2_0(s_logisimBus27[2:0]),
                           .PICV_2_0(s_logisimBus25[2:0]));

   CGA_INTR_IRSRC   IRSRC (.BINT10N(s_logisimNet21),
                           .BINT11N(s_logisimNet20),
                           .BINT12N(s_logisimNet19),
                           .BINT13N(s_logisimNet18),
                           .BINT15N(s_logisimNet13),
                           .EMPIDN(s_logisimNet12),
                           .FIDBO_15_0(s_logisimBus1[15:0]),
                           .IOXERRN(s_logisimNet16),
                           .IREQ_15_0_N(s_logisimBus8[15:0]),
                           .NORN(s_logisimNet11),
                           .PARERRN(s_logisimNet15),
                           .POWFAILN(s_logisimNet14),
                           .Z(s_logisimNet17));

endmodule
