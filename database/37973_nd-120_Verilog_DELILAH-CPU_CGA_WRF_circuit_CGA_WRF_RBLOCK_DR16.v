// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_WRF_RBLOCK_DR16                                          **
 **                                                                          **
 *****************************************************************************/

module CGA_WRF_RBLOCK_DR16( ALUCLK,
                            RB_15_0,
                            REG_15_0,
                            WR );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] RB_15_0;
   input        WR;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] REG_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus15;
   wire [15:0] s_logisimBus35;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
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
   assign s_logisimBus35[15:0] = RB_15_0;
   assign s_logisimNet1        = WR;
   assign s_logisimNet2        = ALUCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign REG_15_0 = s_logisimBus15[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   R6 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[6]),
                 .Q(s_logisimBus15[6]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[6]));

   SCAN_FF   R5 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[5]),
                 .Q(s_logisimBus15[5]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[5]));

   SCAN_FF   R4 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[4]),
                 .Q(s_logisimBus15[4]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[4]));

   SCAN_FF   R3 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[3]),
                 .Q(s_logisimBus15[3]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[3]));

   SCAN_FF   R2 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[2]),
                 .Q(s_logisimBus15[2]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[2]));

   SCAN_FF   R1 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[1]),
                 .Q(s_logisimBus15[1]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[1]));

   SCAN_FF   R0 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[0]),
                 .Q(s_logisimBus15[0]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[0]));

   SCAN_FF   R7 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[7]),
                 .Q(s_logisimBus15[7]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[7]));

   SCAN_FF   R14 (.CLK(s_logisimNet2),
                  .D(s_logisimBus15[14]),
                  .Q(s_logisimBus15[14]),
                  .QN(),
                  .TE(s_logisimNet1),
                  .TI(s_logisimBus35[14]));

   SCAN_FF   R13 (.CLK(s_logisimNet2),
                  .D(s_logisimBus15[13]),
                  .Q(s_logisimBus15[13]),
                  .QN(),
                  .TE(s_logisimNet1),
                  .TI(s_logisimBus35[13]));

   SCAN_FF   R12 (.CLK(s_logisimNet2),
                  .D(s_logisimBus15[12]),
                  .Q(s_logisimBus15[12]),
                  .QN(),
                  .TE(s_logisimNet1),
                  .TI(s_logisimBus35[12]));

   SCAN_FF   R11 (.CLK(s_logisimNet2),
                  .D(s_logisimBus15[11]),
                  .Q(s_logisimBus15[11]),
                  .QN(),
                  .TE(s_logisimNet1),
                  .TI(s_logisimBus35[11]));

   SCAN_FF   R10 (.CLK(s_logisimNet2),
                  .D(s_logisimBus15[10]),
                  .Q(s_logisimBus15[10]),
                  .QN(),
                  .TE(s_logisimNet1),
                  .TI(s_logisimBus35[10]));

   SCAN_FF   R9 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[9]),
                 .Q(s_logisimBus15[9]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[9]));

   SCAN_FF   R8 (.CLK(s_logisimNet2),
                 .D(s_logisimBus15[8]),
                 .Q(s_logisimBus15[8]),
                 .QN(),
                 .TE(s_logisimNet1),
                 .TI(s_logisimBus35[8]));

   SCAN_FF   R15 (.CLK(s_logisimNet2),
                  .D(s_logisimBus15[15]),
                  .Q(s_logisimBus15[15]),
                  .QN(),
                  .TE(s_logisimNet1),
                  .TI(s_logisimBus35[15]));

endmodule
