// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_IDBCTL_PGSREG                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_IDBCTL_PGSREG( FETCHN,
                          LA_21_10,
                          MCLK,
                          PGS_11_0,
                          PGS_15_14,
                          PVIOL,
                          VACCN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        FETCHN;
   input [11:0] LA_21_10;
   input        MCLK;
   input        PVIOL;
   input        VACCN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [11:0] PGS_11_0;
   output [1:0]  PGS_15_14;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [11:0] s_logisimBus30;
   wire [1:0]  s_logisimBus32;
   wire [11:0] s_logisimBus34;
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
   wire        s_logisimNet33;
   wire        s_logisimNet4;
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
   assign s_logisimBus34[11:0] = LA_21_10;
   assign s_logisimNet0        = MCLK;
   assign s_logisimNet14       = FETCHN;
   assign s_logisimNet25       = PVIOL;
   assign s_logisimNet33       = VACCN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PGS_11_0  = s_logisimBus30[11:0];
   assign PGS_15_14 = s_logisimBus32[1:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet33;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   PGS9 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[9]),
                   .Q(s_logisimBus30[9]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[9]));

   SCAN_FF   PGS8 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[8]),
                   .Q(s_logisimBus30[8]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[8]));

   SCAN_FF   PGS7 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[7]),
                   .Q(s_logisimBus30[7]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[7]));

   SCAN_FF   PGS15 (.CLK(s_logisimNet0),
                    .D(s_logisimNet27),
                    .Q(s_logisimNet27),
                    .QN(s_logisimBus32[1]),
                    .TE(s_logisimNet5),
                    .TI(s_logisimNet14));

   SCAN_FF   PGS14 (.CLK(s_logisimNet0),
                    .D(s_logisimBus32[0]),
                    .Q(s_logisimBus32[0]),
                    .QN(),
                    .TE(s_logisimNet5),
                    .TI(s_logisimNet25));

   SCAN_FF   PGS11 (.CLK(s_logisimNet0),
                    .D(s_logisimBus30[11]),
                    .Q(s_logisimBus30[11]),
                    .QN(),
                    .TE(s_logisimNet5),
                    .TI(s_logisimBus34[11]));

   SCAN_FF   PGS10 (.CLK(s_logisimNet0),
                    .D(s_logisimBus30[10]),
                    .Q(s_logisimBus30[10]),
                    .QN(),
                    .TE(s_logisimNet5),
                    .TI(s_logisimBus34[10]));

   SCAN_FF   PGS3 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[3]),
                   .Q(s_logisimBus30[3]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[3]));

   SCAN_FF   PGS2 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[2]),
                   .Q(s_logisimBus30[2]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[2]));

   SCAN_FF   PGS1 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[1]),
                   .Q(s_logisimBus30[1]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[1]));

   SCAN_FF   PGS0 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[0]),
                   .Q(s_logisimBus30[0]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[0]));

   SCAN_FF   PGS6 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[6]),
                   .Q(s_logisimBus30[6]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[6]));

   SCAN_FF   PGS5 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[5]),
                   .Q(s_logisimBus30[5]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[5]));

   SCAN_FF   PGS4 (.CLK(s_logisimNet0),
                   .D(s_logisimBus30[4]),
                   .Q(s_logisimBus30[4]),
                   .QN(),
                   .TE(s_logisimNet5),
                   .TI(s_logisimBus34[4]));

endmodule
