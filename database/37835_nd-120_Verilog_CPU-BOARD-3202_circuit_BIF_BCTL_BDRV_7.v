// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** BIF/BCTL/BDRV                                                         **
** BUS DRIVER                                                            **
** SHEET 7 of 50                                                         **
**                                                                       ** 
** Last reviewed: 13-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/
module BIF_BCTL_BDRV_7
( 
   input APR_n,
   input BDRY25_n,
   input BDRY50_n,
   input BINPUT75_n,
   input CACT_n,
   input CBWRITE_n,
   input DAP_n,
   input EIOD_n,
   input GNT50_n,
   input IBDRY_n,
   input IBREQ_n,
   input IOD_n,
   input MEM_n,
   input MIS0,
   input REF_n,
   input SEM_n,
   input SSEMA_n,
   input TOUT,

   output BAPR_n,
   output BDAP_n,
   output BDRY_n,
   output BERROR_n,
   output BINACK_n,
   output BINPUT_n,
   output BIOXE_n,
   output BMEM_n,
   output BREF_n,
   output IOXERR_n,
   output MOR_n,
   output OUTGRANT_n,
   output OUTIDENT_n,
   output SEMRQ_n
);


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_iod_n;
   wire s_eiod_n;
   wire s_outident_n;
   wire s_bioxe_n;
   wire s_binack_n;
   wire s_ioxerr_n;
   wire s_mor_n;
   wire s_bdry_n;
   wire s_ibdry_n;
   wire s_sem_n;
   wire s_cbwrite_n;
   
   wire s_out_8g_6;   
   wire s_gnt50;
   wire s_gnd;
   wire s_mis0_n;
   wire s_dap_n;
   wire s_ssema_n;
   wire s_cact_n;
   wire s_bmem_n;
   wire s_mem_n;
   wire s_out_2a_8;
   wire s_berror_n;
   wire s_gnt50_n;
   wire s_out_2b_8;
   wire s_ibreq;
   wire s_out_8g_3;
   wire s_ref_n;
   wire s_apr_n;
   wire s_ibreq_n;
   wire s_bdry25_n;
   wire s_bdry50_n;
   wire s_bdap_n;
   wire s_binput75_n;
   wire s_out_2b_3;
   wire s_tout;   
   wire s_dap;
   wire s_out_9d_10;
   wire s_mis0;
   wire s_out_2b_6;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_apr_n          = APR_n;
   assign s_bdry25_n       = BDRY25_n;
   assign s_bdry50_n       = BDRY50_n;
   assign s_binput75_n     = BINPUT75_n;
   assign s_cact_n         = CACT_n;
   assign s_cbwrite_n      = CBWRITE_n;
   assign s_dap_n          = DAP_n;
   assign s_gnt50_n        = GNT50_n;
   assign s_ibdry_n        = IBDRY_n;
   assign s_ibreq_n        = IBREQ_n;
   assign s_iod_n          = IOD_n;
   assign s_eiod_n         = EIOD_n;
   assign s_mem_n          = MEM_n;
   assign s_mis0           = MIS0;
   assign s_ref_n          = REF_n;
   assign s_sem_n          = SEM_n;
   assign s_ssema_n        = SSEMA_n;
   assign s_tout           = TOUT;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BAPR_n     = s_apr_n;
   assign BDAP_n     = s_bdap_n;
   assign BDRY_n     = s_bdry_n;
   assign BERROR_n   = s_berror_n;
   assign BINACK_n   = s_binack_n;
   assign BINPUT_n   = s_cbwrite_n;
   assign BIOXE_n    = s_bioxe_n;
   assign BMEM_n     = s_bmem_n;
   assign BREF_n     = s_ref_n;
   assign IOXERR_n   = s_ioxerr_n;
   assign MOR_n      = s_mor_n;
   assign OUTGRANT_n = s_out_2b_8;
   assign OUTIDENT_n = s_outident_n;
   assign SEMRQ_n    = s_out_2a_8;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_gnd  =  1'b0;

   // Signal inverters
   assign s_gnt50    = ~s_gnt50_n;
   assign s_mis0_n   = ~s_mis0;
   assign s_ibreq    = ~s_ibreq_n;
   assign s_dap      = ~s_dap_n;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_out_2b_3),
               .input2(s_sem_n),
               .result(s_out_2b_6));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_cbwrite_n),
               .input2(s_out_9d_10),
               .result(s_out_2a_8));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_out_2b_6),
               .input2(s_gnt50),
               .result(s_out_2b_8));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_ibreq),
               .input2(s_iod_n),
               .result(s_out_8g_3));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_5 (.input1(s_out_8g_3),
               .input2(s_mem_n),
               .result(s_out_8g_6));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_6 (.input1(s_ssema_n),
               .input2(s_cact_n),
               .result(s_out_9d_10));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_dap),
               .input2(s_bdry50_n),
               .result(s_bdap_n));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_ibdry_n),
               .input2(s_out_8g_6),
               .result(s_bmem_n));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_bdry25_n),
               .input2(s_bdry50_n),
               .result(s_out_2b_3));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/
   
   wire [3:0] s_A1 = {1'b0, s_binput75_n, s_mis0_n, s_mis0};
   wire [3:0] s_Y1;

   assign s_outident_n = s_eiod_n ? 1'b1 : s_Y1[0]; // pull OUTIDENT_n high if EIOD_n is high (giving 3 state output on 74241-Y1)
   assign s_bioxe_n    = s_Y1[1]; 
   assign s_binack_n   = s_Y1[2];
   // 4th output of 74241-Y1 is not connected

   wire [3:0] s_A2 = {s_berror_n, s_gnd, s_mem_n, s_iod_n};
   wire [3:0] s_Y2;

   assign s_ioxerr_n       = s_tout ? s_Y2[0] : 1'b1; // pull IOXERR_n high if TOUT is low (giving 3 state output on 74241-Y2)
   assign s_mor_n          = s_tout ? s_Y2[1] : 1'b1;    // pull MOR_n high if TOUT is low (giving 3 state output on 74241-Y2)
   assign s_berror_n       = s_Y2[2];
   assign s_bdry_n         = s_Y2[3];
   

   TTL_74241   CHIP_3A 
   (
      .A1(s_A1[3:0]),
      .Y1(s_Y1),
      .G1_n(s_eiod_n),

      .A2(s_A2[3:0]),
      .Y2(s_Y2),
      .G2(s_tout)
   );

endmodule
