// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module OnlineFuzzification(
  input        clock,
  input        reset,
  input        io_start,
  input        io_inputs_0,
  input        io_inputs_1,
  input        io_inputs_2,
  input        io_inputs_3,
  input        io_inputs_4,
  output       io_outResultValid,
  output [2:0] io_outResult
);
  wire  comparatorModule_clock; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_reset; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_0; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_1; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_2; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_3; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_inputs_4; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire [2:0] comparatorModule_io_result; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire  comparatorModule_io_resultValid; // @[5_input_custom_index_based_max_comparator.scala 180:34]
  wire [2:0] result = comparatorModule_io_result; // @[5_input_custom_index_based_max_comparator.scala 184:22 193:12]
  wire  resultValid = comparatorModule_io_resultValid; // @[5_input_custom_index_based_max_comparator.scala 185:27 194:17]
  FiveInputCustomIndexBasedMaxComparator comparatorModule ( // @[5_input_custom_index_based_max_comparator.scala 180:34]
    .clock(comparatorModule_clock),
    .reset(comparatorModule_reset),
    .io_inputs_0(comparatorModule_io_inputs_0),
    .io_inputs_1(comparatorModule_io_inputs_1),
    .io_inputs_2(comparatorModule_io_inputs_2),
    .io_inputs_3(comparatorModule_io_inputs_3),
    .io_inputs_4(comparatorModule_io_inputs_4),
    .io_result(comparatorModule_io_result),
    .io_resultValid(comparatorModule_io_resultValid)
  );
  assign io_outResultValid = io_start & resultValid; // @[online_fuzzification.scala 52:29 64:23 70:23]
  assign io_outResult = io_start ? result : 3'h0; // @[online_fuzzification.scala 52:29 63:18 69:18]
  assign comparatorModule_clock = clock;
  assign comparatorModule_reset = reset;
  assign comparatorModule_io_inputs_0 = io_inputs_0; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_1 = io_inputs_1; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_2 = io_inputs_2; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_3 = io_inputs_3; // @[5_input_custom_index_based_max_comparator.scala 191:32]
  assign comparatorModule_io_inputs_4 = io_inputs_4; // @[5_input_custom_index_based_max_comparator.scala 191:32]
endmodule
