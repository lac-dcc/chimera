// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_DBR                                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_DBR( ALUCLK,
                    CD_15_0,
                    DBR_15_0,
                    LDDBRN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] CD_15_0;
   input        LDDBRN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] DBR_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus20;
   wire [15:0] s_logisimBus36;
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
   assign s_logisimBus36[15:0] = CD_15_0;
   assign s_logisimNet0        = ALUCLK;
   assign s_logisimNet32       = LDDBRN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DBR_15_0 = s_logisimBus20[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet32;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   DBRF12 (.CLK(s_logisimNet0),
                     .D(s_logisimBus20[12]),
                     .Q(s_logisimBus20[12]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus36[12]));

   SCAN_FF   DBRF11 (.CLK(s_logisimNet0),
                     .D(s_logisimBus20[11]),
                     .Q(s_logisimBus20[11]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus36[11]));

   SCAN_FF   DBRF10 (.CLK(s_logisimNet0),
                     .D(s_logisimBus20[10]),
                     .Q(s_logisimBus20[10]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus36[10]));

   SCAN_FF   DBRF9 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[9]),
                    .Q(s_logisimBus20[9]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[9]));

   SCAN_FF   DBRF8 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[8]),
                    .Q(s_logisimBus20[8]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[8]));

   SCAN_FF   DBRF7 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[7]),
                    .Q(s_logisimBus20[7]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[7]));

   SCAN_FF   DBRF6 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[6]),
                    .Q(s_logisimBus20[6]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[6]));

   SCAN_FF   DBRF5 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[5]),
                    .Q(s_logisimBus20[5]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[5]));

   SCAN_FF   DBRF4 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[4]),
                    .Q(s_logisimBus20[4]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[4]));

   SCAN_FF   DBRF3 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[3]),
                    .Q(s_logisimBus20[3]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[3]));

   SCAN_FF   DBRF2 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[2]),
                    .Q(s_logisimBus20[2]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[2]));

   SCAN_FF   DBRF1 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[1]),
                    .Q(s_logisimBus20[1]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[1]));

   SCAN_FF   DBRF0 (.CLK(s_logisimNet0),
                    .D(s_logisimBus20[0]),
                    .Q(s_logisimBus20[0]),
                    .QN(),
                    .TE(s_logisimNet1),
                    .TI(s_logisimBus36[0]));

   SCAN_FF   DBRF15 (.CLK(s_logisimNet0),
                     .D(s_logisimBus20[15]),
                     .Q(s_logisimBus20[15]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus36[15]));

   SCAN_FF   DBRF14 (.CLK(s_logisimNet0),
                     .D(s_logisimBus20[14]),
                     .Q(s_logisimBus20[14]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus36[14]));

   SCAN_FF   DBRf13 (.CLK(s_logisimNet0),
                     .D(s_logisimBus20[13]),
                     .Q(s_logisimBus20[13]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus36[13]));

endmodule
