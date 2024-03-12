//*****************************************************************************
// (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 3.4
//  \   \         Application: MIG
//  /   /         Filename: phy_top.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//Purpose:
//   Top-level for memory physical layer (PHY) interface
//   NOTES:
//     1. Need to support multiple copies of CS outputs
//     2. DFI_DRAM_CKE_DISABLE not supported
//
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_top.v,v 1.10 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.10 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_top.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_top #
  (
   parameter TCQ             = 100,
   parameter nCK_PER_CLK     = 2,       // # of memory clocks per CLK
   parameter CLK_PERIOD      = 3333,    // Internal clock period (in ps)
   parameter REFCLK_FREQ     = 300.0,   // IODELAY Reference Clock freq (MHz)
   parameter DRAM_TYPE       = "DDR3",  // Memory I/F type: "DDR3", "DDR2"
   // Slot Conifg parameters
   parameter [7:0] SLOT_0_CONFIG = 8'b0000_0001,
   parameter [7:0] SLOT_1_CONFIG = 8'b0000_0000,
   // DRAM bus widths
   parameter BANK_WIDTH      = 2,       // # of bank bits
   parameter CK_WIDTH        = 1,       // # of CK/CK# outputs to memory
   parameter COL_WIDTH       = 10,      // column address width
   parameter nCS_PER_RANK    = 1,       // # of unique CS outputs per rank
   parameter DQ_CNT_WIDTH    = 6,       // = ceil(log2(DQ_WIDTH))
   parameter DQ_WIDTH        = 64,      // # of DQ (data)
   parameter DM_WIDTH        = 8,      // # of DM (data mask)
   parameter DQS_CNT_WIDTH   = 3,       // = ceil(log2(DQS_WIDTH))
   parameter DQS_WIDTH       = 8,       // # of DQS (strobe)
   parameter DRAM_WIDTH      = 8,       // # of DQ per DQS
   parameter ROW_WIDTH       = 14,      // DRAM address bus width
   parameter RANK_WIDTH      = 1,       // log2(CS_WIDTH)
   parameter CS_WIDTH        = 1,       // # of DRAM ranks
   parameter CKE_WIDTH       = 1,       // # of cke outputs 
   parameter CAL_WIDTH       = "HALF",  // # of DRAM ranks to be calibrated
                                        // CAL_WIDTH = CS_WIDTH when "FULL"
                                        // CAL_WIDTH = CS_WIDTH/2 when "HALF"          
   // calibration Address. The address given below will be used for calibration
   // read and write operations. 
   parameter CALIB_ROW_ADD   = 16'h0000,// Calibration row address
   parameter CALIB_COL_ADD   = 12'h000, // Calibration column address
   parameter CALIB_BA_ADD    = 3'h0,    // Calibration bank address 
   // DRAM mode settings
   parameter AL              = "0",     // Additive Latency option
   parameter BURST_MODE      = "8",     // Burst length
   parameter BURST_TYPE      = "SEQ",   // Burst type
   parameter nAL             = 0,       // Additive latency (in clk cyc)
   parameter nCL             = 5,       // Read CAS latency (in clk cyc)
   parameter nCWL            = 5,       // Write CAS latency (in clk cyc)
   parameter tRFC            = 110000,  // Refresh-to-command delay
   parameter OUTPUT_DRV      = "HIGH",  // DRAM reduced output drive option
   parameter REG_CTRL        = "ON",    // "ON" for registered DIMM
   parameter RTT_NOM         = "60",    // ODT Nominal termination value
   parameter RTT_WR          = "60",    // ODT Write termination value
   parameter WRLVL           = "OFF",   // Enable write leveling
   // Phase Detector/Read Leveling options
   parameter PHASE_DETECT    = "OFF",   // Enable read phase detector
   parameter PD_TAP_REQ      = 0,       // # of IODELAY taps reserved for PD
   parameter PD_MSB_SEL      = 8,       // # of bits in PD response cntr
   parameter PD_DQS0_ONLY    = "ON",    // Enable use of DQS[0] only for
                                        // phase detector
   parameter PD_LHC_WIDTH    = 16,      // sampling averaging cntr widths   
   parameter PD_CALIB_MODE   = "PARALLEL",  // parallel/seq PD calibration
   // IODELAY/BUFFER options
   parameter IBUF_LPWR_MODE  = "OFF",   // Input buffer low power mode
   parameter IODELAY_HP_MODE = "ON",    // IODELAY High Performance Mode
   parameter IODELAY_GRP     = "IODELAY_MIG", // May be assigned unique name
                                              // when mult IP cores in design
   // Pin-out related parameters
   parameter nDQS_COL0       = DQS_WIDTH,  // # DQS groups in I/O column #1
   parameter nDQS_COL1       = 0,          // # DQS groups in I/O column #2
   parameter nDQS_COL2       = 0,          // # DQS groups in I/O column #3
   parameter nDQS_COL3       = 0,          // # DQS groups in I/O column #4
   parameter DQS_LOC_COL0    = 144'h11100F0E0D0C0B0A09080706050403020100,
                                           // DQS grps in col #1
   parameter DQS_LOC_COL1    = 0,          // DQS grps in col #2
   parameter DQS_LOC_COL2    = 0,          // DQS grps in col #3
   parameter DQS_LOC_COL3    = 0,          // DQS grps in col #4
   parameter USE_DM_PORT     = 1,          // DM instantation enable
   // Simulation /debug options
   parameter SIM_INIT_OPTION = "NONE",  // Skip various initialization steps
   parameter SIM_CAL_OPTION  = "NONE",  // Skip various calibration steps
   parameter DEBUG_PORT      = "OFF"    // Enable debug port
   )
  (
   input                              clk_mem,     // Memory clock
   input                              clk,         // Internal (logic) clock
   input                              clk_rd_base, // Base capture clock
   input                              rst,         // Reset sync'ed to CLK
   // Slot present inputs
   input [7:0]                        slot_0_present,
   input [7:0]                        slot_1_present,
   // DFI Control/Address
   input [ROW_WIDTH-1:0]              dfi_address0,
   input [ROW_WIDTH-1:0]              dfi_address1,
   input [BANK_WIDTH-1:0]             dfi_bank0,
   input [BANK_WIDTH-1:0]             dfi_bank1,
   input                              dfi_cas_n0,
   input                              dfi_cas_n1,
   input [CKE_WIDTH-1:0]              dfi_cke0,
   input [CKE_WIDTH-1:0]              dfi_cke1,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_cs_n0,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_cs_n1,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_odt0,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_odt1,
   input                              dfi_ras_n0,
   input                              dfi_ras_n1,
   input                              dfi_reset_n,
   input                              dfi_we_n0,
   input                              dfi_we_n1,
   // DFI Write
   input                              dfi_wrdata_en,
   input [4*DQ_WIDTH-1:0]             dfi_wrdata,
   input [4*(DQ_WIDTH/8)-1:0]         dfi_wrdata_mask,
   // DFI Read
   input                              dfi_rddata_en,
   output [4*DQ_WIDTH-1:0]            dfi_rddata,
   output                             dfi_rddata_valid,
   // DFI Initialization Status / CLK Disable
   input                              dfi_dram_clk_disable,
   output                             dfi_init_complete,
   // sideband signals
   input                              io_config_strobe,
   input [RANK_WIDTH:0]               io_config,
   // DDRx Output Interface
   output [CK_WIDTH-1:0]              ddr_ck_p,
   output [CK_WIDTH-1:0]              ddr_ck_n,
   output [ROW_WIDTH-1:0]             ddr_addr,
   output [BANK_WIDTH-1:0]            ddr_ba,
   output                             ddr_ras_n,
   output                             ddr_cas_n,
   output                             ddr_we_n,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_cs_n,
   output [CKE_WIDTH-1:0]             ddr_cke,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_odt,
   output                             ddr_reset_n,
   output                             ddr_parity,
   output [DM_WIDTH-1:0]              ddr_dm,
   inout [DQS_WIDTH-1:0]              ddr_dqs_p,
   inout [DQS_WIDTH-1:0]              ddr_dqs_n,
   inout [DQ_WIDTH-1:0]               ddr_dq,
   // Read Phase Detector Interface
   input                              pd_PSDONE,
   output                             pd_PSEN,         
   output                             pd_PSINCDEC,         
   // Debug Port
   // Write leveling logic
   input  [5*DQS_WIDTH-1:0]   dbg_wr_dqs_tap_set,
   input  [5*DQS_WIDTH-1:0]   dbg_wr_dq_tap_set,
   input                      dbg_wr_tap_set_en,  
   output                     dbg_wrlvl_start,
   output                     dbg_wrlvl_done,
   output                     dbg_wrlvl_err,
   output [DQS_WIDTH-1:0]     dbg_wl_dqs_inverted,
   output [2*DQS_WIDTH-1:0]   dbg_wr_calib_clk_delay,
   output [5*DQS_WIDTH-1:0]   dbg_wl_odelay_dqs_tap_cnt,
   output [5*DQS_WIDTH-1:0]   dbg_wl_odelay_dq_tap_cnt,
   output [4:0]               dbg_tap_cnt_during_wrlvl,
   output                     dbg_wl_edge_detect_valid,
   output [DQS_WIDTH-1:0]     dbg_rd_data_edge_detect,
   // Read leveling logic
   output [1:0]               dbg_rdlvl_start,
   output [1:0]               dbg_rdlvl_done,
   output [1:0]               dbg_rdlvl_err,
   output [5*DQS_WIDTH-1:0]   dbg_cpt_first_edge_cnt,
   output [5*DQS_WIDTH-1:0]   dbg_cpt_second_edge_cnt,
   output [3*DQS_WIDTH-1:0]   dbg_rd_bitslip_cnt,
   output [2*DQS_WIDTH-1:0]   dbg_rd_clkdly_cnt,
   output [4:0]               dbg_rd_active_dly,
   output [4*DQ_WIDTH-1:0]    dbg_rd_data,
   // Delay control
   input                      dbg_idel_up_all,
   input                      dbg_idel_down_all,
   input                      dbg_idel_up_cpt,
   input                      dbg_idel_down_cpt,
   input                      dbg_idel_up_rsync,
   input                      dbg_idel_down_rsync,
   input [DQS_CNT_WIDTH-1:0]  dbg_sel_idel_cpt,
   input                      dbg_sel_all_idel_cpt,
   input [DQS_CNT_WIDTH-1:0]  dbg_sel_idel_rsync,
   input                      dbg_sel_all_idel_rsync,
   output [5*DQS_WIDTH-1:0]   dbg_cpt_tap_cnt,
   output [19:0]              dbg_rsync_tap_cnt,
   output [5*DQS_WIDTH-1:0]   dbg_dqs_tap_cnt,
   output [5*DQS_WIDTH-1:0]   dbg_dq_tap_cnt,
   // Phase detector
   input                      dbg_pd_off,
   input                      dbg_pd_maintain_off,
   input                      dbg_pd_maintain_0_only,
   input                      dbg_pd_inc_cpt,
   input                      dbg_pd_dec_cpt,
   input                      dbg_pd_inc_dqs,
   input                      dbg_pd_dec_dqs,   
   input                      dbg_pd_disab_hyst,
   input                      dbg_pd_disab_hyst_0,
   input  [3:0]               dbg_pd_msb_sel,
   input [DQS_CNT_WIDTH-1:0]  dbg_pd_byte_sel,
   input                      dbg_inc_rd_fps,
   input                      dbg_dec_rd_fps,
   // General debug ports - connect to internal nets as needed
   output [255:0]             dbg_phy_pd,    // Phase Detector
   output [255:0]             dbg_phy_read,  // Read datapath
   output [255:0]             dbg_phy_rdlvl, // Read leveling calibration
   output [255:0]             dbg_phy_top    // General PHY debug
   );

  // Advance ODELAY of DQ by extra 0.25*tCK (quarter clock cycle) to center
  // align DQ and DQS on writes. Round (up or down) value to nearest integer
  localparam integer SHIFT_TBY4_TAP
             = (CLK_PERIOD + (nCK_PER_CLK*(1000000/(REFCLK_FREQ*64))*2)-1) /
             (nCK_PER_CLK*(1000000/(REFCLK_FREQ*64))*4);
  
  // For reg dimm addign one extra cycle of latency for CWL. The new value
  // will be passed to phy_write and phy_data_io
  localparam CWL_M = (REG_CTRL == "ON") ? nCWL + 1 : nCWL;

  // Calculate number of slots in the system
  localparam nSLOTS  = 1 + (|SLOT_1_CONFIG ? 1 : 0);
  // Disable Phase Detector Below 250MHz
  localparam USE_PHASE_DETECT = (CLK_PERIOD > 8000) ? "OFF" : PHASE_DETECT;

  reg  [2:0]                       calib_width;
  wire [1:0]                       chip_cnt;
  wire [DQS_WIDTH-1:0]             clk_cpt;
  wire [3:0]                       clk_rsync;
  wire [4*DQS_WIDTH-1:0]           dfi_rd_dqs;
  wire [DQS_WIDTH-1:0]             dlyce_cpt;
  wire [DQS_WIDTH-1:0]             dlyce_pd_cpt;
  wire [DQS_WIDTH-1:0]             dlyce_rdlvl_cpt;
  wire [3:0]                       dlyce_rdlvl_rsync;
  wire [3:0]                       dlyce_rsync;
  wire [DQS_WIDTH-1:0]             dlyinc_cpt;
  wire [DQS_WIDTH-1:0]             dlyinc_pd_cpt;
  wire                             dlyinc_pd_dqs;
  wire                             dlyinc_rdlvl_cpt;
  wire                             dlyinc_rdlvl_rsync;
  wire [3:0]                       dlyinc_rsync;
  wire                             dlyrst_cpt;
  wire                             dlyrst_rsync;
  wire [5*DQS_WIDTH-1:0]           dlyval_dq;
  wire [5*DQS_WIDTH-1:0]           dlyval_dqs;
  wire [5*DQS_WIDTH-1:0]           dlyval_pd_dqs;
  wire [5*DQS_WIDTH-1:0]           dlyval_rdlvl_dq;
  wire [5*DQS_WIDTH-1:0]           dlyval_rdlvl_dqs;
  wire [5*DQS_WIDTH-1:0]           dlyval_wrlvl_dq;
  wire [5*DQS_WIDTH-1:0]           dlyval_wrlvl_dq_w;
  wire [5*DQS_WIDTH-1:0]           dlyval_wrlvl_dqs;
  wire [5*DQS_WIDTH-1:0]           dlyval_wrlvl_dqs_w;
  wire [DQS_WIDTH-1:0]             dm_ce;
  wire [4*DQS_WIDTH-1:0]           dq_oe_n;
  wire [DQS_WIDTH-1:0]             dqs_inv;
  reg                              dqs_oe;
  wire [4*DQS_WIDTH-1:0]           dqs_oe_n;
  wire [(DQS_WIDTH*4)-1:0]         dqs_rst;
  wire [DQS_WIDTH-1:0]             inv_dqs;
  wire [(DQ_WIDTH/8)-1:0]          mask_data_fall0;
  wire [(DQ_WIDTH/8)-1:0]          mask_data_fall1;
  wire [(DQ_WIDTH/8)-1:0]          mask_data_rise0;
  wire [(DQ_WIDTH/8)-1:0]          mask_data_rise1;
  wire                             pd_cal_done;
  wire                             pd_cal_start;
  wire                             pd_prech_req;
  wire [ROW_WIDTH-1:0]             phy_address0;
  wire [ROW_WIDTH-1:0]             phy_address1;
  wire [BANK_WIDTH-1:0]            phy_bank0;
  wire [BANK_WIDTH-1:0]            phy_bank1;
  wire                             phy_cas_n0;
  wire                             phy_cas_n1;
  wire [CKE_WIDTH-1:0]             phy_cke0;
  wire [CKE_WIDTH-1:0]             phy_cke1;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] phy_cs_n0;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] phy_cs_n1;
  wire                             phy_init_data_sel;
  wire [0:0]                       phy_io_config;  
  wire                             phy_io_config_strobe;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] phy_odt0;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] phy_odt1;
  wire                             phy_ras_n0;
  wire                             phy_ras_n1;
  wire                             phy_rddata_en;
  wire                             phy_reset_n;
  wire                             phy_we_n0;
  wire                             phy_we_n1;
  wire [4*DQ_WIDTH-1:0]            phy_wrdata;
  wire                             phy_wrdata_en;
  wire [4*(DQ_WIDTH/8)-1:0]        phy_wrdata_mask;
  wire                             prech_done;
  wire [1:0]                       rank_cnt;
  wire [4:0]                       rd_active_dly;
  wire [2*DQS_WIDTH-1:0]           rd_bitslip_cnt;
  wire [2*DQS_WIDTH-1:0]           rd_clkdly_cnt;
  wire [DQ_WIDTH-1:0]              rd_data_fall0;
  wire [DQ_WIDTH-1:0]              rd_data_fall1;
  wire [DQ_WIDTH-1:0]              rd_data_rise0;
  wire [DQ_WIDTH-1:0]              rd_data_rise1;
  wire [DQS_WIDTH-1:0]             rd_dqs_fall0;
  wire [DQS_WIDTH-1:0]             rd_dqs_fall1;
  wire [DQS_WIDTH-1:0]             rd_dqs_rise0;
  wire [DQS_WIDTH-1:0]             rd_dqs_rise1;
  wire [1:0]                       rdlvl_done;
  wire [1:0]                       rdlvl_err;
  wire                             rdlvl_pat_resume;
  wire                             rdlvl_pat_resume_w;
  wire                             rdlvl_pat_err;
  wire [DQS_CNT_WIDTH-1:0]         rdlvl_pat_err_cnt;
  wire                             rdlvl_prech_req;
  wire [1:0]                       rdlvl_start;
  wire [3:0]                       rst_rsync;
  wire                             wl_sm_start;
  wire [2*DQS_WIDTH-1:0]           wr_calib_dly;
  wire [DQ_WIDTH-1:0]              wr_data_rise0;
  wire [DQ_WIDTH-1:0]              wr_data_fall0;
  wire [DQ_WIDTH-1:0]              wr_data_rise1;
  wire [DQ_WIDTH-1:0]              wr_data_fall1;
  wire [2*DQS_WIDTH-1:0]           wrcal_dly_w;
  wire                             wrcal_err;
  wire                             wrlvl_active;
  wire                             wrlvl_done;
  wire                             wrlvl_err;
  wire                             wrlvl_start;

  //***************************************************************************
  // Debug
  //***************************************************************************
  
  // Captured data in clk domain
  // NOTE: Prior to MIG 3.4, this data was synchronized to CLK_RSYNC domain
  //  But was never connected beyond PHY_TOP (at the MEM_INTFC level, this
  //  port is never used, and instead DFI_RDDATA was routed to DBG_RDDATA)
  assign dbg_rd_data = dfi_rddata;

  // Unused for now - use these as needed to bring up lower level signals
  assign dbg_phy_top = 256'd0;

  // Write Level and write calibration debug observation ports
  assign dbg_wrlvl_start           = wrlvl_start;  
  assign dbg_wrlvl_done            = wrlvl_done;
  assign dbg_wrlvl_err             = wrlvl_err;
  assign dbg_wl_dqs_inverted       = dqs_inv;
  assign dbg_wl_odelay_dqs_tap_cnt = dlyval_wrlvl_dqs;
  assign dbg_wl_odelay_dq_tap_cnt  = dlyval_wrlvl_dq;
  assign dbg_wr_calib_clk_delay    = wr_calib_dly;

  // Read Level debug observation ports
  assign dbg_rdlvl_start           = rdlvl_start;
  assign dbg_rdlvl_done            = rdlvl_done;
  assign dbg_rdlvl_err             = rdlvl_err;
  
  //***************************************************************************
  // Write leveling dependent signals
  //***************************************************************************

  assign rdlvl_pat_resume_w = (WRLVL == "ON") ? rdlvl_pat_resume : 1'b0;
  assign dqs_inv      = (WRLVL == "ON") ? inv_dqs : {DQS_WIDTH{1'b0}};
  assign wrcal_dly_w  = (WRLVL == "ON") ? wr_calib_dly : {2*DQS_WIDTH{1'b0}};

  // Rank count (chip_cnt) from phy_init for write bitslip during read leveling
  // Rank count (io_config) from MC during normal operation
  assign rank_cnt = (rst || (RANK_WIDTH == 0)) ? 2'b00 :
                    (~dfi_init_complete) ? chip_cnt :
                    // io_config[1:0] causes warning with VCS
                    // io_config[RANK_WIDTH-1:0] causes error with VCS
                    (RANK_WIDTH == 2) ? io_config[1:0] :
                    io_config[0];

  //*****************************************************************
  // DETERMINE DQ/DQS output delay values
  //   1. If WRLVL disabled: DQS = 0 delay, DQ = 90 degrees delay
  //   2. If WRLVL enabled: DQS and DQ delays are determined during
  //      write leveling
  // For multi-rank design the appropriate rank values will be sent to
  // phy_write, phy_dly_ctrl, and phy_data_io
  //*****************************************************************
  
  generate
    genvar offset_i;
    for (offset_i = 0; offset_i < DQS_WIDTH;
         offset_i = offset_i + 1) begin: gen_offset_tap
      if (DEBUG_PORT == "ON") begin: gen_offset_tap_dbg
        // Allow debug port to modify the post-write-leveling ODELAY
        // values of DQ and DQS. This can be used to measure DQ-DQS
        // (as well as tDQSS) timing margin on writes  
        assign dlyval_wrlvl_dq[5*offset_i+4:5*offset_i]
                 = (WRLVL == "ON") ?
                   ((wrlvl_done && dbg_wr_tap_set_en) ?
                    dbg_wr_dq_tap_set[5*offset_i+4:5*offset_i] :
                    dlyval_wrlvl_dq_w[5*offset_i+4:5*offset_i]) :
                   ((dbg_wr_tap_set_en) ?
                    dbg_wr_dq_tap_set[5*offset_i+4:5*offset_i] :
                    SHIFT_TBY4_TAP);
        assign dlyval_wrlvl_dqs[5*offset_i+4:5*offset_i]
                 = (WRLVL == "ON") ?
                   ((wrlvl_done && dbg_wr_tap_set_en) ?
                    dbg_wr_dqs_tap_set[5*offset_i+4:5*offset_i] :
                    dlyval_wrlvl_dqs_w[5*offset_i+4:5*offset_i]) :
                   ((dbg_wr_tap_set_en) ?
                    dbg_wr_dqs_tap_set[5*offset_i+4:5*offset_i] :
                    5'b0);
      end else begin: gen_offset_tap_nodbg 
        assign dlyval_wrlvl_dq[5*offset_i+4:5*offset_i]
                 = (WRLVL == "ON") ?
                   dlyval_wrlvl_dq_w[5*offset_i+4:5*offset_i] :
                   SHIFT_TBY4_TAP;
        assign dlyval_wrlvl_dqs[5*offset_i+4:5*offset_i]
                 = (WRLVL == "ON") ?
                   dlyval_wrlvl_dqs_w[5*offset_i+4:5*offset_i] :
                   5'b0;        
      end      
    end
  endgenerate

  //***************************************************************************
  // Used for multi-rank case to determine the number of ranks to be calibrated
  // The number of ranks to be calibrated can be less than the CS_WIDTH (rank
  // width)
  // Assumes at least one rank per slot to be calibrated
  // If nSLOTS equals 1 slot_1_present input will be ignored
  // Assumes CS_WIDTH to be 1, 2, 3, or 4
  //***************************************************************************

  generate
    if (nSLOTS == 1) begin: gen_single_slot
      always @ (posedge clk) begin
        case ({slot_0_present[0],slot_0_present[1],
               slot_0_present[2],slot_0_present[3]})
          // single slot quad rank calibration
          4'b1111:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd4;
            else
              calib_width <= #TCQ 3'd2;
          // single slot dual rank calibration
          4'b1100:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd2;
            else
              calib_width <= #TCQ 3'd1;
          default:
            calib_width <= #TCQ 3'd1;
        endcase
      end
    end else if (nSLOTS == 2) begin: gen_dual_slot
      always @ (posedge clk) begin
        case ({slot_0_present[0],slot_0_present[1],
               slot_1_present[0],slot_1_present[1]})
          // two slots single rank per slot CAL_WIDTH ignored since one rank
          // per slot must be calibrated
          4'b1010:
            calib_width <= #TCQ 3'd2;
          // two slots single rank in slot0
          4'b1000:
            calib_width <= #TCQ 3'd1;
          // two slots single rank in slot1
          4'b0010:
            calib_width <= #TCQ 3'd1;
          // two slots two ranks per slot calibration
          4'b1111:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd4;
            else
              calib_width <= #TCQ 3'd2;
          // two slots: 2 ranks in slot0, 1 rank in slot1
          4'b1110:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd3;
            else
              calib_width <= #TCQ 3'd2;
          // two slots: 2 ranks in slot0, none in slot1
          4'b1100:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd2;
            else
              calib_width <= #TCQ 3'd1;
          // two slots: 1 rank in slot0, 2 ranks in slot1
          4'b1011:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd3;
            else
              calib_width <= #TCQ 3'd2;
          // two slots: none in slot0, 2 ranks in slot1
          4'b0011:
            if (CAL_WIDTH == "FULL")
              calib_width <= #TCQ 3'd2;
            else
              calib_width <= #TCQ 3'd1;
          default:
            calib_width <= #TCQ 3'd2;
        endcase
      end
    end
  endgenerate

  //***************************************************************************
  // Initialization / Master PHY state logic (overall control during memory
  // init, timing leveling)
  //***************************************************************************

  phy_init #
    (
     .TCQ             (TCQ),
     .nCK_PER_CLK     (nCK_PER_CLK),
     .CLK_PERIOD      (CLK_PERIOD),
     .DRAM_TYPE       (DRAM_TYPE),
     .BANK_WIDTH      (BANK_WIDTH),
     .COL_WIDTH       (COL_WIDTH),
     .nCS_PER_RANK    (nCS_PER_RANK),
     .DQ_WIDTH        (DQ_WIDTH),
     .ROW_WIDTH       (ROW_WIDTH),
     .CS_WIDTH        (CS_WIDTH),
     .CKE_WIDTH       (CKE_WIDTH),
     .CALIB_ROW_ADD   (CALIB_ROW_ADD),
     .CALIB_COL_ADD   (CALIB_COL_ADD),
     .CALIB_BA_ADD    (CALIB_BA_ADD),
     .AL              (AL),
     .BURST_MODE      (BURST_MODE),
     .BURST_TYPE      (BURST_TYPE),
     .nAL             (nAL),
     .nCL             (nCL),
     .nCWL            (nCWL),
     .tRFC            (tRFC),
     .OUTPUT_DRV      (OUTPUT_DRV),
     .REG_CTRL        (REG_CTRL),
     .RTT_NOM         (RTT_NOM),
     .RTT_WR          (RTT_WR),
     .WRLVL           (WRLVL),
     .PHASE_DETECT    (USE_PHASE_DETECT),
     .nSLOTS          (nSLOTS),
     .SIM_INIT_OPTION (SIM_INIT_OPTION),
     .SIM_CAL_OPTION  (SIM_CAL_OPTION)
     )
    u_phy_init
      (
       .clk               (clk),
       .rst               (rst),
       .calib_width       (calib_width),
       .rdpath_rdy        (rdpath_rdy),
       .wrlvl_done        (wrlvl_done),
       .wrlvl_rank_done   (wrlvl_rank_done),
       .wrlvl_active      (wrlvl_active),
       .slot_0_present    (slot_0_present),
       .slot_1_present    (slot_1_present),
       .rdlvl_done        (rdlvl_done),
       .rdlvl_start       (rdlvl_start),
       .rdlvl_prech_req   (rdlvl_prech_req),
       .rdlvl_resume      (rdlvl_pat_resume_w),
       .chip_cnt          (chip_cnt),
       .pd_cal_start      (pd_cal_start),
       .pd_cal_done       (pd_cal_done),
       .pd_prech_req      (pd_prech_req),
       .prech_done        (prech_done),
       .dfi_init_complete (dfi_init_complete),
       .phy_address0      (phy_address0),
       .phy_address1      (phy_address1),
       .phy_bank0         (phy_bank0),
       .phy_bank1         (phy_bank1),
       .phy_cas_n0        (phy_cas_n0),
       .phy_cas_n1        (phy_cas_n1),
       .phy_cke0          (phy_cke0),
       .phy_cke1          (phy_cke1),
       .phy_cs_n0         (phy_cs_n0),
       .phy_cs_n1         (phy_cs_n1),
       .phy_init_data_sel (phy_init_data_sel),
       .phy_odt0          (phy_odt0),
       .phy_odt1          (phy_odt1),
       .phy_ras_n0        (phy_ras_n0),
       .phy_ras_n1        (phy_ras_n1),
       .phy_reset_n       (phy_reset_n),
       .phy_we_n0         (phy_we_n0),
       .phy_we_n1         (phy_we_n1),
       .phy_wrdata_en     (phy_wrdata_en),
       .phy_wrdata        (phy_wrdata),
       .phy_rddata_en     (phy_rddata_en),
       .phy_ioconfig      (phy_io_config),
       .phy_ioconfig_en   (phy_io_config_strobe)
       );

  //*****************************************************************
  // Control/Address MUX and IOB logic
  //*****************************************************************

  phy_control_io #
    (
     .TCQ              (TCQ),
     .BANK_WIDTH       (BANK_WIDTH),
     .RANK_WIDTH       (RANK_WIDTH),
     .nCS_PER_RANK     (nCS_PER_RANK),
     .CS_WIDTH         (CS_WIDTH),
     .CKE_WIDTH        (CKE_WIDTH),
     .ROW_WIDTH        (ROW_WIDTH),
     .WRLVL            (WRLVL),
     .nCWL             (CWL_M),
     .DRAM_TYPE        (DRAM_TYPE),
     .REG_CTRL         (REG_CTRL),
     .REFCLK_FREQ      (REFCLK_FREQ),
     .IODELAY_HP_MODE  (IODELAY_HP_MODE),
     .IODELAY_GRP      (IODELAY_GRP)
     )
    u_phy_control_io
      (
       .clk_mem        (clk_mem),
       .clk            (clk),
       .rst            (rst),
       .mc_data_sel    (phy_init_data_sel),
       .dfi_address0   (dfi_address0),
       .dfi_address1   (dfi_address1),
       .dfi_bank0      (dfi_bank0),
       .dfi_bank1      (dfi_bank1),
       .dfi_cas_n0     (dfi_cas_n0),
       .dfi_cas_n1     (dfi_cas_n1),
       .dfi_cke0       (dfi_cke0),
       .dfi_cke1       (dfi_cke1),
       .dfi_cs_n0      (dfi_cs_n0),
       .dfi_cs_n1      (dfi_cs_n1),
       .dfi_odt0       (dfi_odt0),
       .dfi_odt1       (dfi_odt1),
       .dfi_ras_n0     (dfi_ras_n0),
       .dfi_ras_n1     (dfi_ras_n1),
       .dfi_reset_n    (dfi_reset_n),
       .dfi_we_n0      (dfi_we_n0),
       .dfi_we_n1      (dfi_we_n1),
       .phy_address0   (phy_address0),
       .phy_address1   (phy_address1),
       .phy_bank0      (phy_bank0),
       .phy_bank1      (phy_bank1),
       .phy_cas_n0     (phy_cas_n0),
       .phy_cas_n1     (phy_cas_n1),
       .phy_cke0       (phy_cke0),
       .phy_cke1       (phy_cke1),
       .phy_cs_n0      (phy_cs_n0),
       .phy_cs_n1      (phy_cs_n1),
       .phy_odt0       (phy_odt0),
       .phy_odt1       (phy_odt1),
       .phy_ras_n0     (phy_ras_n0),
       .phy_ras_n1     (phy_ras_n1),
       .phy_reset_n    (phy_reset_n),
       .phy_we_n0      (phy_we_n0),
       .phy_we_n1      (phy_we_n1),
       .ddr_addr       (ddr_addr),
       .ddr_ba         (ddr_ba),
       .ddr_ras_n      (ddr_ras_n),
       .ddr_cas_n      (ddr_cas_n),
       .ddr_we_n       (ddr_we_n),
       .ddr_cke        (ddr_cke),
       .ddr_cs_n       (ddr_cs_n),
       .ddr_odt        (ddr_odt),
       .ddr_parity     (ddr_parity),
       .ddr_reset_n    (ddr_reset_n)
       );

  //*****************************************************************
  // Memory clock forwarding and feedback
  //*****************************************************************

  phy_clock_io #
    (
     .TCQ              (TCQ),
     .CK_WIDTH         (CK_WIDTH),
     .WRLVL            (WRLVL),
     .DRAM_TYPE        (DRAM_TYPE),
     .REFCLK_FREQ      (REFCLK_FREQ),
     .IODELAY_GRP      (IODELAY_GRP)
     )
    u_phy_clock_io
      (
       .clk_mem   (clk_mem),
       .clk       (clk),
       .rst       (rst),
       .ddr_ck_p  (ddr_ck_p),
       .ddr_ck_n  (ddr_ck_n)
       );

  //*****************************************************************
  // Data-related IOBs (data, strobe, mask), and regional clock buffers
  // Also includes output clock IOBs, and external feedback clock
  //*****************************************************************

  phy_data_io #
    (
     .TCQ             (TCQ),
     .nCK_PER_CLK     (nCK_PER_CLK),
     .CLK_PERIOD      (CLK_PERIOD),
     .DRAM_TYPE       (DRAM_TYPE),
     .DRAM_WIDTH      (DRAM_WIDTH),
     .DM_WIDTH        (DM_WIDTH),
     .DQ_WIDTH        (DQ_WIDTH),
     .DQS_WIDTH       (DQS_WIDTH),
     .nCWL            (CWL_M),
     .WRLVL           (WRLVL),
     .REFCLK_FREQ     (REFCLK_FREQ),
     .IBUF_LPWR_MODE  (IBUF_LPWR_MODE),
     .IODELAY_HP_MODE (IODELAY_HP_MODE),
     .IODELAY_GRP     (IODELAY_GRP),
     .nDQS_COL0       (nDQS_COL0),
     .nDQS_COL1       (nDQS_COL1),
     .nDQS_COL2       (nDQS_COL2),
     .nDQS_COL3       (nDQS_COL3),
     .DQS_LOC_COL0    (DQS_LOC_COL0),
     .DQS_LOC_COL1    (DQS_LOC_COL1),
     .DQS_LOC_COL2    (DQS_LOC_COL2),
     .DQS_LOC_COL3    (DQS_LOC_COL3),
     .USE_DM_PORT     (USE_DM_PORT)
     )
    u_phy_data_io
      (
       .clk_mem         (clk_mem),
       .clk             (clk),
       .clk_cpt         (clk_cpt),
       .clk_rsync       (clk_rsync),
       .rst             (rst),
       .rst_rsync       (rst_rsync),
       //IODELAY I/F
       .dlyval_dq       (dlyval_dq),
       .dlyval_dqs      (dlyval_dqs),
       //Write datapath I/F
       .inv_dqs         (dqs_inv),
       .wr_calib_dly    (wrcal_dly_w),
       .dqs_oe_n        (dqs_oe_n),
       .dq_oe_n         (dq_oe_n),
       .dqs_rst         (dqs_rst),
       .dm_ce           (dm_ce),
       .mask_data_rise0 (mask_data_rise0),
       .mask_data_fall0 (mask_data_fall0),
       .mask_data_rise1 (mask_data_rise1),
       .mask_data_fall1 (mask_data_fall1),
       .wr_data_rise0   (wr_data_rise0),
       .wr_data_fall0   (wr_data_fall0),
       .wr_data_rise1   (wr_data_rise1),
       .wr_data_fall1   (wr_data_fall1),
       //Read datapath I/F
       .rd_bitslip_cnt  (rd_bitslip_cnt),
       .rd_clkdly_cnt   (rd_clkdly_cnt),
       .rd_data_rise0   (rd_data_rise0),
       .rd_data_fall0   (rd_data_fall0),
       .rd_data_rise1   (rd_data_rise1),
       .rd_data_fall1   (rd_data_fall1),
       .rd_dqs_rise0    (rd_dqs_rise0),
       .rd_dqs_fall0    (rd_dqs_fall0),
       .rd_dqs_rise1    (rd_dqs_rise1),
       .rd_dqs_fall1    (rd_dqs_fall1),
       // DDR3 bus signals
       .ddr_dm          (ddr_dm),
       .ddr_dqs_p       (ddr_dqs_p),
       .ddr_dqs_n       (ddr_dqs_n),
       .ddr_dq          (ddr_dq),
       // Debug signals
       .dbg_dqs_tap_cnt (dbg_dqs_tap_cnt),
       .dbg_dq_tap_cnt  (dbg_dq_tap_cnt)       
       );

  //*****************************************************************
  // IODELAY control logic
  //*****************************************************************

  phy_dly_ctrl #
    (
     .TCQ            (TCQ),
     .DQ_WIDTH       (DQ_WIDTH),
     .DQS_CNT_WIDTH  (DQS_CNT_WIDTH),
     .DQS_WIDTH      (DQS_WIDTH),
     .RANK_WIDTH     (RANK_WIDTH),
     .nCWL           (CWL_M),
     .WRLVL          (WRLVL),
     .PHASE_DETECT   (USE_PHASE_DETECT),
     .DRAM_TYPE      (DRAM_TYPE),
     .nDQS_COL0      (nDQS_COL0),
     .nDQS_COL1      (nDQS_COL1),
     .nDQS_COL2      (nDQS_COL2),
     .nDQS_COL3      (nDQS_COL3),
     .DQS_LOC_COL0   (DQS_LOC_COL0),
     .DQS_LOC_COL1   (DQS_LOC_COL1),
     .DQS_LOC_COL2   (DQS_LOC_COL2),
     .DQS_LOC_COL3   (DQS_LOC_COL3),
     .DEBUG_PORT     (DEBUG_PORT)
     )
    u_phy_dly_ctrl
      (
       .clk                (clk),
       .rst                (rst),
       .clk_rsync          (clk_rsync),
       .rst_rsync          (rst_rsync),
       .wrlvl_done         (wrlvl_done),
       .rdlvl_done         (rdlvl_done),
       .pd_cal_done        (pd_cal_done),
       .mc_data_sel        (phy_init_data_sel),
       .mc_ioconfig        (io_config),
       .mc_ioconfig_en     (io_config_strobe),
       .phy_ioconfig       (phy_io_config),
       .phy_ioconfig_en    (phy_io_config_strobe),
       .dqs_oe             (dqs_oe),
       .dlyval_wrlvl_dqs   (dlyval_wrlvl_dqs),
       .dlyval_wrlvl_dq    (dlyval_wrlvl_dq),
       .dlyce_rdlvl_cpt    (dlyce_rdlvl_cpt),
       .dlyinc_rdlvl_cpt   (dlyinc_rdlvl_cpt),
       .dlyce_rdlvl_rsync  (dlyce_rdlvl_rsync),
       .dlyinc_rdlvl_rsync (dlyinc_rdlvl_rsync),
       .dlyval_rdlvl_dq    (dlyval_rdlvl_dq),
       .dlyval_rdlvl_dqs   (dlyval_rdlvl_dqs),
       .dlyce_pd_cpt       (dlyce_pd_cpt),
       .dlyinc_pd_cpt      (dlyinc_pd_cpt),
       .dlyval_pd_dqs      (dlyval_pd_dqs),
       .dlyval_dqs         (dlyval_dqs),
       .dlyval_dq          (dlyval_dq),
       .dlyrst_cpt         (dlyrst_cpt),
       .dlyce_cpt          (dlyce_cpt),
       .dlyinc_cpt         (dlyinc_cpt),
       .dlyrst_rsync       (dlyrst_rsync),
       .dlyce_rsync        (dlyce_rsync),
       .dlyinc_rsync       (dlyinc_rsync),
       .dbg_pd_off         (dbg_pd_off)
       );

  //*****************************************************************
  // Write path logic (datapath, tri-state enable)
  //*****************************************************************

  phy_write #
    (
     .TCQ             (TCQ),
     .WRLVL           (WRLVL),
     .DQ_WIDTH        (DQ_WIDTH),
     .DQS_WIDTH       (DQS_WIDTH),
     .DRAM_TYPE       (DRAM_TYPE),
     .RANK_WIDTH      (RANK_WIDTH),
     .nCWL            (CWL_M),
     .REG_CTRL        (REG_CTRL)
     )
    u_phy_write
      (
       .clk              (clk),
       .rst              (rst),
       .mc_data_sel      (phy_init_data_sel),
       .wrlvl_active     (wrlvl_active),
       .wrlvl_done       (wrlvl_done),
       .inv_dqs          (dqs_inv),
       .wr_calib_dly     (wrcal_dly_w),
       .dfi_wrdata       (dfi_wrdata),
       .dfi_wrdata_mask  (dfi_wrdata_mask),
       .dfi_wrdata_en    (dfi_wrdata_en),
       .mc_ioconfig_en   (io_config_strobe),
       .mc_ioconfig      (io_config),
       .phy_wrdata       (phy_wrdata),
       .phy_wrdata_en    (phy_wrdata_en),
       .phy_ioconfig_en  (phy_io_config_strobe),
       .phy_ioconfig     (phy_io_config),
       .dm_ce            (dm_ce),
       .dq_oe_n          (dq_oe_n),
       .dqs_oe_n         (dqs_oe_n),
       .dqs_rst          (dqs_rst),
       .out_oserdes_wc   (out_oserdes_wc),
       .dqs_wc           (),
       .dq_wc            (),
       .wl_sm_start      (wl_sm_start),
       .wr_lvl_start     (wrlvl_start),
       .wr_data_rise0    (wr_data_rise0),
       .wr_data_fall0    (wr_data_fall0),
       .wr_data_rise1    (wr_data_rise1),
       .wr_data_fall1    (wr_data_fall1),
       .mask_data_rise0  (mask_data_rise0),
       .mask_data_fall0  (mask_data_fall0),
       .mask_data_rise1  (mask_data_rise1),
       .mask_data_fall1  (mask_data_fall1)
       );

  //***************************************************************************
  // Registered version of DQS Output Enable to determine when to switch
  // from ODELAY to IDELAY in phy_dly_ctrl module
  //***************************************************************************

  // SYNTHESIS_NOTE: might need another pipeline stage to meet timing
  always @(posedge clk)
    dqs_oe <= #TCQ ~(&dqs_oe_n);

  //***************************************************************************
  // Write-leveling calibration logic
  //***************************************************************************

  generate
    if (WRLVL == "ON") begin: mb_wrlvl_inst
      phy_wrlvl #
        (
         .TCQ               (TCQ),
         .DQS_CNT_WIDTH     (DQS_CNT_WIDTH),
         .DQ_WIDTH          (DQ_WIDTH),
         .DQS_WIDTH         (DQS_WIDTH),
         .DRAM_WIDTH        (DRAM_WIDTH),
         .CS_WIDTH          (CS_WIDTH),
         .CAL_WIDTH         (CAL_WIDTH),
         .DQS_TAP_CNT_INDEX (5*DQS_WIDTH-1),
         .SHIFT_TBY4_TAP    (SHIFT_TBY4_TAP)
         )
        u_phy_wrlvl
          (
           .clk                         (clk),
           .rst                         (rst),
           .calib_width                 (calib_width),
           .rank_cnt                    (rank_cnt),
           .wr_level_start              (wrlvl_start),
           .wl_sm_start                 (wl_sm_start),
           .rd_data_rise0               (dfi_rddata[DQ_WIDTH-1:0]),
           .wr_level_done               (wrlvl_done),
           .wrlvl_rank_done             (wrlvl_rank_done),
           .dlyval_wr_dqs               (dlyval_wrlvl_dqs_w),
           .dlyval_wr_dq                (dlyval_wrlvl_dq_w),
           .inv_dqs                     (inv_dqs),
           .rdlvl_error                 (rdlvl_pat_err),
           .rdlvl_err_byte              (rdlvl_pat_err_cnt),
           .rdlvl_resume                (rdlvl_pat_resume),
           .wr_calib_dly                (wr_calib_dly),
           .wrcal_err                   (wrcal_err),
           .wrlvl_err                   (wrlvl_err),
           .dbg_wl_tap_cnt              (dbg_tap_cnt_during_wrlvl),
           .dbg_wl_edge_detect_valid    (dbg_wl_edge_detect_valid),
           .dbg_rd_data_edge_detect     (dbg_rd_data_edge_detect),
           .dbg_rd_data_inv_edge_detect (),
           .dbg_dqs_count               (),
           .dbg_wl_state                ()
           );
    end
  endgenerate

  //*****************************************************************
  // Read clock generation and data/control synchronization
  //*****************************************************************

  phy_read #
    (
     .TCQ             (TCQ),
     .nCK_PER_CLK     (nCK_PER_CLK),
     .CLK_PERIOD      (CLK_PERIOD),
     .REFCLK_FREQ     (REFCLK_FREQ),
     .DQS_WIDTH       (DQS_WIDTH),
     .DQ_WIDTH        (DQ_WIDTH),
     .DRAM_WIDTH      (DRAM_WIDTH),
     .IODELAY_GRP     (IODELAY_GRP),
     .nDQS_COL0       (nDQS_COL0),
     .nDQS_COL1       (nDQS_COL1),
     .nDQS_COL2       (nDQS_COL2),
     .nDQS_COL3       (nDQS_COL3),
     .DQS_LOC_COL0    (DQS_LOC_COL0),
     .DQS_LOC_COL1    (DQS_LOC_COL1),
     .DQS_LOC_COL2    (DQS_LOC_COL2),
     .DQS_LOC_COL3    (DQS_LOC_COL3)
     )
    u_phy_read
      (
       .clk_mem              (clk_mem),
       .clk                  (clk),
       .clk_rd_base          (clk_rd_base),
       .rst                  (rst),
       .dlyrst_cpt           (dlyrst_cpt),
       .dlyce_cpt            (dlyce_cpt),
       .dlyinc_cpt           (dlyinc_cpt),
       .dlyrst_rsync         (dlyrst_rsync),
       .dlyce_rsync          (dlyce_rsync),
       .dlyinc_rsync         (dlyinc_rsync),
       .clk_cpt              (clk_cpt),
       .clk_rsync            (clk_rsync),
       .rst_rsync            (rst_rsync),
       .rdpath_rdy           (rdpath_rdy),
       .mc_data_sel          (phy_init_data_sel),
       .rd_active_dly        (rd_active_dly),
       .rd_data_rise0        (rd_data_rise0),
       .rd_data_fall0        (rd_data_fall0),
       .rd_data_rise1        (rd_data_rise1),
       .rd_data_fall1        (rd_data_fall1),
       .rd_dqs_rise0         (rd_dqs_rise0),
       .rd_dqs_fall0         (rd_dqs_fall0),
       .rd_dqs_rise1         (rd_dqs_rise1),
       .rd_dqs_fall1         (rd_dqs_fall1),
       .dfi_rddata_en        (dfi_rddata_en),
       .phy_rddata_en        (phy_rddata_en),
       .dfi_rddata_valid     (dfi_rddata_valid),
       .dfi_rddata_valid_phy (dfi_rddata_valid_phy),
       .dfi_rddata           (dfi_rddata),
       .dfi_rd_dqs           (dfi_rd_dqs),
       .dbg_cpt_tap_cnt      (dbg_cpt_tap_cnt),
       .dbg_rsync_tap_cnt    (dbg_rsync_tap_cnt),
       .dbg_phy_read         (dbg_phy_read)
       );

  //***************************************************************************
  // Read-leveling calibration logic
  //***************************************************************************

  phy_rdlvl #
    (
     .TCQ             (TCQ),
     .nCK_PER_CLK     (nCK_PER_CLK),
     .CLK_PERIOD      (CLK_PERIOD),
     .REFCLK_FREQ     (REFCLK_FREQ),
     .DQ_WIDTH        (DQ_WIDTH),
     .DQS_CNT_WIDTH   (DQS_CNT_WIDTH),
     .DQS_WIDTH       (DQS_WIDTH),
     .DRAM_WIDTH      (DRAM_WIDTH),
     .nCL             (nCL),
     .PD_TAP_REQ      (PD_TAP_REQ),
     .SIM_CAL_OPTION  (SIM_CAL_OPTION),
     .DEBUG_PORT      (DEBUG_PORT)
     )
    u_phy_rdlvl
      (
       .clk                     (clk),
       .rst                     (rst),
       .rdlvl_start             (rdlvl_start),
       .rdlvl_rd_active         (dfi_rddata_valid_phy),
       .rdlvl_done              (rdlvl_done),
       .rdlvl_err               (rdlvl_err),
       .rdlvl_prech_req         (rdlvl_prech_req),
       .prech_done              (prech_done),
       .rd_data_rise0           (dfi_rddata[DQ_WIDTH-1:0]),
       .rd_data_fall0           (dfi_rddata[2*DQ_WIDTH-1:DQ_WIDTH]),
       .rd_data_rise1           (dfi_rddata[3*DQ_WIDTH-1:2*DQ_WIDTH]),
       .rd_data_fall1           (dfi_rddata[4*DQ_WIDTH-1:3*DQ_WIDTH]),
       .dlyce_cpt               (dlyce_rdlvl_cpt),
       .dlyinc_cpt              (dlyinc_rdlvl_cpt),
       .dlyce_rsync             (dlyce_rdlvl_rsync),
       .dlyinc_rsync            (dlyinc_rdlvl_rsync),
       .dlyval_dq               (dlyval_rdlvl_dq),
       .dlyval_dqs              (dlyval_rdlvl_dqs),
       .rd_bitslip_cnt          (rd_bitslip_cnt),
       .rd_clkdly_cnt           (rd_clkdly_cnt),
       .rd_active_dly           (rd_active_dly),
       .rdlvl_pat_resume        (rdlvl_pat_resume),
       .rdlvl_pat_err           (rdlvl_pat_err),
       .rdlvl_pat_err_cnt       (rdlvl_pat_err_cnt),
       .dbg_cpt_first_edge_cnt  (dbg_cpt_first_edge_cnt),
       .dbg_cpt_second_edge_cnt (dbg_cpt_second_edge_cnt),
       .dbg_rd_bitslip_cnt      (dbg_rd_bitslip_cnt),
       .dbg_rd_clkdly_cnt       (dbg_rd_clkdly_cnt),
       .dbg_rd_active_dly       (dbg_rd_active_dly),
       .dbg_idel_up_all         (dbg_idel_up_all),
       .dbg_idel_down_all       (dbg_idel_down_all),
       .dbg_idel_up_cpt         (dbg_idel_up_cpt),
       .dbg_idel_down_cpt       (dbg_idel_down_cpt),
       .dbg_idel_up_rsync       (dbg_idel_up_rsync),
       .dbg_idel_down_rsync     (dbg_idel_down_rsync),
       .dbg_sel_idel_cpt        (dbg_sel_idel_cpt),
       .dbg_sel_all_idel_cpt    (dbg_sel_all_idel_cpt),
       .dbg_sel_idel_rsync      (dbg_sel_idel_rsync),
       .dbg_sel_all_idel_rsync  (dbg_sel_all_idel_rsync),
       .dbg_phy_rdlvl           (dbg_phy_rdlvl)
       );

  //***************************************************************************
  // Phase Detector: Periodic read-path delay compensation
  //***************************************************************************

  generate
    if (USE_PHASE_DETECT == "ON") begin: gen_enable_pd
      phy_pd_top #
        (
         .TCQ               (TCQ),
         .DQS_CNT_WIDTH     (DQS_CNT_WIDTH),
         .DQS_WIDTH         (DQS_WIDTH),
         .PD_LHC_WIDTH      (PD_LHC_WIDTH),
         .PD_CALIB_MODE     (PD_CALIB_MODE),
         .PD_MSB_SEL        (PD_MSB_SEL),
         .PD_DQS0_ONLY      (PD_DQS0_ONLY),
         .SIM_CAL_OPTION    (SIM_CAL_OPTION),
         .DEBUG_PORT        (DEBUG_PORT)         
         )
        u_phy_pd_top
          (
           .clk                    (clk),
           .rst                    (rst),          
           .pd_cal_start           (pd_cal_start),
           .pd_cal_done            (pd_cal_done),
           .dfi_init_complete      (phy_init_data_sel),
           .read_valid             (dfi_rddata_valid_phy),
           .pd_PSEN                (pd_PSEN),
           .pd_PSINCDEC            (pd_PSINCDEC),
           .dlyval_rdlvl_dqs       (dlyval_rdlvl_dqs),
           .dlyce_pd_cpt           (dlyce_pd_cpt),
           .dlyinc_pd_cpt          (dlyinc_pd_cpt),
           .dlyval_pd_dqs          (dlyval_pd_dqs),
           .rd_dqs_rise0           (dfi_rd_dqs[DQS_WIDTH-1-:DQS_WIDTH]),
           .rd_dqs_fall0           (dfi_rd_dqs[2*DQS_WIDTH-1-:DQS_WIDTH]),
           .rd_dqs_rise1           (dfi_rd_dqs[3*DQS_WIDTH-1-:DQS_WIDTH]),
           .rd_dqs_fall1           (dfi_rd_dqs[4*DQS_WIDTH-1-:DQS_WIDTH]),
           .pd_prech_req           (pd_prech_req),
           .prech_done             (prech_done),
           .dbg_pd_off             (dbg_pd_off),
           .dbg_pd_maintain_off    (dbg_pd_maintain_off),
           .dbg_pd_maintain_0_only (dbg_pd_maintain_0_only),
           .dbg_pd_inc_cpt         (dbg_pd_inc_cpt),
           .dbg_pd_dec_cpt         (dbg_pd_dec_cpt),
           .dbg_pd_inc_dqs         (dbg_pd_inc_dqs),
           .dbg_pd_dec_dqs         (dbg_pd_dec_dqs),
           .dbg_pd_disab_hyst      (dbg_pd_disab_hyst),
           .dbg_pd_disab_hyst_0    (dbg_pd_disab_hyst_0),
           .dbg_pd_msb_sel         (dbg_pd_msb_sel),
           .dbg_pd_byte_sel        (dbg_pd_byte_sel),
           .dbg_inc_rd_fps         (dbg_inc_rd_fps),
           .dbg_dec_rd_fps         (dbg_dec_rd_fps),       
           .dbg_phy_pd             (dbg_phy_pd)
           );
    end else begin: gen_disable_pd_tie_off
      // Otherwise if phase detector is not used, tie off all PD-related
      // control signals
      assign pd_cal_done          = 1'b0;
      assign pd_prech_req         = 1'b0;
      assign dlyce_pd_cpt         = 'b0;
      assign dlyinc_pd_cpt        = 'b0;
      assign dlyval_pd_dqs        = 'b0;
    end
  endgenerate

endmodule
