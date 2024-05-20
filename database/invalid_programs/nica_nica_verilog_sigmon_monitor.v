// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// Event Monitor: Handling a single event
// Gabi Malka, Technion, TCE
// June-2017

module sigmon_monitor (
    input wire 	       clk,
    input wire 	       reset,
    input wire 	       monitor_enable,
    input wire 	       sigmon_enable_event,
    input wire 	       timestamp_counter_24toggle,
    input wire 	       nwp2sbu_sop,
    input wire 	       nwp2sbu_eop,
    input wire 	       sbu2nwp_sop,
    input wire 	       sbu2nwp_eop,
    input wire 	       cxp2sbu_sop,
    input wire 	       cxp2sbu_eop,
    input wire 	       sbu2cxp_sop,
    input wire 	       sbu2cxp_eop,
    input wire 	       sbu2cxpfifo_sop,
    input wire 	       sbu2cxpfifo_eop,
    input wire 	       sbu2nwpfifo_sop,
    input wire 	       sbu2nwpfifo_eop,
    input wire 	       nwp2sbu_lossless_credits_on,
    input wire 	       cxp2sbu_lossless_credits_on,
    input wire 	       nwp2sbu_lossless_credits_off,
    input wire 	       cxp2sbu_lossless_credits_off,
    input wire 	       got_ikwaddr,
    input wire 	       got_ikraddr,
    input wire 	       got_ddrwaddr,
    input wire 	       got_ddrwdata,
    input wire 	       got_ddrwdone,
    input wire 	       got_ddrraddr,
    input wire 	       got_ddrrdata,
    input wire         axi4mm_aw_rdy,
    input wire         axi4mm_aw_vld,
    input wire         axi4mm_w_rdy,
    input wire         axi4mm_w_vld,
    input wire         axi4mm_w_last,
    input wire         axi4mm_b_rdy,
    input wire         axi4mm_b_vld,
    input wire         axi4mm_ar_rdy,
    input wire         axi4mm_ar_vld,
    input wire         axi4mm_r_rdy,
    input wire         axi4mm_r_vld,
    input wire         axi4mm_r_last,
    input wire 	       dram_test_enabled,
    input wire [15:0]  nica_events,
    input wire [15:0]  count_events,
    input wire [2:0]   clb0_events,
    input wire [2:0]   clb1_events,
    input wire 	       clb0_out_on,
    input wire 	       clb0_out_off,
    input wire 	       clb1_out_on,
    input wire 	       clb1_out_off,
    input wire [2:0]   clb2_events,
    input wire [2:0]   clb3_events,
    input wire 	       clb2_out_on,
    input wire 	       clb2_out_off,
    input wire 	       clb3_out_on,
    input wire 	       clb3_out_off,
    input wire 	       stream0_match,
    input wire 	       stream0_sample,
    input wire 	       stream1_match,
    input wire 	       stream1_sample,
    input wire 	       stream2_match,
    input wire 	       stream2_sample,
    input wire 	       stream3_match,
    input wire 	       stream3_sample,
    input wire 	       stream0_merged,
    input wire 	       stream1_merged,
    input wire 	       stream2_merged,
    input wire 	       stream3_merged,
    input wire [47:0]  sample0_datain,
    input wire [47:0]  sample1_datain,
    input wire [47:0]  sample2_datain,
    input wire [47:0]  sample3_datain,
		       
    input wire [15:0]  events_id,

    input wire 	       data_read,
    output wire [35:0] data_out, 
    output wire [10:0] data_count, 
    output wire        data_valid,
    output wire        data_loss
);

`include "sigmon_events.v"

  reg 		       event1;
  reg 		       event1_en;
  reg 		       event2;
  reg 		       event2_en;
  reg 		       event_fifo_wr;
  reg [47:0] 	       event_time_counter;
  wire [10:0] 	       event_fifo_data_count;
  wire [35:0] 	       event_fifo_din;
  reg [35:0] 	       event_fifo_dinQ;
  wire [35:0] 	       event_fifo_dout;
  wire 		       event_fifo_valid;
  reg 		       event_fifo_data_lost;
  wire 		       event_fifo_full;
  wire 		       event_fifo_empty;
  wire 		       almost_full,wr_ack,overflow,almost_empty,underflow,wr_rst_busy,rd_rst_busy;
  reg 		       event_counter_enable;
  wire 		       event_fifo_reset;
  reg 		       monitor_enable_asserted;
  reg 		       monitor_enable_assertedQ;
  wire [7:0] 	       event1_id, event2_id;
  reg 		       implied_sample_event1, implied_sample_event2;
  reg [47:0] 	       implied_sample_datain;
  reg 		       implied_timestamp_event;
  reg [23:0] 	       implied_timestamp_datain;
  wire 		       event1_id_is_sample;
  wire 		       event1_id_is_match;
  wire 		       event1_id_is_merged;
  wire 		       event1_id_is_pattern;
  wire 		       event2_id_is_merged;
  wire 		       event2_is_merged;
  wire 		       event_id_is_timestamp_24toggle;
  
  assign data_out = event_fifo_dout;
  assign data_count = event_fifo_data_count;
//  assign fifo_full = event_fifo_full;
  assign event_fifo_reset = reset | monitor_enable_asserted;
  assign event_fifo_din = event_fifo_dinQ;
  assign event1_id = events_id[7:0];
  assign event2_id = events_id[15:8];

  assign event1_id_is_sample = (event1_id == STREAM0_PATTERN_SAMPLE) | (event1_id == STREAM1_PATTERN_SAMPLE) |
			       (event1_id == STREAM2_PATTERN_SAMPLE) | (event1_id == STREAM3_PATTERN_SAMPLE);
  assign event1_id_is_match = (event1_id == STREAM0_PATTERN_MATCH) | (event1_id == STREAM1_PATTERN_MATCH) |
			      (event1_id == STREAM2_PATTERN_MATCH) | (event1_id == STREAM3_PATTERN_MATCH);
  assign event1_id_is_merged = (event1_id == STREAM0_PATTERN_MERGED) | (event1_id == STREAM1_PATTERN_MERGED) |
			       (event1_id == STREAM2_PATTERN_MERGED) | (event1_id == STREAM3_PATTERN_MERGED);
  assign event2_id_is_merged = (event2_id == STREAM0_PATTERN_MERGED) | (event2_id == STREAM1_PATTERN_MERGED) |
			       (event2_id == STREAM2_PATTERN_MERGED) | (event2_id == STREAM3_PATTERN_MERGED);
  assign event2_is_merged = stream0_merged & (event2_id == STREAM0_PATTERN_MERGED) | stream1_merged & (event2_id == STREAM1_PATTERN_MERGED) | 
			    stream2_merged & (event2_id == STREAM2_PATTERN_MERGED) | stream3_merged & (event2_id == STREAM3_PATTERN_MERGED);
  
  assign event1_id_is_pattern = event1_id_is_sample | event1_id_is_match | event1_id_is_merged;

  assign event_id_is_timestamp_24toggle = event1 & event1_en & (event1_id == TIMESTAMP_24TOGGLE) | event2 & event2_en & (event2_id == TIMESTAMP_24TOGGLE);


// Hide fifo_valid while reading last word: (to eliminate an extra read by sigmon_top, causing underflow)
//  assign data_valid = (data_read & (event_fifo_data_count == 1)) ? 1'b0 : event_fifo_valid;
//  assign data_valid = (event_fifo_data_count >= 4) ? event_fifo_valid : 1'b0;
  assign data_valid = event_fifo_valid;

  // there is an event to be written to the fifo, but was not written due to fifo full	
  // data_loss indicates that at least one write to the fifo has been rejected due to fifo full
  // This indicatiion will be cleared only upon next sigmon restart
  assign data_loss = event_fifo_data_lost;
  

//event_mon0
  always @(*) begin
    //event_mon0, first input:
    case (events_id[7:0]) 
      NO_EVENT:
	begin
	  event1 = 1'b0;
	  event1_en = 1'b0;
	  implied_sample_datain = 48'h000000000000;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  event1 = timestamp_counter_24toggle;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      EVENT_FALSE:
	begin
	  event1 = 1'b0;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2NWPFIFO_SOP:
	begin
	  event1 = sbu2nwpfifo_sop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2NWPFIFO_EOP:
	begin
	  event1 = sbu2nwpfifo_eop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2NWP_SOP:
	begin
	  event1 = sbu2nwp_sop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2NWP_EOP:
	begin
	  event1 = sbu2nwp_eop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NWP2SBU_SOP:
	begin
	  event1 = nwp2sbu_sop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NWP2SBU_EOP:
	begin
	  event1 = nwp2sbu_eop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2CXPFIFO_SOP:
	begin
	  event1 = sbu2cxpfifo_sop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2CXPFIFO_EOP:
	begin
	  event1 = sbu2cxpfifo_eop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2CXP_SOP:
	begin
	  event1 = sbu2cxp_sop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SBU2CXP_EOP:
	begin
	  event1 = sbu2cxp_eop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CXP2SBU_SOP:
	begin
	  event1 = cxp2sbu_sop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CXP2SBU_EOP:
	begin
	  event1 = cxp2sbu_eop;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  event1 = nwp2sbu_lossless_credits_on;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  event1 = nwp2sbu_lossless_credits_off;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  event1 = cxp2sbu_lossless_credits_on;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  event1 = cxp2sbu_lossless_credits_off;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT0:
	begin
	  event1 = nica_events[0];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT1:
	begin
	  event1 = nica_events[1];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT2:
	begin
	  event1 = nica_events[2];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT3:
	begin
	  event1 = nica_events[3];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT4:
	begin
	  event1 = nica_events[4];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT5:
	begin
	  event1 = nica_events[5];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT6:
	begin
	  event1 = nica_events[6];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT7:
	begin
	  event1 = nica_events[7];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT8:
	begin
	  event1 = nica_events[8];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT9:
	begin
	  event1 = nica_events[9];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT10:
	begin
	  event1 = nica_events[10];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT11:
	begin
	  event1 = nica_events[11];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT12:
	begin
	  event1 = nica_events[12];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT13:
	begin
	  event1 = nica_events[13];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT14:
	begin
	  event1 = nica_events[14];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      NICA_EVENT15:
	begin
	  event1 = nica_events[15];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT0:
	begin
	  event1 = count_events[0];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT1:
	begin
	  event1 = count_events[1];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT2:
	begin
	  event1 = count_events[2];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT3:
	begin
	  event1 = count_events[3];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT4:
	begin
	  event1 = count_events[4];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT5:
	begin
	  event1 = count_events[5];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT6:
	begin
	  event1 = count_events[6];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT7:
	begin
	  event1 = count_events[7];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT8:
	begin
	  event1 = count_events[8];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT9:
	begin
	  event1 = count_events[9];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT10:
	begin
	  event1 = count_events[10];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      LOCAL_EVENT11:
	begin
	  event1 = count_events[11];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_IK_WADDR:
	begin
	  event1 = got_ikwaddr;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_IK_RADDR:
	begin
	  event1 = got_ikraddr;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WADDR:
	begin
	  event1 = got_ddrwaddr;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WADDR_RDY:
	begin
	  event1 = axi4mm_aw_rdy;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WADDR_VLD:
	begin
	  event1 = axi4mm_aw_vld;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDATA:
	begin
	  event1 = got_ddrwdata;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDATA_VLD:
	begin
	  event1 = axi4mm_w_vld;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDATA_RDY:
	begin
	  event1 = axi4mm_w_rdy;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDATA_LAST:
	begin
	  event1 = axi4mm_w_last;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDONE:
	begin
	  event1 = got_ddrwdone;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDONE_RDY:
	begin
	  event1 = axi4mm_b_rdy;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WDONE_VLD:
	begin
	  event1 = axi4mm_b_vld;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RADDR:
	begin
	  event1 = got_ddrraddr;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RADDR_VLD:
	begin
	  event1 = axi4mm_ar_vld;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RADDR_RDY:
	begin
	  event1 = axi4mm_ar_rdy;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RDATA:
	begin
	  event1 = got_ddrrdata;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RDATA_RDY:
	begin
	  event1 = axi4mm_r_rdy;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RDATA_VLD:
	begin
	  event1 = axi4mm_r_vld;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_RDATA_LAST:
	begin
	  event1 = axi4mm_r_last;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_TEST_ENABLE:
	begin
	  event1 = dram_test_enabled;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB0_START:
	begin
	  event1 = clb0_events[0];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB0_MID:
	begin
	  event1 = clb0_events[1];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB0_END:
	begin
	  event1 = clb0_events[2];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB1_START:
	begin
	  event1 = clb1_events[0];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB1_MID:
	begin
	  event1 = clb1_events[1];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB1_END:
	begin
	  event1 = clb1_events[2];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB0_OUT_ON:
	begin
	  event1 = clb0_out_on;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB0_OUT_OFF:
	begin
	  event1 = clb0_out_off;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB1_OUT_ON:
	begin
	  event1 = clb1_out_on;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB1_OUT_OFF:
	begin
	  event1 = clb1_out_off;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB2_START:
	begin
	  event1 = clb2_events[0];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB2_MID:
	begin
	  event1 = clb2_events[1];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB2_END:
	begin
	  event1 = clb2_events[2];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB3_START:
	begin
	  event1 = clb3_events[0];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB3_MID:
	begin
	  event1 = clb3_events[1];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB3_END:
	begin
	  event1 = clb3_events[2];
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB2_OUT_ON:
	begin
	  event1 = clb2_out_on;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB2_OUT_OFF:
	begin
	  event1 = clb2_out_off;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB3_OUT_ON:
	begin
	  event1 = clb3_out_on;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      CLB3_OUT_OFF:
	begin
	  event1 = clb3_out_off;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM0_PATTERN_MATCH:
	begin
	  event1 = event2_id_is_merged ? stream0_match & event2_is_merged : stream0_match;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM0_PATTERN_SAMPLE:
	begin
	  // When this event is merged with another events, it is possible to record the merged events only when all occur,
	  // rather than recording each event separately, which might pollute the sigmon fifo with too many redundant samples
	  event1 = event2_id_is_merged ? stream0_sample & event2_is_merged : stream0_sample;
	  event1_en = 1'b1;
// Maintain implied_sample_datain contents as long as writing implied data into the monitor fifo is in progress
	  implied_sample_datain = (implied_sample_event1 | implied_sample_event2) ? implied_sample_datain : sample0_datain;
	end
      STREAM1_PATTERN_MATCH:
	begin
	  event1 = event2_id_is_merged ? stream1_match & event2_is_merged : stream1_match;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM1_PATTERN_SAMPLE:
	begin
	  event1 = event2_id_is_merged ? stream1_sample & event2_is_merged : stream1_sample;
	  event1_en = 1'b1;
// Maintain implied_sample_datain contents as long as writing implied data into the monitor fifo is in progress
	  implied_sample_datain = (implied_sample_event1 | implied_sample_event2) ? implied_sample_datain : sample1_datain;
	end
      STREAM2_PATTERN_MATCH:
	begin
	  event1 = event2_id_is_merged ? stream2_match & event2_is_merged : stream2_match;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM2_PATTERN_SAMPLE:
	begin
	  event1 = event2_id_is_merged ? stream2_sample & event2_is_merged : stream2_sample;
	  event1_en = 1'b1;
// Maintain implied_sample_datain contents as long as writing implied data into the monitor fifo is in progress
	  implied_sample_datain = (implied_sample_event1 | implied_sample_event2) ? implied_sample_datain : sample2_datain;
	end
      STREAM3_PATTERN_MATCH:
	begin
	  event1 = event2_id_is_merged ? stream3_match & event2_is_merged : stream3_match;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM3_PATTERN_SAMPLE:
	begin
	  event1 = event2_id_is_merged ? stream3_sample & event2_is_merged : stream3_sample;
	  event1_en = 1'b1;
// Maintain implied_sample_datain contents as long as writing implied data into the monitor fifo is in progress
	  implied_sample_datain = (implied_sample_event1 | implied_sample_event2) ? implied_sample_datain : sample3_datain;
	end
      STREAM0_PATTERN_MERGED:
	begin
	  event1 = stream0_merged;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM1_PATTERN_MERGED:
	begin
	  event1 = stream1_merged;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM2_PATTERN_MERGED:
	begin
	  event1 = stream2_merged;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      STREAM3_PATTERN_MERGED:
	begin
	  event1 = stream3_merged;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      SIGMON_ENABLED:
	begin
	  event1 = sigmon_enable_event;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      default: begin
	event1 = 1'b0;;
	event1_en = 1'b0;
	implied_sample_datain = 48'h000000000000;
      end
    endcase

    //event_mon0, second input:
    case (events_id[15:8]) 
      NO_EVENT:
	begin
	  event2 = 1'b0;
	  event2_en = 1'b0;
	end
      TIMESTAMP_24TOGGLE:
	begin
	  event2 = timestamp_counter_24toggle;
	  event2_en = 1'b1;
	end
      EVENT_FALSE:
	begin
	  event2 = 1'b0;
	  event2_en = 1'b1;
	end
      SBU2NWPFIFO_SOP:
	begin
	  event2 = sbu2nwpfifo_sop;
	  event2_en = 1'b1;
	end
      SBU2NWPFIFO_EOP:
	begin
	  event2 = sbu2nwpfifo_eop;
	  event2_en = 1'b1;
	end
      SBU2NWP_SOP:
	begin
	  event2 = sbu2nwp_sop;
	  event2_en = 1'b1;
	end
      SBU2NWP_EOP:
	begin
	  event2 = sbu2nwp_eop;
	  event2_en = 1'b1;
	end
      NWP2SBU_SOP:
	begin
	  event2 = nwp2sbu_sop;
	  event2_en = 1'b1;
	end
      NWP2SBU_EOP:
	begin
	  event2 = nwp2sbu_eop;
	  event2_en = 1'b1;
	end
      SBU2CXPFIFO_SOP:
	begin
	  event2 = sbu2cxpfifo_sop;
	  event2_en = 1'b1;
	end
      SBU2CXPFIFO_EOP:
	begin
	  event2 = sbu2cxpfifo_eop;
	  event2_en = 1'b1;
	end
      SBU2CXP_SOP:
	begin
	  event2 = sbu2cxp_sop;
	  event2_en = 1'b1;
	end
      SBU2CXP_EOP:
	begin
	  event2 = sbu2cxp_eop;
	  event2_en = 1'b1;
	end
      CXP2SBU_SOP:
	begin
	  event2 = cxp2sbu_sop;
	  event2_en = 1'b1;
	end
      CXP2SBU_EOP:
	begin
	  event2 = cxp2sbu_eop;
	  event2_en = 1'b1;
	end
      NWP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  event2 = nwp2sbu_lossless_credits_on;
	  event2_en = 1'b1;
	end
      NWP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  event2 = nwp2sbu_lossless_credits_off;
	  event2_en = 1'b1;
	end
      CXP2SBU_LOSSLESS_CREDITS_ON:
	begin
	  event2 = cxp2sbu_lossless_credits_on;
	  event2_en = 1'b1;
	end
      CXP2SBU_LOSSLESS_CREDITS_OFF:
	begin
	  event2 = cxp2sbu_lossless_credits_off;
	  event2_en = 1'b1;
	end
      NICA_EVENT0:
	begin
	  event2 = nica_events[0];
	  event2_en = 1'b1;
	end
      NICA_EVENT1:
	begin
	  event2 = nica_events[1];
	  event2_en = 1'b1;
	end
      NICA_EVENT2:
	begin
	  event2 = nica_events[2];
	  event2_en = 1'b1;
	end
      NICA_EVENT3:
	begin
	  event2 = nica_events[3];
	  event2_en = 1'b1;
	end
      NICA_EVENT4:
	begin
	  event2 = nica_events[4];
	  event2_en = 1'b1;
	end
      NICA_EVENT5:
	begin
	  event2 = nica_events[5];
	  event2_en = 1'b1;
	end
      NICA_EVENT6:
	begin
	  event2 = nica_events[6];
	  event2_en = 1'b1;
	end
      NICA_EVENT7:
	begin
	  event2 = nica_events[7];
	  event2_en = 1'b1;
	end
      NICA_EVENT8:
	begin
	  event2 = nica_events[8];
	  event2_en = 1'b1;
	end
      NICA_EVENT9:
	begin
	  event2 = nica_events[9];
	  event2_en = 1'b1;
	end
      NICA_EVENT10:
	begin
	  event2 = nica_events[10];
	  event2_en = 1'b1;
	end
      NICA_EVENT11:
	begin
	  event2 = nica_events[11];
	  event2_en = 1'b1;
	end
      NICA_EVENT12:
	begin
	  event2 = nica_events[12];
	  event2_en = 1'b1;
	end
      NICA_EVENT13:
	begin
	  event2 = nica_events[13];
	  event2_en = 1'b1;
	end
      NICA_EVENT14:
	begin
	  event2 = nica_events[14];
	  event2_en = 1'b1;
	end
      NICA_EVENT15:
	begin
	  event2 = nica_events[15];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT0:
	begin
	  event2 = count_events[0];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT1:
	begin
	  event2 = count_events[1];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT2:
	begin
	  event2 = count_events[2];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT3:
	begin
	  event2 = count_events[3];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT4:
	begin
	  event2 = count_events[4];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT5:
	begin
	  event2 = count_events[5];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT6:
	begin
	  event2 = count_events[6];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT7:
	begin
	  event2 = count_events[7];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT8:
	begin
	  event2 = count_events[8];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT9:
	begin
	  event2 = count_events[9];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT10:
	begin
	  event2 = count_events[10];
	  event2_en = 1'b1;
	end
      LOCAL_EVENT11:
	begin
	  event2 = count_events[11];
	  event2_en = 1'b1;
	end
      DRAM_IK_WADDR:
	begin
	  event1 = got_ikwaddr;
	  event1_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_IK_RADDR:
	begin
	  event2 = got_ikraddr;
	  event2_en = 1'b1;
	  implied_sample_datain = 48'h000000000000;
	end
      DRAM_WADDR:
	begin
	  event2 = got_ddrwaddr;
	  event2_en = 1'b1;
	end
      DRAM_WADDR_RDY:
	begin
	  event2 = axi4mm_aw_rdy;
	  event2_en = 1'b1;
	end
      DRAM_WADDR_VLD:
	begin
	  event2 = axi4mm_aw_vld;
	  event2_en = 1'b1;
	end
      DRAM_WDATA:
	begin
	  event2 = got_ddrwdata;
	  event2_en = 1'b1;
	end
      DRAM_WDATA_VLD:
	begin
	  event2 = axi4mm_w_vld;
	  event2_en = 1'b1;
	end
      DRAM_WDATA_RDY:
	begin
	  event2 = axi4mm_w_rdy;
	  event2_en = 1'b1;
	end
      DRAM_WDATA_LAST:
	begin
	  event2 = axi4mm_w_last;
	  event2_en = 1'b1;
	end
      DRAM_WDONE:
	begin
	  event2 = got_ddrwdone;
	  event2_en = 1'b1;
	end
      DRAM_WDONE_RDY:
	begin
	  event2 = axi4mm_b_rdy;
	  event2_en = 1'b1;
	end
      DRAM_WDONE_VLD:
	begin
	  event2 = axi4mm_b_vld;
	  event2_en = 1'b1;
	end
      DRAM_RADDR:
	begin
	  event2 = got_ddrraddr;
	  event2_en = 1'b1;
	end
      DRAM_RADDR_VLD:
	begin
	  event2 = axi4mm_ar_vld;
	  event2_en = 1'b1;
	end
      DRAM_RADDR_RDY:
	begin
	  event2 = axi4mm_ar_rdy;
	  event2_en = 1'b1;
	end
      DRAM_RDATA:
	begin
	  event2 = got_ddrrdata;
	  event2_en = 1'b1;
	end
      DRAM_RDATA_RDY:
	begin
	  event2 = axi4mm_r_rdy;
	  event2_en = 1'b1;
	end
      DRAM_RDATA_VLD:
	begin
	  event2 = axi4mm_r_vld;
	  event2_en = 1'b1;
	end
      DRAM_RDATA_LAST:
	begin
	  event2 = axi4mm_r_last;
	  event2_en = 1'b1;
	end
      DRAM_TEST_ENABLE:
	begin
	  event2 = dram_test_enabled;
	  event2_en = 1'b1;
	end
      CLB0_START:
	begin
	  event2 = clb0_events[0];
	  event2_en = 1'b1;
	end
      CLB0_MID:
	begin
	  event2 = clb0_events[1];
	  event2_en = 1'b1;
	end
      CLB0_END:
	begin
	  event2 = clb0_events[2];
	  event2_en = 1'b1;
	end
      CLB1_START:
	begin
	  event2 = clb1_events[0];
	  event2_en = 1'b1;
	end
      CLB1_MID:
	begin
	  event2 = clb1_events[1];
	  event2_en = 1'b1;
	end
      CLB1_END:
	begin
	  event2 = clb1_events[2];
	  event2_en = 1'b1;
	end
      CLB0_OUT_ON:
	begin
	  event2 = clb0_out_on;
	  event2_en = 1'b1;
	end
      CLB0_OUT_OFF:
	begin
	  event2 = clb0_out_off;
	  event2_en = 1'b1;
	end
      CLB1_OUT_ON:
	begin
	  event2 = clb1_out_on;
	  event2_en = 1'b1;
	end
      CLB1_OUT_OFF:
	begin
	  event2 = clb1_out_off;
	  event2_en = 1'b1;
	end
      SIGMON_ENABLED:
	begin
	  event2 = sigmon_enable_event;
	  event2_en = 1'b1;
	end
      default: begin
	event2 = 1'b0;;
	event2_en = 1'b0;
      end
    endcase
  end

  
// Look for monitor_enable assertion
always @(posedge clk) begin
  if (reset) begin
    monitor_enable_asserted <= 0;
    monitor_enable_assertedQ <= 0;
    event_counter_enable <= 0;    
  end
  else begin
    monitor_enable_assertedQ <= monitor_enable;

// event_ctrl1[31] assertion is used to reset both time stamp counter and the event_fifo
    if (monitor_enable & ~monitor_enable_assertedQ)
      monitor_enable_asserted <= 1;
    else 
      monitor_enable_asserted <= 0;

// event_time_counter is enabled two clocks after sigmon_monitor is enabled,
// and disabled once monitor_enable has been dropped
    if (monitor_enable_asserted & monitor_enable_assertedQ)
      event_counter_enable <= 1;    
    if (~monitor_enable & monitor_enable_assertedQ)
      event_counter_enable <= 0;    
  end
end

  
  // Time stamp counter:
always @(posedge clk) begin
//  if (reset | monitor_enable_asserted) begin
  if (reset) begin
    event_time_counter <= 48'h000000000000;
  end
  else begin
    if (event_counter_enable) begin
      // What to do upon counter overflow...
      event_time_counter <= event_time_counter + 1;
    end
  end
end

// Write the captured event into the fifo
always @(posedge clk) begin
//  if (reset | monitor_enable_asserted) begin
  if (reset) begin
    event_fifo_wr <= 1'b0;
    event_fifo_data_lost <= 1'b0;
    implied_sample_event1 <= 1'b0;
    implied_sample_event2 <= 1'b0;
    implied_timestamp_event <= 1'b0;
  end
  else begin
    if (event_counter_enable) begin
      if (event1 & event1_en | event2 & event2_en | implied_sample_event1 | implied_sample_event2 | implied_timestamp_event) begin
	if (~event_fifo_full) begin	

	  // Implied events state machine:
	  // Upon occurrence of the regular event PATTERN_SAMPLE, the following sequence will be executed:
	  // 1. A regular timestamp entry, prepended by the PATTERN_SAMPLE code is written to the fifo
	  // 2. An implied entry, PATTERN_SAMPLEH & implied_sample_datain[47:24] (sampled data high_half) is written to the fifo
	  // 3. An implied entry, PATTERN_SAMPLEL & implied_sample_datain[23:0] (sampled data low_half) is written to the fifo
	  if (implied_sample_event1) begin
	    implied_sample_event1 <= 1'b0;
	    implied_sample_event2 <= 1'b1;
	    event_fifo_dinQ[23:0] <= implied_sample_datain[47:24];
	    event_fifo_dinQ[31:24] <= event1_id + 'h01;
	    event_fifo_dinQ[35:32] <= 4'b1000;
	    event_fifo_wr <= 1'b1;
	  end
	  else if (implied_sample_event2) begin
	    implied_sample_event2 <= 1'b0;
	    event_fifo_dinQ[23:0] <= implied_sample_datain[23:0];
	    event_fifo_dinQ[31:24] <= event1_id + 'h02;
	    event_fifo_dinQ[35:32] <= 4'b0000;
	    event_fifo_wr <= 1'b1;
	  end
	  else if (implied_timestamp_event) begin
	    implied_timestamp_event <= 1'b0;
	    event_fifo_dinQ[23:0] <= implied_timestamp_datain[23:0];
	    event_fifo_dinQ[31:24] <= TIMESTAMP_HIGH;
	    event_fifo_dinQ[35:32] <= 4'b0000;
	    event_fifo_wr <= 1'b1;
	  end
	  
	  else begin
	    // A pattern_related event (either of packet match/sample/merged events) is asserted 4 clocks after the related packet EOP event.
	    // In such cases, 4 clocks are deducted from the recorded timestamp, to match the associated EOP event timestamp.
	    event_fifo_dinQ[23:0] <= event_id_is_timestamp_24toggle ? event_time_counter[47:24] : (event1_id_is_pattern ? event_time_counter[23:0] - 24'h000004 : event_time_counter[23:0]);
	    event_fifo_dinQ[31:24] <= (event1) ? events_id[7:0] : events_id[15:8];

	    // Mark the SAMPLE event, to indicate an implied data is following in the event fifo.
	    // To be used while empting this fifo into the sigmon_fifo, to guarantee that the implied data will always be consequtive to the original sample event.
	    if (event1_id_is_sample) begin
	      implied_sample_event1 <= 1'b1;
	      event_fifo_dinQ[35:32] <= 4'b1000;
	    end

	    // Both event selectors are equal: sigmon_monitor interprets this selection by adding the high half timestamp to the fifo
	    // stream_sample events are not allowed (those already have implied data)
	    else if ((event1_id == event2_id) & ~event1_id_is_sample) begin 
	      implied_timestamp_event <= 1'b1;
	      event_fifo_dinQ[35:32] <= 4'b1000;

	      // Adding the high_half timestamp to the fifo in pattern related events:
	      // Upon an event1_id_is_pattern, its recorded timestamp is decreased by 4 (see above), but we should watch for underflow:
	      // If there is an underflow after reducing 4, the recorded high_half timestamp should also be reduced by 1.
	      implied_timestamp_datain[23:0] <= (event1_id_is_pattern & (event_time_counter[23:0] < 24'h000004)) ? (event_time_counter[47:24] - 24'h000001) : event_time_counter[47:24];
	    end
	    
	    else begin
	      implied_sample_event1 <= 1'b0;
	      event_fifo_dinQ[35:32] <= 4'b0000;
	    end
	    implied_sample_event2 <= 1'b0;
	    event_fifo_wr <= 1'b1;
	  end
	  
	end
	else begin
	  // there is an event to be written to the fifo, but cannot written due to fifo full	
	  // We record this indication, to be read by the host via sigmon_status register
	  // This indicatiion will be cleared only upon next sigmon restart
	  event_fifo_data_lost <= 1'b1;
	  event_fifo_wr <= 1'b0;
	end
      end
      
      else
	event_fifo_wr <= 1'b0;
    end

    else
      event_fifo_wr <= 1'b0;
  end
end




////////////////////////////////////////////////////////////////////////////////////////
// Local fifo: 1K x 36bit
//
event_fifo_1Kx36b fifo_1Kx36b (
  .clk(clk),                           // input wire clk
  .srst(event_fifo_reset),             // input wire srst
  .din(event_fifo_din),                // input wire [35 : 0] din
  .wr_en(event_fifo_wr),               // input wire wr_en
  .rd_en(data_read),                   // input wire rd_en
  .dout(event_fifo_dout),              // output wire [35 : 0] dout
  .full(event_fifo_full),              // output wire full
  .almost_full(almost_full),           // output wire almost_full
  .wr_ack(wr_ack),                     // output wire wr_ack
  .overflow(overflow),                 // output wire overflow
  .empty(event_fifo_empty),            // output wire empty
  .almost_empty(almost_empty),         // output wire almost_empty
  .valid(event_fifo_valid),            // output wire valid
  .underflow(underflow),               // output wire underflow
  .data_count(event_fifo_data_count),  // output wire [10 : 0] data_count
  .wr_rst_busy(wr_rst_busy),           // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)            // output wire rd_rst_busy
);

endmodule
