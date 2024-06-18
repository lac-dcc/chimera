// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

 /**************************************************************************
** ND120 CPU, MM&M                                                       **
** MEM/ERROR                                                             **
** LOCAL PES & PEA                                                       **
** SHEET 47 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module MEM_ERROR_47( 
   
   // Input signals
   
   input        BCGNT50,
   input        BLOCKL25,
   input        CGNT50_n,
   input        CORR_n,
   input        FETCH,
   input        HIERR,
   input [23:0] LBD_23_0_IN,
   input        LERR_n,
   input        LOERR,
   input        MR_n,
   input        PA_n,
   input        PD4,
   input        PS_n,
   input        RDATA25,
   input        RERR_n,

   // Output signals

   output        BLOCKL_n,
   output [15:0] IDB_15_0_OUT
   );



   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_pea_idb_15_0_out;
   wire [23:0] s_lbd_23_0;
   wire [15:0] s_pes_idb_15_0_out;
   wire        s_ps_n;
   wire        s_spesl;
   wire        s_blockl25;
   wire        s_pa_n;
   wire        s_lerr_n;
   wire        s_mr_n;
   wire        s_speal;
   wire        s_epesl_n;
   wire        s_cgnt50_n;
   wire        s_corr_n;
   wire        s_loerr;
   wire        s_epeal_n;
   wire        s_pd4;
   wire        s_rdata25;
   wire        s_bcgnt50;
   wire        s_rerr_n;
   wire        s_blockl_n;
   wire        s_fetch;
   wire        s_hierr;
   wire        s_power;


   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_lbd_23_0[23:0] = LBD_23_0_IN;
   assign s_ps_n           = PS_n;
   assign s_blockl25       = BLOCKL25;
   assign s_pa_n           = PA_n;
   assign s_lerr_n         = LERR_n;
   assign s_mr_n           = MR_n;
   assign s_cgnt50_n       = CGNT50_n;
   assign s_corr_n         = CORR_n;
   assign s_loerr          = LOERR;
   assign s_pd4            = PD4;
   assign s_rdata25        = RDATA25;
   assign s_bcgnt50        = BCGNT50;
   assign s_rerr_n         = RERR_n;
   assign s_fetch          = FETCH;
   assign s_hierr          = HIERR;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BLOCKL_n         = s_blockl_n;

   // OR together two 16-bit values (maybe use logic to detect which signal to use?)
   assign IDB_15_0_OUT     = s_pea_idb_15_0_out[15:0] | s_pes_idb_15_0_out[15:0];   

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_power  =  1'b1;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   // PESL register
   TTL_74374   CHIP_7C_PESL_HI (.CK(s_spesl),
                                .D({s_fetch,s_cgnt50_n,s_power,s_power,s_power, s_corr_n,s_hierr,s_loerr}),
                                .OE_n(s_epesl_n),
                                .Q(s_pes_idb_15_0_out[15:8])
                              );

   TTL_74374   CHIP_3C_PESL_LO (.CK(s_speal),
                                .D(s_lbd_23_0[23:16]),
                                .OE_n(s_epesl_n),
                                .Q(s_pes_idb_15_0_out[7:0])
                                );


   // PEAL register                                                              
   TTL_74374   CHIP_4C_PEAL_HI (.CK(s_speal),
                                .D(s_lbd_23_0[15:8]),
                                .OE_n(s_epeal_n),
                                .Q(s_pea_idb_15_0_out[15:8])
                              );

   TTL_74374   CHIP_6D_PEAL_LO (.CK(s_speal),
                                .D(s_lbd_23_0[7:0]),
                                .OE_n(s_epeal_n),
                                .Q(s_pea_idb_15_0_out[7:0])
                                );

   // Hardware patch via PAL 45009B                                

   PAL_45009B   PAL_45009_UERROR ( 
                                   .EPESL_n(s_epesl_n),           // B0_n - EPESL_n (clock to PEAL register)
                                   .EPEAL_n(s_epeal_n),           // B1_n - EPEAL_n (/output enable to PEAL register)
                                   .BLOCKL_n(s_blockl_n),         // B2_n - BLOCKL_n

                                   .RDATA(s_rdata25),             // I0 - RDATA25 signal (doesnt match name)
                                   .BLOCKL25_n(s_blockl25),       // I1 - BLOCKL25_n
                                   .BCGNT50(s_bcgnt50),           // I2 - BCGNT50
                                   .PS_n(s_ps_n),                 // I3 - PS_n
                                   .RERR_n(s_rerr_n),             // I4 - RERR_n
                                   .PA_n(s_pa_n),                 // I5 - PA_n
                                   .TEST(s_pd4),                  // I6 - PD4
                                   .LERR_n(s_lerr_n),             // I7 - LERR_n
                                   //.I8(1'b0),                   // I8 - (not connected)
                                   .MR_n(s_mr_n),                 // I9 - MR_n

                                   .SPESL(s_spesl),        // Y0_n (OUT Only)
                                   .SPEAL(s_speal)                   // Y1_n (OUT ONLY)
                                   );




endmodule
