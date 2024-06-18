// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module OnlineFuzzification(
  input        clock,
  input        reset,
  input        io_start,
  input        io_inputs_0,
  input        io_inputs_1,
  output       io_outResultValid,
  output [2:0] io_outResult,
  input        io_regLutResultsVec_0,
  input        io_regLutResultsVec_1,
  input        io_regLutResultsVec_2,
  input        io_regLutResultsVec_3,
  input        io_regLutResultsVec_4,
  input        io_regLutResultsVec_5,
  input        io_regLutResultsVec_6,
  input        io_regLutResultsVec_7,
  input        io_regLutResultsVec_8,
  input        io_regLutResultsVec_9
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
  wire  minMaxTree_io_outResult; // @[min_max_parallel_online_comparator.scala 237:28]
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
  wire  minMaxTree_1_io_outResult; // @[min_max_parallel_online_comparator.scala 237:28]
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
  wire  minMaxTree_2_io_outResult; // @[min_max_parallel_online_comparator.scala 237:28]
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
  wire  minMaxTree_3_io_outResult; // @[min_max_parallel_online_comparator.scala 237:28]
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
  wire  minMaxTree_4_io_outResult; // @[min_max_parallel_online_comparator.scala 237:28]
  wire  comparatorModule_clock; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_reset; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_start; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_0; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_1; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_2; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_3; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_4; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire [2:0] comparatorModule_io_result; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_resultValid; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  reg  regLutResultsVec_0; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_1; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_2; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_3; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_4; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_5; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_6; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_7; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_8; // @[online_fuzzification.scala 55:29]
  reg  regLutResultsVec_9; // @[online_fuzzification.scala 55:29]
  reg  regMinMaxTreeResultsVec_0; // @[online_fuzzification.scala 248:10]
  reg  regMinMaxTreeResultsVec_1; // @[online_fuzzification.scala 248:10]
  reg  regMinMaxTreeResultsVec_2; // @[online_fuzzification.scala 248:10]
  reg  regMinMaxTreeResultsVec_3; // @[online_fuzzification.scala 248:10]
  reg  regMinMaxTreeResultsVec_4; // @[online_fuzzification.scala 248:10]
  reg  regMinMaxTreeResultsValidVec_0; // @[online_fuzzification.scala 250:10]
  reg  regMinMaxTreeResultsValidVec_1; // @[online_fuzzification.scala 250:10]
  reg  regMinMaxTreeResultsValidVec_2; // @[online_fuzzification.scala 250:10]
  reg  regMinMaxTreeResultsValidVec_3; // @[online_fuzzification.scala 250:10]
  reg  regMinMaxTreeResultsValidVec_4; // @[online_fuzzification.scala 250:10]
  wire  _T_1 = regMinMaxTreeResultsValidVec_0 & regMinMaxTreeResultsValidVec_1; // @[online_fuzzification.scala 306:41]
  wire  _T_3 = _T_1 & regMinMaxTreeResultsValidVec_2 & regMinMaxTreeResultsValidVec_3; // @[online_fuzzification.scala 308:45]
  wire [2:0] result = comparatorModule_io_result; // @[5_input_custom_index_based_max_comparator.scala 184:22 193:12]
  wire  resultValid = comparatorModule_io_resultValid; // @[5_input_custom_index_based_max_comparator.scala 185:27 194:17]
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
    .io_outResultValid(minMaxTree_io_outResultValid),
    .io_outResult(minMaxTree_io_outResult)
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
    .io_outResultValid(minMaxTree_1_io_outResultValid),
    .io_outResult(minMaxTree_1_io_outResult)
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
    .io_outResultValid(minMaxTree_2_io_outResultValid),
    .io_outResult(minMaxTree_2_io_outResult)
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
    .io_outResultValid(minMaxTree_3_io_outResultValid),
    .io_outResult(minMaxTree_3_io_outResult)
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
    .io_outResultValid(minMaxTree_4_io_outResultValid),
    .io_outResult(minMaxTree_4_io_outResult)
  );
  FiveInputCustomIndexBasedMaxComparator comparatorModule ( // @[5_input_custom_index_based_max_comparator.scala 180:34]
    .clock(comparatorModule_clock),
    .reset(comparatorModule_reset),
    .io_start(comparatorModule_io_start),
    .io_inputs_0(comparatorModule_io_inputs_0),
    .io_inputs_1(comparatorModule_io_inputs_1),
    .io_inputs_2(comparatorModule_io_inputs_2),
    .io_inputs_3(comparatorModule_io_inputs_3),
    .io_inputs_4(comparatorModule_io_inputs_4),
    .io_result(comparatorModule_io_result),
    .io_resultValid(comparatorModule_io_resultValid)
  );
  assign io_outResultValid = io_start & resultValid; // @[online_fuzzification.scala 315:20 86:29]
  assign io_outResult = io_start ? result : 3'h0; // @[online_fuzzification.scala 314:15 86:29]
  assign minMaxTree_clock = clock;
  assign minMaxTree_reset = reset;
  assign minMaxTree_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_io_in1_0 = regLutResultsVec_0; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_io_in1_1 = regLutResultsVec_0; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_io_in1_2 = regLutResultsVec_0; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_io_in1_3 = regLutResultsVec_1; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_io_in1_4 = 1'h0; // @[online_fuzzification.scala 263:{30,30}]
  assign minMaxTree_io_in1_5 = 1'h0; // @[online_fuzzification.scala 263:{30,30}]
  assign minMaxTree_io_in2_0 = regLutResultsVec_5; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_io_in2_1 = regLutResultsVec_6; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_io_in2_2 = regLutResultsVec_7; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_io_in2_3 = regLutResultsVec_5; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_io_in2_4 = 1'h0; // @[online_fuzzification.scala 264:{30,30}]
  assign minMaxTree_io_in2_5 = 1'h0; // @[online_fuzzification.scala 264:{30,30}]
  assign minMaxTree_1_clock = clock;
  assign minMaxTree_1_reset = reset;
  assign minMaxTree_1_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_1_io_in1_0 = regLutResultsVec_0; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_1_io_in1_1 = regLutResultsVec_0; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_1_io_in1_2 = regLutResultsVec_1; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_1_io_in1_3 = regLutResultsVec_1; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_1_io_in1_4 = regLutResultsVec_1; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_1_io_in1_5 = regLutResultsVec_2; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_1_io_in2_0 = regLutResultsVec_8; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_1_io_in2_1 = regLutResultsVec_9; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_1_io_in2_2 = regLutResultsVec_6; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_1_io_in2_3 = regLutResultsVec_7; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_1_io_in2_4 = regLutResultsVec_8; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_1_io_in2_5 = regLutResultsVec_5; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_2_clock = clock;
  assign minMaxTree_2_reset = reset;
  assign minMaxTree_2_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_2_io_in1_0 = regLutResultsVec_1; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_2_io_in1_1 = regLutResultsVec_2; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_2_io_in1_2 = regLutResultsVec_2; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_2_io_in1_3 = regLutResultsVec_3; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_2_io_in1_4 = 1'h0; // @[online_fuzzification.scala 263:{30,30}]
  assign minMaxTree_2_io_in1_5 = 1'h0; // @[online_fuzzification.scala 263:{30,30}]
  assign minMaxTree_2_io_in2_0 = regLutResultsVec_9; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_2_io_in2_1 = regLutResultsVec_6; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_2_io_in2_2 = regLutResultsVec_7; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_2_io_in2_3 = regLutResultsVec_5; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_2_io_in2_4 = 1'h0; // @[online_fuzzification.scala 264:{30,30}]
  assign minMaxTree_2_io_in2_5 = 1'h0; // @[online_fuzzification.scala 264:{30,30}]
  assign minMaxTree_3_clock = clock;
  assign minMaxTree_3_reset = reset;
  assign minMaxTree_3_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_3_io_in1_0 = regLutResultsVec_2; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_3_io_in1_1 = regLutResultsVec_2; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_3_io_in1_2 = regLutResultsVec_3; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_3_io_in1_3 = regLutResultsVec_3; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_3_io_in1_4 = regLutResultsVec_4; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_3_io_in1_5 = regLutResultsVec_4; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_3_io_in2_0 = regLutResultsVec_8; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_3_io_in2_1 = regLutResultsVec_9; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_3_io_in2_2 = regLutResultsVec_6; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_3_io_in2_3 = regLutResultsVec_7; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_3_io_in2_4 = regLutResultsVec_5; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_3_io_in2_5 = regLutResultsVec_6; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_4_clock = clock;
  assign minMaxTree_4_reset = reset;
  assign minMaxTree_4_io_start = io_start; // @[min_max_parallel_online_comparator.scala 243:25]
  assign minMaxTree_4_io_in1_0 = regLutResultsVec_3; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_4_io_in1_1 = regLutResultsVec_3; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_4_io_in1_2 = regLutResultsVec_4; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_4_io_in1_3 = regLutResultsVec_4; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_4_io_in1_4 = regLutResultsVec_4; // @[online_fuzzification.scala 263:30 271:30]
  assign minMaxTree_4_io_in1_5 = 1'h0; // @[online_fuzzification.scala 263:{30,30}]
  assign minMaxTree_4_io_in2_0 = regLutResultsVec_8; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_4_io_in2_1 = regLutResultsVec_9; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_4_io_in2_2 = regLutResultsVec_7; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_4_io_in2_3 = regLutResultsVec_8; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_4_io_in2_4 = regLutResultsVec_9; // @[online_fuzzification.scala 264:30 273:30]
  assign minMaxTree_4_io_in2_5 = 1'h0; // @[online_fuzzification.scala 264:{30,30}]
  assign comparatorModule_clock = clock;
  assign comparatorModule_reset = reset;
  assign comparatorModule_io_start = _T_3 & regMinMaxTreeResultsValidVec_4; // @[online_fuzzification.scala 310:11]
  assign comparatorModule_io_inputs_0 = regMinMaxTreeResultsVec_0; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_1 = regMinMaxTreeResultsVec_1; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_2 = regMinMaxTreeResultsVec_2; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_3 = regMinMaxTreeResultsVec_3; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_4 = regMinMaxTreeResultsVec_4; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  always @(posedge clock) begin
    regLutResultsVec_0 <= io_regLutResultsVec_0; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_1 <= io_regLutResultsVec_1; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_2 <= io_regLutResultsVec_2; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_3 <= io_regLutResultsVec_3; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_4 <= io_regLutResultsVec_4; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_5 <= io_regLutResultsVec_5; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_6 <= io_regLutResultsVec_6; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_7 <= io_regLutResultsVec_7; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_8 <= io_regLutResultsVec_8; // @[online_fuzzification.scala 79:20]
    regLutResultsVec_9 <= io_regLutResultsVec_9; // @[online_fuzzification.scala 79:20]
    regMinMaxTreeResultsVec_0 <= minMaxTree_io_outResult; // @[min_max_parallel_online_comparator.scala 240:25 249:15]
    regMinMaxTreeResultsVec_1 <= minMaxTree_1_io_outResult; // @[min_max_parallel_online_comparator.scala 240:25 249:15]
    regMinMaxTreeResultsVec_2 <= minMaxTree_2_io_outResult; // @[min_max_parallel_online_comparator.scala 240:25 249:15]
    regMinMaxTreeResultsVec_3 <= minMaxTree_3_io_outResult; // @[min_max_parallel_online_comparator.scala 240:25 249:15]
    regMinMaxTreeResultsVec_4 <= minMaxTree_4_io_outResult; // @[min_max_parallel_online_comparator.scala 240:25 249:15]
    regMinMaxTreeResultsValidVec_0 <= minMaxTree_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_1 <= minMaxTree_1_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_2 <= minMaxTree_2_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_3 <= minMaxTree_3_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
    regMinMaxTreeResultsValidVec_4 <= minMaxTree_4_io_outResultValid; // @[min_max_parallel_online_comparator.scala 241:30 251:20]
  end
endmodule
