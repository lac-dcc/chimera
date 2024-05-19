// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : ND38GHP                                                      **
 **                                                                          **
 *****************************************************************************/

module ND38GHP( A,
                B,
                C,
                G,
                Z0,
                Z1,
                Z2,
                Z3,
                Z4,
                Z5,
                Z6,
                Z7 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input G;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output Z0;
   output Z1;
   output Z2;
   output Z3;
   output Z4;
   output Z5;
   output Z6;
   output Z7;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus11;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
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
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus11[0] = A;
   assign s_logisimBus11[1] = B;
   assign s_logisimBus11[2] = C;
   assign s_logisimNet12    = G;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Z0 = s_logisimNet13;
   assign Z1 = s_logisimNet14;
   assign Z2 = s_logisimNet15;
   assign Z3 = s_logisimNet16;
   assign Z4 = s_logisimNet17;
   assign Z5 = s_logisimNet18;
   assign Z6 = s_logisimNet19;
   assign Z7 = s_logisimNet20;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet13 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet15 = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimNet10;

   // NOT Gate
   assign s_logisimNet18 = ~s_logisimNet4;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet2;

   // NOT Gate
   assign s_logisimNet20 = ~s_logisimNet9;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Decoder_8   PLEXERS_1 (.decoderOut_0(s_logisimNet8),
                          .decoderOut_1(s_logisimNet1),
                          .decoderOut_2(s_logisimNet3),
                          .decoderOut_3(s_logisimNet0),
                          .decoderOut_4(s_logisimNet10),
                          .decoderOut_5(s_logisimNet4),
                          .decoderOut_6(s_logisimNet2),
                          .decoderOut_7(s_logisimNet9),
                          .enable(s_logisimNet12),
                          .sel(s_logisimBus11[2:0]));


endmodule
