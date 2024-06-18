// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module RegularFuzzification(
  input        clock,
  input        reset,
  input        io_start,
  input  [6:0] io_regMaxVec_0,
  input  [6:0] io_regMaxVec_1,
  input  [6:0] io_regMaxVec_2,
  input  [6:0] io_regMaxVec_3,
  input  [6:0] io_regMaxVec_4,
  output       io_outResultValid,
  output [6:0] io_outResult
);
  wire  io_outResult_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  io_outResult_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_comparatorModule_io_inputs_4; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  wire [6:0] io_outResult_result = io_outResult_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  MultipleComparator io_outResult_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(io_outResult_comparatorModule_clock),
    .io_start(io_outResult_comparatorModule_io_start),
    .io_inputs_0(io_outResult_comparatorModule_io_inputs_0),
    .io_inputs_1(io_outResult_comparatorModule_io_inputs_1),
    .io_inputs_2(io_outResult_comparatorModule_io_inputs_2),
    .io_inputs_3(io_outResult_comparatorModule_io_inputs_3),
    .io_inputs_4(io_outResult_comparatorModule_io_inputs_4),
    .io_result(io_outResult_comparatorModule_io_result)
  );
  assign io_outResultValid = 1'h0; // @[regular_fuzzification.scala 102:18 138:23 146:23]
  assign io_outResult = io_start ? io_outResult_result : 7'h0; // @[regular_fuzzification.scala 102:18 119:18 145:18]
  assign io_outResult_comparatorModule_clock = clock;
  assign io_outResult_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign io_outResult_comparatorModule_io_inputs_0 = io_regMaxVec_0; // @[regular_fuzzification.scala 109:11 116:40]
  assign io_outResult_comparatorModule_io_inputs_1 = io_regMaxVec_1; // @[regular_fuzzification.scala 109:11 116:40]
  assign io_outResult_comparatorModule_io_inputs_2 = io_regMaxVec_2; // @[regular_fuzzification.scala 109:11 116:40]
  assign io_outResult_comparatorModule_io_inputs_3 = io_regMaxVec_3; // @[regular_fuzzification.scala 109:11 116:40]
  assign io_outResult_comparatorModule_io_inputs_4 = io_regMaxVec_4; // @[regular_fuzzification.scala 109:11 116:40]
endmodule
