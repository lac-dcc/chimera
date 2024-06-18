// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_RALU_MUX216L                                         **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_RALU_MUX216L( F_15_0,
                             O_15_0,
                             S,
                             T_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] F_15_0;
   input        S;
   input [15:0] T_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] O_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus24;
   wire [15:0] s_logisimBus41;
   wire [15:0] s_logisimBus51;
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
   assign s_logisimBus41[15:0] = T_15_0;
   assign s_logisimBus51[15:0] = F_15_0;
   assign s_logisimNet20       = S;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign O_15_0 = s_logisimBus24[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet25 = ~s_logisimNet20;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX21LP   MUXQ10 (.A(s_logisimBus51[10]),
                     .B(s_logisimBus41[10]),
                     .S(s_logisimNet25),
                     .ZN(s_logisimBus24[10]));

   MUX21LP   MUXQ9 (.A(s_logisimBus51[9]),
                    .B(s_logisimBus41[9]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[9]));

   MUX21LP   MUXQ8 (.A(s_logisimBus51[8]),
                    .B(s_logisimBus41[8]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[8]));

   MUX21LP   MUXQ7 (.A(s_logisimBus51[7]),
                    .B(s_logisimBus41[7]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[7]));

   MUX21LP   MUXQ6 (.A(s_logisimBus51[6]),
                    .B(s_logisimBus41[6]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[6]));

   MUX21LP   MUXQ5 (.A(s_logisimBus51[5]),
                    .B(s_logisimBus41[5]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[5]));

   MUX21LP   MUXQ4 (.A(s_logisimBus51[4]),
                    .B(s_logisimBus41[4]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[4]));

   MUX21LP   MUXQ3 (.A(s_logisimBus51[3]),
                    .B(s_logisimBus41[3]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[3]));

   MUX21LP   MUXQ2 (.A(s_logisimBus51[2]),
                    .B(s_logisimBus41[2]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[2]));

   MUX21LP   MUXQ1 (.A(s_logisimBus51[1]),
                    .B(s_logisimBus41[1]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[1]));

   MUX21LP   MUXQ0 (.A(s_logisimBus51[0]),
                    .B(s_logisimBus41[0]),
                    .S(s_logisimNet25),
                    .ZN(s_logisimBus24[0]));

   MUX21LP   MUXQ15 (.A(s_logisimBus51[15]),
                     .B(s_logisimBus41[15]),
                     .S(s_logisimNet25),
                     .ZN(s_logisimBus24[15]));

   MUX21LP   MUXQ14 (.A(s_logisimBus51[14]),
                     .B(s_logisimBus41[14]),
                     .S(s_logisimNet25),
                     .ZN(s_logisimBus24[14]));

   MUX21LP   MUXQ13 (.A(s_logisimBus51[13]),
                     .B(s_logisimBus41[13]),
                     .S(s_logisimNet25),
                     .ZN(s_logisimBus24[13]));

   MUX21LP   MUXQ12 (.A(s_logisimBus51[12]),
                     .B(s_logisimBus41[12]),
                     .S(s_logisimNet25),
                     .ZN(s_logisimBus24[12]));

   MUX21LP   MUXQ11 (.A(s_logisimBus51[11]),
                     .B(s_logisimBus41[11]),
                     .S(s_logisimNet25),
                     .ZN(s_logisimBus24[11]));

endmodule
