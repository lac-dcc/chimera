// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module OnlineFuzzification(
  input        clock,
  input        reset,
  input        io_start,
  input        io_inputs_0,
  input        io_inputs_1,
  input        io_lutConnections_0,
  input        io_lutConnections_1,
  input        io_lutConnections_2,
  input        io_lutConnections_3,
  input        io_lutConnections_4,
  input        io_lutConnections_5,
  input        io_lutConnections_6,
  input        io_lutConnections_7,
  input        io_lutConnections_8,
  input        io_lutConnections_9,
  output       io_outResultValid,
  output [2:0] io_outResult
);
  wire  minMaxTree_clock; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_reset; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_start; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in1_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in1_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in1_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in1_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in1_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in1_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in2_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in2_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in2_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in2_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in2_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_in2_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_io_outResultValid; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_clock; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_reset; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_start; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in1_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in1_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in1_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in1_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in1_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in1_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in2_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in2_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in2_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in2_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in2_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_in2_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_1_io_outResultValid; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_clock; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_reset; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_start; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in1_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in1_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in1_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in1_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in1_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in1_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in2_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in2_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in2_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in2_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in2_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_in2_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_2_io_outResultValid; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_clock; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_reset; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_start; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in1_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in1_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in1_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in1_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in1_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in1_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in2_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in2_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in2_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in2_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in2_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_in2_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_3_io_outResultValid; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_clock; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_reset; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_start; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in1_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in1_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in1_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in1_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in1_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in1_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in2_0; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in2_1; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in2_2; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in2_3; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in2_4; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_in2_5; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  minMaxTree_4_io_outResultValid; // @[min_max_parallel_online_comparator.scala 237:28]
  reg  regLutResultsVec_0; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_1; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_2; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_3; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_4; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_5; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_6; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_7; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_8; // @[online_fuzzification.scala 52:29]
  reg  regLutResultsVec_9; // @[online_fuzzification.scala 52:29]
  reg  regMinMaxTreeResultsValidVec_0; // @[online_fuzzification.scala 242:10]
  reg  regMinMaxTreeResultsValidVec_1; // @[online_fuzzification.scala 242:10]
  reg  regMinMaxTreeResultsValidVec_2; // @[online_fuzzification.scala 242:10]
  reg  regMinMaxTreeResultsValidVec_3; // @[online_fuzzification.scala 242:10]
  reg  regMinMaxTreeResultsValidVec_4; // @[online_fuzzification.scala 242:10]
  wire  _outResult_T = regMinMaxTreeResultsValidVec_0 & regMinMaxTreeResultsValidVec_1; // @[online_fuzzification.scala 297:50]
  wire  _outResult_T_2 = _outResult_T & regMinMaxTreeResultsValidVec_2 & regMinMaxTreeResultsValidVec_3; // @[online_fuzzification.scala 299:41]
  wire  _outResult_T_3 = _outResult_T_2 & regMinMaxTreeResultsValidVec_4; // @[online_fuzzification.scala 301:7]
  MinMaxParallelOnlineComparator minMaxTree ( // @[min_max_parallel_online_comparator.scala 237:28]
    .clock(minMaxTree_clock),
    .reset(minMaxTree_reset),
    .io_start(minMaxTree_io_start),
    .io_in1_0(minMaxTree_io_in1_0),
    .io_in1_1(minMaxTree_io_in1_1),
    .io_in1_2(minMaxTree_io_in1_2),
    .io_in1_3(minMaxTree_io_in1_3),
    .io_in1_4(minMaxTree_io_in1_4),
    .io_in1_5(minMaxTree_io_in1_5),
    .io_in2_0(minMaxTree_io_in2_0),
    .io_in2_1(minMaxTree_io_in2_1),
    .io_in2_2(minMaxTree_io_in2_2),
    .io_in2_3(minMaxTree_io_in2_3),
    .io_in2_4(minMaxTree_io_in2_4),
    .io_in2_5(minMaxTree_io_in2_5),
    .io_outResultValid(minMaxTree_io_outResultValid)
  );
  MinMaxParallelOnlineComparator minMaxTree_1 ( // @[min_max_parallel_online_comparator.scala 237:28]
    .clock(minMaxTree_1_clock),
    .reset(minMaxTree_1_reset),
    .io_start(minMaxTree_1_io_start),
    .io_in1_0(minMaxTree_1_io_in1_0),
    .io_in1_1(minMaxTree_1_io_in1_1),
    .io_in1_2(minMaxTree_1_io_in1_2),
    .io_in1_3(minMaxTree_1_io_in1_3),
    .io_in1_4(minMaxTree_1_io_in1_4),
    .io_in1_5(minMaxTree_1_io_in1_5),
    .io_in2_0(minMaxTree_1_io_in2_0),
    .io_in2_1(minMaxTree_1_io_in2_1),
    .io_in2_2(minMaxTree_1_io_in2_2),
    .io_in2_3(minMaxTree_1_io_in2_3),
    .io_in2_4(minMaxTree_1_io_in2_4),
    .io_in2_5(minMaxTree_1_io_in2_5),
    .io_outResultValid(minMaxTree_1_io_outResultValid)
  );
  MinMaxParallelOnlineComparator minMaxTree_2 ( // @[min_max_parallel_online_comparator.scala 237:28]
    .clock(minMaxTree_2_clock),
    .reset(minMaxTree_2_reset),
    .io_start(minMaxTree_2_io_start),
    .io_in1_0(minMaxTree_2_io_in1_0),
    .io_in1_1(minMaxTree_2_io_in1_1),
    .io_in1_2(minMaxTree_2_io_in1_2),
    .io_in1_3(minMaxTree_2_io_in1_3),
    .io_in1_4(minMaxTree_2_io_in1_4),
    .io_in1_5(minMaxTree_2_io_in1_5),
    .io_in2_0(minMaxTree_2_io_in2_0),
    .io_in2_1(minMaxTree_2_io_in2_1),
    .io_in2_2(minMaxTree_2_io_in2_2),
    .io_in2_3(minMaxTree_2_io_in2_3),
    .io_in2_4(minMaxTree_2_io_in2_4),
    .io_in2_5(minMaxTree_2_io_in2_5),
    .io_outResultValid(minMaxTree_2_io_outResultValid)
  );
  MinMaxParallelOnlineComparator minMaxTree_3 ( // @[min_max_parallel_online_comparator.scala 237:28]
    .clock(minMaxTree_3_clock),
    .reset(minMaxTree_3_reset),
    .io_start(minMaxTree_3_io_start),
    .io_in1_0(minMaxTree_3_io_in1_0),
    .io_in1_1(minMaxTree_3_io_in1_1),
    .io_in1_2(minMaxTree_3_io_in1_2),
    .io_in1_3(minMaxTree_3_io_in1_3),
    .io_in1_4(minMaxTree_3_io_in1_4),
    .io_in1_5(minMaxTree_3_io_in1_5),
    .io_in2_0(minMaxTree_3_io_in2_0),
    .io_in2_1(minMaxTree_3_io_in2_1),
    .io_in2_2(minMaxTree_3_io_in2_2),
    .io_in2_3(minMaxTree_3_io_in2_3),
    .io_in2_4(minMaxTree_3_io_in2_4),
    .io_in2_5(minMaxTree_3_io_in2_5),
    .io_outResultValid(minMaxTree_3_io_outResultValid)
  );
  MinMaxParallelOnlineComparator minMaxTree_4 ( // @[min_max_parallel_online_comparator.scala 237:28]
    .clock(minMaxTree_4_clock),
    .reset(minMaxTree_4_reset),
    .io_start(minMaxTree_4_io_start),
    .io_in1_0(minMaxTree_4_io_in1_0),
    .io_in1_1(minMaxTree_4_io_in1_1),
    .io_in1_2(minMaxTree_4_io_in1_2),
    .io_in1_3(minMaxTree_4_io_in1_3),
    .io_in1_4(minMaxTree_4_io_in1_4),
    .io_in1_5(minMaxTree_4_io_in1_5),
    .io_in2_0(minMaxTree_4_io_in2_0),
    .io_in2_1(minMaxTree_4_io_in2_1),
    .io_in2_2(minMaxTree_4_io_in2_2),
    .io_in2_3(minMaxTree_4_io_in2_3),
    .io_in2_4(minMaxTree_4_io_in2_4),
    .io_in2_5(minMaxTree_4_io_in2_5),
    .io_outResultValid(minMaxTree_4_io_outResultValid)
  );
  assign io_outResultValid = 1'h0; // @[online_fuzzification.scala 302:20 84:29]
  assign io_outResult = io_start ? {{2'd0}, _outResult_T_3} : 3'h0; // @[online_fuzzification.scala 297:15 84:29]
  assign minMaxTree_clock = clock;
  assign minMaxTree_reset = reset;
  assign minMaxTree_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_io_in1_0 = regLutResultsVec_0; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_io_in1_1 = regLutResultsVec_0; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_io_in1_2 = regLutResultsVec_0; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_io_in1_3 = regLutResultsVec_1; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_io_in1_4 = 1'h0; // @[online_fuzzification.scala 255:{30,30}]
  assign minMaxTree_io_in1_5 = 1'h0; // @[online_fuzzification.scala 255:{30,30}]
  assign minMaxTree_io_in2_0 = regLutResultsVec_5; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_io_in2_1 = regLutResultsVec_6; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_io_in2_2 = regLutResultsVec_7; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_io_in2_3 = regLutResultsVec_5; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_io_in2_4 = 1'h0; // @[online_fuzzification.scala 256:{30,30}]
  assign minMaxTree_io_in2_5 = 1'h0; // @[online_fuzzification.scala 256:{30,30}]
  assign minMaxTree_1_clock = clock;
  assign minMaxTree_1_reset = reset;
  assign minMaxTree_1_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_1_io_in1_0 = regLutResultsVec_0; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_1_io_in1_1 = regLutResultsVec_0; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_1_io_in1_2 = regLutResultsVec_1; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_1_io_in1_3 = regLutResultsVec_1; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_1_io_in1_4 = regLutResultsVec_1; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_1_io_in1_5 = regLutResultsVec_2; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_1_io_in2_0 = regLutResultsVec_8; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_1_io_in2_1 = regLutResultsVec_9; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_1_io_in2_2 = regLutResultsVec_6; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_1_io_in2_3 = regLutResultsVec_7; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_1_io_in2_4 = regLutResultsVec_8; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_1_io_in2_5 = regLutResultsVec_5; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_2_clock = clock;
  assign minMaxTree_2_reset = reset;
  assign minMaxTree_2_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_2_io_in1_0 = regLutResultsVec_1; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_2_io_in1_1 = regLutResultsVec_2; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_2_io_in1_2 = regLutResultsVec_2; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_2_io_in1_3 = regLutResultsVec_3; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_2_io_in1_4 = 1'h0; // @[online_fuzzification.scala 255:{30,30}]
  assign minMaxTree_2_io_in1_5 = 1'h0; // @[online_fuzzification.scala 255:{30,30}]
  assign minMaxTree_2_io_in2_0 = regLutResultsVec_9; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_2_io_in2_1 = regLutResultsVec_6; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_2_io_in2_2 = regLutResultsVec_7; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_2_io_in2_3 = regLutResultsVec_5; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_2_io_in2_4 = 1'h0; // @[online_fuzzification.scala 256:{30,30}]
  assign minMaxTree_2_io_in2_5 = 1'h0; // @[online_fuzzification.scala 256:{30,30}]
  assign minMaxTree_3_clock = clock;
  assign minMaxTree_3_reset = reset;
  assign minMaxTree_3_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_3_io_in1_0 = regLutResultsVec_2; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_3_io_in1_1 = regLutResultsVec_2; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_3_io_in1_2 = regLutResultsVec_3; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_3_io_in1_3 = regLutResultsVec_3; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_3_io_in1_4 = regLutResultsVec_4; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_3_io_in1_5 = regLutResultsVec_4; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_3_io_in2_0 = regLutResultsVec_8; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_3_io_in2_1 = regLutResultsVec_9; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_3_io_in2_2 = regLutResultsVec_6; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_3_io_in2_3 = regLutResultsVec_7; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_3_io_in2_4 = regLutResultsVec_5; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_3_io_in2_5 = regLutResultsVec_6; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_4_clock = clock;
  assign minMaxTree_4_reset = reset;
  assign minMaxTree_4_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_4_io_in1_0 = regLutResultsVec_3; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_4_io_in1_1 = regLutResultsVec_3; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_4_io_in1_2 = regLutResultsVec_4; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_4_io_in1_3 = regLutResultsVec_4; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_4_io_in1_4 = regLutResultsVec_4; // @[online_fuzzification.scala 255:30 263:30]
  assign minMaxTree_4_io_in1_5 = 1'h0; // @[online_fuzzification.scala 255:{30,30}]
  assign minMaxTree_4_io_in2_0 = regLutResultsVec_8; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_4_io_in2_1 = regLutResultsVec_9; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_4_io_in2_2 = regLutResultsVec_7; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_4_io_in2_3 = regLutResultsVec_8; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_4_io_in2_4 = regLutResultsVec_9; // @[online_fuzzification.scala 256:30 265:30]
  assign minMaxTree_4_io_in2_5 = 1'h0; // @[online_fuzzification.scala 256:{30,30}]
  always @(posedge clock) begin
    regLutResultsVec_0 <= io_lutConnections_0; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_1 <= io_lutConnections_1; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_2 <= io_lutConnections_2; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_3 <= io_lutConnections_3; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_4 <= io_lutConnections_4; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_5 <= io_lutConnections_5; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_6 <= io_lutConnections_6; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_7 <= io_lutConnections_7; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_8 <= io_lutConnections_8; // @[online_fuzzification.scala 78:22]
    regLutResultsVec_9 <= io_lutConnections_9; // @[online_fuzzification.scala 78:22]
    regMinMaxTreeResultsValidVec_0 <= minMaxTree_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_1 <= minMaxTree_1_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_2 <= minMaxTree_2_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_3 <= minMaxTree_3_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_4 <= minMaxTree_4_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
  end
endmodule
