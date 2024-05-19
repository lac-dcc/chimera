// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

module sigmon_counter 
  (		       
		       input wire 	  clk,
		       input wire 	  reset,
		       input wire 	  counter_enable, 
		       input wire 	  sigmon_enable_event,
		       input wire 	  timestamp_counter_24toggle,
		       input wire [31:0]  events_select, 
		       input wire [31:0]  count_limit, 
		       input wire 	  nwp2sbu_sop,
		       input wire 	  nwp2sbu_eop,
		       input wire 	  nwp2sbu_eop_temp,
		       input wire 	  sbu2nwp_sop,
		       input wire 	  sbu2nwp_eop,
		       input wire 	  cxp2sbu_sop,
		       input wire 	  cxp2sbu_eop,
		       input wire 	  sbu2cxp_sop,
		       input wire 	  sbu2cxp_eop,
		       input wire 	  sbu2cxpfifo_sop,
		       input wire 	  sbu2cxpfifo_eop,
		       input wire 	  sbu2nwpfifo_sop,
		       input wire 	  sbu2nwpfifo_eop,
		       input wire 	  nwp2sbu_lossless_credits_on,
		       input wire 	  cxp2sbu_lossless_credits_on,
		       input wire 	  nwp2sbu_lossless_credits_off,
		       input wire 	  cxp2sbu_lossless_credits_off,
		       input wire 	  got_ikwaddr,
		       input wire 	  got_ikraddr,
		       input wire 	  got_ddrwaddr,
		       input wire 	  got_ddrwdata,
		       input wire 	  got_ddrwdone,
		       input wire 	  got_ddrraddr,
		       input wire 	  got_ddrrdata,
		       input wire 	  dram_test_enabled,
		       input wire [15:0]  nica_events,
		       input wire [15:0]  count_events,
		       input wire 	  clb0_out,
		       input wire 	  clb1_out,
		       input wire [2:0]   clb0_events,
		       input wire [2:0]   clb1_events,
		       input wire 	  clb0_out_on,
		       input wire 	  clb0_out_off,
		       input wire 	  clb1_out_on,
		       input wire 	  clb1_out_off,
		       input wire 	  clb2_out,
		       input wire 	  clb3_out,
		       input wire [2:0]   clb2_events,
		       input wire [2:0]   clb3_events,
		       input wire 	  clb2_out_on,
		       input wire 	  clb2_out_off,
		       input wire 	  clb3_out_on,
		       input wire 	  clb3_out_off,
		       input wire 	  stream0_match,
		       input wire 	  stream0_sample,
		       input wire 	  stream1_match,
		       input wire 	  stream1_sample,
		       input wire 	  stream2_match,
		       input wire 	  stream2_sample,
		       input wire 	  stream3_match,
		       input wire 	  stream3_sample,
		       input wire 	  stream0_merged,
		       input wire 	  stream1_merged,
		       input wire 	  stream2_merged,
		       input wire 	  stream3_merged,
		       output wire [31:0] count_out,
		       output wire 	  event_out
);
  
`include "sigmon_events.v"

  reg		 enable_in;
  reg 		 clear_in;
  reg 		 event_in;

// sigmon counter modes:
// Notes: Counting in all modes start only after enable_in accurrence. 
localparam	
  SINGLE_EVENT_COUNT_NOLIMIT = 8'h00, // Count num of event_in occurrences,
  SINGLE_EVENT_COUNT_LIMIT = 8'h01,   // Count num of event_in occurrences. Assert count_event if count > LIMIT
  REPEAT_COUNT_LIMIT = 8'h02,         // Count num of event_in occurrences. Assert count_event if count > LIMIT and repeat counting
  DUAL_EVENTS_COUNT_LIMIT = 8'h03,    // Count num of both event_in & clear_in occurrences. Assert count_event if count > LIMIT
  WINDOW_COUNT_LIMIT = 8'h04,         // Count num of event_in between enable_in and clear_in. Assert count_event if count > LIMIT
  DUAL_EVENTS_LATENCY = 8'h05,        // Count num of event_in occurrences, and clear counter upon clear_in. Assert count_event if count > LIMIT
  DUAL_EVENTS_BALANCE = 8'h06;        // Separately count num of event_in & clear_in occurrences in counter1 & counter2, respectively. Assert count_event if counter2>counter1 or counter1-counter2 > LIMIT

  always @(*) begin
    //counter enable input:
    case (events_select[7:0]) 
      NO_EVENT:
	begin
	  enable_in = 1'b0;
	end
      EVENT_TRUE:
	begin
	  enable_in = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  enable_in = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  enable_in = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  enable_in = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  enable_in = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  enable_in = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  enable_in = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  enable_in = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  enable_in = nwp2sbu_eop;
	end
      NWP2SBU_EOP_TEMP:
	begin
	  enable_in = nwp2sbu_eop_temp;
	end
      SBU2CXPFIFO_SOP:
	begin
	  enable_in = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  enable_in = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  enable_in = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  enable_in = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  enable_in = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  enable_in = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  enable_in = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  enable_in = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  enable_in = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  enable_in = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  enable_in = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  enable_in = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  enable_in = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  enable_in = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  enable_in = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  enable_in = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  enable_in = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  enable_in = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  enable_in = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  enable_in = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  enable_in = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  enable_in = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  enable_in = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  enable_in = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  enable_in = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  enable_in = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  enable_in = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  enable_in = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  enable_in = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  enable_in = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  enable_in = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  enable_in = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  enable_in = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  enable_in = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  enable_in = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  enable_in = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  enable_in = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  enable_in = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  enable_in = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  enable_in = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  enable_in = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  enable_in = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  enable_in = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  enable_in = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  enable_in = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  enable_in = dram_test_enabled;
	end
      CLB0_OUT:
	begin
	  enable_in = clb0_out;
	end
      CLB0_START:
	begin
	  enable_in = clb0_events[0];
	end
      CLB0_MID:
	begin
	  enable_in = clb0_events[1];
	end
      CLB0_END:
	begin
	  enable_in = clb0_events[2];
	end
      CLB0_OUT_ON:
	begin
	  enable_in = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  enable_in = clb0_out_off;
	end
      CLB1_OUT:
	begin
	  enable_in = clb1_out;
	end
      CLB1_START:
	begin
	  enable_in = clb1_events[0];
	end
      CLB1_MID:
	begin
	  enable_in = clb1_events[1];
	end
      CLB1_END:
	begin
	  enable_in = clb1_events[2];
	end
      CLB1_OUT_ON:
	begin
	  enable_in = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  enable_in = clb1_out_off;
	end
      CLB2_OUT:
	begin
	  enable_in = clb2_out;
	end
      CLB2_START:
	begin
	  enable_in = clb2_events[0];
	end
      CLB2_MID:
	begin
	  enable_in = clb2_events[1];
	end
      CLB2_END:
	begin
	  enable_in = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  enable_in = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  enable_in = clb2_out_off;
	end
      CLB3_OUT:
	begin
	  enable_in = clb3_out;
	end
      CLB3_START:
	begin
	  enable_in = clb3_events[0];
	end
      CLB3_MID:
	begin
	  enable_in = clb3_events[1];
	end
      CLB3_END:
	begin
	  enable_in = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  enable_in = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  enable_in = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  enable_in = stream0_match;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  enable_in = stream0_sample;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  enable_in = stream1_match;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  enable_in = stream1_sample;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  enable_in = stream2_match;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  enable_in = stream2_sample;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  enable_in = stream3_match;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  enable_in = stream3_sample;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  enable_in = stream0_merged;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  enable_in = stream1_merged;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  enable_in = stream2_merged;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  enable_in = stream3_merged;
	end
      SIGMON_ENABLED:
	begin
	  enable_in = sigmon_enable_event;
	end
      default: begin
	enable_in = 1'b0;;
      end
    endcase

    //counter clear input:
    case (events_select[15:8]) 
      NO_EVENT:
	begin
	  clear_in = 1'b0;
	end
      EVENT_TRUE:
	begin
	  clear_in = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  clear_in = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  clear_in = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  clear_in = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  clear_in = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  clear_in = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  clear_in = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  clear_in = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  clear_in = nwp2sbu_eop;
	end
      NWP2SBU_EOP_TEMP:
	begin
	  clear_in = nwp2sbu_eop_temp;
	end
      SBU2CXPFIFO_SOP:
	begin
	  clear_in = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  clear_in = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  clear_in = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  clear_in = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  clear_in = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  clear_in = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  clear_in = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  clear_in = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  clear_in = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  clear_in = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  clear_in = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  clear_in = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  clear_in = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  clear_in = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  clear_in = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  clear_in = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  clear_in = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  clear_in = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  clear_in = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  clear_in = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  clear_in = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  clear_in = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  clear_in = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  clear_in = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  clear_in = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  clear_in = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  clear_in = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  clear_in = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  clear_in = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  clear_in = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  clear_in = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  clear_in = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  clear_in = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  clear_in = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  clear_in = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  clear_in = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  clear_in = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  clear_in = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  clear_in = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  clear_in = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  clear_in = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  clear_in = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  clear_in = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  clear_in = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  clear_in = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  clear_in = dram_test_enabled;
	end
      CLB0_OUT:
	begin
	  clear_in = clb0_out;
	end
      CLB1_OUT:
	begin
	  clear_in = clb1_out;
	end
      CLB0_START:
	begin
	  clear_in = clb0_events[0];
	end
      CLB0_MID:
	begin
	  clear_in = clb0_events[1];
	end
      CLB0_END:
	begin
	  clear_in = clb0_events[2];
	end
      CLB1_START:
	begin
	  clear_in = clb1_events[0];
	end
      CLB1_MID:
	begin
	  clear_in = clb1_events[1];
	end
      CLB1_END:
	begin
	  clear_in = clb1_events[2];
	end
      CLB0_OUT_ON:
	begin
	  clear_in = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  clear_in = clb0_out_off;
	end
      CLB1_OUT_ON:
	begin
	  clear_in = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  clear_in = clb1_out_off;
	end
      CLB2_OUT:
	begin
	  clear_in = clb2_out;
	end
      CLB2_START:
	begin
	  clear_in = clb2_events[0];
	end
      CLB2_MID:
	begin
	  clear_in = clb2_events[1];
	end
      CLB2_END:
	begin
	  clear_in = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  clear_in = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  clear_in = clb2_out_off;
	end
      CLB3_OUT:
	begin
	  clear_in = clb3_out;
	end
      CLB3_START:
	begin
	  clear_in = clb3_events[0];
	end
      CLB3_MID:
	begin
	  clear_in = clb3_events[1];
	end
      CLB3_END:
	begin
	  clear_in = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  clear_in = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  clear_in = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  clear_in = stream0_match;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  clear_in = stream0_sample;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  clear_in = stream1_match;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  clear_in = stream1_sample;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  clear_in = stream2_match;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  clear_in = stream2_sample;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  clear_in = stream3_match;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  clear_in = stream3_sample;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  clear_in = stream0_merged;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  clear_in = stream1_merged;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  clear_in = stream2_merged;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  clear_in = stream3_merged;
	end
      SIGMON_ENABLED:
	begin
	  clear_in = sigmon_enable_event;
	end
      default: begin
	clear_in = 1'b0;;
      end
    endcase

    //counter event input:
    case (events_select[23:16]) 
      NO_EVENT:
	begin
	  event_in = 1'b0;
	end
      EVENT_TRUE:
	begin
	  event_in = 1'b1;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  event_in = timestamp_counter_24toggle;
	end
      EVENT_FALSE:
	begin
	  event_in = 1'b0;
	end
      SBU2NWPFIFO_SOP:
	begin
	  event_in = sbu2nwpfifo_sop;
	end
      SBU2NWPFIFO_EOP:
	begin
	  event_in = sbu2nwpfifo_eop;
	end
      SBU2NWP_SOP:
	begin
	  event_in = sbu2nwp_sop;
	end
      SBU2NWP_EOP:
	begin
	  event_in = sbu2nwp_eop;
	end
      NWP2SBU_SOP:
	begin
	  event_in = nwp2sbu_sop;
	end
      NWP2SBU_EOP:
	begin
	  event_in = nwp2sbu_eop;
	end
      NWP2SBU_EOP_TEMP:
	begin
	  event_in = nwp2sbu_eop_temp;
	end
      SBU2CXPFIFO_SOP:
	begin
	  event_in = sbu2cxpfifo_sop;
	end
      SBU2CXPFIFO_EOP:
	begin
	  event_in = sbu2cxpfifo_eop;
	end
      SBU2CXP_SOP:
	begin
	  event_in = sbu2cxp_sop;
	end
      SBU2CXP_EOP:
	begin
	  event_in = sbu2cxp_eop;
	end
      CXP2SBU_SOP:
	begin
	  event_in = cxp2sbu_sop;
	end
      CXP2SBU_EOP:
	begin
	  event_in = cxp2sbu_eop;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  event_in = nwp2sbu_lossless_credits_on;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  event_in = nwp2sbu_lossless_credits_off;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  event_in = cxp2sbu_lossless_credits_on;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  event_in = cxp2sbu_lossless_credits_off;
	end
      NICA_EVENT0:
	begin
	  event_in = nica_events[0];
	end
      NICA_EVENT1:
	begin
	  event_in = nica_events[1];
	end
      NICA_EVENT2:
	begin
	  event_in = nica_events[2];
	end
      NICA_EVENT3:
	begin
	  event_in = nica_events[3];
	end
      NICA_EVENT4:
	begin
	  event_in = nica_events[4];
	end
      NICA_EVENT5:
	begin
	  event_in = nica_events[5];
	end
      NICA_EVENT6:
	begin
	  event_in = nica_events[6];
	end
      NICA_EVENT7:
	begin
	  event_in = nica_events[7];
	end
      NICA_EVENT8:
	begin
	  event_in = nica_events[8];
	end
      NICA_EVENT9:
	begin
	  event_in = nica_events[9];
	end
      NICA_EVENT10:
	begin
	  event_in = nica_events[10];
	end
      NICA_EVENT11:
	begin
	  event_in = nica_events[11];
	end
      NICA_EVENT12:
	begin
	  event_in = nica_events[12];
	end
      NICA_EVENT13:
	begin
	  event_in = nica_events[13];
	end
      NICA_EVENT14:
	begin
	  event_in = nica_events[14];
	end
      NICA_EVENT15:
	begin
	  event_in = nica_events[15];
	end
      LOCAL_EVENT0:
	begin
	  event_in = count_events[0];
	end
      LOCAL_EVENT1:
	begin
	  event_in = count_events[1];
	end
      LOCAL_EVENT2:
	begin
	  event_in = count_events[2];
	end
      LOCAL_EVENT3:
	begin
	  event_in = count_events[3];
	end
      LOCAL_EVENT4:
	begin
	  event_in = count_events[4];
	end
      LOCAL_EVENT5:
	begin
	  event_in = count_events[5];
	end
      LOCAL_EVENT6:
	begin
	  event_in = count_events[6];
	end
      LOCAL_EVENT7:
	begin
	  event_in = count_events[7];
	end
      LOCAL_EVENT8:
	begin
	  event_in = count_events[8];
	end
      LOCAL_EVENT9:
	begin
	  event_in = count_events[9];
	end
      LOCAL_EVENT10:
	begin
	  event_in = count_events[10];
	end
      LOCAL_EVENT11:
	begin
	  event_in = count_events[11];
	end
      DRAM_IK_WADDR:
	begin
	  event_in = got_ikwaddr;
	end
      DRAM_IK_RADDR:
	begin
	  event_in = got_ikraddr;
	end
      DRAM_WADDR:
	begin
	  event_in = got_ddrwaddr;
	end
      DRAM_WDATA:
	begin
	  event_in = got_ddrwdata;
	end
      DRAM_WDONE:
	begin
	  event_in = got_ddrwdone;
	end
      DRAM_RADDR:
	begin
	  event_in = got_ddrraddr;
	end
      DRAM_RDATA:
	begin
	  event_in = got_ddrrdata;
	end
      DRAM_TEST_ENABLE:
	begin
	  event_in = dram_test_enabled;
	end
      CLB0_OUT:
	begin
	  event_in = clb0_out;
	end
      CLB1_OUT:
	begin
	  event_in = clb1_out;
	end
      CLB0_START:
	begin
	  event_in = clb0_events[0];
	end
      CLB0_MID:
	begin
	  event_in = clb0_events[1];
	end
      CLB0_END:
	begin
	  event_in = clb0_events[2];
	end
      CLB1_START:
	begin
	  event_in = clb1_events[0];
	end
      CLB1_MID:
	begin
	  event_in = clb1_events[1];
	end
      CLB1_END:
	begin
	  event_in = clb1_events[2];
	end
      CLB0_OUT_ON:
	begin
	  event_in = clb0_out_on;
	end
      CLB0_OUT_OFF:
	begin
	  event_in = clb0_out_off;
	end
      CLB1_OUT_ON:
	begin
	  event_in = clb1_out_on;
	end
      CLB1_OUT_OFF:
	begin
	  event_in = clb1_out_off;
	end
      CLB2_OUT:
	begin
	  event_in = clb2_out;
	end
      CLB2_START:
	begin
	  event_in = clb2_events[0];
	end
      CLB2_MID:
	begin
	  event_in = clb2_events[1];
	end
      CLB2_END:
	begin
	  event_in = clb2_events[2];
	end
      CLB2_OUT_ON:
	begin
	  event_in = clb2_out_on;
	end
      CLB2_OUT_OFF:
	begin
	  event_in = clb2_out_off;
	end
      CLB3_OUT:
	begin
	  event_in = clb3_out;
	end
      CLB3_START:
	begin
	  event_in = clb3_events[0];
	end
      CLB3_MID:
	begin
	  event_in = clb3_events[1];
	end
      CLB3_END:
	begin
	  event_in = clb3_events[2];
	end
      CLB3_OUT_ON:
	begin
	  event_in = clb3_out_on;
	end
      CLB3_OUT_OFF:
	begin
	  event_in = clb3_out_off;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  event_in = stream0_match;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  event_in = stream0_sample;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  event_in = stream1_match;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  event_in = stream1_sample;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  event_in = stream2_match;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  event_in = stream2_sample;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  event_in = stream3_match;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  event_in = stream3_sample;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  event_in = stream0_merged;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  event_in = stream1_merged;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  event_in = stream2_merged;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  event_in = stream3_merged;
	end
      SIGMON_ENABLED:
	begin
	  event_in = sigmon_enable_event;
	end
      default: begin
	event_in = 1'b0;
      end
    endcase
  end

  reg 		       counter_enable_asserted;
  reg 		       counter_enable_assertedQ;
  reg 		       event_count_enabled;
  reg 		       event_outQ;
  reg [31:0] 	       event_counter1;
  reg [31:0] 	       event_counter2;
  reg [31:0] 	       count_outQ;
  wire [7:0] 	       counter_mode;
  reg 		       event_out_asserted;
  
  assign count_out = count_outQ;
  assign event_out = event_outQ;
  assign counter_mode = events_select[31:24];

// Look for counter_enable assertion
always @(posedge clk) begin
  if (reset) begin
    counter_enable_asserted <= 0;
    counter_enable_assertedQ <= 0;
  end
  else begin
    counter_enable_assertedQ <= counter_enable;

    if (counter_enable & ~counter_enable_assertedQ)
      counter_enable_asserted <= 1;
    else 
      counter_enable_asserted <= 0;
  end
end

always @(posedge clk) begin
  if (reset | counter_enable_asserted) begin
    event_outQ <= 0;
    event_counter1 <= 0;
    event_counter2 <= 0;
    event_count_enabled <= 1'b0;
    event_out_asserted <= 1'b0;
  end
  else begin

    if (counter_mode == SINGLE_EVENT_COUNT_NOLIMIT) begin
      // Count num of event_in occurrences
      if (enable_in)
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled & event_in) begin
	  event_counter1 <= event_counter1 + 1;
      end

      count_outQ <= event_counter1;
    end    

    else if (counter_mode == SINGLE_EVENT_COUNT_LIMIT) begin
      // Count num of event_in occurrences. Assert count_event if count > LIMIT
      // count_limit is considered only if non zero.
      if (enable_in & ~event_out_asserted)
	// Only first assertion of enable_in is onsidered
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled) begin
	if ((count_limit > 0) & (event_counter1 >= count_limit)) begin
	  
	  event_outQ <= 1'b1;
	  event_out_asserted <= 1'b1;
	  event_count_enabled <= 1'b0;
	end
	else if (event_in)
	  event_counter1 <= event_counter1 + 1;
      end

      count_outQ <= event_counter1;
    end
    
    else if (counter_mode == REPEAT_COUNT_LIMIT) begin
      // Count num of event_in occurrences. Assert count_event if count > LIMIT
      // Repeat counting, once count_event occurred
      // count_limit is considered only if non zero.
      if (enable_in)
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled) begin
	if (clear_in) begin
	  event_count_enabled <= 1'b0;
	end
	else if ((count_limit > 0) & (event_counter1 >= count_limit)) begin
	  
	  event_outQ <= 1'b1;
//	  event_count_enabled <= 1'b0;
	  event_counter1 <= 0;
	end
	else if (event_in)
	  event_counter1 <= event_counter1 + 1;
      end
      // Notice that counter1 is cleared once count_event has occurred.
      count_outQ <= event_counter1;
    end
    
    else if (counter_mode == DUAL_EVENTS_COUNT_LIMIT) begin
      // Count num of both event_in & clear_in occurrences. Assert count_event if both_counts_sum > LIMIT
      // count_limit is considered only if non zero.
      if (enable_in)
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled) begin
	if ((count_limit > 0) & (event_counter1 + event_counter2 >= count_limit)) begin
	  event_outQ <= 1'b1;
	  event_count_enabled <= 1'b0;
	end
	else begin
	  event_counter1 <= event_in ?  event_counter1 + 1 : event_counter1;
	  event_counter2 <= clear_in ?  event_counter2 + 1 : event_counter2;
	end
      end

      count_outQ <= event_counter1 + event_counter2;
    end
    
    else if (counter_mode == WINDOW_COUNT_LIMIT) begin
      // Count num of event_in between enable_in and clear_in. Assert count_event if count > LIMIT	  
      // count_limit is considered only if non zero.
      if (enable_in)
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled) begin
	if (clear_in) begin
	  event_count_enabled <= 1'b0;
	end
	else if ((count_limit > 0) & (event_counter1 >= count_limit)) begin
	  event_outQ <= 1'b1;
	  event_count_enabled <= 1'b0;
	  event_counter1 <= 0;
	end
	else begin
	  event_counter1 <= event_in ?  event_counter1 + 1 : event_counter1;
	end
      end
      // Notice that counter1 is cleared once count_event has occurred.
      count_outQ <= event_counter1;
    end
    
    else if (counter_mode == DUAL_EVENTS_LATENCY) begin
      // Count num of event_in occurrences, and clear counter upon clear_in. Assert count_event if count > LIMIT
      // count_limit is considered only if non zero.
      if (enable_in)
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled) begin
	if (clear_in) begin
	  event_counter1 <= 0;
	  event_count_enabled <= 1'b0;
	end
	else if ((count_limit > 0) & (event_counter1 >= count_limit)) begin
	  
	  event_outQ <= 1'b1;
	  event_count_enabled <= 1'b0;
	  event_counter1 <= 0;
	end
	else begin
	  event_counter1 <= event_in ?  event_counter1 + 1 : event_counter1;
	end
      end
      count_outQ <= event_counter1;
    end
    
    else if (counter_mode == DUAL_EVENTS_BALANCE) begin
      // Separately count num of event_in & clear_in occurrences in counter1 & counter2, respectively.
      // Assert count_event if counter2>counter1 or counter1-counter2 > LIMIT
      // count_limit is considered only if non zero.
      if (enable_in)
	event_count_enabled <= 1'b1;
      
      if (event_count_enabled) begin
	if ((count_limit > 0) & ((event_counter2 > event_counter1) | ((event_counter1 - event_counter2) >= count_limit))) begin
	  event_outQ <= 1'b1;
	  event_count_enabled <= 1'b0;
	  event_counter1 <= 0;
	  event_counter2 <= 0;
	end
	else begin
	  event_counter1 <= event_in ?  event_counter1 + 1 : event_counter1;
	  event_counter2 <= clear_in ?  event_counter2 + 1 : event_counter2;
	end
      end

      count_outQ <= event_counter1 + event_counter2;
    end
    
    else begin
      // do nothing
    end
    
    if (event_outQ)
      event_outQ <= 1'b0;
  end
end

endmodule
