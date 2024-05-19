// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_FASTADD                                              **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_FASTADD( ADD_15_0,
                        CDE_15_8,
                        CD_7_0,
                        PRP_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [7:0]  CDE_15_8;
   input [7:0]  CD_7_0;
   input [15:0] PRP_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] ADD_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus2;
   wire [7:0]  s_logisimBus5;
   wire [7:0]  s_logisimBus6;
   wire [15:0] s_logisimBus7;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus5[7:0]  = CD_7_0;
   assign s_logisimBus6[7:0]  = CDE_15_8;
   assign s_logisimBus7[15:0] = PRP_15_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ADD_15_0 = s_logisimBus2[15:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Adder #(.extendedBits(9),
           .nrOfBits(8))
      ARITH_1 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus5[7:0]),
               .dataB(s_logisimBus7[7:0]),
               .result(s_logisimBus2[7:0]));

   Adder #(.extendedBits(9),
           .nrOfBits(8))
      ARITH_2 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus6[7:0]),
               .dataB(s_logisimBus7[15:8]),
               .result(s_logisimBus2[15:8]));


endmodule
