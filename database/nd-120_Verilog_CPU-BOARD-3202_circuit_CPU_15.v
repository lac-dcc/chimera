// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU                                                                   **
** CPU TOP LEVEL                                                         **
** SHEET 15 of 50                                                        **
**                                                                       ** 
** Last reviewed: 15-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

//TODO: Missing MMU, LAPA, STOC and IN/OUT SIGNAL ASSIGN MUST BE VALIDATED.

module CPU_15( 

   input sysclk, // System clock in FPGA
   input sys_rst_n, // System reset in FPGA

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       CLK,
   input       MCLK,
   input       MACLK,
   input       ALUCLK,

   input       CA10,
   input       CCLR_n,
   input [2:0] CC_3_1_n,
   
   input       CYD,
   input       DT_n,
   input       DVACC_n,
   input       ECSR_n,
   input       EDO_n,
   input       EMCL_n,
   input       EMPID_n,
   input       EORF_n,
   input       ESTOF_n,
   input       ETRAP_n,
   input       FETCH,
   input       FMISS,
   input       FORM_n,
   input       IBINT10_n,
   input       IBINT11_n,
   input       IBINT12_n,
   input       IBINT13_n,
   input       IBINT15_n,
   input       IOXERR_n,
   input       LCS_n,   
   input       MAP_n,   
   input       MOR_n,
   input       MR_n,
   input       PAN_n,
   input       PARERR_n,
   input       PD1,
   input       PD2,
   input       POWFAIL_n,
   input       RT_n,   
   input       RWCS_n,
   input       STOC_n,
   input       STP,
   input       SW1_CONSOLE,
   input       TERM_n,
   input       UCLK,
   input       WCHIM_n,
   input       WRFSTB,
   input       WRITE,   
   input [2:0]  SEL_TESTMUX, // Selects testmux signals to output on TEST_4_0
   /*******************************************************************************
   ** The signals with IN and OUT are defined here                               **
   *******************************************************************************/

   input  [15:0] CD_15_0_IN,
   output [15:0] CD_15_0_OUT,

   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,


   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [9:0]  CA_9_0,
   output [3:0]  LBA_3_0,   
   output [12:0] LUA_12_0,
   output [1:0]  PCR_1_0,
   output [3:0]  PIL_3_0,
   output [13:0] PPN_23_10,
   output [4:0]  TEST_4_0,
   output [63:0] TOPCSB,

   output        LSHADOW,
   output        OPCLCS,   
   output        PONI,
   output        TP1_INTRQ_n,
   output        TRAP,
   output        VEX,
   output        LDEXM_n,

   output        LED1 // Cache enabled ?   
);

   


   

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [13:0] s_la_23_10;
   wire [3:0]  s_lba_3_0;
   wire [63:0] s_csbits;
   wire [15:0] s_ppn_25_10;
   wire [4:0]  s_test_4_0;
   wire [9:0]  s_csca_9_0;
   wire [2:0]  s_cc_3_1_n;   
   wire [1:0]  s_rf_1_0;   
   wire [15:0] s_pt_15_0;
   wire [12:0] s_csa_12_0;
   wire [10:0] s_ca_10_0;
   wire [1:0]  s_pcr_1_0;
   wire [3:0]  s_pil_3_0;
   wire [12:0] s_lua_12_0;
   wire [15:0] s_cd_15_0_in;
   wire [15:0] s_cd_15_0_out;
   wire [15:0] s_proc_IDB_15_0_in;
   wire [15:0] s_proc_IDB_15_0_out;
   wire [15:0] s_cs_IDB_15_0_in;
   wire [15:0] s_cs_IDB_15_0_out;
   
   wire        s_blcs_n;
   wire        s_brk_n;
   wire        s_rt_n;
   wire        s_ewca_n;
   wire        s_eorf_n;
   wire        s_wcs_n;
   wire        s_emcl_n;
   wire        s_lapa_n;
   wire        s_pan_n;
   wire        s_aluclk;
   wire        s_ibint13_n;
   wire        s_cup;
   wire        s_acond_n;
   wire        s_mor_n;
   wire        s_maclk;
   wire        s_opclcs;
   wire        s_trap;
   wire        s_rrf_n;
   wire        s_lcs_n;
   wire        s_ibint15_n;
   wire        s_pd2;
   wire        s_powfail_n;
   wire        s_term_n;
   wire        s_map_n;
   wire        s_etrap_n;
   wire        s_wrfstb;
   wire        s_mreq;
   wire        s_wchim_n;
   wire        s_lev0;
   wire        s_ibint10_n;
   wire        s_ibint12_n;
   wire        s_stoc_n;
   wire        s_cyd;
   wire        s_tp1_intr1_n;
   wire        s_bempid_n;
   wire        s_sw1_console;
   wire        s_empid_n;
   wire        s_edo_n;
   wire        s_cwr;
   wire        s_rwcs_n;
   wire        s_write;
   wire        s_stp;
   wire        s_ioxerr_n;
   wire        s_parerr_n;
   wire        s_ecsr_n;
   wire        s_cc2_n;
   wire        s_form_n;
   wire        s_clk;
   wire        s_uclk;
   wire        s_ioni;
   wire        s_ibint11_n;
   wire        s_bedo_n;
   wire        s_eccr;
   wire        s_pd1;
   wire        s_estof_n;
   wire        s_hit;
   wire        s_lshadow;
   wire        s_poni;
   wire        s_double;
   wire        s_cclr_n;
   wire        s_bstp;
   wire        s_pd18;
   wire        s_dt_n;
   wire        s_fmiss;
   wire        s_fetch;   
   wire        s_vex;
   wire        s_dvacc_n;
   wire        s_mr_n;
   wire        s_mclk;
   wire        s_led1;

   wire        [15:0] s_mmu_15_0_in;
   wire        [15:0] s_mmu_15_0_out;

   wire        [15:0] s_mmu_idb_15_0_in;
   wire        [15:0] s_mmu_idb_15_0_out;

   wire        [15:0] s_mmu_ppn_25_10_in;
   wire        [15:0] s_mmu_ppn_25_10_out;

   wire        [15:0] s_stoc_idb_15_0_in;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_cc2_n    = s_cc_3_1_n[2];
   
   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_cc_3_1_n[2:0]     = CC_3_1_n;
   assign s_ca_10_0[10]       = CA10;
   assign s_rt_n              = RT_n;
   assign s_eorf_n            = EORF_n;
   assign s_emcl_n            = EMCL_n;
   assign s_pan_n             = PAN_n;
   assign s_aluclk            = ALUCLK;
   assign s_ibint13_n         = IBINT13_n;
   assign s_mor_n       = MOR_n;
   assign s_maclk             = MACLK;
   assign s_lcs_n             = LCS_n;
   assign s_ibint15_n         = IBINT15_n;
   assign s_pd2               = PD2;
   assign s_powfail_n         = POWFAIL_n;
   assign s_term_n            = TERM_n;
   assign s_map_n             = MAP_n;
   assign s_etrap_n           = ETRAP_n;
   assign s_wrfstb            = WRFSTB;
   assign s_wchim_n           = WCHIM_n;
   assign s_ibint10_n         = IBINT10_n;
   assign s_ibint12_n         = IBINT12_n;
   assign s_stoc_n            = STOC_n;
   assign s_cyd               = CYD;
   assign s_sw1_console       = SW1_CONSOLE;
   assign s_empid_n           = EMPID_n;
   assign s_edo_n             = EDO_n;
   assign s_rwcs_n            = RWCS_n;
   assign s_write             = WRITE;
   assign s_stp               = STP;
   assign s_ioxerr_n          = IOXERR_n;
   assign s_parerr_n          = PARERR_n;
   assign s_ecsr_n            = ECSR_n;
   assign s_form_n            = FORM_n;
   assign s_clk               = CLK;
   assign s_uclk              = UCLK;
   assign s_ibint11_n         = IBINT11_n;
   assign s_pd1               = PD1;
   assign s_estof_n           = ESTOF_n;
   assign s_cclr_n            = CCLR_n;
   assign s_dt_n              = DT_n;
   assign s_fmiss             = FMISS;
   assign s_fetch             = FETCH;
   assign s_dvacc_n           = DVACC_n;
   assign s_mr_n              = MR_n;
   assign s_mclk              = MCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CA_9_0      = s_ca_10_0[9:0];
   assign CD_15_0_OUT = s_cd_15_0_out[15:0];
   
   //TODO: Add assign of IDB out of this block based onIDB out from PROC or CS
   assign IDB_15_0_OUT = s_proc_IDB_15_0_out[15:0] | s_cs_IDB_15_0_out[15:0] | s_mmu_idb_15_0_out[15:0];
   
   assign s_stoc_idb_15_0_in =  s_proc_IDB_15_0_out[15:0] | s_cs_IDB_15_0_out[15:0] |  s_mmu_idb_15_0_out[15:0] |IDB_15_0_IN;

   
   assign LBA_3_0     = s_lba_3_0[3:0];
   assign LSHADOW     = s_lshadow;
   assign LUA_12_0    = s_lua_12_0[12:0];
   assign OPCLCS      = s_opclcs;
   assign PCR_1_0     = s_pcr_1_0[1:0];
   assign PIL_3_0     = s_pil_3_0[3:0];
   assign PONI        = s_poni;
   assign PPN_23_10   = s_ppn_25_10[13:0];
   assign TEST_4_0    = s_test_4_0[4:0];
   assign TOPCSB      = s_csbits[63:0];
   assign TP1_INTRQ_n = s_tp1_intr1_n;
   assign TRAP        = s_trap;
   assign VEX         = s_vex;

   assign LED1        = s_led1;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CPU_PROC_32   PROC (
                       .sysclk(sysclk), // System clock in FPGA
                       .sys_rst_n(sys_rst_n), // System reset in FPGA
                       
                       .ACOND_n(s_acond_n), //TODO: not connected?
                       .ALUCLK(s_aluclk),
                       .BEDO_n(s_bedo_n),
                       .BEMPID_n(s_bempid_n),
                       .BRK_n(s_brk_n),
                       .BSTP(s_bstp),
                       .CA_9_0(s_ca_10_0[9:0]),
                       .CD_15_0_IN(s_cd_15_0_in[15:0]),
                       .CLK(s_clk),
                       .CSA_12_0(s_csa_12_0[12:0]),
                       .CSBITS(s_csbits[63:0]),
                       .CSCA_9_0(s_csca_9_0[9:0]),
                       .CUP(s_cup),
                       .CWR(s_cwr),
                       .DOUBLE(s_double),
                       .ECCR(s_eccr), //TODO: not connected?
                       .ESTOF_n(s_estof_n),
                       .ETRAP_n(s_etrap_n),
                       .EWCA_n(s_ewca_n),
                       .IBINT10_n(s_ibint10_n),
                       .IBINT11_n(s_ibint11_n),
                       .IBINT12_n(s_ibint12_n),
                       .IBINT13_n(s_ibint13_n),
                       .IBINT15_n(s_ibint15_n),
                       .IDB_15_0_IN(s_proc_IDB_15_0_in[15:0]),
                       .IDB_15_0_OUT(s_proc_IDB_15_0_out[15:0]),
                       .IONI(s_ioni), //TODO: not connected?
                       .IOXERR_n(s_ioxerr_n),
                       .LA_23_10(s_la_23_10[13:0]),
                       .LBA_3_0(s_lba_3_0[3:0]),
                       .LCS_n(s_lcs_n),
                       .LEV0(s_lev0),
                       .LSHADOW(s_lshadow),
                       .MAP_n(s_map_n),
                       .MCLK(s_mclk),
                       .MOR_n(s_mor_n),
                       .MREQ_n(s_mreq),  //TODO: not connected to anything?
                       .MR_n(s_mr_n),
                       .OPCLCS(s_opclcs),
                       .PAN_n(s_pan_n),
                       .PARERR_n(s_parerr_n),
                       .PCR_1_0(s_pcr_1_0[1:0]),
                       .PD1(s_pd1),
                       .PIL_3_0(s_pil_3_0[3:0]),
                       .PONI(s_poni),
                       .POWFAIL_n(s_powfail_n),
                       .PT_15_9(s_pt_15_0[15:9]),
                       .RF_1_0(s_rf_1_0[1:0]),
                       .RRF_n(s_rrf_n),   //TODO: not connected to anything?
                       .RT_n(s_rt_n),
                       .RWCS_n(s_rwcs_n),
                       .TERM_n(s_term_n),
                       .TEST_4_0(s_test_4_0[4:0]),
                       .SEL_TESTMUX(SEL_TESTMUX),
                       .TP1_INTRQ_n(s_tp1_intr1_n),
                       .TRAP(s_trap),
                       .UCLK(s_uclk),
                       .VEX(s_vex),
                       .WCA_n(s_pd18),
                       .WCS_n(s_wcs_n),
                       .WRFSTB(s_wrfstb),
                       .LDEXM_n(LDEXM_n)                     
                       );

   CPU_CS_16   CS (
                  .sysclk(sysclk),        // System clock in FPGA
                  .sys_rst_n(sys_rst_n),  // System reset in FPGA

                  /* Clock signals */
                   .CLK(s_clk),
                   .MACLK(s_maclk),

                   /* Test signals */
                   .PD1(s_pd1),

                   /* Input signals */
                   .IDB_15_0_IN(s_cs_IDB_15_0_in[15:0]),

                   .BLCS_n(s_blcs_n),
                   .BRK_n(s_brk_n),
                   .CC_3_1_n(s_cc_3_1_n[2:0]),
                   .CSA_12_0(s_csa_12_0[12:0]),
                   .CSCA_9_0(s_csca_9_0[9:0]),
                   .FETCH(s_fetch),
                   .FORM_n(s_form_n),                   
                   .LCS_n(s_lcs_n),
                   .RF_1_0(s_rf_1_0[1:0]),
                   .RWCS_n(s_rwcs_n),
                   .TERM_n(s_term_n),
                   .WCA_n(s_pd18),
                   .WCS_n(s_wcs_n),

                    /* OUTPUTS */
                   .EWCA_n(s_ewca_n),
                   .CSBITS(s_csbits[63:0]),
                   .IDB_15_0_OUT(s_cs_IDB_15_0_out[15:0]),
                   .LUA_12_0(s_lua_12_0[12:0])
                   );
/*
   CPU_MMU_24   MMU (
                     .sysclk(sysclk),        // System clock in FPGA
                     .sys_rst_n(sys_rst_n),  // System reset in FPGA

                     .BEDO_n(s_bedo_n),
                     .BEMPID_n(s_bempid_n),
                     .BLCS_n(s_blcs_n),
                     .BRK_n(s_brk_n),
                     .BSTP(s_bstp),
                     .CA_10_0(s_ca_10_0[10:0]),
                     .CC2_n(s_cc2_n),
                     .CCLR_n(s_cclr_n),
                     .CD_15_0_IN(s_mmu_15_0_in[15:0]),
                     .CD_15_0_OUT(s_mmu_15_0_out[15:0]),
                     .CUP(s_cup),
                     .CWR(s_cwr),
                     .CYD(s_cyd),
                     .DOUBLE(s_double),
                     .DT_n(s_dt_n),
                     .DVACC_n(s_dvacc_n),
                     .ECSR_n(s_ecsr_n),
                     .EDO_n(s_edo_n),
                     .EMCL_n(s_emcl_n),
                     .EMPID_n(s_empid_n),
                     .EORF_n(s_eorf_n),
                     .ESTOF_n(s_estof_n),
                     .FMISS(s_fmiss),
                     .HIT(s_hit),
                     .IDB_15_0_IN(s_mmu_idb_15_0_in[15:0]),
                     .IDB_15_0_OUT(s_mmu_idb_15_0_out[15:0]),
                     .LAPA_n(s_lapa_n),
                     .LA_20_10(s_la_23_10[10:0]),
                     .LCS_n(s_lcs_n),
                     .LSHADOW(s_lshadow),
                     .PD2(s_pd2),
                     .PPN_25_10_IN(s_mmu_ppn_25_10_in[15:0]),
                     .PPN_25_10_OUT(s_mmu_ppn_25_10_out[15:0]),                     
                     .PT_15_0_OUT(s_pt_15_0[15:0]),
                     .RT_n(s_rt_n),
                     .STP(s_stp),
                     .SW1_CONSOLE(s_sw1_console),
                     .UCLK(s_uclk),
                     .WCA_n(s_pd18),
                     .WCHIM_n(s_wchim_n),
                     .WRITE(s_write),
                     .LED1(s_led1)
   );

*/

   // CPU_STOC_35.v is replaced by this line
   assign s_cd_15_0_out[15:0] = s_stoc_n ? 16'b0 : s_stoc_idb_15_0_in[15:0]; // If STOC_n is high, output is high-impedance

   // CPU_LAPA_23.v is replaced by this line
   assign s_ppn_25_10[15:0] = s_lapa_n ? 16'b0 : {2'b0,s_la_23_10[13:0]};  // is s_lapa_n is high, output is high-impedance
   // TODO: Or with other output ?
endmodule
