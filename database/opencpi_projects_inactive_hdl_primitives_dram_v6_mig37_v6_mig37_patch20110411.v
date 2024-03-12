// v6_mig37_patch20110411.v

//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 3.3
//  \   \         Application        : MIG
//  /   /         Filename           : mig_33.v
// /___/   /\     Date Last Modified : $Date: 2009/10/19 15:58:09 $
// \   \  /  \    Date Created       : Mon Jun 23 2008
//  \___\/\___\
//
// Device           : Virtex-6
// Design Name      : DDR3 SDRAM
// Purpose          :
//                   Top-level  module. This module serves both as an example,
//                   and allows the user to synthesize a self-contained design,
//                   which they can use to test their hardware. In addition to
//                   the memory controller.
//                   instantiates:
//                     1. Clock generation/distribution, reset logic
//                     2. IDELAY control block
//                     3. Synthesizable testbench - used to model user's backend
//                        logic
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps/1ps

(* X_CORE_INFO = "mig_v3_3_ddr3_V6, Coregen 11.4" , CORE_GENERATION_INFO = "ddr3_V6,mig_v3_3,{component_name=mig_33, DRAM_TYPE=DDR3, nCS_PER_RANK=1, DQ_CNT_WIDTH=6, DQS_CNT_WIDTH=3, RANK_WIDTH=1, BANK_WIDTH=3, CK_WIDTH=1, COL_WIDTH=10, CS_WIDTH=1, DM_WIDTH=8, USE_DM_PORT=1, DQ_WIDTH=64, DRAM_WIDTH=8, DQS_WIDTH=8, ROW_WIDTH=13, AL=0, BURST_MODE=8, BURST_TYPE=SEQ, IODELAY_HP_MODE=ON, CL=6, CWL=5, RANKS=1, WRLVL=ON, PHASE_DETECT=ON, RTT_NOM=DISABLED, RTT_WR=OFF, OUTPUT_DRV=HIGH, REG_CTRL=OFF, nDQS_COL0=6, nDQS_COL1=2, nDQS_COL2=0, nDQS_COL3=0, DQS_LOC_COL0=48'h050403020100, DQS_LOC_COL1=48'h050403020100, DQS_LOC_COL2=48'h050403020100, DQS_LOC_COL3=48'h050403020100, tFAW=45000, tRRD=7500, tRAS=37500, tRCD=13130, tREFI=7800000, tRFC=110000, tRP=13130, tRTP=7500, tWTR=7500, DEBUG_PORT=ON, ADDR_WIDTH=27, ECC=OFF, DATA_WIDTH=64, ECC_TEST=OFF, CLKFBOUT_MULT_F=3, CLKOUT_DIVIDE=3, tCK=2500, REFCLK_FREQ=200, IODELAY_GRP=IODELAY_MIG, INTERFACE_TYPE=DDR3_SDRAM, RST_ACT_LOW=1, INPUT_CLK_TYPE=DIFFERENTIAL, LANGUAGE=Verilog, SYNTHESIS_TOOL=XST, NO_OF_CONTROLLERS=1}" *)
module v6_mig37 #
  (
   parameter REFCLK_FREQ             = 200,
                                       // # = 200 when design frequency <= 533 MHz,
                                       //   = 300 when design frequency > 533 MHz.
   parameter IODELAY_GRP             = "IODELAY_MIG",
                                       // It is associated to a set of IODELAYs with
                                       // an IDELAYCTRL that have same IODELAY CONTROLLER
                                       // clock frequency.
   parameter CLKFBOUT_MULT_F         = 6,                  // ML605 (was 3 with MIG 3.3)
                                       // write PLL VCO multiplier.
   parameter DIVCLK_DIVIDE           = 1,
                                       // write PLL VCO divisor.
   parameter CLKOUT_DIVIDE           = 3,
                                       // VCO output divisor for fast (memory) clocks.
   parameter nCK_PER_CLK             = 2,
                                       // # of memory CKs per fabric clock.
                                       // # = 2, 1.
   parameter tCK                     = 2500,
                                       // memory tCK paramter.
                                       // # = Clock Period.
   parameter DEBUG_PORT              = "ON",
                                       // # = "ON" Enable debug signals/controls.
                                       //   = "OFF" Disable debug signals/controls.
   parameter SIM_INIT_OPTION         = "NONE",
                                       // # = "SKIP_PU_DLY" - Skip the memory
                                       //                     initilization sequence,
                                       //   = "NONE" - Complete the memory
                                       //              initilization sequence.
   parameter SIM_CAL_OPTION          = "NONE",
                                       // # = "FAST_CAL" - Skip the delay
                                       //                  Calibration process,
                                       //   = "NONE" - Complete the delay
                                       //              Calibration process.
//SPOFFORD - not used with mig3.4   parameter PERFCLK_DIFF            = 0,
                                       // Performance clock delay difference
                                       // between inner and outer columns in ps.
                                       // Should be 0 in only inner column is used.
   parameter nCS_PER_RANK            = 1,
                                       // # of unique CS outputs per Rank for
                                       // phy.
   parameter DQS_CNT_WIDTH           = 3,
                                       // # = ceil(log2(DQS_WIDTH)).
   parameter RANK_WIDTH              = 1,
                                       // # = ceil(log2(RANKS)).
   parameter BANK_WIDTH              = 3,
                                       // # of memory Bank Address bits.
   parameter CK_WIDTH                = 1,
                                       // # of CK/CK# outputs to memory.
//SPOFFORD - added CKE_WIDTH - new with mig3.4
   parameter CKE_WIDTH               = 1,
                                       // # of CKE outputs to memory.
   parameter COL_WIDTH               = 10,
                                       // # of memory Column Address bits.
   parameter CS_WIDTH                = 1,
                                       // # of unique CS outputs to memory.
   parameter DM_WIDTH                = 8,
                                       // # of Data Mask bits.
   parameter DQ_WIDTH                = 64,
                                       // # of Data (DQ) bits.
   parameter DQS_WIDTH               = 8,
                                       // # of DQS/DQS# bits.
   parameter ROW_WIDTH               = 13,
                                       // # of memory Row Address bits.
   parameter BURST_MODE              = "8",
                                       // Burst Length (Mode Register 0).
                                       // # = "8", "4", "OTF".
   parameter BM_CNT_WIDTH            = 2,
                                       // # = ceil(log2(nBANK_MACHS)).
   parameter ADDR_CMD_MODE           = "UNBUF",
                                       // # = "UNBUF", "REG".
   parameter ORDERING                = "STRICT",
                                       // # = "NORM", "STRICT", "RELAXED".
   parameter WRLVL                   = "ON",
                                       // # = "ON" - DDR3 SDRAM
                                       //   = "OFF" - DDR2 SDRAM.
   parameter PHASE_DETECT            = "ON",
                                       // # = "ON", "OFF".
   parameter RTT_NOM                 = "40",                                 // ML605 "40" or "60" acceptable parameter value
                                       // RTT_NOM (ODT) (Mode Register 1).
                                       // # = "DISABLED" - RTT_NOM disabled,
                                       //   = "120" - RZQ/2,
                                       //   = "60"  - RZQ/4,
                                       //   = "40"  - RZQ/6.
   parameter RTT_WR                  = "OFF",
                                       // RTT_WR (ODT) (Mode Register 2).
                                       // # = "OFF" - Dynamic ODT off,
                                       //   = "120" - RZQ/2,
                                       //   = "60"  - RZQ/4,
   parameter OUTPUT_DRV              = "HIGH",
                                       // Output Driver Impedance Control (Mode Register 1).
                                       // # = "HIGH" - RZQ/6,
                                       //   = "LOW" - RZQ/7.
   parameter REG_CTRL                = "OFF",
                                       // # = "ON" - RDIMMs,
                                       //   = "OFF" - Components, SODIMMs, UDIMMs.
   parameter nDQS_COL0               = 3,
                                       // Number of DQS groups in I/O column #1. // ML605
   parameter nDQS_COL1               = 5,
                                       // Number of DQS groups in I/O column #2. // ML605
   parameter nDQS_COL2               = 0,
                                       // Number of DQS groups in I/O column #3.
   parameter nDQS_COL3               = 0,
                                       // Number of DQS groups in I/O column #4.
   parameter DQS_LOC_COL0            = 24'h020100,
                                       // DQS groups in column #1.  // ML605
   parameter DQS_LOC_COL1            = 40'h0706050403,
                                       // DQS groups in column #2.  // ML605
   parameter DQS_LOC_COL2            = 0,
                                       // DQS groups in column #3.
   parameter DQS_LOC_COL3            = 0,
                                       // DQS groups in column #4.
   parameter OCB_MONITOR             = "ON",
                                       // # = "ON",
                                       //   = "OFF".
   parameter ADDR_WIDTH              = 27,
                                       // # = RANK_WIDTH + BANK_WIDTH
                                       //     + ROW_WIDTH + COL_WIDTH;
   parameter ECC_TEST                = "OFF",
   parameter TCQ                     = 100,
//SPOFFORD - DATA_WIDTH and PAYLOAD_WIDTH are new with mig3.4
   parameter DATA_WIDTH              = 64,
   parameter PAYLOAD_WIDTH           = (ECC_TEST == "OFF") ? DATA_WIDTH : DQ_WIDTH,
   parameter RST_ACT_LOW             = 0,
                                        // =1 for active low reset,
                                       // =0 for active high.
   //parameter INPUT_CLK_TYPE          = "DIFFERENTIAL",
   parameter INPUT_CLK_TYPE          = "SINGLE_ENDED",
                                       // input clock type DIFFERNTIAL or SINGLE_ENDED
   parameter STARVE_LIMIT            = 2
                                       // # = 2,3,4.
   )
  (

   input                                clk_sys,
   input                                clk_ref,
   input                                sys_rst,   // System reset, active Hi

   inout  [DQ_WIDTH-1:0]                ddr3_dq,
   output [ROW_WIDTH-1:0]               ddr3_addr,
   output [BANK_WIDTH-1:0]              ddr3_ba,
   output                               ddr3_ras_n,
   output                               ddr3_cas_n,
   output                               ddr3_we_n,
   output                               ddr3_reset_n,
   output [(CS_WIDTH*nCS_PER_RANK)-1:0] ddr3_cs_n,
   output [(CS_WIDTH*nCS_PER_RANK)-1:0] ddr3_odt,
   output [CS_WIDTH-1:0]                ddr3_cke,
   output [DM_WIDTH-1:0]                ddr3_dm,
   inout  [DQS_WIDTH-1:0]               ddr3_dqs_p,
   inout  [DQS_WIDTH-1:0]               ddr3_dqs_n,
   output [CK_WIDTH-1:0]                ddr3_ck_p,
   output [CK_WIDTH-1:0]                ddr3_ck_n,
   inout                                sda,
   output                               scl,

   input                                app_wdf_wren,
   input [(4*PAYLOAD_WIDTH)-1:0]        app_wdf_data,
   input [(4*PAYLOAD_WIDTH)/8-1:0]      app_wdf_mask,
   input                                app_wdf_end,
   input [ADDR_WIDTH-1:0]               app_addr,
   input [2:0]                          app_cmd,
   input                                app_en,
   output                               app_rdy,
   output                               app_wdf_rdy,
   output [(4*PAYLOAD_WIDTH)-1:0]       app_rd_data,
   output                               app_rd_data_valid,
   output                               app_rd_data_end,    // added
   output                               phy_init_done,
   output                               tb_rst_n,
   output                               tb_clk,

   // added 25 debug signals debug..
   output [DQS_WIDTH-1:0]             dbg_wl_dqs_inverted,
   output [2*DQS_WIDTH-1:0]           dbg_wr_calib_clk_delay,
   output [5*DQS_WIDTH-1:0]           dbg_wl_odelay_dqs_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_wl_odelay_dq_tap_cnt,
   output [1:0]                       dbg_rdlvl_done,
   output [1:0]                       dbg_rdlvl_err,
   output [5*DQS_WIDTH-1:0]           dbg_cpt_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_cpt_first_edge_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_cpt_second_edge_cnt,
   output [3*DQS_WIDTH-1:0]           dbg_rd_bitslip_cnt,
   output [2*DQS_WIDTH-1:0]           dbg_rd_clkdly_cnt,
   output [4:0]                       dbg_rd_active_dly,
   input                              dbg_pd_off,
   input                              dbg_pd_maintain_off,
   input                              dbg_pd_maintain_0_only,
   input                              dbg_ocb_mon_off,
   input                              dbg_inc_cpt,
   input                              dbg_dec_cpt,
   input                              dbg_inc_rd_dqs,
   input                              dbg_dec_rd_dqs,
   input [DQS_CNT_WIDTH-1:0]          dbg_inc_dec_sel,
   output [5*DQS_WIDTH-1:0]           dbg_dqs_p_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_dqs_n_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_dq_tap_cnt,
   output [4*DQ_WIDTH-1:0]            dbg_rddata

   );

  function integer STR_TO_INT;
    input [7:0] in;
    begin
      if(in == "8")
        STR_TO_INT = 8;
      else if(in == "4")
        STR_TO_INT = 4;
      else
        STR_TO_INT = 0;
    end
  endfunction

  localparam SYSCLK_PERIOD          = tCK * nCK_PER_CLK;

// Spofford  localparam DATA_WIDTH          = 64;
// Spofford   localparam PAYLOAD_WIDTH       = (ECC_TEST == "OFF") ? DATA_WIDTH : DQ_WIDTH;
  localparam BURST_LENGTH        = STR_TO_INT(BURST_MODE);
  localparam APP_DATA_WIDTH      = PAYLOAD_WIDTH * 4;
  localparam APP_MASK_WIDTH      = APP_DATA_WIDTH / 8;

  wire                                mmcm_clk;
  wire                                iodelay_ctrl_rdy;
      
 // (* KEEP = "TRUE" *) wire            sda_i;    //ML605 comment out used IIC ports
 // (* KEEP = "TRUE" *) wire            scl_i;    //ML606 comment out used IIC ports
  wire                                rst;
  wire                                rst_pll_ck_fb;
  wire                                pll_lock_ck_fb;
  wire                                clk;
  wire                                clk_mem;
  wire                                clk_wr_i;
  wire                                clk_wr_o;
  wire                                ocb_mon_PSDONE;
  wire                                ocb_mon_PSEN;
  wire                                ocb_mon_PSINCDEC;
  wire  [(BM_CNT_WIDTH)-1:0]          bank_mach_next;
  wire                                ddr3_parity;
  wire [ADDR_WIDTH-1:0]               app_addr;
  wire                                app_hi_pri;
  wire [3:0]                          app_ecc_multiple_err_i;
  wire [47:0]                         traffic_wr_data_counts;
  wire [47:0]                         traffic_rd_data_counts;

  wire                                ddr3_cs0_clk;
  wire [35:0]                         ddr3_cs0_control;
  wire [383:0]                        ddr3_cs0_data;
  wire [7:0]                          ddr3_cs0_trig;
  wire [255:0]                        ddr3_cs1_async_in;
  wire [35:0]                         ddr3_cs1_control;
  wire [255:0]                        ddr3_cs2_async_in;
  wire [35:0]                         ddr3_cs2_control;
  wire [255:0]                        ddr3_cs3_async_in;
  wire [35:0]                         ddr3_cs3_control;
  wire                                ddr3_cs4_clk;
  wire [35:0]                         ddr3_cs4_control;
  wire [31:0]                         ddr3_cs4_sync_out;


  assign app_hi_pri = 1'b0;
  assign tb_clk = clk;
  assign tb_rst_n = !rst;
  MUXCY scl_inst
    (
     .O  (scl),
     .CI (scl_i),
     .DI (1'b0),
     .S  (1'b1)
     );

  MUXCY sda_inst
    (
     .O  (sda),
     .CI (sda_i),
     .DI (1'b0),
     .S  (1'b1)
     );
  assign clk_ref_p = 1'b0;
  assign clk_ref_n = 1'b0;
  assign sys_clk_p = 1'b0;
  assign sys_clk_n = 1'b0;

  //***************************************************************************


  iodelay_ctrl #
    (
     .TCQ            (TCQ),
     .IODELAY_GRP    (IODELAY_GRP),
     .INPUT_CLK_TYPE (INPUT_CLK_TYPE),
     .RST_ACT_LOW    (RST_ACT_LOW)
     )
    u_iodelay_ctrl
      (
       .clk_ref_p        (clk_ref_p),
       .clk_ref_n        (clk_ref_n),
       .clk_ref          (clk_ref),
       .sys_rst          (sys_rst),
       .iodelay_ctrl_rdy (iodelay_ctrl_rdy)
       );

   assign mmcm_clk = clk_sys;  // The DRAM clock

       /* 
  clk_ibuf #
    ( .INPUT_CLK_TYPE (INPUT_CLK_TYPE)) u_clk_ibuf
    ( .sys_clk_p         (sys_clk_p),
      .sys_clk_n         (sys_clk_n),
      .sys_clk           (clk_sys),
      .mmcm_clk          (mmcm_clk)
      );
     */

  infrastructure #
    (
     .TCQ             (TCQ),
     .CLK_PERIOD      (SYSCLK_PERIOD),
     .nCK_PER_CLK     (nCK_PER_CLK),
     .CLKFBOUT_MULT_F (CLKFBOUT_MULT_F),
     .DIVCLK_DIVIDE   (DIVCLK_DIVIDE),
     .CLKOUT_DIVIDE   (CLKOUT_DIVIDE),
// SPOFFORD     .PERFCLK_DIFF    (PERFCLK_DIFF),
     .RST_ACT_LOW     (RST_ACT_LOW)
     )
    u_infrastructure
      (
       .mmcm_clk         (mmcm_clk),
       .sys_rst          (sys_rst),
       .iodelay_ctrl_rdy (iodelay_ctrl_rdy),
// Spofford - doesn't exist in 3.4       .pll_lock_ck_fb   (pll_lock_ck_fb),
       .clk_mem          (clk_mem),
       .clk              (clk),
// Spofford      .clk_wr_i         (clk_wr_i),
// Spofford      .clk_wr_o         (clk_wr_o),
		.clk_rd_base		(clk_wr_i),	// Spofford - new in MIG3.4
// Spofford - doesn't exist in 3.4         .rst_pll_ck_fb    (rst_pll_ck_fb),
       .rstdiv0          (rst),
       .PSDONE           (ocb_mon_PSDONE),
       .PSEN             (ocb_mon_PSEN),
       .PSINCDEC         (ocb_mon_PSINCDEC)
       );


  memc_ui_top #
  (
   .ADDR_CMD_MODE   (ADDR_CMD_MODE),
   .BANK_WIDTH      (BANK_WIDTH),
   .CK_WIDTH        (CK_WIDTH),
	.CKE_WIDTH			(CKE_WIDTH),	//SPOFFORD
   .nCK_PER_CLK     (nCK_PER_CLK),
   .COL_WIDTH       (COL_WIDTH),
   .CS_WIDTH        (CS_WIDTH),
   .DM_WIDTH        (DM_WIDTH),
   .nCS_PER_RANK    (nCS_PER_RANK),
   .DEBUG_PORT      (DEBUG_PORT),
   .IODELAY_GRP     (IODELAY_GRP),
   .DQ_WIDTH        (DQ_WIDTH),
   .DQS_WIDTH       (DQS_WIDTH),
   .DQS_CNT_WIDTH   (DQS_CNT_WIDTH),
//   .OCB_MONITOR     (OCB_MONITOR),
   .ORDERING        (ORDERING),
   .OUTPUT_DRV      (OUTPUT_DRV),
   .PHASE_DETECT    (PHASE_DETECT),
   .RANK_WIDTH      (RANK_WIDTH),
   .REFCLK_FREQ     (REFCLK_FREQ),
   .REG_CTRL        (REG_CTRL),
   .ROW_WIDTH       (ROW_WIDTH),
   .RTT_NOM         (RTT_NOM),
   .RTT_WR          (RTT_WR),
//   .SIM_CAL_OPTION  (SIM_CAL_OPTION),
//   .SIM_INIT_OPTION (SIM_INIT_OPTION),
   .WRLVL           (WRLVL),
   .nDQS_COL0       (nDQS_COL0),
   .nDQS_COL1       (nDQS_COL1),
   .nDQS_COL2       (nDQS_COL2),
   .nDQS_COL3       (nDQS_COL3),
   .DQS_LOC_COL0    (DQS_LOC_COL0),
   .DQS_LOC_COL1    (DQS_LOC_COL1),
   .DQS_LOC_COL2    (DQS_LOC_COL2),
   .DQS_LOC_COL3    (DQS_LOC_COL3),
   .BURST_MODE      (BURST_MODE),
   .BM_CNT_WIDTH    (BM_CNT_WIDTH),
   .tCK             (tCK),
   .ADDR_WIDTH      (ADDR_WIDTH),
   .TCQ             (TCQ),
   .ECC_TEST        (ECC_TEST),
   .PAYLOAD_WIDTH   (PAYLOAD_WIDTH),
	.DATA_WIDTH (DATA_WIDTH)	// SPOFFORD
   )
  u_memc_ui_top
  (
   .ddr_addr                         (ddr3_addr),
   .ddr_ba                           (ddr3_ba),
   .ddr_cas_n                        (ddr3_cas_n),
   .ddr_ck_n                         (ddr3_ck_n),
   .ddr_ck                           (ddr3_ck_p),
   .ddr_cke                          (ddr3_cke),
   .ddr_cs_n                         (ddr3_cs_n),
   .ddr_dm                           (ddr3_dm),
   .ddr_odt                          (ddr3_odt),
   .ddr_ras_n                        (ddr3_ras_n),
   .ddr_reset_n                      (ddr3_reset_n),
   .ddr_parity                       (ddr3_parity),
   .ddr_we_n                         (ddr3_we_n),
   .ddr_dq                           (ddr3_dq),
   .ddr_dqs_n                        (ddr3_dqs_n),
   .ddr_dqs                          (ddr3_dqs_p),

//Spofford   .pll_lock_ck_fb                   (pll_lock_ck_fb),
   .bank_mach_next                   (bank_mach_next),
//Spofford    .ocb_mon_PSEN                     (ocb_mon_PSEN),
//Spofford    .ocb_mon_PSINCDEC                 (ocb_mon_PSINCDEC),
   .phy_init_done                    (phy_init_done),   // ssiegel was dfi_init_complete in v34
   .app_ecc_multiple_err             (app_ecc_multiple_err_i),
   .clk                              (clk),
   .clk_mem                          (clk_mem),
	.clk_rd_base                 (clk_wr_i),		// Spofford - new to mig 3.4
//Spofford    .clk_wr_i                         (clk_wr_i),
//Spofford    .clk_wr_o                         (clk_wr_o),
//Spofford    .ocb_mon_PSDONE                   (ocb_mon_PSDONE),
   .rst                              (rst),
//Spofford    .rst_pll_ck_fb                    (rst_pll_ck_fb),
   .app_rd_data                      (app_rd_data),
   .app_rd_data_end                  (app_rd_data_end),
   .app_rd_data_valid                (app_rd_data_valid),
   .app_rdy                          (app_rdy),     //ssiegel was _full in v34
   .app_wdf_rdy                      (app_wdf_rdy), //ssiegel was _full in v34
   .app_addr                         (app_addr),    //ssiegel was tg_addt in v34
   .app_cmd                          (app_cmd),
   .app_en                           (app_en),
   .app_hi_pri                       (app_hi_pri),
   .app_sz                           (1'b1),
   .app_wdf_data                     (app_wdf_data),
   .app_wdf_end                      (app_wdf_end),
   .app_wdf_mask                     (app_wdf_mask),
   .app_wdf_wren                     (app_wdf_wren),
   .dbg_wl_dqs_inverted              (dbg_wl_dqs_inverted),
   .dbg_wr_calib_clk_delay           (dbg_wr_calib_clk_delay),
   .dbg_wl_odelay_dqs_tap_cnt        (dbg_wl_odelay_dqs_tap_cnt),
   .dbg_wl_odelay_dq_tap_cnt         (dbg_wl_odelay_dq_tap_cnt),
   .dbg_rdlvl_done                   (dbg_rdlvl_done),
   .dbg_rdlvl_err                    (dbg_rdlvl_err),
   .dbg_cpt_tap_cnt                  (dbg_cpt_tap_cnt),
   .dbg_cpt_first_edge_cnt           (dbg_cpt_first_edge_cnt),
   .dbg_cpt_second_edge_cnt          (dbg_cpt_second_edge_cnt),
   .dbg_rd_bitslip_cnt               (dbg_rd_bitslip_cnt),
   .dbg_rd_clkdly_cnt                (dbg_rd_clkdly_cnt),
   .dbg_rd_active_dly                (dbg_rd_active_dly),
//Spofford    .dbg_dqs_p_tap_cnt                (dbg_dqs_p_tap_cnt),
//Spofford    .dbg_dqs_n_tap_cnt                (dbg_dqs_n_tap_cnt),
   .dbg_dq_tap_cnt                   (dbg_dq_tap_cnt),
   .dbg_rddata                       (dbg_rddata),
   .dbg_pd_off                       (dbg_pd_off),
   .dbg_pd_maintain_off              (dbg_pd_maintain_off),
   .dbg_pd_maintain_0_only           (dbg_pd_maintain_0_only),
//Spofford    .dbg_ocb_mon_off                  (dbg_ocb_mon_off),
   .dbg_inc_cpt                      (dbg_inc_cpt),
   .dbg_dec_cpt                      (dbg_dec_cpt),
   .dbg_inc_rd_dqs                   (dbg_inc_rd_dqs),
   .dbg_dec_rd_dqs                   (dbg_dec_rd_dqs),
   .dbg_inc_dec_sel                  (dbg_inc_dec_sel)
   );
endmodule
