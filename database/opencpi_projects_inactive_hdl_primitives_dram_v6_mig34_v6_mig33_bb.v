// v6_mig33.v

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
(* box_type="user_black_box" *)
module v6_mig33 #
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
   input [ADDR_WIDTH-1:0]               tg_addr,
   input [2:0]                          app_cmd,
   input                                app_en,
   output                               app_full,
   output                               app_wdf_full,
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
endmodule
