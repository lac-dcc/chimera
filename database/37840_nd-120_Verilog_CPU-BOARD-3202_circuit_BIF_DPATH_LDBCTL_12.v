// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** BIF/DPATH/LDBCTL                                                      **
** IO DECODING                                                           **
** SHEET 12 of 50                                                        **
**                                                                       ** 
** Last reviewed: 13-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/

module BIF_DPATH_LDBCTL_12( 
   input BDAP50_n,
   input BDRY25_n,
   input BDRY50_n,
   input BGNT50_n,
   input BGNT_n,
   input BINPUT50_n,
   input CACT_n,
   input CC2_n,
   input CGNT50_n,
   input CGNT_n,
   input EADR_n,
   input EBUS_n,
   input GNT_n,
   input IBAPR_n,
   input IOD_n,
   input IORQ_n,
   input MIS0,
   input MWRITE_n,
   input PD1,
   input PD3,
   input Q0_n,
   input Q2_n,
   input RT_n,
   input TERM_n,
   input WRITE,

   output BGNTCACT,
   output CBWRITE_n,
   output CGNTCACT_n,
   output CLKBD,
   output DBAPR,
   output DSTB_n,
   output EBADR,
   output EBD_n,
   output EMD_n,
   output WBD_n,
   output WLBD_n   
);

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_bact_n;
   wire s_bdap50_n;
   wire s_bdry25_n;
   wire s_bdry50_n;
   wire s_bgncact;
   wire s_bgnt_n;
   wire s_bgnt50_n;
   wire s_binput50_n;
   wire s_cact_n;
   wire s_cbwrite_n;
   wire s_cc2_n;
   wire s_cgnt_n;
   wire s_cgnt50_n;
   wire s_cgntcact_n;
   wire s_clkbd;
   wire s_cmwrite;
   wire s_dbapr;
   wire s_dstb_n;   
   wire s_eadr_n;
   wire s_ebadr;
   wire s_ebd_n;
   wire s_ebus_n;
   wire s_emd_n;
   wire s_gnt_n;
   wire s_ibapr_n;
   wire s_iod_n;
   wire s_iorq_n;
   wire s_iorq_n;
   wire s_mis0;
   wire s_mwrite_n;
   wire s_pd1;
   wire s_pd3;
   wire s_q0_n;
   wire s_q2_n;
   wire s_rt_n;
   wire s_term_n;
   wire s_wbd_n;
   wire s_wlbd_n;
   wire s_write;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_bdap50_n    = BDAP50_n;
   assign s_bdry25_n    = BDRY25_n;
   assign s_bdry50_n    = BDRY50_n;
   assign s_bgnt_n      = BGNT_n;
   assign s_bgnt50_n    = BGNT50_n;
   assign s_binput50_n  = BINPUT50_n;
   assign s_cact_n      = CACT_n;
   assign s_cc2_n       = CC2_n;
   assign s_cgnt_n      = CGNT_n;
   assign s_cgnt50_n    = CGNT50_n;
   assign s_eadr_n      = EADR_n;
   assign s_ebus_n      = EBUS_n;
   assign s_gnt_n       = GNT_n;
   assign s_ibapr_n     = IBAPR_n;
   assign s_iod_n       = IOD_n;
   assign s_iorq_n      = IORQ_n;
   assign s_mis0        = MIS0;
   assign s_mwrite_n    = MWRITE_n;
   assign s_pd1         = PD1;
   assign s_pd3         = PD3;
   assign s_q0_n        = Q0_n;
   assign s_q2_n        = Q2_n;
   assign s_rt_n        = RT_n;
   assign s_term_n      = TERM_n;
   assign s_write       = WRITE;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BGNTCACT      = s_bgncact;
   assign CBWRITE_n     = s_cbwrite_n;
   assign CGNTCACT_n    = s_cgntcact_n;
   assign CLKBD         = s_clkbd;
   assign DBAPR         = s_dbapr;
   assign DSTB_n        = s_dstb_n;
   assign EBADR         = s_ebadr;
   assign EBD_n         = s_ebd_n;
   assign EMD_n         = s_emd_n;
   assign WBD_n         = s_wbd_n;
   assign WLBD_n        = s_wlbd_n;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   PAL_44303B   PAL_44303_ULBC2 
   (
         .CACT_n(s_cact_n),           // I0                          
         .CGNT_n(s_cgnt_n),           // I1                          
         .EADR_n(s_eadr_n),           // I2 - Address from CPU to Bus
         .BINPUT50_n(s_binput50_n),   // I3                          
         .MIS0(s_mis0),               // I4                          
         .IOD_n(s_iod_n),             // I5                          
         .WRITE(s_write),             // I6                          
         .TEST(s_pd1), //PD1          // I7 - PD1                    
         //.I8(), // not connected    // I8                          
         .BACT_n(s_bact_n),           // I9                          

         .WBD_n(s_wbd_n),             // Y0_n - Write Bus Direction    
         .CBWRITE_n(s_wlbd_n),        // Y1_n - CPU Write cycle to Bus 

         .WLBD_n(s_cbwrite_n),        // B0_n - Write Local Bus Direction
         .CMWRITE_n(s_cmwrite)        // B1_n - CPU Write to Local Memory (not connected, just used internal in PAL)
      );

      PAL_44302B   PAL_44302_ULBC1 
      (
         .Q0_n(s_q0_n),       // I0
         .Q2_n(s_q2_n),              // I1
         .CC2_n(s_cc2_n),            // I2
         .BDRY25_n(s_bdry25_n),      // I3
         .BDRY50_n(s_bdry50_n),      // I4
         .CGNT_n(s_cgnt_n),          // I5
         .CGNT50_n(s_cgnt50_n),      // I6
         .CACT_n(s_cact_n),          // I7
         .TERM_n(s_term_n),          // I8
         .BGNT_n(s_bgnt_n),          // I9

         .BGNTCACT_n(s_bgncact),     // Y0_n
         .CGNTCACT_n(s_cgntcact_n),  // Y1_n

         .EMD_n(s_emd_n),              // B0_n
         .BDSTB_n1_n(s_dstb_n),        // B1_n
         //.B2_n(),                    // B2_n
         .TEST(s_pd3),  //PD3          // B3_n
         .IORQ_n(s_iorq_n),            // B4_n
         .RT_n(s_rt_n)                 // B5_n
     
      );
      
      PAL_44304E   PAL_44304_ULBC3 
      (
         .CGNT_n(s_cgnt_n),      // I0                  
         .BGNT_n(s_bgnt_n),      // I1                  
         .BGNT50_n(s_bgnt50_n),  // I2                  
         .MWRITE_n(s_mwrite_n),  // I3                  
         .BDAP50_n(s_bdap50_n),  // I4                  
         .EBUS_n(s_ebus_n),      // I5                  
         .IBAPR_n(s_ibapr_n),    // I6                  
         .GNT_n(s_gnt_n),        // I7                  
         .TEST(s_pd3),           // I8 - PD3            
         //.I9(),                // I9                  
         
         .DBAPR(s_dbapr),     // Y0_n  
         //.Y1_n()            // Y1_n  

         .BACT_n(s_bact_n),   // B0_n 
         .EBADR_b1(s_ebadr),  // B1_n 
         //.FAPR(),           // B2_n 
         //.SAPR(),           // B3_n 
         .CLKBD(s_clkbd),     // B4_n 
         .EBD_n(s_ebd_n)      // B5_n  
      );

endmodule
