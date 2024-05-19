// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** BIF/BCTL/SYNC                                                         **
** BIF SYNC                                                              **
** SHEET 8 of 50                                                         **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module BIF_BCTL_SYNC_8( 
   
   // Inputs signals
   input BLOCK_n,
   input CACT_n,
   input CLEAR_n,
   input IBDAP_n,
   input IBDRY_n,
   input IBINPUT_n,
   input IBPERR_n,
   input IBREQ_n,
   input ISEMRQ_n,
   input OSC,
   input PD1,
   input PD3,
   input REFRQ_n,

   // Output signals
   output BDAP50_n,
   output BDRY25_n,
   output BDRY50_n,
   output BDRY75_n,
   output BINPUT50_n,
   output BINPUT75_n,
   output BLOCK25_n,
   output BPERR50_n,
   output BREQ50_n,
   output CACT25_n,
   output MR_n,
   output REFRQ50_n,
   output SEMRQ50_n
);

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_bdry25_n;
   wire s_binput50_n;
   wire s_osc;
   wire s_pd1;
   wire s_pd3;
   wire s_ibreq_n;
   wire s_block_n;
   wire s_cact_n;
   wire s_ibperr_n;
   wire s_isemrq_n;
   wire s_clear_n;
   wire s_refrq_n;
   wire s_ibinput_n;
   wire s_ibdry_n;
   wire s_ibdap_n;
   wire s_binput75_n;
   wire s_breq50_n;
   wire s_bdap50_n;
   wire s_bdry50_n;
   wire s_bdry75_n;
   wire s_block25_n;
   wire s_cact25_n;
   wire s_mr_n;
   wire s_refrq50_n;
   wire s_semrq50_n;
   wire s_bperr50_n;

   // Intermediate wires for CHIP_3D outputs
   wire s_bdap25_n;
   wire s_breq25_n;
   wire s_bperr25_n;
   wire s_binput25_n;
   wire s_semrq25_n;
   wire s_refrq25_n;
   wire s_clear25_n;

   // Intermediate wires for CHIP_3D and CHIP_4D inputs and outputs
   wire [9:0] input_chip_3d;
   wire [9:0] output_chip_3d;
   wire [9:0] input_chip_4d;
   wire [9:0] output_chip_4d;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_ibdap_n  = IBDAP_n;
   assign s_block_n  = BLOCK_n;
   assign s_cact_n   = CACT_n;
   assign s_osc      = OSC;
   assign s_ibperr_n = IBPERR_n;
   assign s_isemrq_n = ISEMRQ_n;
   assign s_clear_n  = CLEAR_n;
   assign s_refrq_n  = REFRQ_n;
   assign s_ibinput_n= IBINPUT_n;
   assign s_ibdry_n  = IBDRY_n;
   assign s_pd1      = PD1;
   assign s_pd3      = PD3;
   assign s_ibreq_n  = IBREQ_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BDAP50_n   = s_bdap50_n;
   assign BDRY25_n   = s_bdry25_n;
   assign BDRY50_n   = s_bdry50_n;
   assign BDRY75_n   = s_bdry75_n;
   assign BINPUT50_n = s_binput50_n;
   assign BINPUT75_n = s_binput75_n;
   assign BLOCK25_n  = s_block25_n;
   assign BPERR50_n  = s_bperr50_n;
   assign BREQ50_n   = s_breq50_n;
   assign CACT25_n   = s_cact25_n;
   assign MR_n       = s_mr_n;
   assign REFRQ50_n  = s_refrq50_n;
   assign SEMRQ50_n  = s_semrq50_n;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   // Bus Driver 10 bits. Positive edge-triggered registers with D-type flip-flops and 3-state
   AM29C821 CHIP_3D (
      .CK(s_osc),
      .OE_n(s_pd3),
      .D(input_chip_3d),
      .Y(output_chip_3d)          
   );

   // Assignments for CHIP_3D inputs and outputs
   assign input_chip_3d = {s_block_n,   s_ibdap_n,  s_ibreq_n,  s_cact_n,   s_ibdry_n,  s_ibperr_n,  s_ibinput_n,  s_isemrq_n,  s_refrq_n,   s_clear_n   };
   assign                 {s_block25_n, s_bdap25_n, s_breq25_n, s_cact25_n, s_bdry25_n, s_bperr25_n, s_binput25_n, s_semrq25_n, s_refrq25_n, s_clear25_n } = output_chip_3d;
      

   // Bus Driver 10 bits. Positive edge-triggered registers with D-type flip-flops and 3-state
   AM29C821 CHIP_4D (
      .CK(s_osc),
      .OE_n(s_pd1),
      .D(input_chip_4d),
      .Y(output_chip_4d)
   );

   // Assignments for CHIP_4D inputs and outputs
   assign input_chip_4d = {s_binput50_n, s_bdap25_n, s_breq25_n, s_bdry50_n, s_bdry25_n, s_bperr25_n, s_binput25_n, s_semrq25_n, s_refrq25_n, s_clear25_n};
   assign                 {s_binput75_n, s_bdap50_n, s_breq50_n, s_bdry75_n, s_bdry50_n, s_bperr50_n, s_binput50_n, s_semrq50_n, s_refrq50_n, s_mr_n } = output_chip_4d;

endmodule
