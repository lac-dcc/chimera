//*****************************************************************************
// (c) Copyright 2008-2009 Xilinx, Inc. All rights reserved.
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
// /___/  \  /    Vendor                : Xilinx
// \   \   \/     Version               : 3.7
//  \   \         Application           : MIG
//  /   /         Filename              : mem_intfc.v
// /___/   /\     Date Last Modified    : $date$
// \   \  /  \    Date Created          : Aug 03 2009
//  \___\/\___\
//
//Device            : Virtex-6
//Design Name       : DDR3 SDRAM
//Purpose           : Top level memory interface block. Instantiates a clock 
//                    and reset generator, the memory controller, the phy and 
//                    the user interface blocks.
//Reference         :
//Revision History  :
//*****************************************************************************

`timescale 1 ps / 1 ps

module mem_intfc #
  (
   parameter TCQ = 100,
   parameter PAYLOAD_WIDTH   = 64,
   parameter ADDR_CMD_MODE   = "UNBUF",
   parameter AL              = "0",     // Additive Latency option
   parameter BANK_WIDTH      = 3,       // # of bank bits
   parameter BM_CNT_WIDTH    = 2,       // Bank machine counter width
   parameter BURST_MODE      = "8",     // Burst length
   parameter BURST_TYPE      = "SEQ",   // Burst type
   parameter CK_WIDTH        = 1,       // # of CK/CK# outputs to memory
   parameter CL              = 5,       
   parameter COL_WIDTH       = 12,      // column address width
   parameter CMD_PIPE_PLUS1  = "ON",    // add pipeline stage between MC and PHY
   parameter CS_WIDTH        = 1,       // # of unique CS outputs
   parameter CKE_WIDTH       = 1,       // # of cke outputs 
   parameter CWL             = 5,
   parameter DATA_WIDTH      = 64,
   parameter DATA_BUF_ADDR_WIDTH = 8,
   parameter DATA_BUF_OFFSET_WIDTH = 1,
//   parameter DELAY_WR_DATA_CNTRL = 0, //This parameter is made as MC local parameter
   parameter DM_WIDTH        = 8,       // # of DM (data mask)
   parameter DQ_CNT_WIDTH    = 6,       // = ceil(log2(DQ_WIDTH))
   parameter DQ_WIDTH        = 64,      // # of DQ (data)
   parameter DQS_CNT_WIDTH   = 3,       // = ceil(log2(DQS_WIDTH))
   parameter DQS_WIDTH       = 8,       // # of DQS (strobe)
   parameter DRAM_TYPE       = "DDR3",
   parameter DRAM_WIDTH      = 8,       // # of DQ per DQS
   parameter ECC             = "OFF",
   parameter ECC_WIDTH       = 8,
   parameter MC_ERR_ADDR_WIDTH = 31,
   parameter nAL             = 0,       // Additive latency (in clk cyc)
   parameter nBANK_MACHS     = 4,
   parameter nCK_PER_CLK     = 2,       // # of memory CKs per fabric CLK
   parameter nCS_PER_RANK    = 1,       // # of unique CS outputs per rank
   parameter ORDERING        = "NORM",
   parameter PHASE_DETECT    = "OFF"  ,  // to phy_top
   parameter IBUF_LPWR_MODE  = "OFF",    // to phy_top
   parameter IODELAY_HP_MODE = "ON",     // to phy_top
   parameter IODELAY_GRP     = "IODELAY_MIG", //to phy_top
   parameter OUTPUT_DRV      = "HIGH" ,  // to phy_top
   parameter REG_CTRL        = "OFF"  ,  // to phy_top
   parameter RTT_NOM         = "60"   ,  // to phy_top
   parameter RTT_WR          = "120"   , // to phy_top
   parameter STARVE_LIMIT    = 2,
   parameter tCK             = 2500,         // pS
   parameter tFAW            = 40000,        // pS
   parameter tPRDI           = 1_000_000,    // pS
   parameter tRAS            = 37500,        // pS
   parameter tRCD            = 12500,        // pS
   parameter tREFI           = 7800000,      // pS
   parameter tRFC            = 110000,       // pS
   parameter tRP             = 12500,        // pS
   parameter tRRD            = 10000,        // pS
   parameter tRTP            = 7500,         // pS
   parameter tWTR            = 7500,         // pS
   parameter tZQI            = 128_000_000,  // nS
   parameter tZQCS           = 64,           // CKs
   parameter WRLVL           = "OFF"  ,  // to phy_top
   parameter DEBUG_PORT      = "OFF"  ,  // to phy_top
   parameter CAL_WIDTH       = "HALF" ,  // to phy_top
   // calibration Address. The address given below will be used for calibration
   // read and write operations. 
   parameter CALIB_ROW_ADD   = 16'h0000,// Calibration row address
   parameter CALIB_COL_ADD   = 12'h000, // Calibration column address
   parameter CALIB_BA_ADD    = 3'h0,    // Calibration bank address 
   parameter RANK_WIDTH      = 1,
   parameter RANKS           = 4,
   parameter ROW_WIDTH       = 16,       // DRAM address bus width
   parameter [7:0] SLOT_0_CONFIG = 8'b0000_0001,
   parameter [7:0] SLOT_1_CONFIG = 8'b0000_0000,
   parameter SIM_BYPASS_INIT_CAL = "OFF",
   parameter REFCLK_FREQ     = 300.0,
   parameter nDQS_COL0       = DQS_WIDTH,
   parameter nDQS_COL1       = 0,
   parameter nDQS_COL2       = 0,
   parameter nDQS_COL3       = 0,
   parameter DQS_LOC_COL0    = 144'h11100F0E0D0C0B0A09080706050403020100,
   parameter DQS_LOC_COL1    = 0,
   parameter DQS_LOC_COL2    = 0,
   parameter DQS_LOC_COL3    = 0,
   parameter USE_DM_PORT     = 1      // DM instantation enable 
  )
  (/*AUTOARG*/
   // Outputs
   wr_data_offset, wr_data_en, wr_data_addr, rd_data_offset, rd_data_en, 
   rd_data_addr, ddr_we_n, ddr_parity, ddr_reset_n, ddr_ras_n, ddr_odt, ddr_dm,
   ddr_cs_n, ddr_cke, ddr_ck, ddr_ck_n, ddr_cas_n, ddr_ba, ddr_addr,  
   bank_mach_next, accept, accept_ns, rd_data, rd_data_end, 
   pd_PSEN, pd_PSINCDEC, dfi_init_complete, 
   ecc_single, ecc_multiple, ecc_err_addr, 
   dbg_wrlvl_start, dbg_wrlvl_done, dbg_wrlvl_err,
   dbg_wl_dqs_inverted, dbg_wr_calib_clk_delay, 
   dbg_wl_odelay_dqs_tap_cnt, dbg_wl_odelay_dq_tap_cnt, 
   dbg_tap_cnt_during_wrlvl, dbg_wl_edge_detect_valid, 
   dbg_rd_data_edge_detect, dbg_rdlvl_start, dbg_rdlvl_done, dbg_rdlvl_err, 
   dbg_cpt_first_edge_cnt, dbg_cpt_second_edge_cnt, dbg_rd_bitslip_cnt, 
   dbg_rd_clkdly_cnt, dbg_rd_active_dly, dbg_rddata, dbg_cpt_tap_cnt,
   dbg_rsync_tap_cnt, dbg_dqs_tap_cnt, dbg_dq_tap_cnt, 
   dbg_phy_pd, dbg_phy_read, dbg_phy_rdlvl, dbg_phy_top,
   // Inouts
   ddr_dq, ddr_dqs, ddr_dqs_n,
   // Inputs
   use_addr, size, rst, row, rank, hi_priority, data_buf_addr, 
   col, cmd, clk_mem, clk, clk_rd_base, bank, wr_data, wr_data_mask, 
   pd_PSDONE, slot_0_present, slot_1_present, correct_en, raw_not_ecc,
   dbg_wr_dqs_tap_set, dbg_wr_dq_tap_set, dbg_wr_tap_set_en, 
   dbg_idel_up_all, dbg_idel_down_all, dbg_idel_up_cpt, dbg_idel_down_cpt, 
   dbg_idel_up_rsync, dbg_idel_down_rsync, 
   dbg_sel_idel_cpt, dbg_sel_all_idel_cpt, 
   dbg_sel_idel_rsync, dbg_sel_all_idel_rsync, 
   dbg_pd_off, dbg_pd_maintain_off, dbg_pd_maintain_0_only,
   dbg_pd_inc_cpt, dbg_pd_dec_cpt, dbg_pd_inc_dqs, dbg_pd_dec_dqs,   
   dbg_pd_disab_hyst, dbg_pd_disab_hyst_0, dbg_pd_msb_sel, dbg_pd_byte_sel,
   dbg_inc_rd_fps, dbg_dec_rd_fps   
   );
   
  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input [BANK_WIDTH-1:0] bank;                   // To mc0 of mc.v
  input                  clk;                    // To mc0 of mc.v, ...
  input                  clk_mem;                // To phy_top0 of phy_top.v
  input                  clk_rd_base;  
  input [2:0]            cmd;                    // To mc0 of mc.v
  input [COL_WIDTH-1:0]  col;                    // To mc0 of mc.v
  input                  correct_en;
  input [DATA_BUF_ADDR_WIDTH-1:0] data_buf_addr; // To mc0 of mc.v
 
  input                           dbg_dec_rd_fps;  
  input                           dbg_idel_down_all;
  input                           dbg_idel_down_cpt;
  input                           dbg_idel_down_rsync;
  input                           dbg_idel_up_all;
  input                           dbg_idel_up_cpt;
  input                           dbg_idel_up_rsync;
  input                           dbg_inc_rd_fps;
  input [DQS_CNT_WIDTH-1:0]       dbg_pd_byte_sel;  
  input                           dbg_pd_dec_cpt;
  input                           dbg_pd_dec_dqs;
  input                           dbg_pd_inc_cpt;
  input                           dbg_pd_inc_dqs;
  input                           dbg_pd_off;
  input                           dbg_pd_maintain_off;
  input                           dbg_pd_maintain_0_only;
  input                           dbg_pd_disab_hyst;
  input                           dbg_pd_disab_hyst_0;
  input [3:0]                     dbg_pd_msb_sel;
  input                           dbg_sel_all_idel_cpt;
  input                           dbg_sel_all_idel_rsync;
  input [DQS_CNT_WIDTH-1:0]       dbg_sel_idel_cpt;
  input [DQS_CNT_WIDTH-1:0]       dbg_sel_idel_rsync;  
  input [5*DQS_WIDTH-1:0]         dbg_wr_dq_tap_set;  
  input [5*DQS_WIDTH-1:0]         dbg_wr_dqs_tap_set;  
  input                           dbg_wr_tap_set_en;
  input                  hi_priority;            // To mc0 of mc.v
  input                  pd_PSDONE;              // To phy_top0 of phy_top.v
  input [RANK_WIDTH-1:0] rank;                   // To mc0 of mc.v
  input [3:0]            raw_not_ecc;
  input [ROW_WIDTH-1:0]  row;                    // To mc0 of mc.v
  input                  rst;                    // To mc0 of mc.v, ...
  input                  size;                   // To mc0 of mc.v
  input [7:0]            slot_0_present;         // To mc0 of mc.v
  input [7:0]            slot_1_present;         // To mc0 of mc.v
  input                  use_addr;               // To mc0 of mc.v
  input [(4*PAYLOAD_WIDTH)-1:0] wr_data;
  input [(4*(DATA_WIDTH/8))-1:0] wr_data_mask;
  // End of automatics

  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output                    accept;             // From mc0 of mc.v
  output                    accept_ns;          // From mc0 of mc.v
  output [BM_CNT_WIDTH-1:0] bank_mach_next;     // From mc0 of mc.v
  output [5*DQS_WIDTH-1:0]  dbg_cpt_first_edge_cnt;
  output [5*DQS_WIDTH-1:0]  dbg_cpt_second_edge_cnt;
  output [5*DQS_WIDTH-1:0]  dbg_cpt_tap_cnt;
  output [5*DQS_WIDTH-1:0]  dbg_dq_tap_cnt;
  output [5*DQS_WIDTH-1:0]  dbg_dqs_tap_cnt;
  output [4:0]              dbg_rd_active_dly;
  output [3*DQS_WIDTH-1:0]  dbg_rd_bitslip_cnt;
  output [2*DQS_WIDTH-1:0]  dbg_rd_clkdly_cnt;
  output [DQS_WIDTH-1:0]    dbg_rd_data_edge_detect;  
  output [4*DQ_WIDTH-1:0]   dbg_rddata;  
  output [1:0]              dbg_rdlvl_done;
  output [1:0]              dbg_rdlvl_err;
  output [1:0]              dbg_rdlvl_start;  
  output [4:0]              dbg_tap_cnt_during_wrlvl;  
  output [DQS_WIDTH-1:0]    dbg_wl_dqs_inverted;
  output                    dbg_wl_edge_detect_valid;  
  output [5*DQS_WIDTH-1:0]  dbg_wl_odelay_dq_tap_cnt;
  output [5*DQS_WIDTH-1:0]  dbg_wl_odelay_dqs_tap_cnt;
  output [2*DQS_WIDTH-1:0]  dbg_wr_calib_clk_delay;  
  output                    dbg_wrlvl_done;  
  output                    dbg_wrlvl_err;
  output                    dbg_wrlvl_start;  
  output [ROW_WIDTH-1:0]    ddr_addr;           // From phy_top0 of phy_top.v
  output [BANK_WIDTH-1:0]   ddr_ba;             // From phy_top0 of phy_top.v
  output                    ddr_cas_n;          // From phy_top0 of phy_top.v
  output [CK_WIDTH-1:0]     ddr_ck_n;           // From phy_top0 of phy_top.v
  output [CK_WIDTH-1:0]     ddr_ck  ;           // From phy_top0 of phy_top.v
  output [CKE_WIDTH-1:0]    ddr_cke;            // From phy_top0 of phy_top.v
  output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_cs_n;  // From phy_top0 of phy_top.v
  output [DM_WIDTH-1:0]     ddr_dm;             // From phy_top0 of phy_top.v
  output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_odt;   // From phy_top0 of phy_top.v
  output                    ddr_ras_n;          // From phy_top0 of phy_top.v
  output                    ddr_reset_n;        // From phy_top0 of phy_top.v
  output                    ddr_parity;
  output                    ddr_we_n;           // From phy_top0 of phy_top.v
  output                    dfi_init_complete;
  output [MC_ERR_ADDR_WIDTH-1:0] ecc_err_addr;
  output [3:0]              ecc_multiple;
  output [3:0]              ecc_single;
  output                    pd_PSEN;            // From phy_top0 of phy_top.v
  output                    pd_PSINCDEC;        // From phy_top0 of phy_top.v
  output [255:0]            dbg_phy_pd;
  output [255:0]            dbg_phy_read;
  output [255:0]            dbg_phy_rdlvl;
  output [255:0]            dbg_phy_top;
  output [(4*PAYLOAD_WIDTH)-1:0]   rd_data;
  output [DATA_BUF_ADDR_WIDTH-1:0] rd_data_addr;// From mc0 of mc.v  
  output                    rd_data_en;         // From mc0 of mc.v
  output                    rd_data_end;        // From mc0 of mc.v
  output [DATA_BUF_OFFSET_WIDTH-1:0] rd_data_offset;// From mc0 of mc.v
  output [19:0]                      dbg_rsync_tap_cnt;  
  output [DATA_BUF_ADDR_WIDTH-1:0] wr_data_addr;// From mc0 of mc.v
  output                    wr_data_en;             // From mc0 of mc.v
  output [DATA_BUF_OFFSET_WIDTH-1:0] wr_data_offset;// From mc0 of mc.v
  // End of automatics

  /*AUTOINOUT*/
  // Beginning of automatic inouts (from unused autoinst inouts)
  inout [DQ_WIDTH-1:0]  ddr_dq;               // To/From phy_top0 of phy_top.v
  inout [DQS_WIDTH-1:0] ddr_dqs_n;            // To/From phy_top0 of phy_top.v
  inout [DQS_WIDTH-1:0] ddr_dqs  ;            // To/From phy_top0 of phy_top.v
  // End of automatics

  localparam nSLOTS  = 1 + (|SLOT_1_CONFIG ? 1 : 0);
  localparam SLOT_0_CONFIG_MC = (nSLOTS == 2)? 8'b0000_0101 : 8'b0000_1111;
  localparam SLOT_1_CONFIG_MC = (nSLOTS == 2)? 8'b0000_1010 : 8'b0000_0000; 

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [ROW_WIDTH-1:0]  dfi_address0;           // From mc0 of mc.v
  wire [ROW_WIDTH-1:0]  dfi_address1;           // From mc0 of mc.v
  wire [BANK_WIDTH-1:0] dfi_bank0;              // From mc0 of mc.v
  wire [BANK_WIDTH-1:0] dfi_bank1;              // From mc0 of mc.v
  wire                  dfi_cas_n0;             // From mc0 of mc.v
  wire                  dfi_cas_n1;             // From mc0 of mc.v
  wire [(CS_WIDTH*nCS_PER_RANK)-1:0] dfi_cs_n0; // From mc0 of mc.v
  wire [(CS_WIDTH*nCS_PER_RANK)-1:0] dfi_cs_n1; // From mc0 of mc.v
  wire [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom0;
  wire [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom1;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_odt0_tmp;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_odt1_tmp;
  wire [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr0;
  wire [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr1;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom0_r;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom0_r1;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom0_r2;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom0_r3;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom1_r;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom1_r1;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom1_r2;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom1_r3;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr0_r;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr0_r1;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr0_r2;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr0_r3;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr1_r;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr1_r1;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr1_r2;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr1_r3;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom0_w;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_nom1_w;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr0_w;
  reg [nSLOTS*nCS_PER_RANK-1:0]   dfi_odt_wr1_w;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] dfi_odt0;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] dfi_odt1;
  wire                  dfi_dram_clk_disable;   // From mc0 of mc.v
  wire                  dfi_ras_n0;             // From mc0 of mc.v
  wire                  dfi_ras_n1;             // From mc0 of mc.v
  wire [DQS_WIDTH-1:0]  dfi_rddata_en;
  wire                  dfi_rddata_valid;       // From phy_top0 of phy_top.v
  wire                  dfi_reset_n;            // From mc0 of mc.v
  wire                  dfi_we_n0;              // From mc0 of mc.v
  wire                  dfi_we_n1;              // From mc0 of mc.v
  wire [DQS_WIDTH-1:0]  dfi_wrdata_en;
  wire [RANK_WIDTH:0]   io_config;              // From mc0 of mc.v
  wire                  io_config_strobe;       // From mc0 of mc.v
  wire [4*DQ_WIDTH-1:0] dfi_rddata;
  wire [4*DQ_WIDTH-1:0] dfi_wrdata;
  wire [4*DQ_WIDTH/8-1:0] dfi_wrdata_mask;

  reg [7:0]               slot_0_present_mc;
  reg [7:0]               slot_1_present_mc; 
   
  // End of automatics

  reg user_periodic_rd_req = 1'b0;
  reg user_ref_req = 1'b0;
  reg user_zq_req = 1'b0;

  // assigning CWL = CL -1 for DDR2. DDR2 customers will not know anything
  // about CWL. There is also nCWL parameter. Need to clean it up.
  localparam CWL_T = (DRAM_TYPE == "DDR3") ? CWL : CL-1;

  // ODT assignment from mc to phy_top based on slot config and slot present
  // Assuming CS_WIDTH equals number of ranks configured
  // For single slot systems slot_1_present input will be ignored
  // Assuming component interfaces to be single slot system
  assign dfi_odt0 = dfi_odt0_tmp;
  assign dfi_odt1 = dfi_odt1_tmp;


  // staging the odt from phy for delaying it based on CWL.

   always @(posedge clk)begin
     dfi_odt_nom0_r  <= #TCQ dfi_odt_nom0;
     dfi_odt_nom0_r1 <= #TCQ dfi_odt_nom0_r;
     dfi_odt_nom0_r2 <= #TCQ dfi_odt_nom0_r1;
     dfi_odt_nom0_r3 <= #TCQ dfi_odt_nom0_r2;
     dfi_odt_nom1_r  <= #TCQ dfi_odt_nom1;
     dfi_odt_nom1_r1 <= #TCQ dfi_odt_nom1_r;
     dfi_odt_nom1_r2 <= #TCQ dfi_odt_nom1_r1;
     dfi_odt_nom1_r3 <= #TCQ dfi_odt_nom1_r2;

     dfi_odt_wr0_r   <= #TCQ dfi_odt_wr0;
     dfi_odt_wr0_r1  <= #TCQ dfi_odt_wr0_r;
     dfi_odt_wr0_r2  <= #TCQ dfi_odt_wr0_r1;
     dfi_odt_wr0_r3  <= #TCQ dfi_odt_wr0_r2;
     dfi_odt_wr1_r   <= #TCQ dfi_odt_wr1;
     dfi_odt_wr1_r1  <= #TCQ dfi_odt_wr1_r;
     dfi_odt_wr1_r2  <= #TCQ dfi_odt_wr1_r1;
     dfi_odt_wr1_r3  <= #TCQ dfi_odt_wr1_r2;
   end // always @ (posedge clk)

   generate
     if(CWL >= 7)begin
       always @(posedge clk) begin 
         dfi_odt_nom0_w  = dfi_odt_nom0;
         dfi_odt_nom1_w  = dfi_odt_nom1;
         dfi_odt_wr0_w   = dfi_odt_wr0;
         dfi_odt_wr1_w   = dfi_odt_wr1;
       end
     end else begin
       always@(*) begin
         dfi_odt_nom0_w  = dfi_odt_nom0;
         dfi_odt_nom1_w  = dfi_odt_nom1;
         dfi_odt_wr0_w   = dfi_odt_wr0;
         dfi_odt_wr1_w   = dfi_odt_wr1;
       end
     end   
   endgenerate 

  
  generate
    if (nSLOTS == 1) begin: gen_single_slot_odt
      always @ (slot_0_present[0] or slot_0_present[1]
                or slot_0_present[2] or slot_0_present[3]
                or dfi_odt_nom0_w or dfi_odt_nom1_w
                or dfi_odt_wr0_w or dfi_odt_wr1_w) begin
        slot_0_present_mc = slot_0_present;
        slot_1_present_mc = slot_1_present;
        dfi_odt0_tmp = {CS_WIDTH*nCS_PER_RANK{1'b0}};
        dfi_odt1_tmp = {CS_WIDTH*nCS_PER_RANK{1'b0}};
        dfi_odt0_tmp[nCS_PER_RANK-1:0] = dfi_odt_wr0_w[nCS_PER_RANK-1:0]
                                      | dfi_odt_nom0_w[nCS_PER_RANK-1:0];
        dfi_odt1_tmp[nCS_PER_RANK-1:0]=  dfi_odt_wr1_w[nCS_PER_RANK-1:0]
                                      | dfi_odt_nom1_w[nCS_PER_RANK-1:0];
      end
    end else if (nSLOTS == 2) begin: gen_dual_slot_odt
        //ODT assignment fixed for nCS_PER_RANK =1. Need to change for others 
        always @ (slot_0_present[0] or slot_0_present[1]
                or slot_1_present[0] or slot_1_present[1]
                or dfi_odt_nom0_w or dfi_odt_nom1_w
                or dfi_odt_wr0_w or dfi_odt_wr1_w) begin
         
        dfi_odt0_tmp = {CS_WIDTH*nCS_PER_RANK{1'b0}};
        dfi_odt1_tmp = {CS_WIDTH*nCS_PER_RANK{1'b0}};
        case ({slot_0_present[0],slot_0_present[1],  
               slot_1_present[0],slot_1_present[1]}) 
          //Two slot configuration, one slot present, single rank
          4'b1000: begin
            dfi_odt0_tmp[0] = dfi_odt_nom0_w[0];
            dfi_odt1_tmp[0] = dfi_odt_nom1_w[0];
             slot_0_present_mc = 8'b0000_0001;       
             slot_1_present_mc = 8'b0000_0000; 
          end
          4'b0010: begin
            dfi_odt0_tmp[0] = dfi_odt_nom0_w[1];
            dfi_odt1_tmp[0] = dfi_odt_nom1_w[1];
            slot_0_present_mc = 8'b0000_0000;        
            slot_1_present_mc = 8'b0000_0010;
          end
          // Two slot configuration, one slot present, dual rank
          4'b1100: begin
            dfi_odt0_tmp[0] = dfi_odt_wr0_w[0];
            dfi_odt0_tmp[1] = dfi_odt_nom0_w[0];
            dfi_odt1_tmp[0] = dfi_odt_wr1_w[0];
            dfi_odt1_tmp[1] = dfi_odt_nom1_w[0];
            slot_0_present_mc = 8'b0000_0101;        
            slot_1_present_mc = 8'b0000_0000;
          end
          4'b0011: begin
            dfi_odt0_tmp[1] = dfi_odt_nom0_w[1];
            dfi_odt0_tmp[0] = dfi_odt_wr0_w[1];
            dfi_odt1_tmp[1] = dfi_odt_nom1_w[1];
            dfi_odt1_tmp[0] = dfi_odt_wr1_w[1];
            slot_0_present_mc = 8'b0000_0000;        
            slot_1_present_mc = 8'b0000_1010;
          end
          // Two slot configuration, one rank per slot
          4'b1010: begin
            dfi_odt0_tmp[1:0] = {dfi_odt_nom0_w[1], dfi_odt_nom0_w[0]};
            dfi_odt1_tmp[1:0] = {dfi_odt_nom1_w[1], dfi_odt_nom1_w[0]};
            slot_0_present_mc = 8'b0000_0001;        
            slot_1_present_mc = 8'b0000_0010;
          end
          // Two Slots - One slot with dual rank and the other with single rank
          4'b1011: begin
            dfi_odt0_tmp[1:0] = {dfi_odt_wr0_w[1], dfi_odt_nom0_w[0]};
            dfi_odt0_tmp[2] = dfi_odt_nom0_w[1];
            dfi_odt1_tmp[1:0] = {dfi_odt_wr1_w[1], dfi_odt_nom1_w[0]};
            dfi_odt1_tmp[2] = dfi_odt_nom1_w[1];
            slot_0_present_mc = 8'b0000_0001;        
            slot_1_present_mc = 8'b0000_1010;
          end
          4'b1110: begin
            dfi_odt0_tmp[2:0] = {dfi_odt_nom0_w[1], dfi_odt_nom0_w[0],  
                                 dfi_odt_wr0_w[0]};
            dfi_odt1_tmp[2:0] = { dfi_odt_nom1_w[1], dfi_odt_nom1_w[0], 
                                 dfi_odt_wr1_w[0]};
            slot_0_present_mc = 8'b0000_0101;        
            slot_1_present_mc = 8'b0000_0010;
          end
          // Two Slots - two ranks per slot
          4'b1111: begin
            dfi_odt0_tmp = {dfi_odt_nom0_w[1], dfi_odt_wr0_w[1],  
                            dfi_odt_nom0_w[0], dfi_odt_wr0_w[0]};
            dfi_odt1_tmp = {dfi_odt_nom1_w[1], dfi_odt_wr1_w[1],
                            dfi_odt_nom1_w[0], dfi_odt_wr1_w[0]};
            slot_0_present_mc = 8'b0000_0101;        
            slot_1_present_mc = 8'b0000_1010;
          end
        endcase
      end
    end
  endgenerate

  mc #
   (/*AUTOINSTPARAM_disabled*/
    // Parameters
    .TCQ(TCQ),
    .PAYLOAD_WIDTH                      (PAYLOAD_WIDTH),
    .MC_ERR_ADDR_WIDTH                  (MC_ERR_ADDR_WIDTH),
    .ADDR_CMD_MODE                      (ADDR_CMD_MODE),
    .BANK_WIDTH                         (BANK_WIDTH),
    .BM_CNT_WIDTH                       (BM_CNT_WIDTH),
    .BURST_MODE                         (BURST_MODE),
    .COL_WIDTH                          (COL_WIDTH),
    .CMD_PIPE_PLUS1                     (CMD_PIPE_PLUS1),
    .CS_WIDTH                           (CS_WIDTH),
    .DATA_WIDTH                         (DATA_WIDTH),
    .DATA_BUF_ADDR_WIDTH                (DATA_BUF_ADDR_WIDTH),
    .DATA_BUF_OFFSET_WIDTH              (DATA_BUF_OFFSET_WIDTH),
    //.DELAY_WR_DATA_CNTRL                (DELAY_WR_DATA_CNTRL),
    .DRAM_TYPE                          (DRAM_TYPE),
    .DQS_WIDTH                          (DQS_WIDTH),
    .DQ_WIDTH                           (DQ_WIDTH),
    .ECC                                (ECC),
    .ECC_WIDTH                          (ECC_WIDTH),
    .nBANK_MACHS                        (nBANK_MACHS),
    .nCK_PER_CLK                        (nCK_PER_CLK),
    .nSLOTS                             (nSLOTS),
    .CL                                 (CL),
    .nCS_PER_RANK                       (nCS_PER_RANK),
    .CWL                                (CWL_T),
    .ORDERING                           (ORDERING),
    .RANK_WIDTH                         (RANK_WIDTH),
    .RANKS                              (RANKS),
    .PHASE_DETECT                       (PHASE_DETECT), //to controll periodic reads
    .ROW_WIDTH                          (ROW_WIDTH),
    .RTT_NOM                            (RTT_NOM),
    .RTT_WR                             (RTT_WR),
    .STARVE_LIMIT                       (STARVE_LIMIT),
    .SLOT_0_CONFIG                      (SLOT_0_CONFIG_MC),
    .SLOT_1_CONFIG                      (SLOT_1_CONFIG_MC),
    .tCK                                (tCK),
    .tFAW                               (tFAW),
    .tPRDI                              (tPRDI),
    .tRAS                               (tRAS),
    .tRCD                               (tRCD),
    .tREFI                              (tREFI),
    .tRFC                               (tRFC),
    .tRP                                (tRP),
    .tRRD                               (tRRD),
    .tRTP                               (tRTP),
    .tWTR                               (tWTR),
    .tZQI                               (tZQI),
    .tZQCS                              (tZQCS))
   mc0
     (.app_periodic_rd_req  (1'b0),
      .app_ref_req          (1'b0),
      .app_zq_req           (1'b0),
      .dfi_rddata_en        (dfi_rddata_en[DQS_WIDTH-1:0]),
      .dfi_wrdata_en        (dfi_wrdata_en[DQS_WIDTH-1:0]),
      .dfi_odt_nom0         (dfi_odt_nom0),
      .dfi_odt_wr0          (dfi_odt_wr0),
      .dfi_odt_nom1         (dfi_odt_nom1),
      .dfi_odt_wr1          (dfi_odt_wr1),
      .ecc_single           (ecc_single),
      .ecc_multiple         (ecc_multiple),
      .ecc_err_addr         (ecc_err_addr),
      /*AUTOINST*/
      // Outputs
      .accept               (accept),
      .accept_ns            (accept_ns),
      .bank_mach_next       (bank_mach_next[BM_CNT_WIDTH-1:0]),
      .dfi_address0         (dfi_address0[ROW_WIDTH-1:0]),
      .dfi_address1         (dfi_address1[ROW_WIDTH-1:0]),
      .dfi_bank0            (dfi_bank0[BANK_WIDTH-1:0]),
      .dfi_bank1            (dfi_bank1[BANK_WIDTH-1:0]),
      .dfi_cas_n0           (dfi_cas_n0),
      .dfi_cas_n1           (dfi_cas_n1),
      .dfi_cs_n0            (dfi_cs_n0[(CS_WIDTH*nCS_PER_RANK)-1:0]),
      .dfi_cs_n1            (dfi_cs_n1[(CS_WIDTH*nCS_PER_RANK)-1:0]),
      .dfi_ras_n0           (dfi_ras_n0),
      .dfi_ras_n1           (dfi_ras_n1),
      .dfi_we_n0            (dfi_we_n0),
      .dfi_we_n1            (dfi_we_n1),
      .io_config            (io_config[RANK_WIDTH:0]),
      .io_config_strobe     (io_config_strobe),
      .rd_data_addr         (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
      .rd_data_en           (rd_data_en),
      .rd_data_end          (rd_data_end),
      .rd_data_offset       (rd_data_offset[DATA_BUF_OFFSET_WIDTH-1:0]),
      .wr_data_addr         (wr_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
      .wr_data_en           (wr_data_en),
      .wr_data_offset       (wr_data_offset[DATA_BUF_OFFSET_WIDTH-1:0]),
      .dfi_dram_clk_disable (dfi_dram_clk_disable),
      .dfi_reset_n          (dfi_reset_n),
      .dfi_rddata           (dfi_rddata[4*DQ_WIDTH-1:0]),
      .dfi_wrdata           (dfi_wrdata[4*DQ_WIDTH-1:0]),
      .dfi_wrdata_mask      (dfi_wrdata_mask[4*DQ_WIDTH/8-1:0]),
      .rd_data              (rd_data[4*PAYLOAD_WIDTH-1:0]),
      .wr_data              (wr_data[4*PAYLOAD_WIDTH-1:0]),
      .wr_data_mask         (wr_data_mask[4*DATA_WIDTH/8-1:0]),
      // Inputs
      .correct_en           (correct_en),
      .bank                 (bank[BANK_WIDTH-1:0]),
      .clk                  (clk),
      .cmd                  (cmd[2:0]),
      .col                  (col[COL_WIDTH-1:0]),
      .data_buf_addr        (data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
      .dfi_init_complete    (dfi_init_complete),
      .dfi_rddata_valid     (dfi_rddata_valid),
      .hi_priority          (hi_priority),
      .rank                 (rank[RANK_WIDTH-1:0]),
      .raw_not_ecc          (raw_not_ecc[3:0]),
      .row                  (row[ROW_WIDTH-1:0]),
      .rst                  (rst),
      .size                 (size),
      .slot_0_present       (slot_0_present_mc[7:0]),
      .slot_1_present       (slot_1_present_mc[7:0]),
      .use_addr             (use_addr));

  // following calculations should be moved inside PHY
  // odt bus should  be added to PHY.
  localparam CLK_PERIOD = tCK * nCK_PER_CLK;
  localparam nCL  = CL;
  localparam nCWL = CWL_T;
`ifdef MC_SVA
  ddr2_improper_CL: assert property
     (@(posedge clk) (~((DRAM_TYPE == "DDR2") && ((CL > 6) || (CL < 3)))));
  // Not needed after the CWL fix for DDR2
  //  ddr2_improper_CWL: assert property
  //     (@(posedge clk) (~((DRAM_TYPE == "DDR2") && ((CL - CWL) != 1))));
`endif

  phy_top #
    (
     .TCQ                               (TCQ),
     .REFCLK_FREQ                       (REFCLK_FREQ),
     .nCS_PER_RANK                      (nCS_PER_RANK),
     .CAL_WIDTH                         (CAL_WIDTH),
     .CALIB_ROW_ADD                     (CALIB_ROW_ADD),
     .CALIB_COL_ADD                     (CALIB_COL_ADD),
     .CALIB_BA_ADD                      (CALIB_BA_ADD),
     .CS_WIDTH                          (CS_WIDTH),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .CKE_WIDTH                         (CKE_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .SLOT_0_CONFIG                     (SLOT_0_CONFIG),
     .SLOT_1_CONFIG                     (SLOT_1_CONFIG),
     .CLK_PERIOD                        (CLK_PERIOD),
     .BANK_WIDTH                        (BANK_WIDTH),
     .CK_WIDTH                          (CK_WIDTH),
     .COL_WIDTH                         (COL_WIDTH),
     .DM_WIDTH                          (DM_WIDTH),
     .DQ_CNT_WIDTH                      (DQ_CNT_WIDTH),
     .DQ_WIDTH                          (DQ_WIDTH),
     .DQS_CNT_WIDTH                     (DQS_CNT_WIDTH),
     .DQS_WIDTH                         (DQS_WIDTH),
     .DRAM_WIDTH                        (DRAM_WIDTH),
     .ROW_WIDTH                         (ROW_WIDTH),
     .RANK_WIDTH                        (RANK_WIDTH),
     .AL                                (AL),
     .BURST_MODE                        (BURST_MODE),
     .BURST_TYPE                        (BURST_TYPE),
     .nAL                               (nAL),
     .nCL                               (nCL),
     .nCWL                              (nCWL),
     .tRFC                              (tRFC),
     .OUTPUT_DRV                        (OUTPUT_DRV),
     .REG_CTRL                          (REG_CTRL),
     .RTT_NOM                           (RTT_NOM),
     .RTT_WR                            (RTT_WR),
     .WRLVL                             (WRLVL),
     .PHASE_DETECT                      (PHASE_DETECT),
     .IODELAY_HP_MODE                   (IODELAY_HP_MODE),
     .IODELAY_GRP                       (IODELAY_GRP),
     // Prevent the following simulation-related parameters from
     // being overridden for synthesis - for synthesis only the
     // default values of these parameters should be used
     // synthesis translate_off
     .SIM_BYPASS_INIT_CAL               (SIM_BYPASS_INIT_CAL),
     // synthesis translate_on
     .nDQS_COL0                         (nDQS_COL0),
     .nDQS_COL1                         (nDQS_COL1),
     .nDQS_COL2                         (nDQS_COL2),
     .nDQS_COL3                         (nDQS_COL3),
     .DQS_LOC_COL0                      (DQS_LOC_COL0),
     .DQS_LOC_COL1                      (DQS_LOC_COL1),
     .DQS_LOC_COL2                      (DQS_LOC_COL2),
     .DQS_LOC_COL3                      (DQS_LOC_COL3),
     .USE_DM_PORT                       (USE_DM_PORT),
     .DEBUG_PORT                        (DEBUG_PORT)
     )
    phy_top0
      (
       /*AUTOINST*/
       // Outputs
       .dfi_rddata                (dfi_rddata),
       .dfi_rddata_valid          (dfi_rddata_valid),
       .dfi_init_complete         (dfi_init_complete),
       .ddr_ck_p                  (ddr_ck),
       .ddr_ck_n                  (ddr_ck_n),
       .ddr_addr                  (ddr_addr),
       .ddr_ba                    (ddr_ba),
       .ddr_ras_n                 (ddr_ras_n),
       .ddr_cas_n                 (ddr_cas_n),
       .ddr_we_n                  (ddr_we_n),
       .ddr_cs_n                  (ddr_cs_n),
       .ddr_cke                   (ddr_cke),
       .ddr_odt                   (ddr_odt),
       .ddr_reset_n               (ddr_reset_n),
       .ddr_parity                (ddr_parity),
       .ddr_dm                    (ddr_dm),
       .pd_PSEN                   (pd_PSEN),
       .pd_PSINCDEC               (pd_PSINCDEC),
       .dbg_wrlvl_start           (dbg_wrlvl_start),
       .dbg_wrlvl_done            (dbg_wrlvl_done),
       .dbg_wrlvl_err             (dbg_wrlvl_err),       
       .dbg_wl_dqs_inverted       (dbg_wl_dqs_inverted),
       .dbg_wr_calib_clk_delay    (dbg_wr_calib_clk_delay),
       .dbg_wl_odelay_dqs_tap_cnt (dbg_wl_odelay_dqs_tap_cnt),
       .dbg_wl_odelay_dq_tap_cnt  (dbg_wl_odelay_dq_tap_cnt),
       .dbg_tap_cnt_during_wrlvl  (dbg_tap_cnt_during_wrlvl),
       .dbg_wl_edge_detect_valid  (dbg_wl_edge_detect_valid),
       .dbg_rd_data_edge_detect   (dbg_rd_data_edge_detect),
       .dbg_rdlvl_start           (dbg_rdlvl_start),
       .dbg_rdlvl_done            (dbg_rdlvl_done),
       .dbg_rdlvl_err             (dbg_rdlvl_err),
       .dbg_cpt_first_edge_cnt    (dbg_cpt_first_edge_cnt),
       .dbg_cpt_second_edge_cnt   (dbg_cpt_second_edge_cnt),
       .dbg_rd_bitslip_cnt        (dbg_rd_bitslip_cnt),
       .dbg_rd_clkdly_cnt         (dbg_rd_clkdly_cnt),
       .dbg_rd_active_dly         (dbg_rd_active_dly),
       .dbg_rd_data               (dbg_rddata),
       .dbg_cpt_tap_cnt           (dbg_cpt_tap_cnt),
       .dbg_rsync_tap_cnt         (dbg_rsync_tap_cnt),
       .dbg_dqs_tap_cnt           (dbg_dqs_tap_cnt),
       .dbg_dq_tap_cnt            (dbg_dq_tap_cnt),
       .dbg_phy_pd                (dbg_phy_pd),
       .dbg_phy_read              (dbg_phy_read),
       .dbg_phy_rdlvl             (dbg_phy_rdlvl),       
       .dbg_phy_top               (dbg_phy_top),       
       // Inouts
       .ddr_dqs_p                 (ddr_dqs),
       .ddr_dqs_n                 (ddr_dqs_n),
       .ddr_dq                    (ddr_dq),
        // Inputs
       .clk_mem                   (clk_mem),
       .clk                       (clk),
       .clk_rd_base               (clk_rd_base),
       .rst                       (rst),
       .slot_0_present            (slot_0_present),
       .slot_1_present            (slot_1_present),
       .dfi_address0              (dfi_address0),
       .dfi_address1              (dfi_address1),
       .dfi_bank0                 (dfi_bank0),
       .dfi_bank1                 (dfi_bank1),
       .dfi_cas_n0                (dfi_cas_n0),
       .dfi_cas_n1                (dfi_cas_n1),
       .dfi_cke0                  ({CKE_WIDTH{1'b1}}),
       .dfi_cke1                  ({CKE_WIDTH{1'b1}}),
       .dfi_cs_n0                 (dfi_cs_n0),
       .dfi_cs_n1                 (dfi_cs_n1),
       .dfi_odt0                  (dfi_odt0),
       .dfi_odt1                  (dfi_odt1),
       .dfi_ras_n0                (dfi_ras_n0),
       .dfi_ras_n1                (dfi_ras_n1),
       .dfi_reset_n               (dfi_reset_n),
       .dfi_we_n0                 (dfi_we_n0),
       .dfi_we_n1                 (dfi_we_n1),
       .dfi_wrdata_en             (dfi_wrdata_en[0]),
       .dfi_wrdata                (dfi_wrdata),
       .dfi_wrdata_mask           (dfi_wrdata_mask),
       .dfi_rddata_en             (dfi_rddata_en[0]),
       .dfi_dram_clk_disable      (dfi_dram_clk_disable),
       .io_config_strobe          (io_config_strobe),
       .io_config                 (io_config),
       .pd_PSDONE                 (pd_PSDONE),
       .dbg_wr_dqs_tap_set        (dbg_wr_dqs_tap_set),
       .dbg_wr_dq_tap_set         (dbg_wr_dq_tap_set),
       .dbg_wr_tap_set_en         (dbg_wr_tap_set_en),         
       .dbg_idel_up_all           (dbg_idel_up_all),       
       .dbg_idel_down_all         (dbg_idel_down_all),
       .dbg_idel_up_cpt           (dbg_idel_up_cpt),
       .dbg_idel_down_cpt         (dbg_idel_down_cpt),
       .dbg_idel_up_rsync         (dbg_idel_up_rsync),
       .dbg_idel_down_rsync       (dbg_idel_down_rsync),
       .dbg_sel_idel_cpt          (dbg_sel_idel_cpt),
       .dbg_sel_all_idel_cpt      (dbg_sel_all_idel_cpt),
       .dbg_sel_idel_rsync        (dbg_sel_idel_rsync),
       .dbg_sel_all_idel_rsync    (dbg_sel_all_idel_rsync),
       .dbg_pd_off                (dbg_pd_off),
       .dbg_pd_maintain_off       (dbg_pd_maintain_off),
       .dbg_pd_maintain_0_only    (dbg_pd_maintain_0_only),
       .dbg_pd_inc_cpt            (dbg_pd_inc_cpt),
       .dbg_pd_dec_cpt            (dbg_pd_dec_cpt),
       .dbg_pd_inc_dqs            (dbg_pd_inc_dqs),
       .dbg_pd_dec_dqs            (dbg_pd_dec_dqs), 
       .dbg_pd_disab_hyst         (dbg_pd_disab_hyst),
       .dbg_pd_disab_hyst_0       (dbg_pd_disab_hyst_0),
       .dbg_pd_msb_sel            (dbg_pd_msb_sel),
       .dbg_pd_byte_sel           (dbg_pd_byte_sel),
       .dbg_inc_rd_fps            (dbg_inc_rd_fps),
       .dbg_dec_rd_fps            (dbg_dec_rd_fps)
       );

endmodule // mem_intfc

// Local Variables:
// verilog-library-directories:("." "../phy" "../controller")
// End:
