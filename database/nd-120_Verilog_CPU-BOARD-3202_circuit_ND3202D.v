// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU                                                                   **
** CPU TOP LEVEL                                                         **
** SHEET 16 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

//TODO: Missing MEM, BIF, IO and BUS Connectors A-B-C



module ND3202D (   
   input sysclk, // System clock in FPGA
   input sys_rst_n, // System reset in FPGA
   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/

   input CLOCK_1,  // XTAL1 = 39.3216MHZ
   input CLOCK_2,  // XTAL2 = 35 MHZ (for slow operations?)




   /* FROM C-PLUG */
   input LOAD_n,        // Input signal from "C PLUG", signal B12 - LOAD_n
   input BREQ_n,        // Input signal from "C PLUG", signal C12 - BREQ_n   
   input CONTINUE_n,    // Input signal from "C PLUG", signal B15 - CONTINUE_n
   input STOP_n,        // Input signal from "C PLUG", signal B16 - STOP_n

   input BINT10_n,      // Input signal from "C PLUG", signal A15 - BINT10_n               
   input BINT11_n,      // Input signal from "C PLUG", signal C15 - BINT11_n               
   input BINT12_n,      // Input signal from "C PLUG", signal A16 - BINT12_n               
   input BINT13_n,      // Input signal from "C PLUG", signal C16 - BINT13_n               
   input BINT15_n,      // Input signal from "C PLUG", signal C17 - BINT15_n               
   
   input POWSENSE_n,    // Input signal from "C PLUG", signals A29,B29,C29 - POWSENSE_n (Power sense signal from the PSU?)
   
   /* FROM A-PLUG */
   input OSCCL_n,       // Input signal from "A PLUG", signal B3 - OSCCL_n                => (TO IO OSCCL_n)
   input [1:0] OC_1_0,  // Input signal from "A PLUG", signal C6 (OC0) and A6 (OC1)       => (TO IO OC_1_0)
   input XTR,           // Input signal from "A PLUG", signal B4/C23 - XTR                => (TO IO XTR)
   input LOCK_n,        // Input signal from "A PLUG", signal B12 - LOCK_n 
   input CONSOLE_n,     // Input signal from "A PLUG", signal C21/C30 - CONSOLE_n
   input SWMCL_n,       // Input signal from "A PLUG", signal C16 - SWMCL_n (Switch SW3 on the PCB 3202D might lock this to GND?)      
   input EAUTO_n,       // Input signal from "A PLUG", signal C19 - EAUTO_n
   input RXD,           // Input signal from "A PLUG", signal C8 - RXD (to the UART RXD)

   // Some other signals from A-PLUG to consider ?
   // LOAD_n => SWLD_n
   // 

   /* Configuration switches */
   input SW1_CONSOLE,            // Switch on the console (on/off)
   input [2:0] SEL_TESTMUX,      // Selects testmux signals to output on TEST_4_0
   input [4:0] BAUD_RATE_SWITCH, // Switch on the PCB to select baudrate

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        TXD,      // Output signal to "A PLUG", signal A10 (D2N) and C7 (TXD) (from the UART TXD)
   output        RUN_n,    // Output signal to "A PLUG", signal C10 (RUN_n) (from the CPU)

   // Microcode Control signals - 64bit
   output [63:0] CSBITS,   

   // Test signals
   output [4:0]  DP_5_1_n,
   output [4:0]  TEST_4_0,
   output        TP1_INTRQ_n,

   // Led signals
   output [5:0]  LED // 0=CPU RED,1=CPU GREEN, 2=LED4_RED_PARITY_ERROR, 3=LED_CPU_GRANT_INDICATOR, 4=LED_BUS_GRANT_INDICATOR, 5=LED1 from MMU
);

/*
http://norsk-data.com/hardware/nd-100/nd-350002.html

LED1 (red)     - Cache disabled
LED2 (red)     - Selftest failed
LED3 (green)   - Selftest passed
LED4 (red)     - Parity error detected
LED5 (red)     - Parity error disabled
LED6 (green)   - CPU grant
LED7 (yellow)  - Bus grant

*/


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   
   wire [1:0]  s_csalum_1_0;
   wire [1:0]  s_csdelay_1_0;
   wire [1:0]  s_csmis_1_0;
   wire [1:0]  s_oc_1_0;
   wire [1:0]  s_pcr_1_0;
   
   wire [2:0]  s_cc_3_1_n;

   wire [3:0]  s_lba_3_0;
   wire [3:0]  s_pil_3_0;

   wire [4:0]  s_bd_23_19_n;
   wire [4:0]  s_cscomm_4_0;
   wire [4:0]  s_csidbs_4_0;
   wire [4:0]  s_dp_5_1_n;
   wire [4:0]  s_ppn_23_19;
   wire [4:0]  s_test_4_0;
   
   wire [7:0]  s_inr_7_0;
   
   wire [8:0]  s_csalui_8_0;
   
   wire [9:0]  s_ca_9_0;


   wire [12:0] s_lua_12_0;

   wire [13:0] s_ppn_23_10;

   // CD BUS
   wire [15:0] s_bif_cd_15_0_in;
   wire [15:0] s_bif_cd_15_0_out;

   wire [15:0] s_cpu_cd_15_0_out;
   wire [15:0] s_cpu_cd_15_0_in;

   // IDB bus   
   wire [15:0] s_bif_idb_15_0_out;

   wire [15:0] s_cpu_IDB_15_0_in;
   wire [15:0] s_cpu_IDB_15_0_out;

   wire [15:0] s_io_IDB_15_0_in;
   wire [15:0] s_io_IDB_15_0_out;

   wire [15:0] s_mem_IDB_15_0_out;

   wire [15:0] s_uart_IDB_15_0_in;
   wire [15:0] s_uart_IDB_15_0_out;

   // LBD BUS
   wire [23:0]  s_mem_lbd_23_0_in;   
   wire [23:0]  s_mem_lbd_23_0_out;   

   wire [23:0] s_bif_lbd_23_0_in;
   wire [23:0] s_bif_lbd_23_0_out;

   // BD ?
   wire [23:0] s_bif_bd_23_0_n_in;
   wire [23:0] s_bif_bd_23_0_n_out;
   
   // CSBITS
   wire [63:0] s_csbits;


   // Wires!
   wire        s_acond_n;
   wire        s_aluclk;
   wire        s_bapr_n;
   wire        s_bdap_n;
   wire        s_bdap50_n;
   wire        s_bdry_n;
   wire        s_bdry50_n;
   wire        s_berror_n;
   wire        s_bgnt_n;
   wire        s_bgnt50_n;
   wire        s_binack_n;
   wire        s_binput_n;
   wire        s_bint10_n;
   wire        s_bint11_n;
   wire        s_bint12_n;
   wire        s_bint13_n;
   wire        s_bint15_n;
   wire        s_bioxe_n;
   wire        s_bmem_n;
   wire        s_bref_n;
   wire        s_breq_n;
   wire        s_brk_n;
   wire        s_ca10;
   wire        s_cc2_n;
   wire        s_cclr_n;   
   wire        s_cgnt_n;
   wire        s_cgnt50_n;
   wire        s_cgntcact_n;
   wire        s_clear_n;
   wire        s_clk;
   wire        s_console_n;   
   wire        s_continue_n;
   wire        s_crq_n;
   wire        s_cx_n;
   wire        s_cyd;
   wire        s_dap_n;
   wire        s_dbapr;
   wire        s_dt_n;
   wire        s_dvacc_n;
   wire        s_eauto_n;
   wire        s_ebus_n;
   wire        s_eccr;
   wire        s_ecreq;
   wire        s_ecrq_n;
   wire        s_ecrq_n5;
   wire        s_ecrq_n9;
   wire        s_ecsr_n;
   wire        s_edo_n;
   wire        s_emcl_n;
   wire        s_empid_n;
   wire        s_eorf_n;
   wire        s_estof_n;
   wire        s_etrap_n;
   wire        s_fetch;
   wire        s_fmiss;
   wire        s_form_n;
   wire        s_gnt_n;
   wire        s_gnt50_n;
   wire        s_hit;
   wire        s_i1p;
   wire        s_ibapr_n;
   wire        s_ibdap_n;
   wire        s_ibdry_n;
   wire        s_ibinput_n;
   wire        s_ibint10_n;
   wire        s_ibint11_n;
   wire        s_ibint12_n;
   wire        s_ibint13_n;
   wire        s_ibint15_n;
   wire        s_ibperr_n;
   wire        s_ibreq_n;
   wire        s_icontin_n;
   wire        s_iload_n;
   wire        s_ioni;
   wire        s_iorq_n;
   wire        s_ioxerr_n;
   wire        s_isemrq_n;
   wire        s_istop_n;
   wire        s_lcs_n;
   wire        s_LDEXM_n;
   wire        s_lerr_n;
   wire        s_lev0;
   wire        s_load_n;
   wire        s_lock_n;
   wire        s_lperr_n;
   wire        s_lprerr_n;
   wire        s_lshadow;
   wire        s_lua12;
   wire        s_maclk;
   wire        s_map_n;
   wire        s_mcl;
   wire        s_mclk;
   wire        s_mis0;
   wire        s_moff_n;
   wire        s_mor_n;
   wire        s_mor25_n;
   wire        s_mr_n;
   wire        s_mreq_n;
   wire        s_mwrite_n;   
   wire        s_opclcs;
   wire        s_osc;
   wire        s_osccl_n;
   wire        s_outgrant_n;
   wire        s_outident_n;      
   wire        s_pa_n;
   wire        s_pan_n;
   wire        s_parerr_n;
   wire        s_pd1;
   wire        s_pd2;
   wire        s_pd3;
   wire        s_pd4;
   wire        s_poni;
   wire        s_powfail_n;
   wire        s_powsense_n;
   wire        s_ps_n;
   wire        s_ref_n;
   wire        s_refreq_n;
   wire        s_refrq_n;
   wire        s_rerr_n;
   wire        s_rp1_intrq_n;
   wire        s_rrf_n;
   wire        s_rt_n;
   wire        s_run_n;
   wire        s_rwcs_n;
   wire        s_rxd;
   wire        s_sel5ms_n;
   wire        s_semrq_n;
   wire        s_semrq50_n;
   wire        s_short_n;
   wire        s_slow_n;
   wire        s_ssema_n;
   wire        s_stoc_n;
   wire        s_stop_n;
   wire        s_stp;
   wire        s_sw1_console;
   wire        s_swmcl_n;
   wire        s_term_n;
   wire        s_tout;
   wire        s_trap_n;
   wire        s_trap;
   wire        s_txd;
   wire        s_uclk;
   wire        s_vex;
   wire        s_wchim_n;
   wire        s_wrfstb;
   wire        s_write;
   wire        s_xtal1;
   wire        s_xtal2;
   wire        s_xtr;

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_cscomm_4_0  [4:0]   = s_csbits[36:32];
   assign s_csmis_1_0   [1:0]   = s_csbits[43:42];
   assign s_csalui_8_0  [8:0]   = s_csbits[63:55];
   assign s_csalum_1_0  [1:0]   = s_csbits[45:44];
   assign s_csidbs_4_0  [4:0]   = s_csbits[41:37];
   assign s_csdelay_1_0 [1:0]   = s_csbits[27:26];
   


  
   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   
   assign s_bint10_n       = BINT10_n;
   assign s_bint11_n       = BINT11_n;
   assign s_bint12_n       = BINT12_n;
   assign s_bint13_n       = BINT13_n;
   assign s_bint15_n       = BINT15_n;
   assign s_breq_n         = BREQ_n;
   assign s_console_n      = CONSOLE_n;
   assign s_continue_n     = CONTINUE_n;
   assign s_eauto_n        = EAUTO_n;
   assign s_load_n         = LOAD_n;
   assign s_lock_n         = LOCK_n;
   assign s_oc_1_0         = OC_1_0;
   assign s_osccl_n        = OSCCL_n;
   assign s_rxd            = RXD;
   assign s_stop_n         = STOP_n;
   assign s_sw1_console    = SW1_CONSOLE;
   assign s_swmcl_n        = SWMCL_n;
   assign s_xtal1          = CLOCK_1;
   assign s_xtal2          = CLOCK_2;
   assign s_xtr            = XTR;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CSBITS           = s_csbits[63:0];
   assign DP_5_1_n         = s_dp_5_1_n[4:0];
   assign RUN_n            = s_run_n;
   assign TEST_4_0         = s_test_4_0[4:0];
   assign TP1_INTRQ_n      = s_rp1_intrq_n;
   assign TXD              = s_txd;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // CD BUS connections
   assign s_bif_cd_15_0_in = s_cpu_cd_15_0_out;
   assign s_cpu_cd_15_0_in = s_bif_cd_15_0_out;

   // IDB BUS connections
/*
   ---assign s_bif_idb_15_0_in   = s_cpu_IDB_15_0_out | s_io_IDB_15_0_out | s_mem_IDB_15_0_out | s_uart_IDB_15_0_out;
   */
   assign s_cpu_IDB_15_0_in   = s_bif_idb_15_0_out | s_io_IDB_15_0_out | s_mem_IDB_15_0_out | s_uart_IDB_15_0_out;
   assign s_io_IDB_15_0_in    = s_bif_idb_15_0_out | s_cpu_IDB_15_0_out| s_mem_IDB_15_0_out | s_uart_IDB_15_0_out;
   assign s_uart_IDB_15_0_in  = s_bif_idb_15_0_out | s_io_IDB_15_0_out | s_mem_IDB_15_0_out | s_cpu_IDB_15_0_out;


   // LBD BUS connections   
   assign s_mem_lbd_23_0_in  [23:0]  = s_bif_lbd_23_0_out[23:0];
   assign s_bif_lbd_23_0_in  [23:0]  = s_mem_lbd_23_0_out[23:0];
   

   // Buffer
   assign s_run_n = s_stp;

   // PD1-PD4 are always 0 during normal function
   assign s_pd1 = 0;
   assign s_pd2 = 0;
   assign s_pd3 = 0;
   assign s_pd4 = 0;
   
   
   // Power sense
   assign s_powsense_n = POWSENSE_n;

   // unknown signals // TODO: Identify the correct source of these signals
   assign s_acond_n = 1;
   assign s_brk_n = 1;
   assign s_inr_7_0 = 8'b0;
   

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CYC_36   CYC (
                 .sysclk(sysclk),       // System clock in FPGA
                 .sys_rst_n(sys_rst_n), // System reset in FPGA

                 .ACOND_n(s_acond_n),
                 .ALUCLK(s_aluclk),
                 .BRK_n(s_brk_n),
                 .CC_3_1_n(s_cc_3_1_n[2:0]),
                 .CGNTCACT_n(s_cgntcact_n), // Goes to PAL 44601 (output from PAL 44302B -LBC1 - 11D)
                 .CLK(s_clk),
                 .CSALUI7(s_csalui_8_0[7]),
                 .CSALUI8(s_csalui_8_0[8]),
                 .CSALUM0(s_csalum_1_0[0]),
                 .CSALUM1(s_csalum_1_0[1]),
                 .CSDELAY_1_0(s_csdelay_1_0),
                 .CSDLY(s_csbits[21]),
                 .CSECOND(s_csbits[23]),
                 .CSLOOP(s_csbits[22]),
                 .CX_n(s_cx_n),
                 .CYD(s_cyd),
                 .EORF_n(s_eorf_n),
                 .ETRAP_n(s_etrap_n),
                 .FORM_n(s_form_n),
                 .HIT(s_hit),
                 .IORQ_n(s_iorq_n),
                 .LBA0(s_lba_3_0[0]),
                 .LBA1(s_lba_3_0[1]),
                 .LBA3(s_lba_3_0[3]),
                 .LCS_n(s_lcs_n),
                 .LSHADOW(s_lshadow),
                 .LUA12(s_lua12),
                 .MACLK(s_maclk),
                 .MAP_n(s_map_n),
                 .MCLK(s_mclk),
                 .MREQ_n(s_mreq_n),
                 .MR_n(s_mr_n),
                 .OSC(s_osc),
                 .PD1(s_pd1),
                 .PD4(s_pd4),
                 .RRF_n(s_rrf_n),
                 .RT_n(s_rt_n),
                 .RWCS_n(s_rwcs_n),
                 .SHORT_n(s_short_n),
                 .SLOW_n(s_slow_n),
                 .TERM_n(s_term_n),
                 .TRAP_n(s_trap_n),
                 .UCLK(s_uclk),
                 .VEX(s_vex),
                 .WRFSTB(s_wrfstb));

   CPU_15   CPU (
                 .sysclk(sysclk), // System clock in FPGA
                 .sys_rst_n(sys_rst_n), // System reset in FPGA
                 .ALUCLK(s_aluclk),
                 .CA10(s_ca10),
                 .CA_9_0(s_ca_9_0[9:0]),
                 .CCLR_n(s_cclr_n),
                 .CC_3_1_n(s_cc_3_1_n[2:0]),
                 .CD_15_0_IN(s_cpu_cd_15_0_in[15:0]),
                 .CD_15_0_OUT(s_cpu_cd_15_0_out[15:0]),
                 .CLK(s_clk),
                 .CYD(s_cyd),
                 .DT_n(s_dt_n),
                 .DVACC_n(s_dvacc_n),
                 .ECSR_n(s_ecsr_n),
                 .EDO_n(s_edo_n),
                 .EMCL_n(s_emcl_n), // input
                 .EMPID_n(s_empid_n),
                 .EORF_n(s_eorf_n),
                 .ESTOF_n(s_estof_n),
                 .ETRAP_n(s_etrap_n),
                 .FETCH(s_fetch),
                 .FMISS(s_fmiss),
                 .FORM_n(s_form_n),
                 .IBINT10_n(s_ibint10_n),
                 .IBINT11_n(s_ibint11_n),
                 .IBINT12_n(s_ibint12_n),
                 .IBINT13_n(s_ibint13_n),
                 .IBINT15_n(s_ibint15_n),
                 .IDB_15_0_IN(s_cpu_IDB_15_0_in[15:0]),
                 .IDB_15_0_OUT(s_cpu_IDB_15_0_out[15:0]),
                 .IOXERR_n(s_ioxerr_n),
                 .LBA_3_0(s_lba_3_0[3:0]),
                 .LCS_n(s_lcs_n),
                 .LSHADOW(s_lshadow),
                 .LUA_12_0(s_lua_12_0[12:0]),
                 .MACLK(s_maclk),
                 .MAP_n(s_map_n),
                 .MCLK(s_mclk),
                 .MOR_n(s_mor_n),
                 .MR_n(s_mr_n),
                 .OPCLCS(s_opclcs),
                 .PAN_n(s_pan_n),
                 .PARERR_n(s_parerr_n),
                 .PCR_1_0(s_pcr_1_0[1:0]),
                 .PD1(s_pd1),
                 .PD2(s_pd2),
                 .PIL_3_0(s_pil_3_0[3:0]),
                 .PONI(s_poni),
                 .POWFAIL_n(s_powfail_n), // input powefail
                 .PPN_23_10(s_ppn_23_10[13:0]),
                 .RT_n(s_rt_n),
                 .RWCS_n(s_rwcs_n),
                 .STOC_n(s_stoc_n),
                 .STP(s_stp),
                 .SW1_CONSOLE(s_sw1_console),
                 .TERM_n(s_term_n),
                 .SEL_TESTMUX(SEL_TESTMUX),
                 .TEST_4_0(s_test_4_0[4:0]),
                 .TOPCSB(s_csbits[63:0]),
                 .TP1_INTRQ_n(s_rp1_intrq_n),
                 .TRAP(s_trap),
                 .UCLK(s_uclk),
                 .VEX(s_vex),
                 .WCHIM_n(s_wchim_n),
                 .WRFSTB(s_wrfstb),
                 .WRITE(s_write),
                 .LDEXM_n(s_LDEXM_n),
                 .LED1(LED[5])
                 );


   
   // Input signals on C-PLUG goes via 5C


   wire s_BPERR_n;  
   assign s_BPERR_n = 1'b1; // DISABLE BUS PARITY ERROR
   
   wire s_y2_0; //output CHIP_5C pin 2Y1 (not used)



   TTL_74244   CHIP_5C (
               // Input 

               //   1A4 = BPERR_n    1A3 = BINPUT_n   1A2= SEMRQ_n    1A1 = BINT10_n
                .A1({s_BPERR_n, s_binput_n,s_semrq_n, s_bint10_n}), // Mapping 4 separate signals to 1A4-1A1
                .G1_n(s_pd1),

                // 2A4 = BAPR_n       2A3= BDRY_n     2A2 = BDAP_n     2A1= n.c.
                .A2({s_bapr_n, s_bdry_n, s_bdap_n, 1'b0}),   // Mapping 4 separate signals to 2A4-2A1
                .G2_n(s_pd1),


               // Output
               .Y1({s_ibperr_n, s_ibinput_n, s_isemrq_n, s_ibint10_n}), // Mapping 4 separate signals to 1Y4-1Y1
               .Y2({s_ibapr_n, s_ibdry_n, s_ibdap_n, s_y2_0}) // Mapping 4 separate signals to 1Y4-1Y1
   );


   IO_37   IO (
               .sysclk(sysclk), // System clock in FPGA
               .sys_rst_n(sys_rst_n), // System reset in FPGA

               .BAUD_RATE_SWITCH(BAUD_RATE_SWITCH),
               
               .BDRY50_n(s_bdry50_n),
               .BINT10_n(s_bint10_n),
               .BINT12_n(s_bint12_n),
               .BINT13_n(s_bint13_n),
               .BRK_n(s_brk_n),
               .CA10(s_ca10),
               .CCLR_n(s_cclr_n),
               .CLEAR_n(s_clear_n),
               .CLK(s_clk),
               .CONSOLE_n(s_console_n),
               .CSCOMM_4_0(s_cscomm_4_0[4:0]),
               .CSIDBS_4_0(s_csidbs_4_0[4:0]),
               .CSMIS_1_0(s_csmis_1_0[1:0]),
               .CX_n(s_cx_n),
               .DAP_n(s_dap_n),
               .DP_5_1_n(s_dp_5_1_n[4:0]),
               .DT_n(s_dt_n),
               .DVACC_n(s_dvacc_n),
               .EAUTO_n(s_eauto_n),
               .ECREQ(s_ecreq),
               .ECSR_n(s_ecsr_n),
               .EDO_n(s_edo_n),
               .EMCL_n(s_emcl_n), // output
               .EMPID_n(s_empid_n),
               .EORF_n(s_eorf_n),
               .ESTOF_n(s_estof_n),
               .FETCH(s_fetch),
               .FMISS(s_fmiss),
               .FORM_n(s_form_n),
               .HIT(s_hit),
               .I1P(s_i1p),
               .ICONTIN_n(s_icontin_n),
               .IDB_15_0_IN(s_io_IDB_15_0_in),
               .IDB_15_0_OUT(s_io_IDB_15_0_out),
               .ILOAD_n(s_iload_n),
               .INR_7_0(s_inr_7_0[7:0]), 
               .IONI(s_ioni),
               .IORQ_n(s_iorq_n),
               .ISTOP_n(s_istop_n),
               .LCS_n(s_lcs_n),
               .LEV0(s_lev0),
               .LOCK_n(s_lock_n),
               .LSHADOW(s_lshadow),
               .MCL(s_mcl),
               .MREQ_n(s_mreq_n),
               .OC_1_0(s_oc_1_0[1:0]),
               .OPCLCS(s_opclcs),
               .OSC(s_osc),
               .OSCCL_n(s_osccl_n),
               .PAN_n(s_pan_n),
               .PA_n(s_pa_n),
               .PCR_1_0(s_pcr_1_0[1:0]),
               .PONI(s_poni),
               .POWFAIL_n(s_powfail_n), // output powfail
               .POWSENSE_n(s_powsense_n),
               .PS_n(s_ps_n),
               .REFRQ_n(s_refreq_n),
               .REF_n(s_ref_n),
               .RT_n(s_rt_n),
               .RWCS_n(s_rwcs_n),
               .RXD(s_rxd),
               .SEL5MS_n(s_sel5ms_n),
               .SHORT_n(s_short_n),
               .SLOW_n(s_slow_n),
               .SSEMA_n(s_ssema_n),
               .STOC_n(s_stoc_n),
               .STP(s_stp),
               .SWMCL_n(s_swmcl_n),
               .TOUT(s_tout),
               .TXD(s_txd),
               .UCLK(s_uclk),
               .WCHIM_n(s_wchim_n),
               .WRITE(s_write),
               .XTAL1(s_xtal1),
               .XTAL2(s_xtal2),
               .XTR(s_xtr),
               .IOLED(LED[1:0])
               );

      // C-PLUG SIGNALS goes via 5C and 33C
      TTL_74244   CHIP_33C (
               // Input

                //   1A4=STOP_n      1A3=CONTINUE_n   1A2=BREQ_n      1A1=LOAD_n
                .A1({s_stop_n, s_continue_n,s_breq_n, s_load_n}), // Mapping 4 separate signals to 1A4-1A1
                .G1_n(s_pd1),
                //   2A4=BINT11_n    2A3=BINT12_n    2A2=BINT13_n    2A1=BINT15_n
                .A2({s_bint11_n, s_bint12_n, s_bint13_n, s_bint15_n}),   // Mapping 4 separate signals to 2A4-2A1
                .G2_n(s_pd1),


               // Output
               .Y1({s_istop_n, s_icontin_n, s_ibreq_n, s_iload_n}), // Mapping 4 separate signals to 1Y4-1Y1
               .Y2({s_ibint11_n, s_ibint12_n, s_ibint13_n, s_ibint15_n}) // Mapping 4 separate signals to 1Y4-1Y1
      );



   MEM_43   MEM (
                 .sysclk(sysclk),          // System clock in FPGA
                 .sys_rst_n(sys_rst_n),    // System reset in FPGA

                 .BDAP50_n(s_bdap50_n),
                 .BDRY50_n(s_bdry50_n),
                 .BDRY_n(s_bdry_n),
                 .BD_23_19_n(s_bd_23_19_n[4:0]),
                 .BGNT50_n(s_bgnt50_n),
                 .BGNT_n(s_bgnt_n),
                 .BIOXE_n(s_bioxe_n),
                 .BMEM_n(s_bmem_n),
                 .CGNT50_n(s_cgnt50_n),
                 .CGNT_n(s_cgnt_n),
                 .CRQ_n(s_crq_n),
                 .DBAPR(s_dbapr),
                 .ECCR(s_eccr),
                 .ECREQ(s_ecreq),
                 .FETCH(s_fetch),
                 .GNT50_n(s_gnt50_n),
                 .GNT_n(s_gnt_n),
                 .IBINPUT_n(s_ibinput_n),                    
                 .IDB_15_0_OUT(s_mem_IDB_15_0_out),  
                 .IORQ_n(s_iorq_n),
                 .LBD_23_0_IN(s_mem_lbd_23_0_in[23:0]),  
                 .LBD_23_0_OUT(s_mem_lbd_23_0_out[23:0]),
                 .LERR_n(s_lerr_n),
                 .LPERR_n(s_lperr_n),
                 .MOFF_n(s_moff_n),
                 .MOR25_n(s_mor25_n),
                 .MOR_n(s_mor_n),
                 .MR_n(s_mr_n),
                 .MWRITE_n(s_mwrite_n),
                 .OSC(s_osc),
                 .PA_n(s_pa_n),
                 .PD1(s_pd1),
                 .PD3(s_pd3),
                 .PD4(s_pd4),
                 .PPN_23_19(s_ppn_23_19[4:0]),
                 .PS_n(s_ps_n),
                 .REFRQ_n(s_refrq_n),
                 .REF_n(s_ref_n),
                 .RERR_n(s_rerr_n),
                 .SEMRQ50_n(s_semrq50_n),
                 .SSEMA_n(s_ssema_n),
                 .WRITE(s_write),                 
                 .LED4(LED[2]),       // LED4_RED_PARITY_ERROR
                 .LED_CPU_GI(LED[3]), // LED_CPU_GRANT_INDICATOR
                 .LED_BUS_GI(LED[4])  // LED_BUS_GRANT_INDICATOR                 
                 );




//                  TODO:LATER ADD BUS INTERFACE

   BIF_5   BIF(
                .sysclk(sysclk), // System clock in FPGA
                .sys_rst_n(sys_rst_n), // System reset in FPGA

                .BAPR_n(s_bapr_n),
                .BDAP50_n(s_bdap50_n),
                .BDAP_n(s_bdap_n),
                .BDRY50_n(s_bdry50_n),
                .BDRY_n(s_bdry_n),
                .BD_23_0_n_IN(s_bif_bd_23_0_n_in[23:0]),  // NEEDS FIXIN
                .BD_23_0_n_OUT(s_bif_bd_23_0_n_out[23:0]),  // NEEDS FIXIN
                .BERROR_n(s_berror_n),
                .BGNT50_n(s_bgnt50_n),
                .BGNT_n(s_bgnt_n),
                .BINACK_n(s_binack_n),
                .BINPUT_n(s_binput_n),
                .BIOXE_n(s_bioxe_n),
                .BMEM_n(s_bmem_n),
                .BREF_n(s_bref_n),
                .CA_9_0(s_ca_9_0[9:0]),
                .CC2_n(s_cc2_n),
                .CD_15_0_IN(s_bif_cd_15_0_in[15:0]),   // NEEDS FIXINg
                .CD_15_0_OUT(s_bif_cd_15_0_out[15:0]),       // NEEDS fixing
                .CGNTCACT_n(s_cgntcact_n),
                .CGNT50_n(s_cgnt50_n),
                .CGNT_n(s_cgnt_n),
                .CLEAR_n(s_clear_n),
                .CRQ_n(s_crq_n),
                .DAP_n(s_dap_n),
                .DBAPR(s_dbapr),
                .EBUS_n(s_ebus_n),
                .ECRQ(s_ecrq_n),
                .FETCH(s_fetch),
                .GNT50_n(s_gnt50_n),
                .GNT_n(s_gnt_n),
                .IBAPR_n(s_ibapr_n),
                .IBDAP_n(s_ibdap_n),
                .IBDRY_n(s_ibdry_n),
                .IBINPUT_n(s_ibinput_n),
                .IBPERR_n(s_ibperr_n),
                .IBREQ_n(s_ibreq_n),   
                .IDB_15_0_OUT(s_bif_idb_15_0_out[15:0]),    
                .IORQ_n(s_iorq_n),
                .IOXERR_n(s_ioxerr_n),
                .ISEMRQ_n(s_isemrq_n),
                .LBD_23_0_IN(s_bif_lbd_23_0_in[23:0]),   
                .LBD_23_0_OUT(s_bif_lbd_23_0_out[23:0]), 
                .LERR_n(s_lerr_n),
                .LPRERR_n(s_lprerr_n),
                .MIS0(s_mis0),
                .MOFF_n(s_moff_n),
                .MOR25_n(s_mor25_n),
                .MOR_n(s_mor_n),
                .MR_n(s_mr_n),  // Master Reset signal comes from BIF (submodule BCTL, sub-sub SYNC, 50 ns delay of CLEAR_n input signal)
                .MWRITE_n(s_mwrite_n),
                .OSC(s_osc),
                .OUTGRANT_n(s_outgrant_n),
                .OUTIDENT_n(s_outident_n),
                .PARERR_n(s_parerr_n),
                .PA_n(s_pa_n),
                .PD1(s_pd1),
                .PD3(s_pd3),
                .PPN_23_10(s_ppn_23_10[13:0]),
                .PS_n(s_ps_n),
                .REFRQ_n(s_refrq_n),
                .REF_n(s_ref_n),
                .RERR_n(s_rerr_n),
                .RT_n(s_rt_n),
                .SEMRQ50_n(s_semrq50_n),
                .SEMRQ_n(s_semrq_n),
                .SSEMA_n(s_ssema_n),
                .TERM_n(s_term_n),
                .TOUT(s_tout),
                .WRITE(s_write));


endmodule
