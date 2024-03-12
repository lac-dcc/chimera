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
//  /   /         Filename              : bank_state.v
// /___/   /\     Date Last Modified    : $date$
// \   \  /  \    Date Created          : Tue Jun 30 2009
//  \___\/\___\
//
//Device            : Virtex-6
//Design Name       : DDR3 SDRAM
//Purpose           :
//Reference         :
//Revision History  :
//*****************************************************************************


// Primary bank state machine.  All bank specific timing is generated here.
//
// Conceptually, when a bank machine is assigned a request, conflicts are
// checked.  If there is a conflict, then the new request is added
// to the queue for that rank-bank.
//
// Eventually, that request will find itself at the head of the queue for
// its rank-bank.  Forthwith, the bank machine will begin arbitration to send an
// activate command to the DRAM.  Once arbitration is successful and the
// activate is sent, the row state machine waits the RCD delay.  The RAS
// counter is also started when the activate is sent.
//
// Upon completion of the RCD delay, the bank state machine will begin
// arbitration for sending out the column command.  Once the column
// command has been sent, the bank state machine waits the RTP latency, and
// if the command is a write, the RAS counter is loaded with the WR latency.
//
// When the RTP counter reaches zero, the pre charge wait state is entered.
// Once the RAS timer reaches zero, arbitration to send a precharge command
// begins.
//
// Upon successful transmission of the precharge command, the bank state
// machine waits the precharge period and then rejoins the idle list.
//
// For an open rank-bank hit, a bank machine passes management of the rank-bank to
// a bank machine that is managing the subsequent request to the same page.  A bank
// machine can either be a "passer" or a "passee" in this handoff.  There
// are two conditions that have to occur before an open bank can be passed.
// A spatial condition, ie same rank-bank and row address.  And a temporal condition,
// ie the passee has completed it work with the bank, but has not issued a precharge.
//
// The spatial condition is signalled by pass_open_bank_ns.  The temporal condition
// is when the column command is issued, or when the bank_wait_in_progress
// signal is true.  Bank_wait_in_progress is true when the RTP timer is not
// zero, or when the RAS/WR timer is not zero and the state machine is waiting
// to send out a precharge command.
//
// On an open bank pass, the passer transitions from the temporal condition
// noted above and performs the end of request processing and eventually lands
// in the act_wait_r state.
//
// On an open bank pass, the passee lands in the col_wait_r state and waits
// for its chance to send out a column command.
//
// Since there is a single data bus shared by all columns in all ranks, there
// is a single column machine.  The column machine is primarily in charge of
// managing the timing on the DQ data bus.  It reserves states for data transfer,
// driver turnaround states, and preambles.  It also has the ability to add
// additional programmable delay for read to write changeovers.  This read to write
// delay is generated in the column machine which inhibits writes via the
// inhbt_wr_r signal.
//
// There is a rank machine for every rank.  The rank machines are responsible
// for enforcing rank specific timing such as FAW, and WTR.  RRD is guaranteed
// in the bank machine since it is closely coupled to the operation of the
// bank machine and is timing critical.
//
// Since a bank machine can be working on a request for any rank, all rank machines
// inhibits are input to all bank machines.  Based on the rank of the current
// request, each bank machine selects the rank information corresponding
// to the rank of its current request.
//
// Since driver turnaround states and WTR delays are so severe with DDRIII, the
// memory interface has the ability to promote requests that use the same
// driver as the most recent request.  There is logic in this block that
// detects when the driver for its request is the same as the driver for
// the most recent request.  In such a case, this block will send out special
// "same" request early enough to eliminate dead states when there is no
// driver changeover.


`timescale 1ps/1ps
`define BM_SHARED_BV (ID+nBANK_MACHS-1):(ID+1)

module bank_state #
  (
   parameter TCQ = 100,
   parameter ADDR_CMD_MODE            = "UNBUF",
   parameter BM_CNT_WIDTH             = 2,
   parameter BURST_MODE               = "8",
   parameter CWL                      = 5,
   parameter DATA_BUF_ADDR_WIDTH      = 8,
   parameter DRAM_TYPE                = "DDR3",
   parameter ECC                      = "OFF",
   parameter ID                       = 0,
   parameter nBANK_MACHS              = 4,
   parameter nCK_PER_CLK              = 2,
   parameter nCNFG2RD_EN              = 2,
   parameter nCNFG2WR                 = 2,
   parameter nOP_WAIT                 = 0,
   parameter nRAS_CLKS                = 10,
   parameter nRP                      = 10,
   parameter nRTP                     = 4,
   parameter nRCD                     = 5,
   parameter nWTP_CLKS                = 5,
   parameter ORDERING                 = "NORM",
   parameter RANKS                    = 4,
   parameter RANK_WIDTH               = 4,
   parameter RAS_TIMER_WIDTH          = 5,
   parameter STARVE_LIMIT             = 2
  )
  (/*AUTOARG*/
  // Outputs
  start_rcd, act_wait_r, rd_half_rmw, ras_timer_ns, end_rtp,
  bank_wait_in_progress, start_pre_wait, op_exit_req, pre_wait_r,
  allow_auto_pre, precharge_bm_end, demand_act_priority, rts_row,
  act_this_rank_r, demand_priority, rtc, col_rdy_wr, rts_col,
  wr_this_rank_r, rd_this_rank_r,
  // Inputs
  clk, rst, bm_end, pass_open_bank_r, sending_row, rcv_open_bank,
  sending_col, rd_wr_r, req_wr_r, rd_data_addr, req_data_buf_addr_r,
  dfi_rddata_valid, rd_rmw, ras_timer_ns_in, rb_hit_busies_r, idle_r,
  passing_open_bank, low_idle_cnt_r, op_exit_grant, tail_r,
  auto_pre_r, pass_open_bank_ns, req_rank_r, req_rank_r_in,
  start_rcd_in, inhbt_act_faw_r, wait_for_maint_r, head_r, sent_row,
  demand_act_priority_in, order_q_zero, sent_col, q_has_rd,
  q_has_priority, req_priority_r, idle_ns, demand_priority_in,
  io_config_strobe, io_config_valid_r, io_config, wtr_inhbt_config_r,
  inhbt_rd_config, inhbt_wr_config, inhbt_rd_r, dq_busy_data
  );

  function integer clogb2 (input integer size); // ceiling logb2
    begin
      size = size - 1;
      for (clogb2=1; size>1; clogb2=clogb2+1)
            size = size >> 1;
    end
  endfunction // clogb2

  input clk;
  input rst;

// Activate wait state machine.
  input bm_end;
  reg bm_end_r1;
  always @(posedge clk) bm_end_r1 <= #TCQ bm_end;

  reg col_wait_r;

  input pass_open_bank_r;
  input sending_row;
  reg act_wait_r_lcl;
  input rcv_open_bank;
  wire start_rcd_lcl = act_wait_r_lcl && sending_row;
  output wire start_rcd;
  assign start_rcd = start_rcd_lcl;
  wire act_wait_ns = rst ||
                     ((act_wait_r_lcl && ~start_rcd_lcl && ~rcv_open_bank) ||
                      bm_end_r1 || (pass_open_bank_r && bm_end));
  always @(posedge clk) act_wait_r_lcl <= #TCQ act_wait_ns;
  output wire act_wait_r;
  assign act_wait_r = act_wait_r_lcl;

// RCD timer
// For nCK_PER_CLK == 2, since column commands are delayed one
// state relative to row commands, we don't need to add the remainder.
// Unless 2T mode, in which case we're not offset and the remainder
// must be added.
  localparam nRCD_CLKS = (nCK_PER_CLK == 1)
                           ? nRCD
                           : ((nRCD/2) + ((ADDR_CMD_MODE == "2T")
                                            ? nRCD%2
                                            : 0));
  localparam nRCD_CLKS_M2 = (nRCD_CLKS-2 <0) ? 0 : nRCD_CLKS-2;
  localparam RCD_TIMER_WIDTH = clogb2(nRCD_CLKS_M2+1);
  localparam ZERO = 0;
  localparam ONE = 1;
  reg [RCD_TIMER_WIDTH-1:0] rcd_timer_r = {RCD_TIMER_WIDTH{1'b0}};
  reg end_rcd;
  reg rcd_active_r = 1'b0;
// Generated so that the config can be started during the RCD, if
// possible.
  reg allow_early_rd_config;
  reg allow_early_wr_config;

  generate
    if (nRCD_CLKS <= 1) begin : rcd_timer_1
      always @(/*AS*/start_rcd_lcl) end_rcd = start_rcd_lcl;
      always @(/*AS*/end_rcd) allow_early_rd_config = end_rcd;
      always @(/*AS*/end_rcd) allow_early_wr_config = end_rcd;
    end
    else if (nRCD_CLKS == 2) begin : rcd_timer_2
      always @(/*AS*/start_rcd_lcl) end_rcd = start_rcd_lcl;
      if (nCNFG2RD_EN > 0) always @(/*AS*/end_rcd) allow_early_rd_config =
                                                                 end_rcd;
      if (nCNFG2WR > 0) always @(/*AS*/end_rcd) allow_early_wr_config =
                                                                 end_rcd;
    end
    else if (nRCD_CLKS > 2) begin : rcd_timer_gt_2
      reg [RCD_TIMER_WIDTH-1:0] rcd_timer_ns;
      always @(/*AS*/rcd_timer_r or rst or start_rcd_lcl) begin
        if (rst) rcd_timer_ns = ZERO[RCD_TIMER_WIDTH-1:0];
        else begin
          rcd_timer_ns = rcd_timer_r;
          if (start_rcd_lcl) rcd_timer_ns = nRCD_CLKS_M2[RCD_TIMER_WIDTH-1:0];
          else if (|rcd_timer_r) rcd_timer_ns =
                                   rcd_timer_r - ONE[RCD_TIMER_WIDTH-1:0];
        end
      end
      always @(posedge clk) rcd_timer_r <= #TCQ rcd_timer_ns;
      wire end_rcd_ns = (rcd_timer_ns == ONE[RCD_TIMER_WIDTH-1:0]);
      always @(posedge clk) end_rcd = end_rcd_ns;
      wire rcd_active_ns = |rcd_timer_ns;
      always @(posedge clk) rcd_active_r <= #TCQ rcd_active_ns;
      always @(/*AS*/rcd_active_r or rcd_timer_r or start_rcd_lcl)
      allow_early_rd_config = ((rcd_timer_r <= nCNFG2RD_EN) && rcd_active_r) ||
                               ((nCNFG2RD_EN > nRCD_CLKS) && start_rcd_lcl);
      always @(/*AS*/rcd_active_r or rcd_timer_r or start_rcd_lcl)
        allow_early_wr_config = ((rcd_timer_r <= nCNFG2WR) && rcd_active_r) ||
                                ((nCNFG2WR > nRCD_CLKS) && start_rcd_lcl);
    end
  endgenerate

// Figure out if the read that's completing is for an RMW for
// this bank machine.  Delay by a state if CWL != 8 since the
// data is not ready in the RMW buffer for the early write
// data fetch that happens with ECC and CWL != 8.
// Create a state bit indicating we're waiting for the read
// half of the rmw to complete.
  input sending_col;
  input rd_wr_r;
  input req_wr_r;
  input [DATA_BUF_ADDR_WIDTH-1:0] rd_data_addr;
  input [DATA_BUF_ADDR_WIDTH-1:0] req_data_buf_addr_r;
  input dfi_rddata_valid;
  input rd_rmw;
  reg rmw_rd_done = 1'b0;
  reg rd_half_rmw_lcl = 1'b0;
  output wire rd_half_rmw;
  assign rd_half_rmw = rd_half_rmw_lcl;
  reg rmw_wait_r = 1'b0;
  generate
    if (ECC != "OFF") begin : rmw_on
// Delay dfi_rddata_valid and rd_rmw by one cycle to align them
// to req_data_buf_addr_r so that rmw_wait_r clears properly
      reg dfi_rddata_valid_r;
      reg rd_rmw_r;
      always @(posedge clk) begin
        dfi_rddata_valid_r <= #TCQ dfi_rddata_valid;
        rd_rmw_r <= #TCQ rd_rmw;
      end   
      wire my_rmw_rd_ns = dfi_rddata_valid_r && rd_rmw_r && 
                            (rd_data_addr == req_data_buf_addr_r); 
      if (CWL == 8) always @(my_rmw_rd_ns) rmw_rd_done = my_rmw_rd_ns;
      else always @(posedge clk) rmw_rd_done = #TCQ my_rmw_rd_ns;
      always @(/*AS*/rd_wr_r or req_wr_r) rd_half_rmw_lcl = req_wr_r && rd_wr_r;
      wire rmw_wait_ns = ~rst && 
             ((rmw_wait_r && ~rmw_rd_done) || (rd_half_rmw_lcl && sending_col));
      always @(posedge clk) rmw_wait_r <= #TCQ rmw_wait_ns;
    end
  endgenerate

// column wait state machine.
  wire col_wait_ns = ~rst && ((col_wait_r && ~sending_col) || end_rcd
                            || rcv_open_bank || (rmw_rd_done && rmw_wait_r));
  always @(posedge clk) col_wait_r <= #TCQ col_wait_ns;

// Set up various RAS timer parameters, wires, etc.

  localparam TWO = 2;
  output reg [RAS_TIMER_WIDTH-1:0] ras_timer_ns;
  reg [RAS_TIMER_WIDTH-1:0] ras_timer_r;
  input [(2*(RAS_TIMER_WIDTH*nBANK_MACHS))-1:0] ras_timer_ns_in;
  input [(nBANK_MACHS*2)-1:0] rb_hit_busies_r;

// On a bank pass, select the RAS timer from the passing bank machine.
  reg [RAS_TIMER_WIDTH-1:0] passed_ras_timer;
  integer i;
  always @(/*AS*/ras_timer_ns_in or rb_hit_busies_r) begin
    passed_ras_timer = {RAS_TIMER_WIDTH{1'b0}};
    for (i=ID+1; i<(ID+nBANK_MACHS); i=i+1)
      if (rb_hit_busies_r[i])
        passed_ras_timer = ras_timer_ns_in[i*RAS_TIMER_WIDTH+:RAS_TIMER_WIDTH];
  end

// RAS and (reused for) WTP timer.  When an open bank is passed, this
// timer is passed to the new owner.  The existing RAS prevents
// an activate from occuring too early.


  wire start_wtp_timer = sending_col && ~rd_wr_r;
  input idle_r;

  always @(/*AS*/bm_end_r1 or ras_timer_r or rst or start_rcd_lcl
           or start_wtp_timer) begin
    if (bm_end_r1 || rst) ras_timer_ns = ZERO[RAS_TIMER_WIDTH-1:0];
    else begin
      ras_timer_ns = ras_timer_r;
      if (start_rcd_lcl) ras_timer_ns =
           nRAS_CLKS[RAS_TIMER_WIDTH-1:0] - TWO[RAS_TIMER_WIDTH-1:0];
      if (start_wtp_timer) ras_timer_ns =
           (ras_timer_r <= (nWTP_CLKS-2)) ? nWTP_CLKS[RAS_TIMER_WIDTH-1:0] - TWO[RAS_TIMER_WIDTH-1:0]
                                          : ras_timer_r - ONE[RAS_TIMER_WIDTH-1:0];//CR #534391
                                          //As the timer is being reused, it is essential to compare
                                          //before new value is loaded. There was case where timer(ras_timer_r)
                                          //is getting updated with a new value(nWTP_CLKS-2) at write 
                                          //command that was quite less than the timer value at that
                                          //time. This made the tRAS timer to expire earlier and resulted.
                                          //in tRAS timing violation.
      if (|ras_timer_r && ~start_wtp_timer) ras_timer_ns =
           ras_timer_r - ONE[RAS_TIMER_WIDTH-1:0];
    end
  end // always @ (...

  wire [RAS_TIMER_WIDTH-1:0] ras_timer_passed_ns = rcv_open_bank
                                                     ? passed_ras_timer
                                                     : ras_timer_ns;
  always @(posedge clk) ras_timer_r <= #TCQ ras_timer_passed_ns;

  wire ras_timer_zero_ns = (ras_timer_ns == ZERO[RAS_TIMER_WIDTH-1:0]);
  reg ras_timer_zero_r;
  always @(posedge clk) ras_timer_zero_r <= #TCQ ras_timer_zero_ns;

// RTP timer.  Unless 2T mode, add one to account for fixed row command
// to column command offset of -1.
  localparam nRTP_CLKS = (nCK_PER_CLK == 1)
                         ? nRTP
                         : ((nRTP/2) + ((ADDR_CMD_MODE == "2T") ? nRTP%2 : 1));
  localparam nRTP_CLKS_M1 = ((nRTP_CLKS-1) <= 0) ? 0 : nRTP_CLKS-1;
  localparam RTP_TIMER_WIDTH = clogb2(nRTP_CLKS_M1 + 1);
  reg [RTP_TIMER_WIDTH-1:0] rtp_timer_ns;
  reg [RTP_TIMER_WIDTH-1:0] rtp_timer_r;
  wire sending_col_not_rmw_rd = sending_col && ~rd_half_rmw_lcl;
  always @(/*AS*/pass_open_bank_r or rst or rtp_timer_r
           or sending_col_not_rmw_rd) begin
    rtp_timer_ns = rtp_timer_r;
    if (rst || pass_open_bank_r)
      rtp_timer_ns = ZERO[RTP_TIMER_WIDTH-1:0];
    else begin
      if (sending_col_not_rmw_rd) 
         rtp_timer_ns = nRTP_CLKS_M1[RTP_TIMER_WIDTH-1:0];
      if (|rtp_timer_r) rtp_timer_ns = rtp_timer_r - ONE[RTP_TIMER_WIDTH-1:0];
    end
  end
  always @(posedge clk) rtp_timer_r <= #TCQ rtp_timer_ns;

  wire end_rtp_lcl =   ~pass_open_bank_r &&
                       ((rtp_timer_r == ONE[RTP_TIMER_WIDTH-1:0]) ||
                       ((nRTP_CLKS_M1 == 0) && sending_col_not_rmw_rd));
  output wire end_rtp;
  assign end_rtp = end_rtp_lcl;

// Optionally implement open page mode timer.
  localparam OP_WIDTH = clogb2(nOP_WAIT + 1);
  output wire bank_wait_in_progress;
  output wire start_pre_wait;
  input passing_open_bank;
  input low_idle_cnt_r;
  output wire op_exit_req;
  input op_exit_grant;
  input tail_r;
  output reg pre_wait_r;

  generate
    if (nOP_WAIT == 0) begin : op_mode_disabled
      assign bank_wait_in_progress = sending_col_not_rmw_rd || |rtp_timer_r ||
                                     (pre_wait_r && ~ras_timer_zero_r);
      assign start_pre_wait = end_rtp_lcl;
      assign op_exit_req = 1'b0;
    end
    else begin : op_mode_enabled
      reg op_wait_r;
      assign bank_wait_in_progress = sending_col || |rtp_timer_r ||
                                     (pre_wait_r && ~ras_timer_zero_r) ||
                                     op_wait_r;
      wire op_active = ~rst && ~passing_open_bank && ((end_rtp_lcl && tail_r)
                                || op_wait_r);
      wire op_wait_ns = ~op_exit_grant && op_active;
      always @(posedge clk) op_wait_r <= #TCQ op_wait_ns;
      assign start_pre_wait = op_exit_grant ||
                              (end_rtp_lcl && ~tail_r && ~passing_open_bank);
      if (nOP_WAIT == -1)
        assign op_exit_req = (low_idle_cnt_r && op_active);
      else begin : op_cnt
        reg [OP_WIDTH-1:0] op_cnt_r;
        wire [OP_WIDTH-1:0] op_cnt_ns =
                                   (passing_open_bank || op_exit_grant || rst)
                                       ? ZERO[OP_WIDTH-1:0]
                                       : end_rtp_lcl
                                         ? nOP_WAIT[OP_WIDTH-1:0]
                                         : |op_cnt_r
                                            ? op_cnt_r - ONE[OP_WIDTH-1:0]
                                            : op_cnt_r;
        always @(posedge clk) op_cnt_r <= #TCQ op_cnt_ns;
        assign op_exit_req = //(low_idle_cnt_r && op_active) || //Changed by KK for improving the
                             (op_wait_r && ~|op_cnt_r);         //effeciency in case of known patterns
      end
    end
  endgenerate

  output allow_auto_pre;
  wire allow_auto_pre = act_wait_r_lcl || rcd_active_r ||
                        (col_wait_r && ~sending_col);

// precharge wait state machine.
  input auto_pre_r;
  wire start_pre;
  input pass_open_bank_ns;
  wire pre_wait_ns = ~rst && (~pass_open_bank_ns &&
                     (start_pre_wait || (pre_wait_r && ~start_pre)));
  always @(posedge clk) pre_wait_r <= #TCQ pre_wait_ns;
  wire pre_request = pre_wait_r && ras_timer_zero_r && ~auto_pre_r;

// precharge timer.
  localparam nRP_CLKS = (nCK_PER_CLK == 1) ? nRP : ((nRP/2) + (nRP % 2));
// Subtract two because there are a minimum of two fabric states from
// end of RP timer until earliest possible arb to send act.
  localparam nRP_CLKS_M2 = (nRP_CLKS-2 < 0) ? 0 : nRP_CLKS-2;
  localparam RP_TIMER_WIDTH = clogb2(nRP_CLKS_M2 + 1);
  assign start_pre = pre_wait_r && ras_timer_zero_r &&
                     (sending_row || auto_pre_r);
  reg [RP_TIMER_WIDTH-1:0] rp_timer_r = ZERO[RP_TIMER_WIDTH-1:0];

  generate
    if (nRP_CLKS_M2 > ZERO) begin : rp_timer
      reg [RP_TIMER_WIDTH-1:0] rp_timer_ns;
      always @(/*AS*/rp_timer_r or rst or start_pre)
        if (rst) rp_timer_ns = ZERO[RP_TIMER_WIDTH-1:0];
        else begin
          rp_timer_ns = rp_timer_r;
          if (start_pre) rp_timer_ns = nRP_CLKS_M2[RP_TIMER_WIDTH-1:0];
          else if (|rp_timer_r) rp_timer_ns =
                                  rp_timer_r - ONE[RP_TIMER_WIDTH-1:0];
        end
      always @(posedge clk) rp_timer_r <= #TCQ rp_timer_ns;
    end // block: rp_timer
  endgenerate

  output wire precharge_bm_end;
  assign precharge_bm_end = (rp_timer_r == ONE[RP_TIMER_WIDTH-1:0]) ||
                            (start_pre && (nRP_CLKS_M2 == ZERO));

// Compute RRD related activate inhibit.
// Compare this bank machine's rank with others, then
// select result based on grant.  An alternative is to
// select the just issued rank with the grant and simply
// compare against this bank machine's rank.  However, this
// serializes the selection of the rank and the compare processes.
// As implemented below, the compare occurs first, then the
// selection based on grant.  This is faster.

  input [RANK_WIDTH-1:0] req_rank_r;
  input [(RANK_WIDTH*nBANK_MACHS*2)-1:0] req_rank_r_in;

  reg inhbt_act_rrd;
  input [(nBANK_MACHS*2)-1:0] start_rcd_in;

  generate
    integer j;
    if (RANKS == 1)
      always @(/*AS*/req_rank_r or req_rank_r_in or start_rcd_in) begin
        inhbt_act_rrd = 1'b0;
        for (j=(ID+1); j<(ID+nBANK_MACHS); j=j+1)
          inhbt_act_rrd = inhbt_act_rrd || start_rcd_in[j];
      end
    else begin
      always @(/*AS*/req_rank_r or req_rank_r_in or start_rcd_in) begin
        inhbt_act_rrd = 1'b0;
        for (j=(ID+1); j<(ID+nBANK_MACHS); j=j+1)
          inhbt_act_rrd = inhbt_act_rrd ||
             (start_rcd_in[j] &&
              (req_rank_r_in[(j*RANK_WIDTH)+:RANK_WIDTH] == req_rank_r));
      end
    end

  endgenerate

// Extract the activate command inhibit for the rank associated
// with this request.  FAW and RRD are computed separately so that
// gate level timing can be carefully managed.
  input [RANKS-1:0] inhbt_act_faw_r;
  wire my_inhbt_act_faw = inhbt_act_faw_r[req_rank_r];

  input wait_for_maint_r;
  input head_r;
  wire act_req = ~idle_r && head_r && act_wait_r && ras_timer_zero_r &&
                 ~wait_for_maint_r;

// Implement simple starvation avoidance for act requests.  Precharge
// requests don't need this because they are never gated off by
// timing events such as inhbt_act_rrd.  Priority request timeout
// is fixed at a single trip around the round robin arbiter.

  input sent_row;
  wire rts_act_denied = act_req && sent_row && ~sending_row;

  reg [BM_CNT_WIDTH-1:0] act_starve_limit_cntr_ns;
  reg [BM_CNT_WIDTH-1:0] act_starve_limit_cntr_r;

  always @(/*AS*/act_req or act_starve_limit_cntr_r or rts_act_denied)
    begin
      act_starve_limit_cntr_ns = act_starve_limit_cntr_r;
      if (~act_req)
        act_starve_limit_cntr_ns = {BM_CNT_WIDTH{1'b0}};
      else
        if (rts_act_denied && &act_starve_limit_cntr_r)
          act_starve_limit_cntr_ns = act_starve_limit_cntr_r +
                                     {{BM_CNT_WIDTH-1{1'b0}}, 1'b1};
    end
  always @(posedge clk) act_starve_limit_cntr_r <=
                        #TCQ act_starve_limit_cntr_ns;

  reg demand_act_priority_r;
  wire demand_act_priority_ns = act_req &&
      (demand_act_priority_r || (rts_act_denied && &act_starve_limit_cntr_r));
  always @(posedge clk) demand_act_priority_r <= #TCQ demand_act_priority_ns;

`ifdef MC_SVA
  cover_demand_act_priority:
    cover property (@(posedge clk) (~rst && demand_act_priority_r));
`endif

  output wire demand_act_priority;
  assign demand_act_priority = demand_act_priority_r && ~sending_row;

// compute act_demanded from other demand_act_priorities
  input [(nBANK_MACHS*2)-1:0] demand_act_priority_in;
  reg act_demanded = 1'b0;
  generate
    if (nBANK_MACHS > 1) begin : compute_act_demanded
      always @(demand_act_priority_in[`BM_SHARED_BV])
           act_demanded = |demand_act_priority_in[`BM_SHARED_BV];
    end
  endgenerate

  wire row_demand_ok = demand_act_priority_r || ~act_demanded;

// Generate the Request To Send row arbitation signal.
  output wire rts_row;

  assign rts_row = ~sending_row && row_demand_ok &&
                    ((act_req && ~my_inhbt_act_faw && ~inhbt_act_rrd) ||
                      pre_request);

`ifdef MC_SVA
  four_activate_window_wait:
    cover property (@(posedge clk)
      (~rst && ~sending_row && act_req &&  my_inhbt_act_faw));
  ras_ras_delay_wait:
    cover property (@(posedge clk)
      (~rst && ~sending_row && act_req && inhbt_act_rrd));
`endif

// Provide rank machines early knowledge that this bank machine is
// going to send an activate to the rank.  In this way, the rank
// machines just need to use the sending_row wire to figure out if
// they need to keep track of the activate.
  output reg [RANKS-1:0] act_this_rank_r;
  reg [RANKS-1:0] act_this_rank_ns;
  always @(/*AS*/act_wait_r or req_rank_r) begin
    act_this_rank_ns = {RANKS{1'b0}};
    for (i = 0; i < RANKS; i = i + 1)
      act_this_rank_ns[i] = act_wait_r && (i[RANK_WIDTH-1:0] == req_rank_r);
  end
  always @(posedge clk) act_this_rank_r <= #TCQ act_this_rank_ns;


// Generate request to send column command signal.

  input order_q_zero;
  wire req_bank_rdy_ns = order_q_zero && col_wait_r;
  reg req_bank_rdy_r;
  always @(posedge clk) req_bank_rdy_r <= #TCQ req_bank_rdy_ns;

// Determine is we have been denied a column command request.
  input sent_col;
  wire rts_col_denied = req_bank_rdy_r && sent_col && ~sending_col;

// Implement a starvation limit counter.  Count the number of times a
// request to send a column command has been denied.
  localparam STARVE_LIMIT_CNT      = STARVE_LIMIT * nBANK_MACHS;
  localparam STARVE_LIMIT_WIDTH    = clogb2(STARVE_LIMIT_CNT);
  reg [STARVE_LIMIT_WIDTH-1:0] starve_limit_cntr_r;
  reg [STARVE_LIMIT_WIDTH-1:0] starve_limit_cntr_ns;
  always @(/*AS*/col_wait_r or rts_col_denied or starve_limit_cntr_r)
   if (~col_wait_r)
     starve_limit_cntr_ns = {STARVE_LIMIT_WIDTH{1'b0}};
   else
     if (rts_col_denied && (starve_limit_cntr_r != STARVE_LIMIT_CNT-1))
       starve_limit_cntr_ns = starve_limit_cntr_r +
                              {{STARVE_LIMIT_WIDTH-1{1'b0}}, 1'b1};
     else starve_limit_cntr_ns = starve_limit_cntr_r;
  always @(posedge clk) starve_limit_cntr_r <= #TCQ starve_limit_cntr_ns;

  input q_has_rd;
  input q_has_priority;

// Decide if this bank machine should demand priority.  Priority is demanded
//  when starvation limit counter is reached, or a bit in the request.
  wire starved = ((starve_limit_cntr_r == (STARVE_LIMIT_CNT-1)) &&
                 rts_col_denied);
  input req_priority_r;
  input idle_ns;
  reg demand_priority_r;
  wire demand_priority_ns = ~idle_ns && col_wait_ns &&
                              (demand_priority_r ||
                              (order_q_zero &&
                               (req_priority_r || q_has_priority)) ||
                               (starved && (q_has_rd || ~req_wr_r)));

  always @(posedge clk) demand_priority_r <= #TCQ demand_priority_ns;

`ifdef MC_SVA
  wire rdy_for_priority = ~rst && ~demand_priority_r && ~idle_ns &&
                          col_wait_ns;
  req_triggers_demand_priority:
    cover property (@(posedge clk)
       (rdy_for_priority && req_priority_r && ~q_has_priority && ~starved));
  q_priority_triggers_demand_priority:
    cover property (@(posedge clk)
       (rdy_for_priority && ~req_priority_r && q_has_priority && ~starved));
  wire not_req_or_q_rdy_for_priority =
        rdy_for_priority && ~req_priority_r && ~q_has_priority;
  starved_req_triggers_demand_priority:
    cover property (@(posedge clk)
       (not_req_or_q_rdy_for_priority && starved && ~q_has_rd && ~req_wr_r));
  starved_q_triggers_demand_priority:
    cover property (@(posedge clk)
       (not_req_or_q_rdy_for_priority && starved && q_has_rd && req_wr_r));
`endif

// compute demanded from other demand_priorities
  input [(nBANK_MACHS*2)-1:0] demand_priority_in;
  reg demanded = 1'b0;
  generate
    if (nBANK_MACHS > 1) begin : compute_demanded
      always @(demand_priority_in[`BM_SHARED_BV]) demanded =
                                    |demand_priority_in[`BM_SHARED_BV];
    end
  endgenerate


// In order to make sure that there is no starvation amongst a possibly
// unlimited stream of priority requests, add a second stage to the demand
// priority signal.  If there are no other requests demanding priority, then
// go ahead and assert demand_priority.  If any other requests are asserting
// demand_priority, hold off asserting demand_priority until these clear, then
// assert demand priority.  Its possible to get multiple requests asserting
// demand priority simultaneously, but that's OK.  Those requests will be
// serviced, demanded will fall, and another group of requests will be
// allowed to assert demand_priority.

  reg demanded_prior_r;
  wire demanded_prior_ns = demanded &&
                          (demanded_prior_r || ~demand_priority_r);
  always @(posedge clk) demanded_prior_r <= #TCQ demanded_prior_ns;

  output wire demand_priority;
  assign demand_priority = demand_priority_r && ~demanded_prior_r &&
                           ~sending_col;

`ifdef MC_SVA
  demand_priority_gated:
    cover property (@(posedge clk) (demand_priority_r && ~demand_priority));
  generate
    if (nBANK_MACHS >1) multiple_demand_priority:
         cover property (@(posedge clk)
           ($countones(demand_priority_in[`BM_SHARED_BV]) > 1));
  endgenerate
`endif

  wire demand_ok = demand_priority_r || ~demanded;

// Figure out if the request in this bank machine matches the current io
// configuration.
  input io_config_strobe;
  input io_config_valid_r;
  input [RANK_WIDTH:0] io_config;
  wire pre_config_match_ns = io_config_valid_r &&
                             (io_config == {~rd_wr_r, req_rank_r});
  reg pre_config_match_r;
  always @(posedge clk) pre_config_match_r <= #TCQ pre_config_match_ns;
  wire io_config_match;
  generate begin : config_match
      if (nCNFG2WR == 1) assign io_config_match =
                                 ~rd_wr_r
                                   ? pre_config_match_ns
                                   : ~io_config_strobe && pre_config_match_r;
      else  assign io_config_match = pre_config_match_r;
    end
  endgenerate

// Compute desire to send a column command independent of whether or not
// various DRAM timing parameters are met.  Ignoring DRAM timing parameters is
// necessary to insure priority.  This is used to drive the demand
// priority signal.

  wire early_config = ~rd_wr_r
                        ? allow_early_wr_config
                        : allow_early_rd_config;

// Using rank state provided by the rank machines, figure out if
// a io configs should wait for WTR.
  input [RANKS-1:0] wtr_inhbt_config_r;
  wire my_wtr_inhbt_config = wtr_inhbt_config_r[req_rank_r];

// Fold in PHY timing constraints to send a io config.
  input inhbt_rd_config;
  input inhbt_wr_config;
  output wire rtc;
  assign rtc = ~io_config_match && order_q_zero &&
               (col_wait_r || early_config) &&
               demand_ok && ~my_wtr_inhbt_config &&
               (~rd_wr_r ? ~inhbt_wr_config : ~inhbt_rd_config);

`ifdef MC_SVA
  early_config_request: cover property (@(posedge clk)
                            (~rst && rtc && ~col_wait_r));
`endif

// Using rank state provided by the rank machines, figure out if
// a read requests should wait for WTR.
  input [RANKS-1:0] inhbt_rd_r;
  wire my_inhbt_rd = inhbt_rd_r[req_rank_r];
  wire allow_rw = ~rd_wr_r ? 1'b1 : ~my_inhbt_rd;

// DQ bus timing constraints.
  input dq_busy_data;

// Column command is ready to arbitrate, except for databus restrictions.
  wire col_rdy = (col_wait_r || ((nRCD_CLKS <= 1) && end_rcd) ||
               (rcv_open_bank && DRAM_TYPE=="DDR2" && BURST_MODE == "4")) &&
                order_q_zero;

// Column command is ready to arbitrate for sending a write.  Used
// to generate early wr_data_addr for ECC mode.
  output wire col_rdy_wr;
  assign col_rdy_wr = col_rdy && ~rd_wr_r;
  
// Figure out if we're ready to send a column command based on all timing
// constraints.  Use of io_config_match could be replaced by later versions
// if timing is an issue.
  wire col_cmd_rts = col_rdy && ~dq_busy_data && allow_rw && io_config_match;

`ifdef MC_SVA
  col_wait_for_order_q: cover property
    (@(posedge clk)
        (~rst && col_wait_r && ~order_q_zero && ~dq_busy_data &&
         allow_rw && io_config_match));
  col_wait_for_dq_busy: cover property
    (@(posedge clk)
        (~rst && col_wait_r && order_q_zero && dq_busy_data &&
         allow_rw && io_config_match));
  col_wait_for_allow_rw: cover property
    (@(posedge clk)
        (~rst && col_wait_r && order_q_zero && ~dq_busy_data &&
         ~allow_rw && io_config_match));
  col_wait_for_io_config: cover property
    (@(posedge clk)
        (~rst && col_wait_r && order_q_zero && ~dq_busy_data &&
         allow_rw && ~io_config_match));
`endif

// Disable priority feature for one state after a config to insure
// forward progress on the just installed io config.
  wire override_demand_ns = io_config_strobe;
  reg override_demand_r;
  always @(posedge clk) override_demand_r <= override_demand_ns;
  output wire rts_col;
  assign rts_col = ~sending_col && (demand_ok || override_demand_r) &&
                   col_cmd_rts;

// As in act_this_rank, wr/rd_this_rank informs rank machines
// that this bank machine is doing a write/rd.  Removes logic
// after the grant.
  reg [RANKS-1:0] wr_this_rank_ns;
  reg [RANKS-1:0] rd_this_rank_ns;
  always @(/*AS*/rd_wr_r or req_rank_r) begin
    wr_this_rank_ns = {RANKS{1'b0}};
    rd_this_rank_ns = {RANKS{1'b0}};
    for (i=0; i<RANKS; i=i+1) begin
      wr_this_rank_ns[i] = ~rd_wr_r && (i[RANK_WIDTH-1:0] == req_rank_r);
      rd_this_rank_ns[i] = rd_wr_r && (i[RANK_WIDTH-1:0] == req_rank_r);
    end
  end
  output reg [RANKS-1:0] wr_this_rank_r;
  always @(posedge clk) wr_this_rank_r <= #TCQ wr_this_rank_ns;
  output reg [RANKS-1:0] rd_this_rank_r;
  always @(posedge clk) rd_this_rank_r <= #TCQ rd_this_rank_ns;
                                   
endmodule // bank_state


