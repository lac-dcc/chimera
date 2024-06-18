// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRGEL                                         **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRGEL( D,
                             E,
                             FIDB03,
                             FIDB04,
                             H,
                             HIDET,
                             HIGSN,
                             HIPASSALL,
                             HIVEC_2_0,
                             HIVGES,
                             IRQN,
                             L,
                             LODET,
                             LOGSN,
                             LOPASSALL,
                             LOVEC_2_0,
                             LOVGES,
                             M,
                             MCLK,
                             N,
                             PD,
                             PICV_2_0,
                             S );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       D;
   input       E;
   input       FIDB03;
   input       FIDB04;
   input       H;
   input       HIDET;
   input [2:0] HIVEC_2_0;
   input       HIVGES;
   input       L;
   input       LODET;
   input [2:0] LOVEC_2_0;
   input       LOVGES;
   input       M;
   input       MCLK;
   input       N;
   input       S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       HIGSN;
   output       HIPASSALL;
   output       IRQN;
   output       LOGSN;
   output       LOPASSALL;
   output       PD;
   output [2:0] PICV_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus10;
   wire [2:0] s_logisimBus11;
   wire [2:0] s_logisimBus6;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
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
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus10[2:0] = LOVEC_2_0;
   assign s_logisimBus6[2:0]  = HIVEC_2_0;
   assign s_logisimNet12      = H;
   assign s_logisimNet13      = S;
   assign s_logisimNet15      = L;
   assign s_logisimNet16      = E;
   assign s_logisimNet18      = MCLK;
   assign s_logisimNet19      = D;
   assign s_logisimNet21      = LODET;
   assign s_logisimNet26      = FIDB04;
   assign s_logisimNet27      = N;
   assign s_logisimNet28      = M;
   assign s_logisimNet31      = HIVGES;
   assign s_logisimNet32      = FIDB03;
   assign s_logisimNet7       = LOVGES;
   assign s_logisimNet8       = HIDET;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HIGSN     = s_logisimNet5;
   assign HIPASSALL = s_logisimNet3;
   assign IRQN      = s_logisimNet23;
   assign LOGSN     = s_logisimNet29;
   assign LOPASSALL = s_logisimNet17;
   assign PD        = s_logisimNet30;
   assign PICV_2_0  = s_logisimBus11[2:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NOR_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet9),
               .input2(s_logisimNet0),
               .result(s_logisimNet23));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_IRGEL_HIGEL   HIGEL (.FIDB03(s_logisimNet32),
                                       .HIDET(s_logisimNet8),
                                       .HIENABN(s_logisimNet14),
                                       .HIGAS(s_logisimNet24),
                                       .HIGSN(s_logisimNet5),
                                       .L(s_logisimNet15),
                                       .LOGASN(s_logisimNet25),
                                       .M(s_logisimNet28),
                                       .MCLK(s_logisimNet18),
                                       .N(s_logisimNet27));

   CGA_INTR_CNTLR_IRGEL_VMUX   VMUX (.HIVEC_2_0(s_logisimBus6[2:0]),
                                     .HVE(s_logisimNet4),
                                     .LOVEC_2_0(s_logisimBus10[2:0]),
                                     .LVE(s_logisimNet1),
                                     .PICV_2_0(s_logisimBus11[2:0]));

   CGA_INTR_CNTLR_IRGEL_LOGEL   LOGEL (.FIDB04(s_logisimNet26),
                                       .L(s_logisimNet15),
                                       .LIENABN(s_logisimNet20),
                                       .LOGAS(s_logisimNet22),
                                       .LOGSN(s_logisimNet29),
                                       .M(s_logisimNet28),
                                       .MCLK(s_logisimNet18),
                                       .N(s_logisimNet27));

   CGA_INTR_CNTLR_IRGEL_HIRL   HIRL (.D(s_logisimNet19),
                                     .E(s_logisimNet16),
                                     .H(s_logisimNet12),
                                     .HIDET(s_logisimNet8),
                                     .HIENABN(s_logisimNet14),
                                     .HIGAS(s_logisimNet24),
                                     .HIGSN(s_logisimNet5),
                                     .HIPASSALL(s_logisimNet3),
                                     .HIRQ(s_logisimNet9),
                                     .HIVEC_2_0(s_logisimBus6[2:0]),
                                     .HIVGES(s_logisimNet31),
                                     .HVE(s_logisimNet4),
                                     .MCLK(s_logisimNet18),
                                     .PD(s_logisimNet30),
                                     .RDN(s_logisimNet2),
                                     .S(s_logisimNet13));

   CGA_INTR_CNTLR_IRGEL_LORL   LORL (.D(s_logisimNet19),
                                     .E(s_logisimNet16),
                                     .LIENABN(s_logisimNet20),
                                     .LIRQ(s_logisimNet0),
                                     .LODET(s_logisimNet21),
                                     .LOGAS(s_logisimNet22),
                                     .LOGASN(s_logisimNet25),
                                     .LOPASSALL(s_logisimNet17),
                                     .LOVEC_2_0(s_logisimBus10[2:0]),
                                     .LOVGES(s_logisimNet7),
                                     .LVE(s_logisimNet1),
                                     .MCLK(s_logisimNet18),
                                     .RDN(s_logisimNet2),
                                     .S(s_logisimNet13));

endmodule
