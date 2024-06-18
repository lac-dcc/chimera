// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU                                                               **
** MMU TOP LEVEL                                                         **
** SHEET 24 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **
***************************************************************************/

module CPU_MMU_24( 
   input sysclk, // System clock in FPGA
   input sys_rst_n, // System reset in FPGA

   input        BRK_n,
   input [10:0] CA_10_0,
   input        CC2_n,
   input        CCLR_n,
   input        CUP,
   input        CWR,
   input        CYD,
   input        DOUBLE,
   input        DT_n,
   input        DVACC_n,
   input        ECSR_n,
   input        EDO_n,
   input        EMCL_n,
   input        EMPID_n,
   input        EORF_n,
   input        ESTOF_n,
   input        FMISS,
   input [10:0] LA_20_10,
   input        LCS_n,
   input        LSHADOW,
   input        PD2,
   input        RT_n,
   input        STP,
   input        SW1_CONSOLE,
   input        UCLK,
   input        WCHIM_n,
   input        WRITE,

   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,
   
   input  [15:0] CD_15_0_IN,
   output [15:0] CD_15_0_OUT,

   input  [15:0] PPN_25_10_IN,
   output [15:0] PPN_25_10_OUT,

   output        BEDO_n,
   output        BEMPID_n,
   output        BLCS_n,
   output        BSTP,
   
   output        HIT,
   
   output        LAPA_n,
   output [15:0] PT_15_0_OUT,
   output        WCA_n,
   output        LED1 // Cache enabled ?
);


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [10:0] s_la_20_10;
   wire [15:0] s_idb_15_0_out;
   wire [15:0] s_pt_15_0_out;

   wire [13:0] s_cpn_23_10;
   wire [10:0] s_ca_10_0;
     
   wire [1:0]  s_hit_1_0_n; 
   
   wire        s_ecd_n;
   wire        s_bstp;
   wire        s_bedo_n;
   wire        s_con;
   wire        s_ept_n;
   wire        s_empid_n;
   wire        s_lcs_n;
   wire        s_ecsr_n;
   wire        s_lapa_n;
   wire        s_wclim_n;   
   wire        s_uclk;
   wire        s_cwr;
   wire        s_wchim_n;
   wire        s_hit;
   wire        s_eipur_n;
   wire        s_eipl_n;
   wire        s_con_n;
   wire        s_cyd;
   wire        s_pd2;
   wire        s_sw1_console;
   wire        s_wcinh_n;
   wire        s_eipu_n;
   wire        s_eorf_n;
   wire        s_epmap_n;
   wire        s_estof_n;
   wire        s_cup;
   wire        s_dvacc_n;
   wire        s_emcl_n;
   wire        s_epti_n;
   wire        s_bempid_n;
   wire        s_blcs_n;
   wire        s_stp;
   wire        s_edo_n;
   wire        s_dt_n;
   wire        s_brk_n;
   wire        s_wmap_n;
   wire        s_rt_n;
   wire        s_cc2_n;   
   wire        s_cclr_n;
   wire        s_fmiss;
   wire        s_double;
   wire        s_write;
   wire        s_lshadow;
   wire        s_wca_n;
   wire        s_led1;

   // PPN
   wire [15:0] s_ppn_25_10_in;
   wire [15:0] s_ppn_25_10_out;

   // PT
   wire [15:0] s_pt_ppn_25_10_out;
   wire [15:0] s_pt_ppn_25_10_in;

   // CPN
   wire [13:0] s_cpn_23_10_cache_out;

   wire [15:0] s_cd_15_0_cache_in;
   wire [15:0] s_cd_15_0_cache_out;

   // PTIDB
   wire [15:0] s_ptidb_pt_15_0_in;
   wire [15:0] s_ptidb_pt_15_0_out;
   
   wire [15:0] s_ptidb_idb_15_0_in;
   wire [15:0] s_ptidb_idb_15_0_out;
   
   // PPNX
   wire [15:0] s_ppnx_idb_15_0_in;
   wire [15:0] s_ppnx_idb_15_0_out;

   wire [15:0] s_ppnx_ppn_25_10_in;
   wire [15:0] s_ppnx_ppn_25_10_out;
   
   // WCA
   wire [13:0] s_wca_ppn_23_10_in;

   // CSR
   wire [3:0] s_csr_idb_3_0_out;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/

   assign s_ptidb_idb_15_0_in = IDB_15_0_IN;
   assign s_ppnx_idb_15_0_in = IDB_15_0_IN;

   assign s_la_20_10[10:0]    = LA_20_10;
   assign s_ca_10_0[10:0]     = CA_10_0;
   assign s_empid_n           = EMPID_n;
   assign s_lcs_n             = LCS_n;
   assign s_ecsr_n            = ECSR_n;
   assign s_uclk              = UCLK;
   assign s_cwr               = CWR;
   assign s_wchim_n           = WCHIM_n;
   assign s_cyd               = CYD;
   assign s_pd2               = PD2;
   assign s_sw1_console       = SW1_CONSOLE;
   assign s_eorf_n            = EORF_n;
   assign s_estof_n           = ESTOF_n;
   assign s_cup               = CUP;
   assign s_dvacc_n           = DVACC_n;
   assign s_emcl_n            = EMCL_n;
   assign s_stp               = STP;
   assign s_edo_n             = EDO_n;
   assign s_dt_n              = DT_n;
   assign s_brk_n             = BRK_n;
   assign s_rt_n              = RT_n;
   assign s_cc2_n             = CC2_n;
   assign s_cclr_n            = CCLR_n;
   assign s_fmiss             = FMISS;
   assign s_double            = DOUBLE;
   assign s_write             = WRITE;
   assign s_lshadow           = LSHADOW;
   assign s_ppn_25_10_in      = PPN_25_10_IN;
   assign s_cd_15_0_cache_in  = CD_15_0_IN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BEDO_n        = s_bedo_n;
   assign BEMPID_n      = s_bempid_n;
   assign BLCS_n        = s_blcs_n;
   assign BSTP          = s_bstp;
   assign CD_15_0_OUT   = s_cd_15_0_cache_out[15:0];
   assign HIT           = s_hit;
   assign IDB_15_0_OUT  = s_idb_15_0_out[15:0];
   assign LAPA_n        = s_lapa_n;
   assign PPN_25_10_OUT = s_ppn_25_10_out[15:0];
   assign PT_15_0_OUT   = s_pt_15_0_out[15:0] | s_ptidb_pt_15_0_out;
   assign WCA_n         = s_wca_n;
   assign LED1          = s_led1;

   // BUS SIGNALS
   assign s_wca_ppn_23_10_in = s_ppn_25_10_in[13:0] | s_ppnx_ppn_25_10_out[13:0] | s_pt_ppn_25_10_out[13:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   /*
   OR_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_wchim_n),
               .input2(s_eorf_n),
               .result(s_wclim_n));
   */

   assign s_wclim_n = s_wchim_n | s_eorf_n;

   /*
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_lshadow),
               .input2(s_write),
               .input3(s_cyd),
               .result(s_wmap_n));
   */

   assign s_wmap_n = ~(s_lshadow & s_write & s_cyd);

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CPU_MMU_HIT_27   MMU_HIT ( // IN
                             .CPN_23_10_IN(s_cpn_23_10[13:0]),
                             .PPN_23_10_IN(s_ppn_25_10_in[13:0]),
                           
                             .LSHADOW(s_lshadow),
                             .FMISS(s_fmiss),
                             .CON_n(s_con_n),

                              // OUT
                             .HIT0_n(s_hit_1_0_n[0]),
                             .HIT1_n(s_hit_1_0_n[1])                                                
                             );

   CPU_MMU_PPNX_28   PPNX (.EIPL_n(s_eipl_n),
                           .EIPUR_n(s_eipur_n),
                           .EIPU_n(s_eipu_n),
                           .ESTOF_n(s_estof_n),
                           .IDB_15_0_IN(s_ppnx_idb_15_0_in[15:0]),
                           .IDB_15_0_OUT(s_ppnx_idb_15_0_out[15:0]),
                           .PPN_25_10_IN(s_ppnx_ppn_25_10_in[15:0]), //s_logisimBus7?
                           .PPN_25_10_OUT(s_ppnx_ppn_25_10_out[15:0])
                           );

   //TODO:  Maybe refactor to one line ?
   CPU_MMU_PTIDB_30   PTIDB (.EPTI_n(s_epti_n),
                             .IDB_15_0_IN(s_ptidb_pt_15_0_in[15:0]),
                             .IDB_15_0_OUT(s_ptidb_idb_15_0_out[15:0]),
                             .PT_15_0_IN(s_ptidb_pt_15_0_in),
                             .PT_15_0_OUT(s_ptidb_pt_15_0_out),
                             .WRITE(s_write));



   // CPU_MMU_WCA_31.v is replaced by this line
   assign s_cpn_23_10[13:0] = s_wca_n ? 14'b0 : s_wca_ppn_23_10_in[13:0];  // is s_lapa_n is high, output is high-impedance

   CPU_MMU_CSR_26   CSR (.BEDO_n(s_bedo_n),
                         .BEMPID_n(s_bempid_n),
                         .BLCS_n(s_blcs_n),
                         .BSTP(s_bstp),
                         .CON(s_con),
                         .CUP(s_cup),
                         .ECSR_n(s_ecsr_n),
                         .EDO_n(s_edo_n),
                         .EMPID_n(s_empid_n),
                         .IDB_3_0(s_csr_idb_3_0_out[3:0]),
                         .LCS_n(s_lcs_n),
                         .PD2(s_pd2),
                         .STP(s_stp));

   CPU_MMU_CACHE_25   CACHE (
                             .sysclk(sysclk),         // System clock in FPGA
                             .sys_rst_n(sys_rst_n),   // System reset in FPGA

                             .BRK_n(s_brk_n),
                             .CA_10_0(s_ca_10_0[10:0]),
                             .CCLR_n(s_cclr_n),
                             .CD_15_0_IN(s_cd_15_0_cache_in),   
                             .CD_15_0_OUT(s_cd_15_0_cache_out),
                             .CON(s_con),
                             .CON_n(s_con_n),
                             .CPN_23_10_IN(s_cpn_23_10[13:0]),   
                             .CPN_23_10_OUT(s_cpn_23_10_cache_out[13:0]),   
                             
                             .CWR(s_cwr),
                             .CYD(s_cyd),
                             .DT_n(s_dt_n),
                             .ECD_n(s_ecd_n),
                             .FMISS(s_fmiss),
                             .HIT(s_hit),
                             .HIT_1_0_n(s_hit_1_0_n[1:0]),
                             .LSHADOW(s_lshadow),
                             .PD2(s_pd2),
                             .RT_n(s_rt_n),
                             .SW1_CONSOLE(s_sw1_console),
                             .UCLK(s_uclk),
                             .WCA_n(s_wca_n),
                             .WCINH_n(s_wcinh_n),
                             .LED1(s_led1)
                             );

   PAL_44306A    PAL_44306_UNOCTL (.EIPUR_n(s_eipur_n), //B0
                                   .EIPU_n(s_eipu_n),   //B1
                                   .EIPL_n(s_eipl_n),   //B2
                                   .EPTI_n(s_epti_n),   //B3
                                   .EPMAP_n(s_epmap_n), //B4
                                   .EPT_n(s_ept_n),     //B5
                                   .CA0(s_ca_10_0[0]),  //I0
                                   .WRITE(s_write),      //I1
                                   .DVACC_n(s_dvacc_n),  //I2
                                   .RT_n(s_rt_n),        //I3
                                   .WCHIM_n(s_wchim_n),  //I4
                                   .DOUBLE(s_double),    //I5
                                   .EMCL_n(s_emcl_n),    //I6
                                   .CC2_n(s_cc2_n),      //I7
                                   .WCA_n(s_wca_n),      //I8
                                   .LSHADOW(s_lshadow),  //I9
                                   .ECD_n(s_ecd_n),      //Y0
                                   .LAPA_n(s_lapa_n)     //Y1
                                 );

   CPU_MMU_PT_29   PT (
                       .sysclk(sysclk),         // System clock in FPGA
                       .sys_rst_n(sys_rst_n),   // System reset in FPGA

                       .EPMAP_n(s_epmap_n),
                       .EPT_n(s_ept_n),
                       .LA_20_10(s_la_20_10[10:0]),
                       .PPN_25_10_IN(s_pt_ppn_25_10_in[15:0]),
                       .PPN_25_10_OUT(s_pt_ppn_25_10_out[15:0]),
                       .PT_15_0_IN(s_ptidb_pt_15_0_out),
                       .PT_15_0_OUT(s_ptidb_pt_15_0_in),
                       .WCINH_n(s_wcinh_n),
                       .WCLIM_n(s_wclim_n),
                       .WMAP_n(s_wmap_n));

endmodule
