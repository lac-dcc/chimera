// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRQ_REG                                       **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRQ_REG( CLRQ_15_0,
                               CPN,
                               IRQ_15_0_N,
                               LREQ_15_0,
                               MCLK );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] CLRQ_15_0;
   input        CPN;
   input [15:0] IRQ_15_0_N;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] LREQ_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus30;
   wire [15:0] s_logisimBus46;
   wire [15:0] s_logisimBus52;
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
   wire        s_logisimNet31;
   wire        s_logisimNet32;
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
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
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
   assign s_logisimBus30[15:0] = CLRQ_15_0;
   assign s_logisimBus46[15:0] = IRQ_15_0_N;
   assign s_logisimNet1        = MCLK;
   assign s_logisimNet2        = CPN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LREQ_15_0 = s_logisimBus52[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_6 (.CLR(s_logisimBus30[6]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[6]),
                                           .PN(s_logisimBus46[6]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_7 (.CLR(s_logisimBus30[7]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[7]),
                                           .PN(s_logisimBus46[7]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_8 (.CLR(s_logisimBus46[8]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[8]),
                                           .PN(s_logisimBus30[8]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_9 (.CLR(s_logisimBus46[9]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[9]),
                                           .PN(s_logisimBus30[9]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_10 (.CLR(s_logisimBus46[10]),
                                            .CP(s_logisimNet1),
                                            .CPN(s_logisimNet2),
                                            .INR(s_logisimBus52[10]),
                                            .PN(s_logisimBus30[10]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_11 (.CLR(s_logisimBus46[11]),
                                            .CP(s_logisimNet1),
                                            .CPN(s_logisimNet2),
                                            .INR(s_logisimBus52[11]),
                                            .PN(s_logisimBus30[11]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_12 (.CLR(s_logisimBus46[12]),
                                            .CP(s_logisimNet1),
                                            .CPN(s_logisimNet2),
                                            .INR(s_logisimBus52[12]),
                                            .PN(s_logisimBus30[12]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_13 (.CLR(s_logisimBus46[13]),
                                            .CP(s_logisimNet1),
                                            .CPN(s_logisimNet2),
                                            .INR(s_logisimBus52[13]),
                                            .PN(s_logisimBus30[13]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_14 (.CLR(s_logisimBus46[14]),
                                            .CP(s_logisimNet1),
                                            .CPN(s_logisimNet2),
                                            .INR(s_logisimBus52[14]),
                                            .PN(s_logisimBus30[14]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_15 (.CLR(s_logisimBus46[15]),
                                            .CP(s_logisimNet1),
                                            .CPN(s_logisimNet2),
                                            .INR(s_logisimBus52[15]),
                                            .PN(s_logisimBus30[15]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_0 (.CLR(s_logisimBus30[0]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[0]),
                                           .PN(s_logisimBus46[0]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_1 (.CLR(s_logisimBus30[1]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[1]),
                                           .PN(s_logisimBus46[1]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_2 (.CLR(s_logisimBus30[2]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[2]),
                                           .PN(s_logisimBus46[2]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_3 (.CLR(s_logisimBus30[3]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[3]),
                                           .PN(s_logisimBus46[3]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_4 (.CLR(s_logisimBus30[4]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[4]),
                                           .PN(s_logisimBus46[4]));

   CGA_INTR_CNTLR_IRQ_REG_RQBIT   RQBIT_5 (.CLR(s_logisimBus30[5]),
                                           .CP(s_logisimNet1),
                                           .CPN(s_logisimNet2),
                                           .INR(s_logisimBus52[5]),
                                           .PN(s_logisimBus46[5]));

endmodule
