// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// Sigmon Counters & count related events
//
module sigmon_counters 
  (		       
		       input wire 	  clk,
		       input wire 	  reset,
		       input wire 	  counters_enable, 
		       input wire 	  sigmon_enable_event,
		       input wire 	  timestamp_counter_24toggle,
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
		       input wire 	  stream0_merged,
		       input wire 	  stream1_match,
		       input wire 	  stream1_sample,
		       input wire 	  stream1_merged,
		       input wire 	  stream2_match,
		       input wire 	  stream2_sample,
		       input wire 	  stream2_merged,
		       input wire 	  stream3_match,
		       input wire 	  stream3_sample,
		       input wire 	  stream3_merged,
		       input wire [31:0]  events0_select, 
		       input wire [31:0]  count0_limit, 
		       input wire [31:0]  events1_select, 
		       input wire [31:0]  count1_limit, 
		       input wire [31:0]  events2_select, 
		       input wire [31:0]  count2_limit, 
		       input wire [31:0]  events3_select, 
		       input wire [31:0]  count3_limit, 
		       input wire [31:0]  events4_select, 
		       input wire [31:0]  count4_limit, 
		       input wire [31:0]  events5_select, 
		       input wire [31:0]  count5_limit, 
		       input wire [31:0]  events6_select, 
		       input wire [31:0]  count6_limit, 
		       input wire [31:0]  events7_select, 
		       input wire [31:0]  count7_limit, 
		       input wire [31:0]  events8_select, 
		       input wire [31:0]  count8_limit, 
		       input wire [31:0]  events9_select, 
		       input wire [31:0]  count9_limit, 
		       input wire [31:0]  events10_select, 
		       input wire [31:0]  count10_limit, 
		       input wire [31:0]  events11_select, 
		       input wire [31:0]  count11_limit, 
		       output wire [31:0] count0_out,
		       output wire [31:0] count1_out,
		       output wire [31:0] count2_out,
		       output wire [31:0] count3_out,
		       output wire [31:0] count4_out,
		       output wire [31:0] count5_out,
		       output wire [31:0] count6_out,
		       output wire [31:0] count7_out,
		       output wire [31:0] count8_out,
		       output wire [31:0] count9_out,
		       output wire [31:0] count10_out,
		       output wire [31:0] count11_out,
		       output wire [15:0] events_out
);

  
  sigmon_counter  sigmon_counter0
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events0_select),
 .count_limit(count0_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:1], 1'b0}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count0_out), 
 .event_out(events_out[0])
 );

  sigmon_counter  sigmon_counter1
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events1_select),
 .count_limit(count1_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:2], 1'b0, events_out[0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count1_out), 
 .event_out(events_out[1])
 );
  
  sigmon_counter  sigmon_counter2
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events2_select),
 .count_limit(count2_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:3], 1'b0, events_out[1:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count2_out), 
 .event_out(events_out[2])
 );
  
  sigmon_counter  sigmon_counter3
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events3_select),
 .count_limit(count3_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:4], 1'b0, events_out[2:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count3_out), 
 .event_out(events_out[3])
 );

  sigmon_counter  sigmon_counter4
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events4_select),
 .count_limit(count4_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:5], 1'b0, events_out[3:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count4_out), 
 .event_out(events_out[4])
 );
  
  sigmon_counter  sigmon_counter5
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events5_select),
 .count_limit(count5_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:6], 1'b0, events_out[4:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count5_out), 
 .event_out(events_out[5])
 );
  
  sigmon_counter  sigmon_counter6
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events6_select),
 .count_limit(count6_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:7], 1'b0, events_out[5:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count6_out), 
 .event_out(events_out[6])
 );
  
  sigmon_counter  sigmon_counter7
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events7_select),
 .count_limit(count7_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:8], 1'b0, events_out[6:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count7_out), 
 .event_out(events_out[7])
 );
  
  sigmon_counter  sigmon_counter8
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events8_select),
 .count_limit(count8_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:9], 1'b0, events_out[7:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count8_out), 
 .event_out(events_out[8])
 );
  
  sigmon_counter  sigmon_counter9
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events9_select),
 .count_limit(count9_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:10], 1'b0, events_out[8:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count9_out), 
 .event_out(events_out[9])
 );
  
  sigmon_counter  sigmon_counter10
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events10_select),
 .count_limit(count10_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:11], 1'b0, events_out[9:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count10_out), 
 .event_out(events_out[10])
 );
  
  sigmon_counter  sigmon_counter11
(
 .clk(clk),
 .reset(reset),
 .counter_enable(counters_enable),
 .events_select(events11_select),
 .count_limit(count11_limit),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .nwp2sbu_eop_temp(nwp2sbu_eop_temp),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events({events_out[15:12], 1'b0, events_out[10:0]}),
 .clb0_out(clb0_out),
 .clb1_out(clb1_out),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_out(clb2_out),
 .clb3_out(clb3_out),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .count_out(count11_out), 
 .event_out(events_out[11])
 );
  
endmodule
