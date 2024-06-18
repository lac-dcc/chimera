// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_CPU_ALU_RMUX                                             **
 **                                                                          **
 *****************************************************************************/

module CGA_CPU_ALU_RMUX( A_15_0,
                         D_15_0,
                         RA,
                         RD,
                         RN_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] A_15_0;
   input [15:0] D_15_0;
   input        RA;
   input        RD;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] RN_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus1;
   wire [15:0] s_logisimBus13;
   wire [15:0] s_logisimBus15;
   wire        s_logisimNet0;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
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
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
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
   assign s_logisimBus13[15:0] = A_15_0;
   assign s_logisimBus1[15:0]  = D_15_0;
   assign s_logisimNet0        = RD;
   assign s_logisimNet3        = RA;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign RN_15_0 = s_logisimBus15[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   RMUX_Gates   RN10 (.A(s_logisimBus13[10]),
                      .D(s_logisimBus1[10]),
                      .RA(s_logisimNet3),
                      .RD(s_logisimNet0),
                      .RN(s_logisimBus15[10]));

   RMUX_Gates   RN9 (.A(s_logisimBus13[9]),
                     .D(s_logisimBus1[9]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[9]));

   RMUX_Gates   RN8 (.A(s_logisimBus13[8]),
                     .D(s_logisimBus1[8]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[8]));

   RMUX_Gates   RN7 (.A(s_logisimBus13[7]),
                     .D(s_logisimBus1[7]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[7]));

   RMUX_Gates   RN6 (.A(s_logisimBus13[6]),
                     .D(s_logisimBus1[6]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[6]));

   RMUX_Gates   RN5 (.A(s_logisimBus13[5]),
                     .D(s_logisimBus1[5]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[5]));

   RMUX_Gates   RN4 (.A(s_logisimBus13[4]),
                     .D(s_logisimBus1[4]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[4]));

   RMUX_Gates   RN3 (.A(s_logisimBus13[3]),
                     .D(s_logisimBus1[3]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[3]));

   RMUX_Gates   RN2 (.A(s_logisimBus13[2]),
                     .D(s_logisimBus1[2]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[2]));

   RMUX_Gates   RN1 (.A(s_logisimBus13[1]),
                     .D(s_logisimBus1[1]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[1]));

   RMUX_Gates   RN0 (.A(s_logisimBus13[0]),
                     .D(s_logisimBus1[0]),
                     .RA(s_logisimNet3),
                     .RD(s_logisimNet0),
                     .RN(s_logisimBus15[0]));

   RMUX_Gates   RN15 (.A(s_logisimBus13[15]),
                      .D(s_logisimBus1[15]),
                      .RA(s_logisimNet3),
                      .RD(s_logisimNet0),
                      .RN(s_logisimBus15[15]));

   RMUX_Gates   RN14 (.A(s_logisimBus13[14]),
                      .D(s_logisimBus1[14]),
                      .RA(s_logisimNet3),
                      .RD(s_logisimNet0),
                      .RN(s_logisimBus15[14]));

   RMUX_Gates   RN13 (.A(s_logisimBus13[13]),
                      .D(s_logisimBus1[13]),
                      .RA(s_logisimNet3),
                      .RD(s_logisimNet0),
                      .RN(s_logisimBus15[13]));

   RMUX_Gates   RN12 (.A(s_logisimBus13[12]),
                      .D(s_logisimBus1[12]),
                      .RA(s_logisimNet3),
                      .RD(s_logisimNet0),
                      .RN(s_logisimBus15[12]));

   RMUX_Gates   RN11 (.A(s_logisimBus13[11]),
                      .D(s_logisimBus1[11]),
                      .RA(s_logisimNet3),
                      .RD(s_logisimNet0),
                      .RN(s_logisimBus15[11]));

endmodule
