// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_CSEL                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_CSEL( ALUCLK,
                     CFETCH,
                     COND,
                     CONDN,
                     CRY,
                     DZD,
                     F11,
                     F15,
                     IRQ,
                     LCZ,
                     OOD,
                     OVF,
                     RESTR,
                     SPARE,
                     STP,
                     TSEL_3_0,
                     ZF );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       ALUCLK;
   input       CFETCH;
   input       COND;
   input       CRY;
   input       DZD;
   input       F11;
   input       F15;
   input       IRQ;
   input       LCZ;
   input       OOD;
   input       OVF;
   input       RESTR;
   input       SPARE;
   input       STP;
   input [3:0] TSEL_3_0;
   input       ZF;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output CONDN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus0;
   wire [3:0] s_logisimBus17;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
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
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus0[0] = s_logisimNet3;
   assign s_logisimBus0[1] = s_logisimNet4;
   assign s_logisimBus0[2] = s_logisimNet5;
   assign s_logisimNet3    = s_logisimBus17[0];
   assign s_logisimNet4    = s_logisimBus17[1];
   assign s_logisimNet5    = s_logisimBus17[2];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus17[3:0] = TSEL_3_0;
   assign s_logisimNet1       = OOD;
   assign s_logisimNet10      = CRY;
   assign s_logisimNet11      = CFETCH;
   assign s_logisimNet12      = OVF;
   assign s_logisimNet13      = ZF;
   assign s_logisimNet14      = DZD;
   assign s_logisimNet15      = SPARE;
   assign s_logisimNet2       = STP;
   assign s_logisimNet21      = COND;
   assign s_logisimNet22      = IRQ;
   assign s_logisimNet23      = F11;
   assign s_logisimNet27      = ALUCLK;
   assign s_logisimNet7       = RESTR;
   assign s_logisimNet8       = F15;
   assign s_logisimNet9       = LCZ;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CONDN = s_logisimNet26;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet16  =  1'b0;


   // NOT Gate
   assign s_logisimNet24 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet27;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Multiplexer_8   PLEXERS_1 (
                              .muxIn_0(s_logisimNet14),
                              .muxIn_1(s_logisimNet9),
                              .muxIn_2(s_logisimNet22),
                              .muxIn_3(s_logisimNet7),
                              .muxIn_4(s_logisimNet11),
                              .muxIn_5(s_logisimNet1),
                              .muxIn_6(s_logisimNet15),
                              .muxIn_7(s_logisimNet21),
                              .muxOut(s_logisimNet19),
                              .sel(s_logisimBus0[2:0]));

   Multiplexer_8   PLEXERS_2 (
                              .muxIn_0(s_logisimNet16),
                              .muxIn_1(s_logisimNet16),
                              .muxIn_2(s_logisimNet12),
                              .muxIn_3(s_logisimNet10),
                              .muxIn_4(s_logisimNet23),
                              .muxIn_5(s_logisimNet8),
                              .muxIn_6(s_logisimNet13),
                              .muxIn_7(s_logisimNet2),
                              .muxOut(s_logisimNet20),
                              .sel(s_logisimBus0[2:0]));

   Multiplexer_2   PLEXERS_3 (
                              .muxIn_0(s_logisimNet19),
                              .muxIn_1(s_logisimNet20),
                              .muxOut(s_logisimNet25),
                              .sel(s_logisimBus17[3]));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   LATCH   CSEL_LATCH (.D(s_logisimNet24),
                       .ENABLE(s_logisimNet6),
                       .Q(s_logisimNet26),
                       .QN());

endmodule
