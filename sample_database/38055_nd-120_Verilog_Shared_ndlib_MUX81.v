// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : MUX81                                                        **
 **                                                                          **
 *****************************************************************************/

module MUX81( A,
              B,
              C,
              D0,
              D1,
              D2,
              D3,
              D4,
              D5,
              D6,
              D7,
              Z );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input D0;
   input D1;
   input D2;
   input D3;
   input D4;
   input D5;
   input D6;
   input D7;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output Z;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus6;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus6[0] = A;
   assign s_logisimBus6[1] = B;
   assign s_logisimBus6[2] = C;
   assign s_logisimNet0    = D2;
   assign s_logisimNet1    = D5;
   assign s_logisimNet11   = D3;
   assign s_logisimNet4    = D4;
   assign s_logisimNet5    = D1;
   assign s_logisimNet7    = D0;
   assign s_logisimNet8    = D7;
   assign s_logisimNet9    = D6;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Z = s_logisimNet10;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Multiplexer_8   PLEXERS_1 (
                              .muxIn_0(s_logisimNet7),
                              .muxIn_1(s_logisimNet5),
                              .muxIn_2(s_logisimNet0),
                              .muxIn_3(s_logisimNet11),
                              .muxIn_4(s_logisimNet4),
                              .muxIn_5(s_logisimNet1),
                              .muxIn_6(s_logisimNet9),
                              .muxIn_7(s_logisimNet8),
                              .muxOut(s_logisimNet10),
                              .sel(s_logisimBus6[2:0]));


endmodule
