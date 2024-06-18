// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

localparam	
// Events selector:
  NO_EVENT = 8'h00,
  EVENT_FALSE = 8'h01,
  EVENT_TRUE = 8'h02,

// axistream interfaces events:

  NWP2SBU_EOP = 8'h10,
  NWP2SBU_SOP = 8'h11,
  NWP2SBU_RDY = 8'h12,
  NWP2SBU_VLD = 8'h13,
  NWP2SBU_LAST = 8'h14,
  NWP2SBU_EOP_TEMP = 8'h15,
// 8'h16 - reserved
  NWP2SBU_LOSSLESS_CREDITS = 8'h17,
  NWP2SBU_LOSSLESS_CREDITS_ON = 8'h18,
  NWP2SBU_LOSSLESS_CREDITS_OFF = 8'h19,

  SBU2NWP_EOP = 8'h20,
  SBU2NWP_SOP = 8'h21,
  SBU2NWP_RDY = 8'h22,
  SBU2NWP_VLD = 8'h23,
  SBU2NWP_LAST = 8'h24,
  SBU2NWPFIFO_EOP = 8'h25,
  SBU2NWPFIFO_SOP = 8'h26,

  CXP2SBU_EOP = 8'h30,
  CXP2SBU_SOP = 8'h31,
  CXP2SBU_RDY = 8'h32,
  CXP2SBU_VLD = 8'h33,
  CXP2SBU_LAST = 8'h34,
// 8'h35 & 8'h36 - reserved
  CXP2SBU_LOSSLESS_CREDITS = 8'h37,
  CXP2SBU_LOSSLESS_CREDITS_ON = 8'h38,
  CXP2SBU_LOSSLESS_CREDITS_OFF = 8'h39,

  SBU2CXP_EOP = 8'h40,
  SBU2CXP_SOP = 8'h41,
  SBU2CXP_RDY = 8'h42,
  SBU2CXP_VLD = 8'h43,
  SBU2CXP_LAST = 8'h44,
  SBU2CXPFIFO_EOP = 8'h45,
  SBU2CXPFIFO_SOP = 8'h46,

// Logic_block0:
  CLB0_OUT = 8'h50,
  CLB0_OUT_ON = 8'h51,
  CLB0_OUT_OFF = 8'h52,
  CLB0_START = 8'h53,
  CLB0_MID = 8'h54,
  CLB0_END = 8'h55,

// Logic_block1:
  CLB1_OUT = 8'h58,
  CLB1_OUT_ON = 8'h59,
  CLB1_OUT_OFF = 8'h5a,
  CLB1_START = 8'h5b,
  CLB1_MID = 8'h5c,
  CLB1_END = 8'h5d,
  
// Logic_block2:
  CLB2_OUT = 8'h60,
  CLB2_OUT_ON = 8'h61,
  CLB2_OUT_OFF = 8'h62,
  CLB2_START = 8'h63,
  CLB2_MID = 8'h64,
  CLB2_END = 8'h65,

// Logic_block3:
  CLB3_OUT = 8'h68,
  CLB3_OUT_ON = 8'h69,
  CLB3_OUT_OFF = 8'h6a,
  CLB3_START = 8'h6b,
  CLB3_MID = 8'h6c,
  CLB3_END = 8'h6d,

// DRAM interface
  DRAM_IK_WADDR = 8'h70,
  DRAM_WADDR = 8'h71,
  DRAM_WADDR_RDY = 8'h72,
  DRAM_WADDR_VLD = 8'h73,

  DRAM_WDATA = 8'h74,
  DRAM_WDATA_RDY = 8'h75,
  DRAM_WDATA_VLD = 8'h76,
  DRAM_WDATA_LAST = 8'h77,

  DRAM_WDONE = 8'h78,
  DRAM_WDONE_RDY = 8'h79,
  DRAM_WDONE_VLD = 8'h7a,

  DRAM_IK_RADDR = 8'h7b,
  DRAM_RADDR = 8'h7c,
  DRAM_RADDR_RDY = 8'h7d,
  DRAM_RADDR_VLD = 8'h7e,

  DRAM_RDATA = 8'h80,
  DRAM_RDATA_RDY = 8'h81,
  DRAM_RDATA_VLD = 8'h82,
  DRAM_RDATA_LAST = 8'h83,

// Counters events:
  LOCAL_EVENT0 = 8'ha0,
  LOCAL_EVENT1 = 8'ha1,
  LOCAL_EVENT2 = 8'ha2,
  LOCAL_EVENT3 = 8'ha3,
  LOCAL_EVENT4 = 8'ha4,
  LOCAL_EVENT5 = 8'ha5,
  LOCAL_EVENT6 = 8'ha6,
  LOCAL_EVENT7 = 8'ha7,
  LOCAL_EVENT8 = 8'ha8,
  LOCAL_EVENT9 = 8'ha9,
  LOCAL_EVENT10 = 8'haa,
  LOCAL_EVENT11 = 8'hab,

// nica & ikernels events:
  NICA_EVENT0 = 8'hb0,
  NICA_EVENT1 = 8'hb1,
  NICA_EVENT2 = 8'hb2,
  NICA_EVENT3 = 8'hb3,
  NICA_EVENT4 = 8'hb4,
  NICA_EVENT5 = 8'hb5,
  NICA_EVENT6 = 8'hb6,
  NICA_EVENT7 = 8'hb7,
  NICA_EVENT8 = 8'hb8,
  NICA_EVENT9 = 8'hb9,
  NICA_EVENT10 = 8'hba,
  NICA_EVENT11 = 8'hbb,
  NICA_EVENT12 = 8'hbc,
  NICA_EVENT13 = 8'hbd,
  NICA_EVENT14 = 8'hbe,
  NICA_EVENT15 = 8'hbf,
  
// Pattern matching/sampling
// Notice the implied events !!! These events cannot be selected.
// The implied events are automatically used by the event_monitor, while recording an STREAMx_PATTERN_SAMPLE event.
// The event_monitor will add STREAM3_PATTERN_SAMPLEH/SAMPLEL samples to the event_fifo, immediately following the STREAMx_PATTERN_SAMPLE time stamp.

// Stream selector:
  NWP2SBU_STREAM = 4'd1,
  SBU2NWP_STREAM = 4'd2,
  CXP2SBU_STREAM = 4'd3,
  SBU2CXP_STREAM = 4'd4,
  IK2MAP_DDR_AW = 4'd5,
  SBU2MLX_DDR_AW = 4'd6,
  IK2MAP_DDR_AR = 4'd7,
  SBU2MLX_DDR_AR = 4'd8,

// Stream match/sample events:
  STREAM0_PATTERN_MATCH = 8'hc0,
  STREAM0_PATTERN_SAMPLE = 8'hc1,
  STREAM0_PATTERN_SAMPLEH = 8'hc2, // Implied event: prepended to upper half (3 bytes) of the sampled pattern
  STREAM0_PATTERN_SAMPLEL = 8'hc3, // Implied event: prepended to lower half (3 bytes) of the sampled pattern
  STREAM0_PATTERN_MERGED = 8'hc4,

  STREAM1_PATTERN_MATCH = 8'hd0,
  STREAM1_PATTERN_SAMPLE = 8'hd1,
  STREAM1_PATTERN_SAMPLEH = 8'hd2, // Implied event: prepended to upper half (3 bytes) of the sampled pattern
  STREAM1_PATTERN_SAMPLEL = 8'hd3, // Implied event: prepended to lower half (3 bytes) of the sampled pattern
  STREAM1_PATTERN_MERGED = 8'hd4,

  STREAM2_PATTERN_MATCH = 8'he0,
  STREAM2_PATTERN_SAMPLE = 8'he1,
  STREAM2_PATTERN_SAMPLEH = 8'he2, // Implied event: prepended to upper half (3 bytes) of the sampled pattern
  STREAM2_PATTERN_SAMPLEL = 8'he3, // Implied event: prepended to lower half (3 bytes) of the sampled pattern
  STREAM2_PATTERN_MERGED = 8'he4,

  STREAM3_PATTERN_MATCH = 8'hf0,
  STREAM3_PATTERN_SAMPLE = 8'hf1,
  STREAM3_PATTERN_SAMPLEH = 8'hf2, // Implied event: prepended to upper half (3 bytes) of the sampled pattern
  STREAM3_PATTERN_SAMPLEL = 8'hf3, // Implied event: prepended to lower half (3 bytes) of the sampled pattern
  STREAM3_PATTERN_MERGED = 8'hf4,
  
// Special events:
  TIMESTAMP_24TOGGLE = 8'hf7,
  TIMESTAMP_HIGH = 8'hf8,          // Implied event: Added to any other event, adding the high timestamp half.
  DRAM_TEST_ENABLE = 8'hfc,
  SIGMON_ENABLED = 8'hff
;
