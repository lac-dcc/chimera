// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRQ_MASK                                      **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRQ_MASK( A,
                                B,
                                C,
                                DIN_15_0,
                                MCLK,
                                PICMASK_15_0,
                                PICMASK_15_0_N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        A;
   input        B;
   input        C;
   input [15:0] DIN_15_0;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] PICMASK_15_0;
   output [15:0] PICMASK_15_0_N;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus36;
   wire [15:0] s_logisimBus44;
   wire [15:0] s_logisimBus49;
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
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
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
   assign s_logisimBus44[15:0] = DIN_15_0;
   assign s_logisimNet2        = A;
   assign s_logisimNet55       = C;
   assign s_logisimNet7        = B;
   assign s_logisimNet8        = MCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PICMASK_15_0   = s_logisimBus36[15:0];
   assign PICMASK_15_0_N = s_logisimBus49[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet0 = ~s_logisimNet55;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT10 (.CLOCK(s_logisimNet8),
                                                .DATAIN(s_logisimBus44[10]),
                                                .DCDA(s_logisimNet2),
                                                .DCDB(s_logisimNet7),
                                                .DCDCN(s_logisimNet0),
                                                .MSK(s_logisimBus36[10]),
                                                .MSKN(s_logisimBus49[10]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT9 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[9]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[9]),
                                               .MSKN(s_logisimBus49[9]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT8 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[8]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[8]),
                                               .MSKN(s_logisimBus49[8]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT7 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[7]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[7]),
                                               .MSKN(s_logisimBus49[7]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT6 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[6]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[6]),
                                               .MSKN(s_logisimBus49[6]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT5 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[5]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[5]),
                                               .MSKN(s_logisimBus49[5]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT4 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[4]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[4]),
                                               .MSKN(s_logisimBus49[4]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT3 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[3]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[3]),
                                               .MSKN(s_logisimBus49[3]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT2 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[2]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[2]),
                                               .MSKN(s_logisimBus49[2]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT1 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[1]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[1]),
                                               .MSKN(s_logisimBus49[1]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT0 (.CLOCK(s_logisimNet8),
                                               .DATAIN(s_logisimBus44[0]),
                                               .DCDA(s_logisimNet2),
                                               .DCDB(s_logisimNet7),
                                               .DCDCN(s_logisimNet0),
                                               .MSK(s_logisimBus36[0]),
                                               .MSKN(s_logisimBus49[0]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT15 (.CLOCK(s_logisimNet8),
                                                .DATAIN(s_logisimBus44[15]),
                                                .DCDA(s_logisimNet2),
                                                .DCDB(s_logisimNet7),
                                                .DCDCN(s_logisimNet0),
                                                .MSK(s_logisimBus36[15]),
                                                .MSKN(s_logisimBus49[15]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT14 (.CLOCK(s_logisimNet8),
                                                .DATAIN(s_logisimBus44[14]),
                                                .DCDA(s_logisimNet2),
                                                .DCDB(s_logisimNet7),
                                                .DCDCN(s_logisimNet0),
                                                .MSK(s_logisimBus36[14]),
                                                .MSKN(s_logisimBus49[14]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT13 (.CLOCK(s_logisimNet8),
                                                .DATAIN(s_logisimBus44[13]),
                                                .DCDA(s_logisimNet2),
                                                .DCDB(s_logisimNet7),
                                                .DCDCN(s_logisimNet0),
                                                .MSK(s_logisimBus36[13]),
                                                .MSKN(s_logisimBus49[13]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT12 (.CLOCK(s_logisimNet8),
                                                .DATAIN(s_logisimBus44[12]),
                                                .DCDA(s_logisimNet2),
                                                .DCDB(s_logisimNet7),
                                                .DCDCN(s_logisimNet0),
                                                .MSK(s_logisimBus36[12]),
                                                .MSKN(s_logisimBus49[12]));

   CGA_INTR_CNTLR_IRQ_MASK_MASKBIT   MASKBIT11 (.CLOCK(s_logisimNet8),
                                                .DATAIN(s_logisimBus44[11]),
                                                .DCDA(s_logisimNet2),
                                                .DCDB(s_logisimNet7),
                                                .DCDCN(s_logisimNet0),
                                                .MSK(s_logisimBus36[11]),
                                                .MSKN(s_logisimBus49[11]));

endmodule
