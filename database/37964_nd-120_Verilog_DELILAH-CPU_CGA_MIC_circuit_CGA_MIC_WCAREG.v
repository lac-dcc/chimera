// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_WCAREG                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_WCAREG( CD_15_0,
                       LCSN,
                       LWCAN,
                       MCLK,
                       WCA_12_0,
                       WCSN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] CD_15_0;
   input        LCSN;
   input        LWCAN;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [12:0] WCA_12_0;
   output        WCSN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus44;
   wire [12:0] s_logisimBus46;
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
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet45;
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
   assign s_logisimBus44[15:0] = CD_15_0;
   assign s_logisimNet2        = MCLK;
   assign s_logisimNet24       = LCSN;
   assign s_logisimNet39       = LWCAN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign WCA_12_0 = s_logisimBus46[12:0];
   assign WCSN     = s_logisimNet25;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet4 = ~s_logisimNet39;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NOR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet10),
               .input2(s_logisimNet24),
               .result(s_logisimNet25));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   WCAFF11 (.CLK(s_logisimNet2),
                      .D(s_logisimNet40),
                      .Q(s_logisimNet40),
                      .QN(s_logisimBus46[11]),
                      .TE(s_logisimNet4),
                      .TI(s_logisimBus44[13]));

   SCAN_FF   WCAFF10 (.CLK(s_logisimNet2),
                      .D(s_logisimNet13),
                      .Q(s_logisimNet13),
                      .QN(s_logisimBus46[10]),
                      .TE(s_logisimNet4),
                      .TI(s_logisimBus44[12]));

   SCAN_FF   WCAFF9 (.CLK(s_logisimNet2),
                     .D(s_logisimNet19),
                     .Q(s_logisimNet19),
                     .QN(s_logisimBus46[9]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[11]));

   SCAN_FF   WCAFF8 (.CLK(s_logisimNet2),
                     .D(s_logisimNet3),
                     .Q(s_logisimNet3),
                     .QN(s_logisimBus46[8]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[10]));

   SCAN_FF   WCAFF7 (.CLK(s_logisimNet2),
                     .D(s_logisimNet34),
                     .Q(s_logisimNet34),
                     .QN(s_logisimBus46[7]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[9]));

   SCAN_FF   WCAFF6 (.CLK(s_logisimNet2),
                     .D(s_logisimNet31),
                     .Q(s_logisimNet31),
                     .QN(s_logisimBus46[6]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[8]));

   SCAN_FF   WCAFF5 (.CLK(s_logisimNet2),
                     .D(s_logisimNet26),
                     .Q(s_logisimNet26),
                     .QN(s_logisimBus46[5]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[7]));

   SCAN_FF   WCAFF4 (.CLK(s_logisimNet2),
                     .D(s_logisimNet37),
                     .Q(s_logisimNet37),
                     .QN(s_logisimBus46[4]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[6]));

   SCAN_FF   WCAFF3 (.CLK(s_logisimNet2),
                     .D(s_logisimNet30),
                     .Q(s_logisimNet30),
                     .QN(s_logisimBus46[3]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[5]));

   SCAN_FF   WCAFF2 (.CLK(s_logisimNet2),
                     .D(s_logisimNet20),
                     .Q(s_logisimNet20),
                     .QN(s_logisimBus46[2]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[4]));

   SCAN_FF   WCAFF1 (.CLK(s_logisimNet2),
                     .D(s_logisimNet7),
                     .Q(s_logisimNet7),
                     .QN(s_logisimBus46[1]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[3]));

   SCAN_FF   WCAFF0 (.CLK(s_logisimNet2),
                     .D(s_logisimNet22),
                     .Q(s_logisimNet22),
                     .QN(s_logisimBus46[0]),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[2]));

   SCAN_FF   WCSNFF (.CLK(s_logisimNet2),
                     .D(s_logisimNet10),
                     .Q(s_logisimNet10),
                     .QN(),
                     .TE(s_logisimNet4),
                     .TI(s_logisimBus44[15]));

   SCAN_FF   WCAFF12 (.CLK(s_logisimNet2),
                      .D(s_logisimBus46[12]),
                      .Q(s_logisimBus46[12]),
                      .QN(),
                      .TE(s_logisimNet4),
                      .TI(s_logisimBus44[14]));

endmodule
