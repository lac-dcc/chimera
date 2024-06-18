// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM/RAMC                                                              **
** LOCAL RAM CONTROL                                                     **
** SHEET 50 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

// TODO: Connect PAL chips

module MEM_RAMC_50(

   // Input signals
   input BDAP50_n,
   input BDRY50_n,
   input BGNT25_n,
   input BLRQ50_n,
   input CGNT25_n,
   input CLRQ_n,
   input MR_n,
   input OSC,
   input PD1,
   input PD3,
   input RLRQ_n,
   input SEMRQ50_n,
   input SSEMA_n,

   // Output signals

   output       BGNT25,
   output       BGNT_n,
   output       CAS,
   output       CGNT_n,
   output       HIEN_n,
   output       LOEN_n,
   output       QD_n,
   output       RAS,
   output       RGNT_n,
   output       LED_CPU_GI, //LED_CPU_GRANT_INDICATOR,
   output       LED_BUS_GI //LED_BUS_GRANT_INDICATOR
);


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_loen_n;
   wire s_bgnt_n;
   wire s_rgnt_n;
   wire s_mr_n;
   wire s_bgnt25;
   wire s_hien_n;
   wire s_qd_n;
   wire s_ras;
   wire s_cas;
   wire s_ssema_n;
   wire s_semrq50_n;
   wire s_rlrq_n;
   wire s_bdap50_n;
   wire s_clrq_n;
   wire s_blrq50_n;
   wire s_pd1;
   wire s_cgnt_n;
   wire s_osc;
   wire s_cgnt25_n;
   wire s_bdry50_n;
   wire s_pd3;
   wire s_bgnt25_n;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_mr_n        = MR_n;
   assign s_ssema_n     = SSEMA_n;
   assign s_semrq50_n   = SEMRQ50_n;
   assign s_rlrq_n      = RLRQ_n;
   assign s_bdap50_n    = BDAP50_n;
   assign s_clrq_n      = CLRQ_n;
   assign s_blrq50_n    = BLRQ50_n;
   assign s_pd1         = PD1;
   assign s_osc         = OSC;
   assign s_cgnt25_n    = CGNT25_n;
   assign s_bdry50_n    = BDRY50_n;
   assign s_pd3         = PD3;
   assign s_bgnt25_n    = BGNT25_n;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BGNT25 = s_bgnt25;
   assign BGNT_n = s_bgnt_n;
   assign CAS    = s_cas;
   assign CGNT_n = s_cgnt_n;
   assign HIEN_n = s_hien_n;
   assign LOEN_n = s_loen_n;
   assign QD_n   = s_qd_n;
   assign RAS    = s_ras;
   assign RGNT_n = s_rgnt_n;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // LED: CPU_GRANT_INDICATOR
   assign LED_CPU_GI = s_cgnt_n;

   // LED: BUS_GRANT_INDICATOR
   assign LED_BUS_GI= s_bgnt_n;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/



   PAL_44803A  PAL_44803_URAMA (
                                 .CK(s_osc),
                                 .OE_n(s_pd1),

                                 .LOEN_n(s_loen_n),         // I0 - LOEN_n
                                 .RLRQ_n(s_rlrq_n),         // I1 - RLRQ_n
                                 .MR_n(s_mr_n),             // I2 - MR_n
                                 .CLRQ_n(s_clrq_n),         // I3 - CLRQ_n
                                 .BLRQ50_n(s_blrq50_n),     // I4 - BLRQ50_n
                                 .SSEMA_n(s_ssema_n),       // I5 - SSEMA_n
                                 .SEMRQ50_n(s_semrq50_n),   // I6 - SEMRQ50_n
                                 //.I7(1'b0),               // I7 - (not connected)
                                
                                 .RGNT_n(s_rgnt_n),         // Q0_n - RGNT_n
                                 .CGNT_n(s_cgnt_n),         // Q1_n - CGNT_n
                                 .BGNT_n(s_bgnt_n),         // Q2_n - BGNT_n
                                 .LOEN25_n(),               // Q3_n - LOEN25_n (n.c.)   
                                 .LDR_n(),                  // Q4_n - LDR_n (n.c.)
                                 .CSEM_n(),                 // Q5_n - CSEM_n (n.c.)
                                 .BSEM_n(),                 // Q6_n - BSEM_n (n.c.)
                                 .BCGNT25(s_bgnt25)         // Q7_n - BCGNT25
   );

    PAL_44902A PAL_44902_URAMC (
                                 .CK(s_osc),
                                 .OE_n(s_pd3),

                                 .RGNT_n(s_rgnt_n),      // I0 - RGNT_n
                                 //.CGNT_n(s_cgnt_n),    // I1 - CGNT_n (NOT USED!!)
                                 //.BGNT_n(s_bgnt_n),    // I2 - BGNT_n (NOT USED!!)
                                 .BDAP50_n(s_bdap50_n),  // I3 - BDAP50_n
                                 .MR_n(s_mr_n),          // I4 - MR_n
                                 .BGNT25_n(s_bgnt25_n),  // I5 - BGNT25_n
                                 .CGNT25_n(s_cgnt25_n),  // I6 - CGNT25_n
                                 .BDRY50_n(s_bdry50_n),  // I7 - BDRY50_n
                                
                                 .QA_n(),                // QA_n - not connected
                                 .QB_n(),                // QB_n - not connected
                                 .QC_n(),                // QC_n - not connected
                                 .QD_n(s_qd_n),          // Q3_n - QD_n
                                 .RAS(s_ras),            // Q4_n - RAS
                                 .CAS(s_cas),            // Q5_n - CAS
                                 .LOEN_n(s_loen_n),      // Q6_n - LOEN_n
                                 .HIEN_n(s_hien_n)       // Q7_n - HIEN_n
    );


endmodule
