// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRQ                                           **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRQ( A,
                           B,
                           C,
                           CLRQ_15_0,
                           CPN,
                           DIN_15_0,
                           IREQ_15_0_N,
                           MCLK,
                           MIREQ_15_0_N,
                           PICMASK_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        A;
   input        B;
   input        C;
   input [15:0] CLRQ_15_0;
   input        CPN;
   input [15:0] DIN_15_0;
   input [15:0] IREQ_15_0_N;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] MIREQ_15_0_N;
   output [15:0] PICMASK_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus0;
   wire [15:0] s_logisimBus11;
   wire [15:0] s_logisimBus2;
   wire [15:0] s_logisimBus3;
   wire [15:0] s_logisimBus7;
   wire [15:0] s_logisimBus8;
   wire [15:0] s_logisimBus9;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet6;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus11[15:0] = DIN_15_0;
   assign s_logisimBus7[15:0]  = CLRQ_15_0;
   assign s_logisimBus8[15:0]  = IREQ_15_0_N;
   assign s_logisimNet1        = MCLK;
   assign s_logisimNet10       = CPN;
   assign s_logisimNet4        = A;
   assign s_logisimNet5        = B;
   assign s_logisimNet6        = C;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign MIREQ_15_0_N = s_logisimBus9[15:0];
   assign PICMASK_15_0 = s_logisimBus2[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_IRQ_REG   IRQ_REG (.CLRQ_15_0(s_logisimBus7[15:0]),
                                     .CPN(s_logisimNet10),
                                     .IRQ_15_0_N(s_logisimBus8[15:0]),
                                     .LREQ_15_0(s_logisimBus0[15:0]),
                                     .MCLK(s_logisimNet1));

   CGA_INTR_CNTLR_IRQ_MASK   IRQ_MASK (.A(s_logisimNet4),
                                       .B(s_logisimNet5),
                                       .C(s_logisimNet6),
                                       .DIN_15_0(s_logisimBus11[15:0]),
                                       .MCLK(s_logisimNet1),
                                       .PICMASK_15_0(s_logisimBus2[15:0]),
                                       .PICMASK_15_0_N(s_logisimBus3[15:0]));

   CGA_INTR_CNTLR_IRQ_MREQ   IRQ_MREQ (.LREQ_15_0(s_logisimBus0[15:0]),
                                       .MIREQ_15_0(s_logisimBus9[15:0]),
                                       .PICMASK_15_0_N(s_logisimBus3[15:0]));

endmodule
