// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_SMUX                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_SMUX( A_15_0,
                     B_15_0,
                     Q_15_0,
                     SA,
                     SB,
                     S_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] A_15_0;
   input [15:0] B_15_0;
   input [15:0] Q_15_0;
   input        SA;
   input        SB;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] S_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus22;
   wire [15:0] s_logisimBus4;
   wire [15:0] s_logisimBus42;
   wire [15:0] s_logisimBus48;
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
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus22[15:0] = B_15_0;
   assign s_logisimBus42[15:0] = A_15_0;
   assign s_logisimBus4[15:0]  = Q_15_0;
   assign s_logisimNet10       = SA;
   assign s_logisimNet13       = SB;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign S_15_0 = s_logisimBus48[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet14  =  1'b0;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX41P   MUXS12 (.A(s_logisimNet10),
                    .B(s_logisimNet13),
                    .D0(s_logisimBus4[12]),
                    .D1(s_logisimBus22[12]),
                    .D2(s_logisimNet14),
                    .D3(s_logisimBus42[12]),
                    .Z(s_logisimBus48[12]));

   MUX41P   MUXS11 (.A(s_logisimNet10),
                    .B(s_logisimNet13),
                    .D0(s_logisimBus4[11]),
                    .D1(s_logisimBus22[11]),
                    .D2(s_logisimNet14),
                    .D3(s_logisimBus42[11]),
                    .Z(s_logisimBus48[11]));

   MUX41P   MUXS10 (.A(s_logisimNet10),
                    .B(s_logisimNet13),
                    .D0(s_logisimBus4[10]),
                    .D1(s_logisimBus22[10]),
                    .D2(s_logisimNet14),
                    .D3(s_logisimBus42[10]),
                    .Z(s_logisimBus48[10]));

   MUX41P   MUXS9 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[9]),
                   .D1(s_logisimBus22[9]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[9]),
                   .Z(s_logisimBus48[9]));

   MUX41P   MUXS8 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[8]),
                   .D1(s_logisimBus22[8]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[8]),
                   .Z(s_logisimBus48[8]));

   MUX41P   MUXS7 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[7]),
                   .D1(s_logisimBus22[7]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[7]),
                   .Z(s_logisimBus48[7]));

   MUX41P   MUXS6 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[6]),
                   .D1(s_logisimBus22[6]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[6]),
                   .Z(s_logisimBus48[6]));

   MUX41P   MUXS5 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[5]),
                   .D1(s_logisimBus22[5]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[5]),
                   .Z(s_logisimBus48[5]));

   MUX41P   MUXS4 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[4]),
                   .D1(s_logisimBus22[4]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[4]),
                   .Z(s_logisimBus48[4]));

   MUX41P   MUXS3 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[3]),
                   .D1(s_logisimBus22[3]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[3]),
                   .Z(s_logisimBus48[3]));

   MUX41P   MUXS2 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[2]),
                   .D1(s_logisimBus22[2]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[2]),
                   .Z(s_logisimBus48[2]));

   MUX41P   MUXS1 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[1]),
                   .D1(s_logisimBus22[1]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[1]),
                   .Z(s_logisimBus48[1]));

   MUX41P   MUXS0 (.A(s_logisimNet10),
                   .B(s_logisimNet13),
                   .D0(s_logisimBus4[0]),
                   .D1(s_logisimBus22[0]),
                   .D2(s_logisimNet14),
                   .D3(s_logisimBus42[0]),
                   .Z(s_logisimBus48[0]));

   MUX41P   MUXS15 (.A(s_logisimNet10),
                    .B(s_logisimNet13),
                    .D0(s_logisimBus4[15]),
                    .D1(s_logisimBus22[15]),
                    .D2(s_logisimNet14),
                    .D3(s_logisimBus42[15]),
                    .Z(s_logisimBus48[15]));

   MUX41P   MUXS14 (.A(s_logisimNet10),
                    .B(s_logisimNet13),
                    .D0(s_logisimBus4[14]),
                    .D1(s_logisimBus22[14]),
                    .D2(s_logisimNet14),
                    .D3(s_logisimBus42[14]),
                    .Z(s_logisimBus48[14]));

   MUX41P   MUXS13 (.A(s_logisimNet10),
                    .B(s_logisimNet13),
                    .D0(s_logisimBus4[13]),
                    .D1(s_logisimBus22[13]),
                    .D2(s_logisimNet14),
                    .D3(s_logisimBus42[13]),
                    .Z(s_logisimBus48[13]));

endmodule
