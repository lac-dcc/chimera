// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_CMP                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_CMP( HISTAT_2_0,
                                  HIVEC_2_0,
                                  HIVGES,
                                  LOSTAT_2_0,
                                  LOVEC_2_0,
                                  LOVGES );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [2:0] HISTAT_2_0;
   input [2:0] HIVEC_2_0;
   input [2:0] LOSTAT_2_0;
   input [2:0] LOVEC_2_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output HIVGES;
   output LOVGES;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus0;
   wire [2:0] s_logisimBus1;
   wire [2:0] s_logisimBus2;
   wire [2:0] s_logisimBus4;
   wire       s_logisimNet3;
   wire       s_logisimNet5;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus0[2:0] = LOVEC_2_0;
   assign s_logisimBus1[2:0] = HIVEC_2_0;
   assign s_logisimBus2[2:0] = LOSTAT_2_0;
   assign s_logisimBus4[2:0] = HISTAT_2_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HIVGES = s_logisimNet3;
   assign LOVGES = s_logisimNet5;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_VECGEN_CMP_MAGCMP   HICMP (.S_2_0(s_logisimBus4[2:0]),
                                             .VGES(s_logisimNet3),
                                             .V_2_0(s_logisimBus1[2:0]));

   CGA_INTR_CNTLR_VECGEN_CMP_MAGCMP   LOCMP (.S_2_0(s_logisimBus2[2:0]),
                                             .VGES(s_logisimNet5),
                                             .V_2_0(s_logisimBus0[2:0]));

endmodule
