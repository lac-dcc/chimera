// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CMP4                                                         **
 **                                                                          **
 *****************************************************************************/

module CMP4( A0,
             A1,
             A2,
             A3,
             AEB,
             AGB,
             ALB,
             B0,
             B1,
             B2,
             B3 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A0;
   input A1;
   input A2;
   input A3;
   input B0;
   input B1;
   input B2;
   input B3;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output AEB;
   output AGB;
   output ALB;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus3;
   wire [3:0] s_logisimBus4;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet2;
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
   assign s_logisimBus3[0] = A0;
   assign s_logisimBus3[1] = A1;
   assign s_logisimBus3[2] = A2;
   assign s_logisimBus3[3] = A3;
   assign s_logisimBus4[0] = B0;
   assign s_logisimBus4[1] = B1;
   assign s_logisimBus4[2] = B2;
   assign s_logisimBus4[3] = B3;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AEB = s_logisimNet2;
   assign AGB = s_logisimNet0;
   assign ALB = s_logisimNet1;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Comparator #(.nrOfBits(4),
                .twosComplement(1))
      ARITH_1 (.aEqualsB(s_logisimNet2),
               .aGreaterThanB(s_logisimNet0),
               .aLessThanB(s_logisimNet1),
               .dataA(s_logisimBus3[3:0]),
               .dataB(s_logisimBus4[3:0]));


endmodule
