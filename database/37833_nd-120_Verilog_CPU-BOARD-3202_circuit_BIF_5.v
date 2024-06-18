// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** BIF/BCTL                                                              **
** BUS INTERFACE                                                         **
** SHEET 5  of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module BIF_5( 

    // FPGA signals
    input        sysclk,      // System clock in FPGA
    input        sys_rst_n,   // System reset in FPGA
 
    // Inputs signals

    input        BGNT50_n,
    input        BGNT_n,
    input [9:0]  CA_9_0,
    input        CC2_n,
    input        CGNT50_n,
    input        CGNT_n,
    input        CLEAR_n,
    input        CRQ_n,
    input        EBUS_n,
    input        ECRQ,
    input        FETCH,
    input        GNT50_n,
    input        IBAPR_n,
    input        IBDAP_n,
    input        IBDRY_n,
    input        IBINPUT_n,
    input        IBPERR_n,
    input        IBREQ_n,
    input        IORQ_n,
    input        ISEMRQ_n,
    input        LERR_n,
    input        LPRERR_n,
    input        MIS0,
    input        MOFF_n,
    input        MOR25_n,
    input        MWRITE_n,
    input        OSC,
    input        PA_n,
    input        PD1,
    input        PD3,
    input        PS_n,
    input        REFRQ_n,
    input        RT_n,
    input        SSEMA_n,
    input        TERM_n,
    input        TOUT,
    input        WRITE,

    input [13:0] PPN_23_10,

    // INPUTS and OUTPUTS here

    input  [23:0] BD_23_0_n_IN,
    output [23:0] BD_23_0_n_OUT,

    
    input  [15:0] CD_15_0_IN,
    output [15:0] CD_15_0_OUT,


    input  [23:0] LBD_23_0_IN,
    output [23:0] LBD_23_0_OUT,

    // OUTPUT signals
    output [15:0] IDB_15_0_OUT,


    output        BAPR_n,
    output        BDAP50_n,
    output        BDAP_n,
    output        BDRY50_n,
    output        BDRY_n,    
    output        BERROR_n,
    output        BINACK_n,
    output        BINPUT_n,
    output        BIOXE_n,
    output        BMEM_n,
    output        BREF_n,
    
    output        CGNTCACT_n,
    output        DAP_n,
    output        DBAPR,
    output        GNT_n,
    
    output        IOXERR_n,    
    output        MOR_n,
    output        MR_n,
    output        OUTGRANT_n,
    output        OUTIDENT_n,
    output        PARERR_n,
    output        REF_n,
    output        RERR_n,
    output        SEMRQ50_n,
    output        SEMRQ_n
);

   
   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0]  s_q_2_0_n;
   wire [9:0]  s_ca_9_0;
   wire [13:0] s_ppn_23_10;
   

   wire [15:0] s_cd_15_0_in;
   wire [15:0] s_cd_15_0_out;

   wire [23:0] s_lbd_23_0_in;
   wire [23:0] s_lbd_23_0_out;
   
   wire [23:0] s_bd_23_0_n_in;
   wire [23:0] s_bd_23_0_n_out;


   wire [15:0] s_idb_15_0_out;

   wire        s_bapr_n;
   wire        s_bdap_n;
   wire        s_bdap50_n;
   wire        s_bdry_n;
   wire        s_bdry25_n;
   wire        s_bdry50_n;
   wire        s_berror_n;
   wire        s_bgnt_n;
   wire        s_bgnt50_n;
   wire        s_binack_n;
   wire        s_binput_n;
   wire        s_binput50_n;
   wire        s_bioxe_n;
   wire        s_bmem_n;
   wire        s_bref_n;
   wire        s_cact_n;
   wire        s_cbwrite_n;
   wire        s_cc2_n;
   wire        s_cgnt_n;
   wire        s_cgnt50_n;
   wire        s_cgntcact_n;
   wire        s_clear_n;
   wire        s_crq_n;
   wire        s_dap_n;
   wire        s_dbapr_n;
   wire        s_eaddr_n;
   wire        s_ebus_n;
   wire        s_ecrq;
   wire        s_epea_n;
   wire        s_epes_n;
   wire        s_fetch;
   wire        s_gnt_n;
   wire        s_gnt50_n;
   wire        s_ibapr_n;
   wire        s_ibdap_n;
   wire        s_ibdry_n;
   wire        s_ibinput_n;
   wire        s_ibperr_n;
   wire        s_ibreq_n;
   wire        s_iod_n;
   wire        s_ioreq_n;
   wire        s_ioxerr_n;
   wire        s_isemreq_n;
   wire        s_lerr_n;
   wire        s_lprerr_n;
   wire        s_mis0;   
   wire        s_moff_n;
   wire        s_mor_n;
   wire        s_mor25_n;
   wire        s_mr_n;   
   wire        s_mwrite_n;
   wire        s_osc;
   wire        s_outgrant_n;
   wire        s_outident_n;
   wire        s_pa_n;
   wire        s_parerr_n;
   wire        s_pd1;
   wire        s_pd3;
   wire        s_ps_n;
   wire        s_ref_n;
   wire        s_refrq_n;
   wire        s_rerr_n;
   wire        s_rt_n;
   wire        s_semrq_n;
   wire        s_semrq50_n;
   wire        s_spea;
   wire        s_spes;
   wire        s_ssema_n;
   wire        s_term_n;
   wire        s_tout;
   wire        s_write;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/   

   assign s_bd_23_0_n_in [23:0] = BD_23_0_n_IN[23:0];
   assign s_ca_9_0[9:0]         = CA_9_0;      
   assign s_cd_15_0_in[15:0]    = CD_15_0_IN;   
   assign s_lbd_23_0_in [23:0]  = LBD_23_0_IN[23:0];
   assign s_ppn_23_10[13:0]     = PPN_23_10;

   assign s_bgnt_n              = BGNT_n;
   assign s_bgnt50_n            = BGNT50_n;
   assign s_cc2_n               = CC2_n;
   assign s_cgnt_n              = CGNT_n;
   assign s_cgnt50_n            = CGNT50_n;
   assign s_clear_n             = CLEAR_n;
   assign s_crq_n               = CRQ_n;
   assign s_ebus_n              = EBUS_n;
   assign s_ecrq                = ECRQ;
   assign s_fetch               = FETCH;
   assign s_gnt50_n             = GNT50_n;
   assign s_ibapr_n             = IBAPR_n;
   assign s_ibdap_n             = IBDAP_n;
   assign s_ibdry_n             = IBDRY_n;
   assign s_ibinput_n           = IBINPUT_n;
   assign s_ibperr_n            = IBPERR_n;
   assign s_ibreq_n             = IBREQ_n;
   assign s_ioreq_n             = IORQ_n;
   assign s_isemreq_n           = ISEMRQ_n;
   assign s_lerr_n              = LERR_n;
   assign s_lprerr_n            = LPRERR_n;
   assign s_mis0                = MIS0;
   assign s_moff_n              = MOFF_n;
   assign s_mor25_n             = MOR25_n;
   assign s_mwrite_n            = MWRITE_n;
   assign s_osc                 = OSC;
   assign s_pa_n                = PA_n;
   assign s_pd1                 = PD1;
   assign s_pd3                 = PD3;
   assign s_ps_n                = PS_n;
   assign s_refrq_n             = REFRQ_n;
   assign s_rt_n                = RT_n;
   assign s_ssema_n             = SSEMA_n;
   assign s_term_n              = TERM_n;
   assign s_tout                = TOUT;
   assign s_write               = WRITE;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   
   assign BD_23_0_n_OUT = s_bd_23_0_n_out[23:0];
   assign CD_15_0_OUT   = s_cd_15_0_out  [15:0];
   assign IDB_15_0_OUT  = s_idb_15_0_out [15:0];
   assign LBD_23_0_OUT  = s_lbd_23_0_out [23:0];

   assign BAPR_n       = s_bapr_n;
   assign BDAP_n       = s_bdap_n;
   assign BDAP50_n     = s_bdap50_n;
   assign BDRY_n       = s_bdry_n;   
   assign BDRY50_n     = s_bdry50_n;
   assign BERROR_n     = s_berror_n;
   assign BINACK_n     = s_binack_n;
   assign BINPUT_n     = s_binput_n;
   assign BIOXE_n      = s_bioxe_n;
   assign BMEM_n       = s_bmem_n;
   assign BREF_n       = s_bref_n;
   assign CGNTCACT_n   = s_cgntcact_n;
   assign DAP_n        = s_dap_n;
   assign DBAPR        = s_dbapr_n;
   assign GNT_n        = s_gnt_n;
   assign IOXERR_n     = s_ioxerr_n;
   assign MOR_n        = s_mor_n;
   assign MR_n         = s_mr_n;
   assign OUTGRANT_n   = s_outgrant_n;
   assign OUTIDENT_n   = s_outident_n;
   assign PARERR_n     = s_parerr_n;
   assign REF_n        = s_ref_n;
   assign RERR_n       = s_rerr_n;
   assign SEMRQ_n      = s_semrq_n;
   assign SEMRQ50_n    = s_semrq50_n;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   BIF_DPATH_9   DPATH (.BDAP50_n(s_bdap50_n),
                        .BDRY25_n(s_bdry25_n),
                        .BDRY50_n(s_bdry50_n),

                        .BD_23_0_n_IN (s_bd_23_0_n_in [23:0]),
                        .BD_23_0_n_OUT(s_bd_23_0_n_out[23:0]),

                        .LBD_23_0_IN  (s_lbd_23_0_in  [23:0]),
                        .LBD_23_0_OUT (s_lbd_23_0_out [23:0]),

                        .CD_15_0_IN(s_cd_15_0_in[15:0]),
                        .CD_15_0_OUT(s_cd_15_0_out[15:0]),

                        
                        .BGNT50_n(s_bgnt50_n),
                        .BGNT_n(s_bgnt_n),
                        .BINPUT50_n(s_binput50_n),
                        .CACT_n(s_cact_n),
                        .CA_9_0(s_ca_9_0[9:0]),
                        .CBWRITE_n(s_cbwrite_n),
                        .CC2_n(s_cc2_n),
                        .CGNT50_n(s_cgnt50_n),
                        .CGNTCACT_n(s_cgntcact_n),
                        .CGNT_n(s_cgnt_n),
                        .DBAPR(s_dbapr_n),
                        .EADDR_n(s_eaddr_n),
                        .EBUS_n(s_ebus_n),
                        .ECREQ(s_ecrq),
                        .EPEA_n(s_epea_n),
                        .EPES_n(s_epes_n),
                        .FETCH(s_fetch),
                        .GNT_n(s_gnt_n),
                        .IBAPR_n(s_ibapr_n),
                        .IDB_15_0_OUT(s_idb_15_0_out[15:0]),
                        .IOD_n(s_iod_n),
                        .IORQ_n(s_ioreq_n),                        
                        .MIS0(s_mis0),
                        .MWRITE_n(s_mwrite_n),
                        .PD1(s_pd1),
                        .PD3(s_pd3),
                        .PPN_23_10(s_ppn_23_10[13:0]),
                        .Q0_n(s_q_2_0_n[0]),
                        .Q2_n(s_q_2_0_n[2]),
                        .RT_n(s_rt_n),
                        .SPEA(s_spea),
                        .SPES(s_spes),
                        .TERM_n(s_term_n),
                        .WRITE(s_write));

   BIF_BCTL_6   BCTL (.BAPR_n(s_bapr_n),
                      .BDAP50_n(s_bdap50_n),
                      .BDAP_n(s_bdap_n),
                      .BDRY25_n(s_bdry25_n),
                      .BDRY50_n(s_bdry50_n),
                      .BDRY_n(s_bdry_n),
                      .BERROR_n(s_berror_n),
                      .BINACK_n(s_binack_n),
                      .BINPUT50_n(s_binput50_n),
                      .BINPUT_n(s_binput_n),
                      .BIOXE_n(s_bioxe_n),
                      .BMEM_n(s_bmem_n),
                      .BREF_n(s_bref_n),
                      .CACT_n(s_cact_n),
                      .CBWRITE_n(s_cbwrite_n),
                      .CC2_n(s_cc2_n),
                      .CGNT50_n(s_cgnt50_n),
                      .CGNT_n(s_cgnt_n),
                      .CLEAR_n(s_clear_n),
                      .CRQ_n(s_crq_n),
                      .DAP_n(s_dap_n),
                      .DBAPR(s_dbapr_n),
                      .EADR_n(s_eaddr_n),
                      .EPEA_n(s_epea_n),
                      .EPES_n(s_epes_n),
                      .GNT50_n(s_gnt50_n),
                      .GNT_n(s_gnt_n),
                      .IBDAP_n(s_ibdap_n),
                      .IBDRY_n(s_ibdry_n),
                      .IBINPUT_n(s_ibinput_n),
                      .IBPERR_n(s_ibperr_n),
                      .IBREQ_n(s_ibreq_n),
                      .IOD_n(s_iod_n),
                      .IORQ_n(s_ioreq_n),
                      .IOXERR_n(s_ioxerr_n),
                      .ISEMRQ_n(s_isemreq_n),
                      .LERR_n(s_lerr_n),
                      .LPERR_n(s_lprerr_n),
                      .MIS0(s_mis0),
                      .MOFF_n(s_moff_n),
                      .MOR25_n(s_mor25_n),
                      .MOR_n(s_mor_n),
                      .MR_n(s_mr_n),
                      .OSC(s_osc),
                      .OUTGRANT_n(s_outgrant_n),
                      .OUTIDENT_n(s_outident_n),
                      .PARERR_n(s_parerr_n),
                      .PA_n(s_pa_n),
                      .PD1(s_pd1),
                      .PD3(s_pd3),
                      .PS_n(s_ps_n),
                      .Q_2_0_n(s_q_2_0_n[2:0]),
                      .REFRQ_n(s_refrq_n),
                      .REF_n(s_ref_n),
                      .RERR_n(s_rerr_n),
                      .SEMRQ50_n(s_semrq50_n),
                      .SEMRQ_n(s_semrq_n),
                      .SPEA(s_spea),
                      .SPES(s_spes),
                      .SSEMA_n(s_ssema_n),
                      .TERM_n(s_term_n),
                      .TOUT(s_tout));

endmodule
