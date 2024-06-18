// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** BIF/BCTL                                                              **
** BIF CONTROL                                                           **   
** SHEET 6 of 50                                                         **
**                                                                       ** 
** Last reviewed: 13-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/

module BIF_BCTL_6
(
   input CBWRITE_n,
   input CC2_n,
   input CGNT50_n,
   input CGNT_n,
   input CLEAR_n,
   input CRQ_n,
   input DBAPR,
   input GNT50_n,
   input IBDAP_n,
   input IBDRY_n,
   input IBINPUT_n,
   input IBPERR_n,
   input IBREQ_n,
   input IORQ_n,
   input ISEMRQ_n,
   input LERR_n,
   input LPERR_n,
   input MIS0,
   input MOFF_n,
   input MOR25_n,
   input OSC,
   input PA_n,
   input PD1,
   input PD3,
   input PS_n,
   input REFRQ_n,
   input SSEMA_n,
   input TERM_n,
   input TOUT,

   output       BAPR_n,
   output       BDAP50_n,
   output       BDAP_n,
   output       BDRY25_n,
   output       BDRY50_n,
   output       BDRY_n,
   output       BERROR_n,
   output       BINACK_n,
   output       BINPUT50_n,
   output       BINPUT_n,
   output       BIOXE_n,
   output       BMEM_n,
   output       BREF_n,
   output       CACT_n,
   output       DAP_n,
   output       EADR_n,
   output       EPEA_n,
   output       EPES_n,
   output       GNT_n,
   output       IOD_n,
   output       IOXERR_n,
   output       MOR_n,
   output       MR_n,
   output       OUTGRANT_n,
   output       OUTIDENT_n,
   output       PARERR_n,
   output [2:0] Q_2_0_n,
   output       REF_n,
   output       RERR_n,
   output       SEMRQ50_n,
   output       SEMRQ_n,
   output       SPEA,
   output       SPES
);   

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_q_2_0_n;
   wire       s_term_n;
   wire       s_moff_n;
   wire       s_pd1;
   wire       s_iorq_n;
   wire       s_dbapr;
   wire       s_clear_n;
   wire       s_ibdap_n;
   wire       s_ibperr_n;
   wire       s_ibreq_n;
   wire       s_gnt50_n;
   wire       s_ibdry_n;
   wire       s_cc2_n;
   wire       s_cgnt_n;
   wire       s_mor25_n;
   wire       s_refrq_n;
   wire       s_crq_n;
   wire       s_tout;
   wire       s_ibinput_n;
   wire       s_ps_n;
   wire       s_cgnt50_n;
   wire       s_lperr_n;
   wire       s_isemrq_n;
   wire       s_ssema_n;
   wire       s_pa_n;
   wire       s_osc;
   wire       s_lerr_n;
   wire       s_mis0;
   wire       s_pd3;
   wire       s_cbwrite_n;
   wire       s_bdry50_n;
   wire       s_apr_n;
   wire       s_bapr_n;
   wire       s_bdap50_n;
   wire       s_bdap_n;
   wire       s_bdry25_n;
   wire       s_bdry_n;
   wire       s_berror_n;
   wire       s_binack_n;
   wire       s_binput50_n;
   wire       s_binput_n;
   wire       s_bioxe_n;
   wire       s_bmem_n;
   wire       s_bref_n;
   wire       s_cact_n;
   wire       s_dap_n;
   wire       s_eadr_n;
   wire       s_epea_n;
   wire       s_epes_n;
   wire       s_gnt_n;
   wire       s_iod_n;
   wire       s_ioxerr_n;
   wire       s_mor_n;
   wire       s_mr_n;
   wire       s_outgrant_n;
   wire       s_outident_n;
   wire       s_parerr_n;
   wire       s_ref_n;
   wire       s_rerr_n;
   wire       s_semrq50_n;
   wire       s_semrq_n;
   wire       s_spea;
   wire       s_spes;   
   wire       s_bgntcact_n;
   wire       s_binput75_n;
   wire       s_block_n;
   wire       s_bperr50_n;
   wire       s_block25_n;
   wire       s_bdry75_n;
   wire       s_act_n;
   wire       s_dore_n;
   wire       s_mem_n;
   wire       s_iord_n;
   wire       s_gnt;
   wire       s_memr_n;
   wire       s_cact25_n;
   wire       s_eiod_n;
   wire       s_brq50_n;
   wire       s_refrq50_n;
   wire       s_sem_n;
   wire       s_ioerr_n;   
   wire       s_test_n;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_term_n        = TERM_n;
   assign s_moff_n        = MOFF_n;
   assign s_pd1           = PD1;
   assign s_iorq_n        = IORQ_n;
   assign s_dbapr         = DBAPR;
   assign s_clear_n       = CLEAR_n;
   assign s_ibdap_n       = IBDAP_n;
   assign s_ibperr_n      = IBPERR_n;
   assign s_ibreq_n       = IBREQ_n;
   assign s_gnt50_n       = GNT50_n;
   assign s_ibdry_n       = IBDRY_n;
   assign s_cc2_n         = CC2_n;
   assign s_cgnt_n        = CGNT_n;
   assign s_mor25_n       = MOR25_n;
   assign s_refrq_n       = REFRQ_n;
   assign s_crq_n         = CRQ_n;
   assign s_tout          = TOUT;
   assign s_ibinput_n     = IBINPUT_n;
   assign s_ps_n          = PS_n;
   assign s_cgnt50_n      = CGNT50_n;
   assign s_lperr_n       = LPERR_n;
   assign s_isemrq_n      = ISEMRQ_n;
   assign s_ssema_n       = SSEMA_n;
   assign s_pa_n          = PA_n;
   assign s_osc           = OSC;
   assign s_lerr_n        = LERR_n;
   assign s_mis0          = MIS0;
   assign s_pd3           = PD3;
   assign s_cbwrite_n     = CBWRITE_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BAPR_n     = s_bapr_n;
   assign BDAP50_n   = s_bdap50_n;
   assign BDAP_n     = s_bdap_n;
   assign BDRY25_n   = s_bdry25_n;
   assign BDRY50_n   = s_bdry50_n;
   assign BDRY_n     = s_bdry_n;
   assign BERROR_n   = s_berror_n;
   assign BINACK_n   = s_binack_n;
   assign BINPUT50_n = s_binput50_n;
   assign BINPUT_n   = s_binput_n;
   assign BIOXE_n    = s_bioxe_n;
   assign BMEM_n     = s_bmem_n;
   assign BREF_n     = s_bref_n;
   assign CACT_n     = s_cact_n;
   assign DAP_n      = s_dap_n;
   assign EADR_n     = s_eadr_n;
   assign EPEA_n     = s_epea_n;
   assign EPES_n     = s_epes_n;
   assign GNT_n      = s_gnt_n;
   assign IOD_n      = s_iod_n;
   assign IOXERR_n   = s_ioxerr_n;
   assign MOR_n      = s_mor_n;
   assign MR_n       = s_mr_n;
   assign OUTGRANT_n = s_outgrant_n;
   assign OUTIDENT_n = s_outident_n;
   assign PARERR_n   = s_parerr_n;
   assign Q_2_0_n    = s_q_2_0_n[2:0];
   assign REF_n      = s_ref_n;
   assign RERR_n     = s_rerr_n;
   assign SEMRQ50_n  = s_semrq50_n;
   assign SEMRQ_n    = s_semrq_n;
   assign SPEA       = s_spea;
   assign SPES       = s_spes;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_ps_n),
               .input2(s_rerr_n),
               .result(s_epes_n));

   NAND_GATE #(.BubblesMask(2'b11))
      GATES_2 (.input1(s_pa_n),
               .input2(s_rerr_n),
               .result(s_epea_n));

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   PAL_44801A PAL_44801_UBARB 
   (
      .CK(s_osc),                // Clock signal                         
      .OE_n(s_pd3),              // OUTPUT ENABLE (active-low) for Q0-Q5 

      .CRQ_n(s_crq_n),           // I0 - CRQ_n      
      .IORQ_n(s_iorq_n),         // I1 - IORQ_n     
      .MR_n(s_mr_n),             // I2 - MR_n       
      .BRQ50_n(s_brq50_n),       // I3 - BRQ50_n    
      .REFRQ50_n(s_refrq50_n),   // I4 - REFRQ50_n  
      .BDRY25_n(s_bdry25_n),     // I5 - BDRY25_n   
      .SEMRQ50_n(s_semrq50_n),   // I6 - SEMRQ50_n  
      .MOFF_n(s_moff_n),         // I7 - MOFF_n     

      .SEM_n(s_sem_n),           // Q0_n - SEM_n          
      .ACT_n(s_act_n),           // Q1_n - ACT_n (n.c.)   
      .DOREF_n(s_dore_n),        // Q2_n - DOREF_n (n.c.) 
      .MEM_n(s_mem_n),           // Q3_n - MEM_n (n.c.)   
      .REF_n(s_ref_n),           // Q4_n - REF_n          
      .IOD_n(s_iod_n),           // Q5_n - IOD_n          
      .GNT_n(s_gnt_n),           // Q6_n - GNT_n          
      .CACT_n(s_cact_n)          // Q7_n - CACT_n         
   );

   PAL_44401B PAL_44401_UBTIM 
   (
      .CK(s_osc),
      .OE_n(s_pd1),
            
      .CC2_n(s_cc2_n),           // I0 
      .CACT_n(s_cact_n),         // I1 
      .CACT25_n(s_cact25_n),     // I2 
      .BDRY50_n(s_bdry50_n),     // I3 
      .CGNT_n(s_cgnt_n),         // I4 
      .CGNT50_n(s_cgnt50_n),     // I5 
      .TERM_n(s_term_n),         // I6 
      .IORQ_n(s_iorq_n),         // I7 
                                   
      .Q0_n(s_q_2_0_n[0]),       // Q0_n                            
      .Q1_n(s_q_2_0_n[1]),       // Q1_n                            
      .Q2_n(s_q_2_0_n[2]),       // Q2_n                            
      //.Q3_n(),                 // Q3_n (not connected, no signal) 
                                   
      .APR_n(s_apr_n),           // B0_n 
      .DAP_n(s_dap_n),           // B1_n 
      .EIOD_n(s_eiod_n),         // B2_n 
      .EADR_n(s_eadr_n)          // B3_n 
   );
      
   PAL_45001B PAL_45001_UBPAR 
   (
      .BDRY50_n(s_bdry50_n),     // I0 - BDRY50_n  
      .BDRY75_n(s_bdry75_n),     // I1 - BDRY75_n  
      .BLOCK25_n(s_block25_n),   // I2 - BLOCK25_n 
      .BPERR50_n(s_bperr50_n),   // I3 - BPERR50_n 
      .DBAPR_n(s_dbapr),         // I4 - DBAPR_n   
      .MOR25_n(s_mor25_n),       // I5 - MOR25_n   
      .LPERR_n(s_lperr_n),       // I6 - LPERR_n   
      .MR_n(s_mr_n),             // I7 - MR_n      
      .EPES_n(s_epes_n),         // I8 - EPES_n    
      .EPEA_n(s_epea_n),         // I9 - EPEA_n    
                                   
      .SPEA(s_spea),             // Y0_n (OUT Only)      
      .SPES(s_spes),             // Y1_n (OUT ONLY)      
                                                           
      .BLOCK_n(s_block_n),       // B0_n - BLOCK_n (out) 
      .PARERR_n(s_parerr_n),     // B1_n - PARERR_n (out)
      .RERR_n(s_rerr_n),         // B2_n                 
      //.B3_n(s_test_n),         // B3_n - (n.c.)        
      .TEST(s_test_n),           // B4_n - TEST          
      .LERR_n(s_lerr_n)          // B5_n                 
   );

   BIF_BCTL_BDRV_7 BDRV 
   (
      .APR_n(s_apr_n),
      .BAPR_n(s_bapr_n),
      .BDAP_n(s_bdap_n),
      .BDRY25_n(s_bdry25_n),
      .BDRY50_n(s_bdry50_n),
      .BDRY_n(s_bdry_n),
      .BERROR_n(s_berror_n),
      .BINACK_n(s_binack_n),
      .BINPUT75_n(s_binput75_n),
      .BINPUT_n(s_binput_n),
      .BIOXE_n(s_bioxe_n),
      .BMEM_n(s_bmem_n),
      .BREF_n(s_bref_n),
      .CACT_n(s_cact_n),
      .CBWRITE_n(s_cbwrite_n),
      .DAP_n(s_dap_n),
      .EIOD_n(s_eiod_n),
      .GNT50_n(s_gnt50_n),
      .IBDRY_n(s_ibdry_n),
      .IBREQ_n(s_ibreq_n),
      .IOD_n(s_iod_n),
      .IOXERR_n(s_ioxerr_n),
      .MEM_n(s_mem_n),
      .MIS0(s_mis0),
      .MOR_n(s_mor_n),
      .OUTGRANT_n(s_outgrant_n),
      .OUTIDENT_n(s_outident_n),
      .REF_n(s_ref_n),
      .SEMRQ_n(s_semrq_n),
      .SEM_n(s_sem_n),
      .SSEMA_n(s_ssema_n),
      .TOUT(s_tout)
   );

   BIF_BCTL_SYNC_8 SYNC 
   (
      .BDAP50_n(s_bdap50_n),
      .BDRY25_n(s_bdry25_n),
      .BDRY50_n(s_bdry50_n),
      .BDRY75_n(s_bdry75_n),
      .BINPUT50_n(s_binput50_n),
      .BINPUT75_n(s_binput75_n),
      .BLOCK25_n(s_block25_n),
      .BLOCK_n(s_block_n),
      .BPERR50_n(s_bperr50_n),
      .BREQ50_n(s_brq50_n),
      .CACT25_n(s_cact25_n),
      .CACT_n(s_cact_n),
      .CLEAR_n(s_clear_n),
      .IBDAP_n(s_ibdap_n),
      .IBDRY_n(s_ibdry_n),
      .IBINPUT_n(s_ibinput_n),
      .IBPERR_n(s_ibperr_n),
      .IBREQ_n(s_ibreq_n),
      .ISEMRQ_n(s_isemrq_n),
      .MR_n(s_mr_n),
      .OSC(s_osc),
      .PD1(s_pd1),
      .PD3(s_pd3),
      .REFRQ50_n(s_refrq50_n),
      .REFRQ_n(s_refrq_n),
      .SEMRQ50_n(s_semrq50_n)
   );

endmodule
