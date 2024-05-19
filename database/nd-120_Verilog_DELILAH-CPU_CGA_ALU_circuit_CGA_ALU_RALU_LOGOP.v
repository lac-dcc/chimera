// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_RALU_LOGOP                                           **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_RALU_LOGOP( ALU14,
                           A_15_0,
                           FSEL,
                           LF_15_0,
                           S_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALU14;
   input [15:0] A_15_0;
   input        FSEL;
   input [15:0] S_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] LF_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus52;
   wire [15:0] s_logisimBus59;
   wire [15:0] s_logisimBus68;
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
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus52[15:0] = S_15_0;
   assign s_logisimBus59[15:0] = A_15_0;
   assign s_logisimNet1        = ALU14;
   assign s_logisimNet2        = FSEL;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LF_15_0 = s_logisimBus68[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet15  =  1'b0;


   // Ground
   assign  s_logisimNet30  =  1'b0;


   // Ground
   assign  s_logisimNet46  =  1'b0;


   // Ground
   assign  s_logisimNet42  =  1'b0;


   // Ground
   assign  s_logisimNet0  =  1'b0;


   // Ground
   assign  s_logisimNet16  =  1'b0;


   // Ground
   assign  s_logisimNet12  =  1'b0;


   // Ground
   assign  s_logisimNet25  =  1'b0;


   // Ground
   assign  s_logisimNet29  =  1'b0;


   // Ground
   assign  s_logisimNet43  =  1'b0;


   // Ground
   assign  s_logisimNet13  =  1'b0;


   // Ground
   assign  s_logisimNet17  =  1'b0;


   // Ground
   assign  s_logisimNet31  =  1'b0;


   // Ground
   assign  s_logisimNet45  =  1'b0;


   // Ground
   assign  s_logisimNet51  =  1'b0;


   // Ground
   assign  s_logisimNet11  =  1'b0;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX41P   MUXLF10 (.A(s_logisimBus59[10]),
                     .B(s_logisimBus52[10]),
                     .D0(s_logisimNet30),
                     .D1(s_logisimNet1),
                     .D2(s_logisimNet1),
                     .D3(s_logisimNet2),
                     .Z(s_logisimBus68[10]));

   MUX41P   MUXLF9 (.A(s_logisimBus59[9]),
                    .B(s_logisimBus52[9]),
                    .D0(s_logisimNet46),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[9]));

   MUX41P   MUXLF8 (.A(s_logisimBus59[8]),
                    .B(s_logisimBus52[8]),
                    .D0(s_logisimNet42),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[8]));

   MUX41P   MUXLF7 (.A(s_logisimBus59[7]),
                    .B(s_logisimBus52[7]),
                    .D0(s_logisimNet0),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[7]));

   MUX41P   MUXLF6 (.A(s_logisimBus59[6]),
                    .B(s_logisimBus52[6]),
                    .D0(s_logisimNet16),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[6]));

   MUX41P   MUXLF5 (.A(s_logisimBus59[5]),
                    .B(s_logisimBus52[5]),
                    .D0(s_logisimNet12),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[5]));

   MUX41P   MUXLF15 (.A(s_logisimBus59[15]),
                     .B(s_logisimBus52[15]),
                     .D0(s_logisimNet29),
                     .D1(s_logisimNet1),
                     .D2(s_logisimNet1),
                     .D3(s_logisimNet2),
                     .Z(s_logisimBus68[15]));

   MUX41P   MUXLF4 (.A(s_logisimBus59[4]),
                    .B(s_logisimBus52[4]),
                    .D0(s_logisimNet25),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[4]));

   MUX41P   MUXLL3 (.A(s_logisimBus59[3]),
                    .B(s_logisimBus52[3]),
                    .D0(s_logisimNet43),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[3]));

   MUX41P   MUXLF2 (.A(s_logisimBus59[2]),
                    .B(s_logisimBus52[2]),
                    .D0(s_logisimNet13),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[2]));

   MUX41P   MUXLF1 (.A(s_logisimBus59[1]),
                    .B(s_logisimBus52[1]),
                    .D0(s_logisimNet17),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[1]));

   MUX41P   MUXLF0 (.A(s_logisimBus59[0]),
                    .B(s_logisimBus52[0]),
                    .D0(s_logisimNet31),
                    .D1(s_logisimNet1),
                    .D2(s_logisimNet1),
                    .D3(s_logisimNet2),
                    .Z(s_logisimBus68[0]));

   MUX41P   MUXLF14 (.A(s_logisimBus59[14]),
                     .B(s_logisimBus52[14]),
                     .D0(s_logisimNet45),
                     .D1(s_logisimNet1),
                     .D2(s_logisimNet1),
                     .D3(s_logisimNet2),
                     .Z(s_logisimBus68[14]));

   MUX41P   MUXLF13 (.A(s_logisimBus59[13]),
                     .B(s_logisimBus52[13]),
                     .D0(s_logisimNet51),
                     .D1(s_logisimNet1),
                     .D2(s_logisimNet1),
                     .D3(s_logisimNet2),
                     .Z(s_logisimBus68[13]));

   MUX41P   MUXLF12 (.A(s_logisimBus59[12]),
                     .B(s_logisimBus52[12]),
                     .D0(s_logisimNet11),
                     .D1(s_logisimNet1),
                     .D2(s_logisimNet1),
                     .D3(s_logisimNet2),
                     .Z(s_logisimBus68[12]));

   MUX41P   MUXLF11 (.A(s_logisimBus59[11]),
                     .B(s_logisimBus52[11]),
                     .D0(s_logisimNet15),
                     .D1(s_logisimNet1),
                     .D2(s_logisimNet1),
                     .D3(s_logisimNet2),
                     .Z(s_logisimBus68[11]));

endmodule
