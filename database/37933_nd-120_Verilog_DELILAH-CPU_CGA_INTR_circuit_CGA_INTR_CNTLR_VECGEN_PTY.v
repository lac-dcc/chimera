// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_PTY                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_PTY( HIDET,
                                  HIVEC,
                                  LODET,
                                  LOVEC,
                                  MIREQ_15_0_N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] MIREQ_15_0_N;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       HIDET;
   output [2:0] HIVEC;
   output       LODET;
   output [2:0] LOVEC;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus0;
   wire [2:0]  s_logisimBus4;
   wire [2:0]  s_logisimBus5;
   wire        s_logisimNet3;
   wire        s_logisimNet6;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus0[15:0] = MIREQ_15_0_N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HIDET = s_logisimNet3;
   assign HIVEC = s_logisimBus4[2:0];
   assign LODET = s_logisimNet6;
   assign LOVEC = s_logisimBus5[2:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_VECGEN_PTY_PTYENC   PTYENC_HI (.DET(s_logisimNet3),
                                                 .RN(s_logisimBus0[15:8]),
                                                 .V_2_0(s_logisimBus4[2:0]));

   CGA_INTR_CNTLR_VECGEN_PTY_PTYENC   PTYENC_LO (.DET(s_logisimNet6),
                                                 .RN(s_logisimBus0[7:0]),
                                                 .V_2_0(s_logisimBus5[2:0]));

endmodule
