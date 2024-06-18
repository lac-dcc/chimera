// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : TTL_74521                                                    **
 **                                                                          **
 *****************************************************************************/

module TTL_74521( AB_n,
                  A_7_0,
                  B_7_0,
                  E_n );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [7:0] A_7_0;
   input [7:0] B_7_0;
   input       E_n;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output AB_n;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0] s_logisimBus0;
   wire [7:0] s_logisimBus1;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus0[7:0] = A_7_0;
   assign s_logisimBus1[7:0] = B_7_0;
   assign s_logisimNet3      = E_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AB_n = s_logisimNet2;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet4 = ~s_logisimNet3;

   // Controlled Inverter
   assign s_logisimNet2 = (s_logisimNet4) ? ~s_logisimNet5 : 1'b0;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Comparator #(.nrOfBits(8),
                .twosComplement(1))
      ARITH_1 (.aEqualsB(s_logisimNet5),
               .aGreaterThanB(),
               .aLessThanB(),
               .dataA(s_logisimBus0[7:0]),
               .dataB(s_logisimBus1[7:0]));


endmodule
