// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module RegularFuzzificationInput(
  input        clock,
  input        io_start,
  input  [6:0] io_lutConnections_0,
  input  [6:0] io_lutConnections_1,
  input  [6:0] io_lutConnections_2,
  input  [6:0] io_lutConnections_3,
  input  [6:0] io_lutConnections_4,
  input  [6:0] io_lutConnections_5,
  input  [6:0] io_lutConnections_6,
  input  [6:0] io_lutConnections_7,
  input  [6:0] io_lutConnections_8,
  input  [6:0] io_lutConnections_9,
  output [6:0] io_outResult
);
  wire [6:0] regMinVec_0_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_0_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_0_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_1_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_1_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_1_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_2_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_2_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_2_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_3_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_3_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_3_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_4_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_4_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_4_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_5_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_5_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_5_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_6_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_6_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_6_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_7_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_7_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_7_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_8_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_8_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_8_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_9_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_9_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_9_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_10_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_10_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_10_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_11_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_11_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_11_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_12_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_12_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_12_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_13_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_13_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_13_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_14_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_14_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_14_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_15_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_15_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_15_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_16_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_16_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_16_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_17_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_17_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_17_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_18_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_18_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_18_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_19_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_19_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_19_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_20_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_20_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_20_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_21_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_21_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_21_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_22_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_22_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_22_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_23_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_23_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_23_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_24_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinVec_24_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinVec_24_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire  regMaxVec_0_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_0_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_0_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_0_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_0_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_0_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_0_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_1_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_1_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_inputs_4; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_inputs_5; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_1_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_2_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_2_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_2_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_2_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_2_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_2_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_2_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_3_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_3_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_inputs_4; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_inputs_5; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_3_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_4_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  regMaxVec_4_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_4_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_4_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_4_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_4_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_4_comparatorModule_io_inputs_4; // @[multiple_comparator.scala 293:34]
  wire [6:0] regMaxVec_4_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  wire  outResult_comparatorModule_clock; // @[multiple_comparator.scala 293:34]
  wire  outResult_comparatorModule_io_start; // @[multiple_comparator.scala 293:34]
  wire [6:0] outResult_comparatorModule_io_inputs_0; // @[multiple_comparator.scala 293:34]
  wire [6:0] outResult_comparatorModule_io_inputs_1; // @[multiple_comparator.scala 293:34]
  wire [6:0] outResult_comparatorModule_io_inputs_2; // @[multiple_comparator.scala 293:34]
  wire [6:0] outResult_comparatorModule_io_inputs_3; // @[multiple_comparator.scala 293:34]
  wire [6:0] outResult_comparatorModule_io_inputs_4; // @[multiple_comparator.scala 293:34]
  wire [6:0] outResult_comparatorModule_io_result; // @[multiple_comparator.scala 293:34]
  reg [6:0] regLutResultsVec_0; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_1; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_2; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_3; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_4; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_5; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_6; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_7; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_8; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regLutResultsVec_9; // @[regular_fuzzification.scala 132:29]
  reg [6:0] regMinVec_0; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_1; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_2; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_3; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_4; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_5; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_6; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_7; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_8; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_9; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_10; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_11; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_12; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_13; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_14; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_15; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_16; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_17; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_18; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_19; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_20; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_21; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_22; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_23; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMinVec_24; // @[regular_fuzzification.scala 151:22]
  reg [6:0] regMaxVec_0; // @[regular_fuzzification.scala 166:22]
  reg [6:0] regMaxVec_1; // @[regular_fuzzification.scala 166:22]
  reg [6:0] regMaxVec_2; // @[regular_fuzzification.scala 166:22]
  reg [6:0] regMaxVec_3; // @[regular_fuzzification.scala 166:22]
  reg [6:0] regMaxVec_4; // @[regular_fuzzification.scala 166:22]
  wire  regMinVec_0_maxMinOutput = regMinVec_0_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_1_maxMinOutput = regMinVec_1_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_2_maxMinOutput = regMinVec_2_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_3_maxMinOutput = regMinVec_3_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_4_maxMinOutput = regMinVec_4_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_5_maxMinOutput = regMinVec_5_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_6_maxMinOutput = regMinVec_6_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_7_maxMinOutput = regMinVec_7_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_8_maxMinOutput = regMinVec_8_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_9_maxMinOutput = regMinVec_9_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_10_maxMinOutput = regMinVec_10_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_11_maxMinOutput = regMinVec_11_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_12_maxMinOutput = regMinVec_12_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_13_maxMinOutput = regMinVec_13_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_14_maxMinOutput = regMinVec_14_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_15_maxMinOutput = regMinVec_15_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_16_maxMinOutput = regMinVec_16_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_17_maxMinOutput = regMinVec_17_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_18_maxMinOutput = regMinVec_18_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_19_maxMinOutput = regMinVec_19_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_20_maxMinOutput = regMinVec_20_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_21_maxMinOutput = regMinVec_21_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_22_maxMinOutput = regMinVec_22_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_23_maxMinOutput = regMinVec_23_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinVec_24_maxMinOutput = regMinVec_24_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire [6:0] regMaxVec_0_result = regMaxVec_0_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  wire [6:0] regMaxVec_1_result = regMaxVec_1_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  wire [6:0] regMaxVec_2_result = regMaxVec_2_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  wire [6:0] regMaxVec_3_result = regMaxVec_3_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  wire [6:0] regMaxVec_4_result = regMaxVec_4_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  wire [6:0] outResult_result = outResult_comparatorModule_io_result; // @[multiple_comparator.scala 304:22 312:12]
  Comparator regMinVec_0_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_0_comparatorModule_io_in1),
    .io_in2(regMinVec_0_comparatorModule_io_in2),
    .io_maxMin(regMinVec_0_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_1_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_1_comparatorModule_io_in1),
    .io_in2(regMinVec_1_comparatorModule_io_in2),
    .io_maxMin(regMinVec_1_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_2_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_2_comparatorModule_io_in1),
    .io_in2(regMinVec_2_comparatorModule_io_in2),
    .io_maxMin(regMinVec_2_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_3_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_3_comparatorModule_io_in1),
    .io_in2(regMinVec_3_comparatorModule_io_in2),
    .io_maxMin(regMinVec_3_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_4_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_4_comparatorModule_io_in1),
    .io_in2(regMinVec_4_comparatorModule_io_in2),
    .io_maxMin(regMinVec_4_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_5_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_5_comparatorModule_io_in1),
    .io_in2(regMinVec_5_comparatorModule_io_in2),
    .io_maxMin(regMinVec_5_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_6_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_6_comparatorModule_io_in1),
    .io_in2(regMinVec_6_comparatorModule_io_in2),
    .io_maxMin(regMinVec_6_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_7_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_7_comparatorModule_io_in1),
    .io_in2(regMinVec_7_comparatorModule_io_in2),
    .io_maxMin(regMinVec_7_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_8_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_8_comparatorModule_io_in1),
    .io_in2(regMinVec_8_comparatorModule_io_in2),
    .io_maxMin(regMinVec_8_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_9_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_9_comparatorModule_io_in1),
    .io_in2(regMinVec_9_comparatorModule_io_in2),
    .io_maxMin(regMinVec_9_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_10_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_10_comparatorModule_io_in1),
    .io_in2(regMinVec_10_comparatorModule_io_in2),
    .io_maxMin(regMinVec_10_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_11_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_11_comparatorModule_io_in1),
    .io_in2(regMinVec_11_comparatorModule_io_in2),
    .io_maxMin(regMinVec_11_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_12_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_12_comparatorModule_io_in1),
    .io_in2(regMinVec_12_comparatorModule_io_in2),
    .io_maxMin(regMinVec_12_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_13_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_13_comparatorModule_io_in1),
    .io_in2(regMinVec_13_comparatorModule_io_in2),
    .io_maxMin(regMinVec_13_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_14_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_14_comparatorModule_io_in1),
    .io_in2(regMinVec_14_comparatorModule_io_in2),
    .io_maxMin(regMinVec_14_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_15_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_15_comparatorModule_io_in1),
    .io_in2(regMinVec_15_comparatorModule_io_in2),
    .io_maxMin(regMinVec_15_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_16_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_16_comparatorModule_io_in1),
    .io_in2(regMinVec_16_comparatorModule_io_in2),
    .io_maxMin(regMinVec_16_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_17_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_17_comparatorModule_io_in1),
    .io_in2(regMinVec_17_comparatorModule_io_in2),
    .io_maxMin(regMinVec_17_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_18_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_18_comparatorModule_io_in1),
    .io_in2(regMinVec_18_comparatorModule_io_in2),
    .io_maxMin(regMinVec_18_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_19_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_19_comparatorModule_io_in1),
    .io_in2(regMinVec_19_comparatorModule_io_in2),
    .io_maxMin(regMinVec_19_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_20_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_20_comparatorModule_io_in1),
    .io_in2(regMinVec_20_comparatorModule_io_in2),
    .io_maxMin(regMinVec_20_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_21_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_21_comparatorModule_io_in1),
    .io_in2(regMinVec_21_comparatorModule_io_in2),
    .io_maxMin(regMinVec_21_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_22_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_22_comparatorModule_io_in1),
    .io_in2(regMinVec_22_comparatorModule_io_in2),
    .io_maxMin(regMinVec_22_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_23_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_23_comparatorModule_io_in1),
    .io_in2(regMinVec_23_comparatorModule_io_in2),
    .io_maxMin(regMinVec_23_comparatorModule_io_maxMin)
  );
  Comparator regMinVec_24_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinVec_24_comparatorModule_io_in1),
    .io_in2(regMinVec_24_comparatorModule_io_in2),
    .io_maxMin(regMinVec_24_comparatorModule_io_maxMin)
  );
  MultipleComparator regMaxVec_0_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(regMaxVec_0_comparatorModule_clock),
    .io_start(regMaxVec_0_comparatorModule_io_start),
    .io_inputs_0(regMaxVec_0_comparatorModule_io_inputs_0),
    .io_inputs_1(regMaxVec_0_comparatorModule_io_inputs_1),
    .io_inputs_2(regMaxVec_0_comparatorModule_io_inputs_2),
    .io_inputs_3(regMaxVec_0_comparatorModule_io_inputs_3),
    .io_result(regMaxVec_0_comparatorModule_io_result)
  );
  MultipleComparator_1 regMaxVec_1_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(regMaxVec_1_comparatorModule_clock),
    .io_start(regMaxVec_1_comparatorModule_io_start),
    .io_inputs_0(regMaxVec_1_comparatorModule_io_inputs_0),
    .io_inputs_1(regMaxVec_1_comparatorModule_io_inputs_1),
    .io_inputs_2(regMaxVec_1_comparatorModule_io_inputs_2),
    .io_inputs_3(regMaxVec_1_comparatorModule_io_inputs_3),
    .io_inputs_4(regMaxVec_1_comparatorModule_io_inputs_4),
    .io_inputs_5(regMaxVec_1_comparatorModule_io_inputs_5),
    .io_result(regMaxVec_1_comparatorModule_io_result)
  );
  MultipleComparator regMaxVec_2_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(regMaxVec_2_comparatorModule_clock),
    .io_start(regMaxVec_2_comparatorModule_io_start),
    .io_inputs_0(regMaxVec_2_comparatorModule_io_inputs_0),
    .io_inputs_1(regMaxVec_2_comparatorModule_io_inputs_1),
    .io_inputs_2(regMaxVec_2_comparatorModule_io_inputs_2),
    .io_inputs_3(regMaxVec_2_comparatorModule_io_inputs_3),
    .io_result(regMaxVec_2_comparatorModule_io_result)
  );
  MultipleComparator_1 regMaxVec_3_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(regMaxVec_3_comparatorModule_clock),
    .io_start(regMaxVec_3_comparatorModule_io_start),
    .io_inputs_0(regMaxVec_3_comparatorModule_io_inputs_0),
    .io_inputs_1(regMaxVec_3_comparatorModule_io_inputs_1),
    .io_inputs_2(regMaxVec_3_comparatorModule_io_inputs_2),
    .io_inputs_3(regMaxVec_3_comparatorModule_io_inputs_3),
    .io_inputs_4(regMaxVec_3_comparatorModule_io_inputs_4),
    .io_inputs_5(regMaxVec_3_comparatorModule_io_inputs_5),
    .io_result(regMaxVec_3_comparatorModule_io_result)
  );
  MultipleComparator_4 regMaxVec_4_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(regMaxVec_4_comparatorModule_clock),
    .io_start(regMaxVec_4_comparatorModule_io_start),
    .io_inputs_0(regMaxVec_4_comparatorModule_io_inputs_0),
    .io_inputs_1(regMaxVec_4_comparatorModule_io_inputs_1),
    .io_inputs_2(regMaxVec_4_comparatorModule_io_inputs_2),
    .io_inputs_3(regMaxVec_4_comparatorModule_io_inputs_3),
    .io_inputs_4(regMaxVec_4_comparatorModule_io_inputs_4),
    .io_result(regMaxVec_4_comparatorModule_io_result)
  );
  MultipleComparator_5 outResult_comparatorModule ( // @[multiple_comparator.scala 293:34]
    .clock(outResult_comparatorModule_clock),
    .io_start(outResult_comparatorModule_io_start),
    .io_inputs_0(outResult_comparatorModule_io_inputs_0),
    .io_inputs_1(outResult_comparatorModule_io_inputs_1),
    .io_inputs_2(outResult_comparatorModule_io_inputs_2),
    .io_inputs_3(outResult_comparatorModule_io_inputs_3),
    .io_inputs_4(outResult_comparatorModule_io_inputs_4),
    .io_result(outResult_comparatorModule_io_result)
  );
  assign io_outResult = io_start ? outResult_result : 7'h0; // @[regular_fuzzification.scala 178:29 395:15 420:15]
  assign regMinVec_0_comparatorModule_io_in1 = regLutResultsVec_0; // @[comparator.scala 76:29]
  assign regMinVec_0_comparatorModule_io_in2 = regLutResultsVec_5; // @[comparator.scala 77:29]
  assign regMinVec_1_comparatorModule_io_in1 = regLutResultsVec_0; // @[comparator.scala 76:29]
  assign regMinVec_1_comparatorModule_io_in2 = regLutResultsVec_6; // @[comparator.scala 77:29]
  assign regMinVec_2_comparatorModule_io_in1 = regLutResultsVec_0; // @[comparator.scala 76:29]
  assign regMinVec_2_comparatorModule_io_in2 = regLutResultsVec_7; // @[comparator.scala 77:29]
  assign regMinVec_3_comparatorModule_io_in1 = regLutResultsVec_0; // @[comparator.scala 76:29]
  assign regMinVec_3_comparatorModule_io_in2 = regLutResultsVec_8; // @[comparator.scala 77:29]
  assign regMinVec_4_comparatorModule_io_in1 = regLutResultsVec_0; // @[comparator.scala 76:29]
  assign regMinVec_4_comparatorModule_io_in2 = regLutResultsVec_9; // @[comparator.scala 77:29]
  assign regMinVec_5_comparatorModule_io_in1 = regLutResultsVec_1; // @[comparator.scala 76:29]
  assign regMinVec_5_comparatorModule_io_in2 = regLutResultsVec_5; // @[comparator.scala 77:29]
  assign regMinVec_6_comparatorModule_io_in1 = regLutResultsVec_1; // @[comparator.scala 76:29]
  assign regMinVec_6_comparatorModule_io_in2 = regLutResultsVec_6; // @[comparator.scala 77:29]
  assign regMinVec_7_comparatorModule_io_in1 = regLutResultsVec_1; // @[comparator.scala 76:29]
  assign regMinVec_7_comparatorModule_io_in2 = regLutResultsVec_7; // @[comparator.scala 77:29]
  assign regMinVec_8_comparatorModule_io_in1 = regLutResultsVec_1; // @[comparator.scala 76:29]
  assign regMinVec_8_comparatorModule_io_in2 = regLutResultsVec_8; // @[comparator.scala 77:29]
  assign regMinVec_9_comparatorModule_io_in1 = regLutResultsVec_1; // @[comparator.scala 76:29]
  assign regMinVec_9_comparatorModule_io_in2 = regLutResultsVec_9; // @[comparator.scala 77:29]
  assign regMinVec_10_comparatorModule_io_in1 = regLutResultsVec_2; // @[comparator.scala 76:29]
  assign regMinVec_10_comparatorModule_io_in2 = regLutResultsVec_5; // @[comparator.scala 77:29]
  assign regMinVec_11_comparatorModule_io_in1 = regLutResultsVec_2; // @[comparator.scala 76:29]
  assign regMinVec_11_comparatorModule_io_in2 = regLutResultsVec_6; // @[comparator.scala 77:29]
  assign regMinVec_12_comparatorModule_io_in1 = regLutResultsVec_2; // @[comparator.scala 76:29]
  assign regMinVec_12_comparatorModule_io_in2 = regLutResultsVec_7; // @[comparator.scala 77:29]
  assign regMinVec_13_comparatorModule_io_in1 = regLutResultsVec_2; // @[comparator.scala 76:29]
  assign regMinVec_13_comparatorModule_io_in2 = regLutResultsVec_8; // @[comparator.scala 77:29]
  assign regMinVec_14_comparatorModule_io_in1 = regLutResultsVec_2; // @[comparator.scala 76:29]
  assign regMinVec_14_comparatorModule_io_in2 = regLutResultsVec_9; // @[comparator.scala 77:29]
  assign regMinVec_15_comparatorModule_io_in1 = regLutResultsVec_3; // @[comparator.scala 76:29]
  assign regMinVec_15_comparatorModule_io_in2 = regLutResultsVec_5; // @[comparator.scala 77:29]
  assign regMinVec_16_comparatorModule_io_in1 = regLutResultsVec_3; // @[comparator.scala 76:29]
  assign regMinVec_16_comparatorModule_io_in2 = regLutResultsVec_6; // @[comparator.scala 77:29]
  assign regMinVec_17_comparatorModule_io_in1 = regLutResultsVec_3; // @[comparator.scala 76:29]
  assign regMinVec_17_comparatorModule_io_in2 = regLutResultsVec_7; // @[comparator.scala 77:29]
  assign regMinVec_18_comparatorModule_io_in1 = regLutResultsVec_3; // @[comparator.scala 76:29]
  assign regMinVec_18_comparatorModule_io_in2 = regLutResultsVec_8; // @[comparator.scala 77:29]
  assign regMinVec_19_comparatorModule_io_in1 = regLutResultsVec_3; // @[comparator.scala 76:29]
  assign regMinVec_19_comparatorModule_io_in2 = regLutResultsVec_9; // @[comparator.scala 77:29]
  assign regMinVec_20_comparatorModule_io_in1 = regLutResultsVec_4; // @[comparator.scala 76:29]
  assign regMinVec_20_comparatorModule_io_in2 = regLutResultsVec_5; // @[comparator.scala 77:29]
  assign regMinVec_21_comparatorModule_io_in1 = regLutResultsVec_4; // @[comparator.scala 76:29]
  assign regMinVec_21_comparatorModule_io_in2 = regLutResultsVec_6; // @[comparator.scala 77:29]
  assign regMinVec_22_comparatorModule_io_in1 = regLutResultsVec_4; // @[comparator.scala 76:29]
  assign regMinVec_22_comparatorModule_io_in2 = regLutResultsVec_7; // @[comparator.scala 77:29]
  assign regMinVec_23_comparatorModule_io_in1 = regLutResultsVec_4; // @[comparator.scala 76:29]
  assign regMinVec_23_comparatorModule_io_in2 = regLutResultsVec_8; // @[comparator.scala 77:29]
  assign regMinVec_24_comparatorModule_io_in1 = regLutResultsVec_4; // @[comparator.scala 76:29]
  assign regMinVec_24_comparatorModule_io_in2 = regLutResultsVec_9; // @[comparator.scala 77:29]
  assign regMaxVec_0_comparatorModule_clock = clock;
  assign regMaxVec_0_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign regMaxVec_0_comparatorModule_io_inputs_0 = regMinVec_0; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_0_comparatorModule_io_inputs_1 = regMinVec_1; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_0_comparatorModule_io_inputs_2 = regMinVec_2; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_0_comparatorModule_io_inputs_3 = regMinVec_5; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_1_comparatorModule_clock = clock;
  assign regMaxVec_1_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign regMaxVec_1_comparatorModule_io_inputs_0 = regMinVec_3; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_1_comparatorModule_io_inputs_1 = regMinVec_4; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_1_comparatorModule_io_inputs_2 = regMinVec_6; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_1_comparatorModule_io_inputs_3 = regMinVec_7; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_1_comparatorModule_io_inputs_4 = regMinVec_8; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_1_comparatorModule_io_inputs_5 = regMinVec_10; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_2_comparatorModule_clock = clock;
  assign regMaxVec_2_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign regMaxVec_2_comparatorModule_io_inputs_0 = regMinVec_9; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_2_comparatorModule_io_inputs_1 = regMinVec_11; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_2_comparatorModule_io_inputs_2 = regMinVec_12; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_2_comparatorModule_io_inputs_3 = regMinVec_15; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_3_comparatorModule_clock = clock;
  assign regMaxVec_3_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign regMaxVec_3_comparatorModule_io_inputs_0 = regMinVec_13; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_3_comparatorModule_io_inputs_1 = regMinVec_14; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_3_comparatorModule_io_inputs_2 = regMinVec_16; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_3_comparatorModule_io_inputs_3 = regMinVec_17; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_3_comparatorModule_io_inputs_4 = regMinVec_20; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_3_comparatorModule_io_inputs_5 = regMinVec_21; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_4_comparatorModule_clock = clock;
  assign regMaxVec_4_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign regMaxVec_4_comparatorModule_io_inputs_0 = regMinVec_18; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_4_comparatorModule_io_inputs_1 = regMinVec_19; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_4_comparatorModule_io_inputs_2 = regMinVec_22; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_4_comparatorModule_io_inputs_3 = regMinVec_23; // @[regular_fuzzification.scala 323:15 326:30]
  assign regMaxVec_4_comparatorModule_io_inputs_4 = regMinVec_24; // @[regular_fuzzification.scala 323:15 326:30]
  assign outResult_comparatorModule_clock = clock;
  assign outResult_comparatorModule_io_start = io_start; // @[multiple_comparator.scala 309:31]
  assign outResult_comparatorModule_io_inputs_0 = regMaxVec_0; // @[regular_fuzzification.scala 378:11 385:40]
  assign outResult_comparatorModule_io_inputs_1 = regMaxVec_1; // @[regular_fuzzification.scala 378:11 385:40]
  assign outResult_comparatorModule_io_inputs_2 = regMaxVec_2; // @[regular_fuzzification.scala 378:11 385:40]
  assign outResult_comparatorModule_io_inputs_3 = regMaxVec_3; // @[regular_fuzzification.scala 378:11 385:40]
  assign outResult_comparatorModule_io_inputs_4 = regMaxVec_4; // @[regular_fuzzification.scala 378:11 385:40]
  always @(posedge clock) begin
    regLutResultsVec_0 <= io_lutConnections_0; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_1 <= io_lutConnections_1; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_2 <= io_lutConnections_2; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_3 <= io_lutConnections_3; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_4 <= io_lutConnections_4; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_5 <= io_lutConnections_5; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_6 <= io_lutConnections_6; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_7 <= io_lutConnections_7; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_8 <= io_lutConnections_8; // @[regular_fuzzification.scala 172:22]
    regLutResultsVec_9 <= io_lutConnections_9; // @[regular_fuzzification.scala 172:22]
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_0_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_0 <= regLutResultsVec_0; // @[comparator.scala 101:14]
      end else begin
        regMinVec_0 <= regLutResultsVec_5; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_1_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_1 <= regLutResultsVec_0; // @[comparator.scala 101:14]
      end else begin
        regMinVec_1 <= regLutResultsVec_6; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_2_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_2 <= regLutResultsVec_0; // @[comparator.scala 101:14]
      end else begin
        regMinVec_2 <= regLutResultsVec_7; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_3_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_3 <= regLutResultsVec_0; // @[comparator.scala 101:14]
      end else begin
        regMinVec_3 <= regLutResultsVec_8; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_4_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_4 <= regLutResultsVec_0; // @[comparator.scala 101:14]
      end else begin
        regMinVec_4 <= regLutResultsVec_9; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_5_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_5 <= regLutResultsVec_1; // @[comparator.scala 101:14]
      end else begin
        regMinVec_5 <= regLutResultsVec_5; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_6_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_6 <= regLutResultsVec_1; // @[comparator.scala 101:14]
      end else begin
        regMinVec_6 <= regLutResultsVec_6; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_7_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_7 <= regLutResultsVec_1; // @[comparator.scala 101:14]
      end else begin
        regMinVec_7 <= regLutResultsVec_7; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_8_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_8 <= regLutResultsVec_1; // @[comparator.scala 101:14]
      end else begin
        regMinVec_8 <= regLutResultsVec_8; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_9_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_9 <= regLutResultsVec_1; // @[comparator.scala 101:14]
      end else begin
        regMinVec_9 <= regLutResultsVec_9; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_10_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_10 <= regLutResultsVec_2; // @[comparator.scala 101:14]
      end else begin
        regMinVec_10 <= regLutResultsVec_5; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_11_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_11 <= regLutResultsVec_2; // @[comparator.scala 101:14]
      end else begin
        regMinVec_11 <= regLutResultsVec_6; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_12_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_12 <= regLutResultsVec_2; // @[comparator.scala 101:14]
      end else begin
        regMinVec_12 <= regLutResultsVec_7; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_13_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_13 <= regLutResultsVec_2; // @[comparator.scala 101:14]
      end else begin
        regMinVec_13 <= regLutResultsVec_8; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_14_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_14 <= regLutResultsVec_2; // @[comparator.scala 101:14]
      end else begin
        regMinVec_14 <= regLutResultsVec_9; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_15_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_15 <= regLutResultsVec_3; // @[comparator.scala 101:14]
      end else begin
        regMinVec_15 <= regLutResultsVec_5; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_16_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_16 <= regLutResultsVec_3; // @[comparator.scala 101:14]
      end else begin
        regMinVec_16 <= regLutResultsVec_6; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_17_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_17 <= regLutResultsVec_3; // @[comparator.scala 101:14]
      end else begin
        regMinVec_17 <= regLutResultsVec_7; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_18_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_18 <= regLutResultsVec_3; // @[comparator.scala 101:14]
      end else begin
        regMinVec_18 <= regLutResultsVec_8; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_19_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_19 <= regLutResultsVec_3; // @[comparator.scala 101:14]
      end else begin
        regMinVec_19 <= regLutResultsVec_9; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_20_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_20 <= regLutResultsVec_4; // @[comparator.scala 101:14]
      end else begin
        regMinVec_20 <= regLutResultsVec_5; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_21_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_21 <= regLutResultsVec_4; // @[comparator.scala 101:14]
      end else begin
        regMinVec_21 <= regLutResultsVec_6; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_22_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_22 <= regLutResultsVec_4; // @[comparator.scala 101:14]
      end else begin
        regMinVec_22 <= regLutResultsVec_7; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_23_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_23 <= regLutResultsVec_4; // @[comparator.scala 101:14]
      end else begin
        regMinVec_23 <= regLutResultsVec_8; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      if (~regMinVec_24_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinVec_24 <= regLutResultsVec_4; // @[comparator.scala 101:14]
      end else begin
        regMinVec_24 <= regLutResultsVec_9; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      regMaxVec_0 <= regMaxVec_0_result; // @[regular_fuzzification.scala 329:39]
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      regMaxVec_1 <= regMaxVec_1_result; // @[regular_fuzzification.scala 329:39]
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      regMaxVec_2 <= regMaxVec_2_result; // @[regular_fuzzification.scala 329:39]
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      regMaxVec_3 <= regMaxVec_3_result; // @[regular_fuzzification.scala 329:39]
    end
    if (io_start) begin // @[regular_fuzzification.scala 178:29]
      regMaxVec_4 <= regMaxVec_4_result; // @[regular_fuzzification.scala 329:39]
    end
  end
endmodule
