// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/CS                                                                **
** CONTROL STORE                                                         **
** SHEET 16 of 50                                                        **
**                                                                       ** 
** Last reviewed: 14-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module CPU_CS_16( 

   input sysclk, // System clock in FPGA
   input sys_rst_n, // System reset in FPGA

   // Clock signals
   input        CLK,
   input        MACLK,

   // Input signals
   input [15:0] IDB_15_0_IN,
   input [1:0]  RF_1_0,
   input [2:0]  CC_3_1_n, //note: 3-1 (not 3-0)
   input [12:0] CSA_12_0,
   input [9:0]  CSCA_9_0,

   input        PD1,
   input        FETCH,

   input        BLCS_n,
   input        BRK_n,
   input        FORM_n,
   input        LCS_n,
   input        RWCS_n,
   input        TERM_n,
   input        WCA_n,
   input        WCS_n,

   // Output signals
   output        EWCA_n,
   output [63:0] CSBITS,   
   output [15:0] IDB_15_0_OUT,
   output [12:0] LUA_12_0
   );

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0]  s_ew_3_0_n;
   wire [63:0] s_csbits_out_wcs; // out from WCS
   wire [63:0] s_csbits_out_tcv; // out from TCV

   wire [15:0] s_IDB_15_0_prom_out;
   wire [15:0] s_IDB_15_0_tcv_in;
   wire [15:0] s_IDB_15_0_tcv_out;

   wire [3:0]  s_ww3_0_n;
   wire [3:0]  s_WU_3_0_n;
   wire [12:0] s_LUA_12_0;

   wire [11:0] s_uua;
   wire        s_elow_n;
   wire        s_ecsl_n;
   wire        s_eupp_n;

   // Select the input data for the TCV (s_IDB_15_0_tcv_in) based on the BLCS_n signal:
   // - If BLCS_n is low, use data from the PROM (s_IDB_15_0_prom_out) for the TCV input.
   // - If BLCS_n is high, use the normal IDB data (IDB_15_0).
   assign s_IDB_15_0_tcv_in = BLCS_n ? IDB_15_0_IN : s_IDB_15_0_prom_out;
   

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LUA_12_0  = s_LUA_12_0[12:0];

   // Output data bus selection for IDB_15_0_OUT:
   // - If BLCS_n is low (inactive high signal), output data is sourced from PROM.
   // - Otherwise, check ECSL_n for TCV data control:
   //   - If ECSL_n is low (inactive high signal), TCV data is output.
   //   - If ECSL_n is high, output is set to high-impedance state (tri-state).
   assign IDB_15_0_OUT = BLCS_n ? 
                         (s_ecsl_n ? 16'b0 : s_IDB_15_0_tcv_out[15:0]) : 
                         s_IDB_15_0_prom_out[15:0];
   


   // CSBITS out from this module is always the bits from OUT from the WCS/TCW (WCS is also feeding the TCV)
   assign CSBITS = s_csbits_out_wcs | s_csbits_out_tcv;
   
   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CPU_CS_PROM_19   PROM (
                           .BLCS_n(BLCS_n),
                           .RF_1_0(RF_1_0[1:0]),
                           .LUA_12_0(s_LUA_12_0[12:0]),

                           .IDB_15_0_OUT(s_IDB_15_0_prom_out[15:0])
                          );

   // CSBITS into WCS is always the CSBITS out from the TCV

   CPU_CS_WCS_21_22   WCS (
                           .sysclk(sysclk),
                           .sys_rst_n(sys_rst_n),
                           .CSBITS_63_0(s_csbits_out_tcv[63:0]),
                           .CSBITS_63_0_OUT(s_csbits_out_wcs[63:0]),
                           .ELOW_n(s_elow_n),
                           .EUPP_n(s_eupp_n),
                           .LUA_11_0(s_LUA_12_0[11:0]),
                           .UUA_11_0(s_uua[11:0]),
                           .WU0_n(s_WU_3_0_n[0]),
                           .WU1_n(s_WU_3_0_n[1]),
                           .WU2_n(s_WU_3_0_n[2]),
                           .WU3_n(s_WU_3_0_n[3]),
                           .WW0_n(s_ww3_0_n[0]),
                           .WW1_n(s_ww3_0_n[1]),
                           .WW2_n(s_ww3_0_n[2]),
                           .WW3_n(s_ww3_0_n[3]));

   CPU_CS_TCV_20   TCV (.CSBITS(s_csbits_out_wcs[63:0]),
                        .CSBITS_OUT(s_csbits_out_tcv[63:0]),
                        .ECSL_n(s_ecsl_n),
                        .EW_3_0_n(s_ew_3_0_n[3:0]),
                        .IDB_15_0_IN(s_IDB_15_0_tcv_in[15:0]),
                        .IDB_15_0_OUT(s_IDB_15_0_tcv_out[15:0]),
                        .WCS_n(WCS_n));

   CPU_CS_CTL_18   CTL (.BRK_n(BRK_n),
                        .CC_3_1_n(CC_3_1_n[2:0]),
                        .ECSL_n(s_ecsl_n),
                        .ELOW_n(s_elow_n),
                        .EUPP_n(s_eupp_n),
                        .EWCA_n(EWCA_n),
                        .EW_3_0_n(s_ew_3_0_n[3:0]),
                        .FETCH(FETCH),
                        .FORM_n(FORM_n),
                        .LCS_n(LCS_n),
                        .LUA12(s_LUA_12_0[12]),
                        .RF_1_0(RF_1_0[1:0]),
                        .RWCS_n(RWCS_n),
                        .TERM_n(TERM_n),
                        .WCA_n(WCA_n),
                        .WCS_n(WCS_n),
                        .WU_3_0_n(s_WU_3_0_n[3:0]),
                        .WW_3_0_n(s_ww3_0_n[3:0]));

   CPU_CS_ACAL_17   ACAL (.CLK(CLK),
                          .CSA_12_0(CSA_12_0[12:0]),
                          .CSCA_9_0(CSCA_9_0[9:0]),
                          .LUA_12_0(s_LUA_12_0[12:0]),
                          .MACLK(MACLK),
                          .PD1(PD1),
                          .UUA_11_0(s_uua[11:0]));

endmodule
