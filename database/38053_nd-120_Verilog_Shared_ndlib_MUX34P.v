// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : MUX34P                                                       **
 **                                                                          **
 *****************************************************************************/

module MUX34P( A,
               B,
               D00,
               D01,
               D02,
               D03,
               D10,
               D11,
               D12,
               D13,
               D20,
               D21,
               D22,
               D23,
               Z0,
               Z1,
               Z2,
               Z3 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input D00;
   input D01;
   input D02;
   input D03;
   input D10;
   input D11;
   input D12;
   input D13;
   input D20;
   input D21;
   input D22;
   input D23;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output Z0;
   output Z1;
   output Z2;
   output Z3;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus2;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
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
   assign s_logisimBus2[0] = A;
   assign s_logisimBus2[1] = B;
   assign s_logisimNet0    = D12;
   assign s_logisimNet1    = D13;
   assign s_logisimNet11   = D22;
   assign s_logisimNet12   = D23;
   assign s_logisimNet16   = D02;
   assign s_logisimNet17   = D03;
   assign s_logisimNet3    = D10;
   assign s_logisimNet4    = D11;
   assign s_logisimNet5    = D00;
   assign s_logisimNet6    = D01;
   assign s_logisimNet7    = D20;
   assign s_logisimNet8    = D21;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Z0 = s_logisimNet21;
   assign Z1 = s_logisimNet22;
   assign Z2 = s_logisimNet14;
   assign Z3 = s_logisimNet15;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet9  =  1'b0;


   // Ground
   assign  s_logisimNet10  =  1'b0;


   // Ground
   assign  s_logisimNet18  =  1'b0;


   // Ground
   assign  s_logisimNet19  =  1'b0;


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Multiplexer_4   PLEXERS_1 (
                              .muxIn_0(s_logisimNet5),
                              .muxIn_1(s_logisimNet3),
                              .muxIn_2(s_logisimNet7),
                              .muxIn_3(s_logisimNet9),
                              .muxOut(s_logisimNet21),
                              .sel(s_logisimBus2[1:0]));

   Multiplexer_4   PLEXERS_2 (
                              .muxIn_0(s_logisimNet6),
                              .muxIn_1(s_logisimNet4),
                              .muxIn_2(s_logisimNet8),
                              .muxIn_3(s_logisimNet10),
                              .muxOut(s_logisimNet22),
                              .sel(s_logisimBus2[1:0]));

   Multiplexer_4   PLEXERS_3 (
                              .muxIn_0(s_logisimNet16),
                              .muxIn_1(s_logisimNet0),
                              .muxIn_2(s_logisimNet11),
                              .muxIn_3(s_logisimNet18),
                              .muxOut(s_logisimNet14),
                              .sel(s_logisimBus2[1:0]));

   Multiplexer_4   PLEXERS_4 (
                              .muxIn_0(s_logisimNet17),
                              .muxIn_1(s_logisimNet1),
                              .muxIn_2(s_logisimNet12),
                              .muxIn_3(s_logisimNet19),
                              .muxOut(s_logisimNet15),
                              .sel(s_logisimBus2[1:0]));


endmodule
