// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// Configurable Logic Block: Tracking the assertion duration of a signal (or a combination of signals)
//
// The input tracked signal is actually composed of up to 4 input signals, each selected via an appropriate track control register
// This tracker implements most of possible logic functions out of the 4 input signals. The desired logic function is defined via an appropriate track control register
// Once the logic function has been calculated, a final signal, called signal_in is generated.
// signal_in is then analyzed by the tracker, to mark its assert and deassert times, trigger specific events, etc
// signal_in is also output from tracker, to be potentially used by other traclers/monitors in sigmon_top.
//
// Tracked signals are applied to clb_in[3:0] inputs
//    Each of clb_in[i] is individually selected via sigmon_ctrl10[31:0] (sigmon_ctrl14[31:0] for tracker 1)
// sigmon_ctrl10[31:24] - Select clb_in[3] source
//              [23:16] - Select clb_in[2] source
//               [15:8] - Select clb_in[1] source
//                [7:0] - Select clb_in[0] source
// See sigmon_top.v for the signals selection choices
//
// Calculating the desired logic function, depending on the applied inputs and operators:
// The idea is to implement the following generic logic function (for simplicity, the selected clb_in[3:0] are denoted by a, b, c, d):
//     signal_in = uop0 ((uop1 a) op2 (uop2 b) op3 (uop3 c) op4 (uop4 d))
//     where opi are either of "&", "|", and uopi is either the negation operator ("~") or none.
// 
// clb_mid_limit[31:0] - mid interval limit
// clb_start_limit[31:0]  - start interval limit
// Operators are specified in clb_logic_eq[7:0] input
//    clb_logic_eq[7:0]  logic function operands:
//             [7]  uop0 - Inverse function: Invert the final signal_in  
//             [6]  uop1 - optionally inverting operand a
//             [5]  op2  - & or |  
//             [4]  uop2 - optionally inverting operand b
//             [3]  op3  - & or |  
//             [2]  uop3 - optionally inverting operand c
//             [1]  op4  - & or |  
//             [0]  uop4 - optionally inverting operand d
//
// thus, the generic logic function is actually:
//             assign signal_in = op[7] ((op[6] a) op[5] (op[4] b) op[3] (op[2] c) op[91] (op[0] d));
//
//
// Tracking begins upon signal_in asserted:
//    a clk-counter starts counting
//    When the counter reaches a start_watermark, a start_event is flagged, to be recorded by other event monitors.
//    Counter is cleared and a clb_start indicator is set
//
//    As long as clb_start indicator is set (the tracked signal duration was longer than start_watermark) do:
//       a clk-counter starts counting
//       When the counter reaches a interval_watermark:
//          mid_event is flagged, to be recorded by other event monitors.
//          The counter is cleared to begin with counting the next interval
//    
// Upon signal_in deasserted:
// If clb_start indicator is set, then end_event is flagged
// Clear all counters & flags
//
//
// Notes:
// 1. tracking watermarks are denoted via clb_start_limit & clb_mid_limit
// 2. To aviod excessive time stamps in sigmon fifo, only signals duration longer than start_watermark are recorded 
//
//
// Gabi Malka, Technion, TCE
// Nov-2017

module sigmon_logic_block (
    input wire 	      clk,
    input wire 	      reset,
    input wire 	      clb_enable,

    input wire 	      sbu2nwp_rdy,
    input wire 	      sbu2nwp_vld,
    input wire 	      nwp2sbu_rdy,
    input wire 	      nwp2sbu_vld,
    input wire 	      sbu2cxp_rdy,
    input wire 	      sbu2cxp_vld,
    input wire 	      cxp2sbu_rdy,
    input wire 	      cxp2sbu_vld,
    input wire 	      sbu2nwp_tlast,
    input wire 	      nwp2sbu_tlast,
    input wire 	      sbu2cxp_tlast,
    input wire 	      cxp2sbu_tlast,
    input wire 	      nwp2sbu_lossless_credits,
    input wire 	      cxp2sbu_lossless_credits,
    input wire 	      axi4mm_aw_rdy,
    input wire 	      axi4mm_aw_vld,
    input wire 	      axi4mm_w_rdy,
    input wire 	      axi4mm_w_vld,
    input wire 	      axi4mm_w_last,
    input wire 	      axi4mm_b_rdy,
    input wire 	      axi4mm_b_vld,
    input wire 	      axi4mm_ar_rdy,
    input wire 	      axi4mm_ar_vld,
    input wire 	      axi4mm_r_rdy,
    input wire 	      axi4mm_r_vld,
    input wire 	      axi4mm_r_last,
    input wire 	      sigmon_enable_event,
    input wire [15:0] nica_events,

    input wire [3:0]  clbs_in,			   
    input [31:0]      clb_in_select,
    input [31:0]      clb_start_limit,
    input [31:0]      clb_mid_limit,
    input [7:0]       clb_logic_eq,

    output wire [2:0] clb_events_out,
    output wire       clb_out
);

`include "sigmon_events.v"

//localparam
//  NO_EVENT = 0,
//  EVENT1   = 1,
//  EVENT2   = 2;

  reg 		       clb_enable_asserted;
  reg 		       clb_enable_assertedQ;
  reg 		       clb_counter_enabled;
  reg 		       start_eventQ;
  reg 		       mid_eventQ;
  reg 		       end_eventQ;
  reg 		       signal_asserted;
  reg 		       signal_deasserted;
  reg 		       start_interval;
  reg 		       mid_interval;
  reg [31:0] 	       clb_counter;
  reg 		       signal_in_a;
  wire 		       signal_in;
  reg 		       signal_inQ; 		       
  wire [31:0] 	       start_interval_limit;
  wire [31:0] 	       mid_interval_limit;
  wire [3:0] 	       inv;
  wire [2:0] 	       op;
  wire 		       in_a;
  wire 		       in_b;
  wire 		       in_c;
  wire 		       in_d;
  reg [3:0] 	       clb_in;
  
// Placeholder for more events:
  wire [15:0] 	count_events;
  assign count_events = 16'h0000;
  
//Clb inputs:
  always @(*) begin
    //clb_in[0]:
    case (clb_in_select[7:0]) 
      NO_EVENT:
	begin
	  clb_in[0] = 1'b0;
	end
      EVENT_FALSE:
	begin
	  clb_in[0] = 1'b0;
	end
      CLB0_OUT:
	begin
          clb_in[0] = clbs_in[0];
	end
      CLB1_OUT:
	begin
	  clb_in[0] = clbs_in[1];
	end
      CLB2_OUT:
	begin
          clb_in[0] = clbs_in[2];
	end
      CLB3_OUT:
	begin
	  clb_in[0] = clbs_in[3];
	end
      SBU2NWP_RDY:
	begin
	  clb_in[0] = sbu2nwp_rdy;
	end
      SBU2NWP_VLD:
	begin
	  clb_in[0] = sbu2nwp_vld;
	end
      NWP2SBU_RDY:
	begin
	  clb_in[0] = nwp2sbu_rdy;
	end
      NWP2SBU_VLD:
	begin
	  clb_in[0] = nwp2sbu_vld;
	end
      SBU2CXP_RDY:
	begin
	  clb_in[0] = sbu2cxp_rdy;
	end
      SBU2CXP_VLD:
	begin
	  clb_in[0] = sbu2cxp_vld;
	end
      CXP2SBU_RDY:
	begin
	  clb_in[0] = cxp2sbu_rdy;
	end
      CXP2SBU_VLD:
	begin
	  clb_in[0] = cxp2sbu_vld;
	end
      SBU2NWP_LAST:
	begin
	  clb_in[0] = sbu2nwp_tlast;
	end
      NWP2SBU_LAST:
	begin
	  clb_in[0] = nwp2sbu_tlast;
	end
      SBU2CXP_LAST:
	begin
	  clb_in[0] = sbu2cxp_tlast;
	end
      CXP2SBU_LAST:
	begin
	  clb_in[0] = cxp2sbu_tlast;
	end
      NWP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[0] = nwp2sbu_lossless_credits;
	end
      CXP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[0] = cxp2sbu_lossless_credits;
	end
      NICA_EVENT0:
	begin
	  clb_in[0] = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  clb_in[0] = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  clb_in[0] = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  clb_in[0] = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  clb_in[0] = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  clb_in[0] = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  clb_in[0] = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  clb_in[0] = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  clb_in[0] = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  clb_in[0] = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  clb_in[0] = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  clb_in[0] = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  clb_in[0] = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  clb_in[0] = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  clb_in[0] = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  clb_in[0] = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  clb_in[0] = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  clb_in[0] = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  clb_in[0] = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  clb_in[0] = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  clb_in[0] = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  clb_in[0] = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  clb_in[0] = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  clb_in[0] = count_events[7];
	end
      DRAM_WADDR_RDY:
	begin
	  clb_in[0] = axi4mm_aw_rdy;
	end
      DRAM_WADDR_VLD:
	begin
	  clb_in[0] = axi4mm_aw_vld;
	end
      DRAM_WDATA_RDY:
	begin
	  clb_in[0] = axi4mm_w_rdy;
	end
      DRAM_WDATA_VLD:
	begin
	  clb_in[0] = axi4mm_w_vld;
	end
      DRAM_WDATA_LAST:
	begin
	  clb_in[0] = axi4mm_w_last;
	end
      DRAM_WDONE_RDY:
	begin
	  clb_in[0] = axi4mm_b_rdy;
	end
      DRAM_WDONE_VLD:
	begin
	  clb_in[0] = axi4mm_b_vld;
	end
      DRAM_RADDR_RDY:
	begin
	  clb_in[0] = axi4mm_ar_rdy;
	end
      DRAM_RADDR_VLD:
	begin
	  clb_in[0] = axi4mm_ar_vld;
	end
      DRAM_RDATA_RDY:
	begin
	  clb_in[0] = axi4mm_r_rdy;
	end
      DRAM_RDATA_VLD:
	begin
	  clb_in[0] = axi4mm_r_vld;
	end
      DRAM_RDATA_LAST:
	begin
	  clb_in[0] = axi4mm_r_last;
	end
      SIGMON_ENABLED:
	begin
	  clb_in[0] = sigmon_enable_event;
	end
      default: begin
	clb_in[0] = 1'b0;
      end
    endcase

    //clb_in[1]:
    case (clb_in_select[15:8]) 
      NO_EVENT:
	begin
	  clb_in[1] = 1'b0;
	end
      EVENT_FALSE:
	begin
	  clb_in[1] = 1'b0;
	end
      CLB0_OUT:
	begin
          clb_in[1] = clbs_in[0];
	end
      CLB1_OUT:
	begin
	  clb_in[1] = clbs_in[1];
	end
      CLB2_OUT:
	begin
          clb_in[1] = clbs_in[2];
	end
      CLB3_OUT:
	begin
	  clb_in[1] = clbs_in[3];
	end
      SBU2NWP_RDY:
	begin
	  clb_in[1] = sbu2nwp_rdy;
	end
      SBU2NWP_VLD:
	begin
	  clb_in[1] = sbu2nwp_vld;
	end
      NWP2SBU_RDY:
	begin
	  clb_in[1] = nwp2sbu_rdy;
	end
      NWP2SBU_VLD:
	begin
	  clb_in[1] = nwp2sbu_vld;
	end
      SBU2CXP_RDY:
	begin
	  clb_in[1] = sbu2cxp_rdy;
	end
      SBU2CXP_VLD:
	begin
	  clb_in[1] = sbu2cxp_vld;
	end
      CXP2SBU_RDY:
	begin
	  clb_in[1] = cxp2sbu_rdy;
	end
      CXP2SBU_VLD:
	begin
	  clb_in[1] = cxp2sbu_vld;
	end
      SBU2NWP_LAST:
	begin
	  clb_in[1] = sbu2nwp_tlast;
	end
      NWP2SBU_LAST:
	begin
	  clb_in[1] = nwp2sbu_tlast;
	end
      SBU2CXP_LAST:
	begin
	  clb_in[1] = sbu2cxp_tlast;
	end
      CXP2SBU_LAST:
	begin
	  clb_in[1] = cxp2sbu_tlast;
	end
      NWP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[1] = nwp2sbu_lossless_credits;
	end
      CXP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[1] = cxp2sbu_lossless_credits;
	end
      NICA_EVENT0:
	begin
	  clb_in[1] = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  clb_in[1] = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  clb_in[1] = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  clb_in[1] = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  clb_in[1] = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  clb_in[1] = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  clb_in[1] = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  clb_in[1] = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  clb_in[1] = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  clb_in[1] = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  clb_in[1] = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  clb_in[1] = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  clb_in[1] = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  clb_in[1] = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  clb_in[1] = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  clb_in[1] = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  clb_in[1] = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  clb_in[1] = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  clb_in[1] = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  clb_in[1] = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  clb_in[1] = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  clb_in[1] = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  clb_in[1] = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  clb_in[1] = count_events[7];
	end
      DRAM_WADDR_RDY:
	begin
	  clb_in[1] = axi4mm_aw_rdy;
	end
      DRAM_WADDR_VLD:
	begin
	  clb_in[1] = axi4mm_aw_vld;
	end
      DRAM_WDATA_RDY:
	begin
	  clb_in[1] = axi4mm_w_rdy;
	end
      DRAM_WDATA_VLD:
	begin
	  clb_in[1] = axi4mm_w_vld;
	end
      DRAM_WDATA_LAST:
	begin
	  clb_in[1] = axi4mm_w_last;
	end
      DRAM_WDONE_RDY:
	begin
	  clb_in[1] = axi4mm_b_rdy;
	end
      DRAM_WDONE_VLD:
	begin
	  clb_in[1] = axi4mm_b_vld;
	end
      DRAM_RADDR_RDY:
	begin
	  clb_in[1] = axi4mm_ar_rdy;
	end
      DRAM_RADDR_VLD:
	begin
	  clb_in[1] = axi4mm_ar_vld;
	end
      DRAM_RDATA_RDY:
	begin
	  clb_in[1] = axi4mm_r_rdy;
	end
      DRAM_RDATA_VLD:
	begin
	  clb_in[1] = axi4mm_r_vld;
	end
      DRAM_RDATA_LAST:
	begin
	  clb_in[1] = axi4mm_r_last;
	end
      SIGMON_ENABLED:
	begin
	  clb_in[1] = sigmon_enable_event;
	end
      default: begin
	clb_in[1] = 1'b0;
      end
    endcase

    //clb_in[2]:
    case (clb_in_select[23:16]) 
      NO_EVENT:
	begin
	  clb_in[2] = 1'b0;
	end
      EVENT_FALSE:
	begin
	  clb_in[2] = 1'b0;
	end
      CLB0_OUT:
	begin
          clb_in[2] = clbs_in[0];
	end
      CLB1_OUT:
	begin
	  clb_in[2] = clbs_in[1];
	end
      CLB2_OUT:
	begin
          clb_in[2] = clbs_in[2];
	end
      CLB3_OUT:
	begin
	  clb_in[2] = clbs_in[3];
	end
      SBU2NWP_RDY:
	begin
	  clb_in[2] = sbu2nwp_rdy;
	end
      SBU2NWP_VLD:
	begin
	  clb_in[2] = sbu2nwp_vld;
	end
      NWP2SBU_RDY:
	begin
	  clb_in[2] = nwp2sbu_rdy;
	end
      NWP2SBU_VLD:
	begin
	  clb_in[2] = nwp2sbu_vld;
	end
      SBU2CXP_RDY:
	begin
	  clb_in[2] = sbu2cxp_rdy;
	end
      SBU2CXP_VLD:
	begin
	  clb_in[2] = sbu2cxp_vld;
	end
      CXP2SBU_RDY:
	begin
	  clb_in[2] = cxp2sbu_rdy;
	end
      CXP2SBU_VLD:
	begin
	  clb_in[2] = cxp2sbu_vld;
	end
      SBU2NWP_LAST:
	begin
	  clb_in[2] = sbu2nwp_tlast;
	end
      NWP2SBU_LAST:
	begin
	  clb_in[2] = nwp2sbu_tlast;
	end
      SBU2CXP_LAST:
	begin
	  clb_in[2] = sbu2cxp_tlast;
	end
      CXP2SBU_LAST:
	begin
	  clb_in[2] = cxp2sbu_tlast;
	end
      NWP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[2] = nwp2sbu_lossless_credits;
	end
      CXP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[2] = cxp2sbu_lossless_credits;
	end
      NICA_EVENT0:
	begin
	  clb_in[2] = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  clb_in[2] = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  clb_in[2] = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  clb_in[2] = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  clb_in[2] = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  clb_in[2] = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  clb_in[2] = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  clb_in[2] = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  clb_in[2] = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  clb_in[2] = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  clb_in[2] = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  clb_in[2] = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  clb_in[2] = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  clb_in[2] = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  clb_in[2] = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  clb_in[2] = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  clb_in[2] = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  clb_in[2] = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  clb_in[2] = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  clb_in[2] = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  clb_in[2] = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  clb_in[2] = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  clb_in[2] = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  clb_in[2] = count_events[7];
	end
      DRAM_WADDR_RDY:
	begin
	  clb_in[2] = axi4mm_aw_rdy;
	end
      DRAM_WADDR_VLD:
	begin
	  clb_in[2] = axi4mm_aw_vld;
	end
      DRAM_WDATA_RDY:
	begin
	  clb_in[2] = axi4mm_w_rdy;
	end
      DRAM_WDATA_VLD:
	begin
	  clb_in[2] = axi4mm_w_vld;
	end
      DRAM_WDATA_LAST:
	begin
	  clb_in[2] = axi4mm_w_last;
	end
      DRAM_WDONE_RDY:
	begin
	  clb_in[2] = axi4mm_b_rdy;
	end
      DRAM_WDONE_VLD:
	begin
	  clb_in[2] = axi4mm_b_vld;
	end
      DRAM_RADDR_RDY:
	begin
	  clb_in[2] = axi4mm_ar_rdy;
	end
      DRAM_RADDR_VLD:
	begin
	  clb_in[2] = axi4mm_ar_vld;
	end
      DRAM_RDATA_RDY:
	begin
	  clb_in[2] = axi4mm_r_rdy;
	end
      DRAM_RDATA_VLD:
	begin
	  clb_in[2] = axi4mm_r_vld;
	end
      DRAM_RDATA_LAST:
	begin
	  clb_in[2] = axi4mm_r_last;
	end
      SIGMON_ENABLED:
	begin
	  clb_in[2] = sigmon_enable_event;
	end
      default: begin
	clb_in[2] = 1'b0;
      end
    endcase

    //clb_in[3]:
    case (clb_in_select[31:24]) 
      NO_EVENT:
	begin
	  clb_in[3] = 1'b0;
	end
      EVENT_FALSE:
	begin
	  clb_in[3] = 1'b0;
	end
      CLB0_OUT:
	begin
          clb_in[3] = clbs_in[0];
	end
      CLB1_OUT:
	begin
	  clb_in[3] = clbs_in[1];
	end
      CLB2_OUT:
	begin
          clb_in[3] = clbs_in[2];
	end
      CLB3_OUT:
	begin
	  clb_in[3] = clbs_in[3];
	end
      SBU2NWP_RDY:
	begin
	  clb_in[3] = sbu2nwp_rdy;
	end
      SBU2NWP_VLD:
	begin
	  clb_in[3] = sbu2nwp_vld;
	end
      NWP2SBU_RDY:
	begin
	  clb_in[3] = nwp2sbu_rdy;
	end
      NWP2SBU_VLD:
	begin
	  clb_in[3] = nwp2sbu_vld;
	end
      SBU2CXP_RDY:
	begin
	  clb_in[3] = sbu2cxp_rdy;
	end
      SBU2CXP_VLD:
	begin
	  clb_in[3] = sbu2cxp_vld;
	end
      CXP2SBU_RDY:
	begin
	  clb_in[3] = cxp2sbu_rdy;
	end
      CXP2SBU_VLD:
	begin
	  clb_in[3] = cxp2sbu_vld;
	end
      SBU2NWP_LAST:
	begin
	  clb_in[3] = sbu2nwp_tlast;
	end
      NWP2SBU_LAST:
	begin
	  clb_in[3] = nwp2sbu_tlast;
	end
      SBU2CXP_LAST:
	begin
	  clb_in[3] = sbu2cxp_tlast;
	end
      CXP2SBU_LAST:
	begin
	  clb_in[3] = cxp2sbu_tlast;
	end
      NWP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[3] = nwp2sbu_lossless_credits;
	end
      CXP2SBU_LOSSLESS_CREDITS:
	begin
	  clb_in[3] = cxp2sbu_lossless_credits;
	end
      NICA_EVENT0:
	begin
	  clb_in[3] = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  clb_in[3] = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  clb_in[3] = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  clb_in[3] = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  clb_in[3] = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  clb_in[3] = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  clb_in[3] = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  clb_in[3] = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  clb_in[3] = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  clb_in[3] = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  clb_in[3] = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  clb_in[3] = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  clb_in[3] = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  clb_in[3] = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  clb_in[3] = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  clb_in[3] = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  clb_in[3] = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  clb_in[3] = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  clb_in[3] = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  clb_in[3] = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  clb_in[3] = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  clb_in[3] = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  clb_in[3] = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  clb_in[3] = count_events[7];
	end
      DRAM_WADDR_RDY:
	begin
	  clb_in[3] = axi4mm_aw_rdy;
	end
      DRAM_WADDR_VLD:
	begin
	  clb_in[3] = axi4mm_aw_vld;
	end
      DRAM_WDATA_RDY:
	begin
	  clb_in[3] = axi4mm_w_rdy;
	end
      DRAM_WDATA_VLD:
	begin
	  clb_in[3] = axi4mm_w_vld;
	end
      DRAM_WDATA_LAST:
	begin
	  clb_in[3] = axi4mm_w_last;
	end
      DRAM_WDONE_RDY:
	begin
	  clb_in[3] = axi4mm_b_rdy;
	end
      DRAM_WDONE_VLD:
	begin
	  clb_in[3] = axi4mm_b_vld;
	end
      DRAM_RADDR_RDY:
	begin
	  clb_in[3] = axi4mm_ar_rdy;
	end
      DRAM_RADDR_VLD:
	begin
	  clb_in[3] = axi4mm_ar_vld;
	end
      DRAM_RDATA_RDY:
	begin
	  clb_in[3] = axi4mm_r_rdy;
	end
      DRAM_RDATA_VLD:
	begin
	  clb_in[3] = axi4mm_r_vld;
	end
      DRAM_RDATA_LAST:
	begin
	  clb_in[3] = axi4mm_r_last;
	end
      SIGMON_ENABLED:
	begin
	  clb_in[3] = sigmon_enable_event;
	end
      default: begin
	clb_in[3] = 1'b0;
      end
    endcase
  end // always @ begin (Clb inputs)


  
  assign clb_events_out = {end_eventQ, mid_eventQ, start_eventQ};
  assign start_interval_limit = clb_start_limit;
  assign mid_interval_limit = clb_mid_limit;
  

// Calculate  the desired logic function:
  assign inv[3:0] = {clb_logic_eq[6], clb_logic_eq[4], clb_logic_eq[2], clb_logic_eq[0]};  
  assign op[2:0] = {clb_logic_eq[5], clb_logic_eq[3],clb_logic_eq[1]};  

// Select the desired polarity per each input
  assign in_a = inv[3] ? ~clb_in[3] : clb_in[3];
  assign in_b = inv[2] ? ~clb_in[2] : clb_in[2];
  assign in_c = inv[1] ? ~clb_in[1] : clb_in[1];
  assign in_d = inv[0] ? ~clb_in[0] : clb_in[0];

// Invert the final result, dependng on op[15]:
  assign signal_in = clb_logic_eq[7] ? ~signal_in_a : signal_in_a;
  
// Calculate op[2:0](in_a, in_b, in_c, in_d)
  always @(*) begin
    case (op) 
      0:
	begin
	  signal_in_a =  in_a &  in_b  &  in_c  & in_d;
	end
      1:
	begin
	  signal_in_a = (in_a &  in_b  &  in_c) | in_d;
	end
      2:
	begin
	  signal_in_a = (in_a &  in_b) | (in_c  & in_d);
	end
      3:
	begin
	  signal_in_a = (in_a &  in_b) |  in_c  | in_d;
	end
      4:
	begin
	  signal_in_a =  in_a | (in_b  &  in_c  & in_d);
	end
      5:
	begin
	  signal_in_a =  in_a | (in_b  &  in_c) | in_d;
	end
      6:
	begin
	  signal_in_a =  in_a |  in_b  | (in_c  & in_d);
	end
      7:
	begin
	  signal_in_a =  in_a |  in_b  |  in_c  | in_d;
	end

      default: begin
// Treated like op == 0:
	  signal_in_a = in_a & in_b & in_c & in_d;
      end
    endcase
  end // always @ begin
  
// output the result of function(clb_in)
  assign clb_out = signal_in;  

// Look for event_enable assertion
always @(posedge clk) begin
  if (reset) begin
    clb_enable_asserted <= 0;
    clb_enable_assertedQ <= 0;
  end
  else begin
    clb_enable_assertedQ <= clb_enable;

// event_ctrl1[31] assertion is used to reset both time stamp counter and the event_fifo
    if (clb_enable & ~clb_enable_assertedQ)
      clb_enable_asserted <= 1;
    else 
      clb_enable_asserted <= 0;
  end
end

// Look for the tracked signal assertion/deassertion
always @(posedge clk) begin
  if (reset) begin
    signal_asserted <= 1'b0;
    signal_deasserted <= 1'b0;
  end
  else begin
    signal_inQ <= signal_in;

// signal_in assertion is used to reset both time stamp counter and the event_fifo
    if (signal_in & ~signal_inQ) begin
      signal_asserted <= 1;
      end
    else 
      signal_asserted <= 0;

    if (~signal_in & signal_inQ) begin
      signal_deasserted <= 1;
      end
    else 
      signal_deasserted <= 0;
  end
end

always @(posedge clk) begin
  if (reset | clb_enable_asserted) begin
    start_eventQ <= 0;
    mid_eventQ <= 0;
    end_eventQ <= 0;
    start_interval <= 1'b0;
    mid_interval <= 1'b0;
    clb_counter <= 0;
    clb_counter_enabled <= 1'b0;
  end

  else begin

    if (~signal_deasserted) begin
      if ((signal_asserted | start_interval) & clb_counter < start_interval_limit) begin
	start_interval <= 1'b1;
	clb_counter <= clb_counter + 1;
      end
      else if (start_interval & clb_counter >= start_interval_limit) begin
	// End of start interval reached; flag the start_event and proceed to intermmediate intervals
	start_eventQ <= 1'b1;
	start_interval <= 1'b0;
	mid_interval <= 1'b1;
	clb_counter <= 0;
      end
      
      
      if (mid_interval & (mid_interval_limit > 0)) begin
	// intermmediate events are flagged only if the MID_WATERMARK is non zero
	if (clb_counter < mid_interval_limit - 1'b1) begin
	  clb_counter <= clb_counter + 1;
	  mid_eventQ <= 1'b0;
	end
	else if (clb_counter >= mid_interval_limit - 1'b1) begin
	  // End of an intermmediate interval reached; flag the mid_event and proceed to next intermmediate interval
	  mid_eventQ <= 1'b1;
	  clb_counter <= 0;
	end
      end
    end // if (~signal_deasserted)
    
    else begin
      // Tracked signal has been deasserted: signal tracking ended, Clear all:
      
      // end_event is flagged only if the start watermark has been reached
      if (mid_interval)
	end_eventQ <= 1'b1;
      
      start_interval <= 1'b0;
      mid_interval <= 1'b0;
      clb_counter <= 0;
      mid_eventQ <= 1'b0;
      
    end
    
    // Event signals are valid for one clock only:
    if (start_eventQ)
      start_eventQ <= 1'b0;
//    if (mid_eventQ)
//      mid_eventQ <= 1'b0;
    if (end_eventQ)
      end_eventQ <= 1'b0;
    
  end
end
  
endmodule
