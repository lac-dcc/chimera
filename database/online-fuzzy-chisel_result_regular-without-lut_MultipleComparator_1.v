// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module MultipleComparator_1(
  input        clock,
  input        io_start,
  input  [6:0] io_inputs_0,
  input  [6:0] io_inputs_1,
  input  [6:0] io_inputs_2,
  input  [6:0] io_inputs_3,
  input  [6:0] io_inputs_4,
  input  [6:0] io_inputs_5,
  output [6:0] io_result
);
  wire [6:0] regMinMaxResultVec_0_minMaxResult_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_0_minMaxResult_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinMaxResultVec_0_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_1_minMaxResult_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_1_minMaxResult_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinMaxResultVec_1_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_2_minMaxResult_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_2_minMaxResult_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinMaxResultVec_2_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_3_minMaxResult_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_3_minMaxResult_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinMaxResultVec_3_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_4_minMaxResult_comparatorModule_io_in1; // @[comparator.scala 69:34]
  wire [6:0] regMinMaxResultVec_4_minMaxResult_comparatorModule_io_in2; // @[comparator.scala 69:34]
  wire  regMinMaxResultVec_4_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 69:34]
  reg [6:0] regMinMaxResultVec_0_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [6:0] regMinMaxResultVec_1_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [6:0] regMinMaxResultVec_2_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [6:0] regMinMaxResultVec_3_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [6:0] regMinMaxResultVec_4_minMaxResult; // @[multiple_comparator.scala 113:31]
  wire  regMinMaxResultVec_0_minMaxResult_maxMinOutput = regMinMaxResultVec_0_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinMaxResultVec_1_minMaxResult_maxMinOutput = regMinMaxResultVec_1_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinMaxResultVec_2_minMaxResult_maxMinOutput = regMinMaxResultVec_2_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinMaxResultVec_3_minMaxResult_maxMinOutput = regMinMaxResultVec_3_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  wire  regMinMaxResultVec_4_minMaxResult_maxMinOutput = regMinMaxResultVec_4_minMaxResult_comparatorModule_io_maxMin; // @[comparator.scala 71:28 90:18]
  Comparator_25 regMinMaxResultVec_0_minMaxResult_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinMaxResultVec_0_minMaxResult_comparatorModule_io_in1),
    .io_in2(regMinMaxResultVec_0_minMaxResult_comparatorModule_io_in2),
    .io_maxMin(regMinMaxResultVec_0_minMaxResult_comparatorModule_io_maxMin)
  );
  Comparator_25 regMinMaxResultVec_1_minMaxResult_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinMaxResultVec_1_minMaxResult_comparatorModule_io_in1),
    .io_in2(regMinMaxResultVec_1_minMaxResult_comparatorModule_io_in2),
    .io_maxMin(regMinMaxResultVec_1_minMaxResult_comparatorModule_io_maxMin)
  );
  Comparator_25 regMinMaxResultVec_2_minMaxResult_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinMaxResultVec_2_minMaxResult_comparatorModule_io_in1),
    .io_in2(regMinMaxResultVec_2_minMaxResult_comparatorModule_io_in2),
    .io_maxMin(regMinMaxResultVec_2_minMaxResult_comparatorModule_io_maxMin)
  );
  Comparator_25 regMinMaxResultVec_3_minMaxResult_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinMaxResultVec_3_minMaxResult_comparatorModule_io_in1),
    .io_in2(regMinMaxResultVec_3_minMaxResult_comparatorModule_io_in2),
    .io_maxMin(regMinMaxResultVec_3_minMaxResult_comparatorModule_io_maxMin)
  );
  Comparator_25 regMinMaxResultVec_4_minMaxResult_comparatorModule ( // @[comparator.scala 69:34]
    .io_in1(regMinMaxResultVec_4_minMaxResult_comparatorModule_io_in1),
    .io_in2(regMinMaxResultVec_4_minMaxResult_comparatorModule_io_in2),
    .io_maxMin(regMinMaxResultVec_4_minMaxResult_comparatorModule_io_maxMin)
  );
  assign io_result = regMinMaxResultVec_4_minMaxResult; // @[multiple_comparator.scala 274:13]
  assign regMinMaxResultVec_0_minMaxResult_comparatorModule_io_in1 = io_inputs_0; // @[comparator.scala 76:29]
  assign regMinMaxResultVec_0_minMaxResult_comparatorModule_io_in2 = io_inputs_1; // @[comparator.scala 77:29]
  assign regMinMaxResultVec_1_minMaxResult_comparatorModule_io_in1 = io_inputs_2; // @[comparator.scala 76:29]
  assign regMinMaxResultVec_1_minMaxResult_comparatorModule_io_in2 = io_inputs_3; // @[comparator.scala 77:29]
  assign regMinMaxResultVec_2_minMaxResult_comparatorModule_io_in1 = io_inputs_4; // @[comparator.scala 76:29]
  assign regMinMaxResultVec_2_minMaxResult_comparatorModule_io_in2 = io_inputs_5; // @[comparator.scala 77:29]
  assign regMinMaxResultVec_3_minMaxResult_comparatorModule_io_in1 = regMinMaxResultVec_0_minMaxResult; // @[comparator.scala 76:29]
  assign regMinMaxResultVec_3_minMaxResult_comparatorModule_io_in2 = regMinMaxResultVec_1_minMaxResult; // @[comparator.scala 77:29]
  assign regMinMaxResultVec_4_minMaxResult_comparatorModule_io_in1 = regMinMaxResultVec_2_minMaxResult; // @[comparator.scala 76:29]
  assign regMinMaxResultVec_4_minMaxResult_comparatorModule_io_in2 = regMinMaxResultVec_3_minMaxResult; // @[comparator.scala 77:29]
  always @(posedge clock) begin
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~regMinMaxResultVec_0_minMaxResult_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinMaxResultVec_0_minMaxResult <= io_inputs_0; // @[comparator.scala 101:14]
      end else begin
        regMinMaxResultVec_0_minMaxResult <= io_inputs_1; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~regMinMaxResultVec_1_minMaxResult_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinMaxResultVec_1_minMaxResult <= io_inputs_2; // @[comparator.scala 101:14]
      end else begin
        regMinMaxResultVec_1_minMaxResult <= io_inputs_3; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~regMinMaxResultVec_2_minMaxResult_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinMaxResultVec_2_minMaxResult <= io_inputs_4; // @[comparator.scala 101:14]
      end else begin
        regMinMaxResultVec_2_minMaxResult <= io_inputs_5; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~regMinMaxResultVec_3_minMaxResult_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinMaxResultVec_3_minMaxResult <= regMinMaxResultVec_0_minMaxResult; // @[comparator.scala 101:14]
      end else begin
        regMinMaxResultVec_3_minMaxResult <= regMinMaxResultVec_1_minMaxResult; // @[comparator.scala 103:14]
      end
    end
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~regMinMaxResultVec_4_minMaxResult_maxMinOutput) begin // @[comparator.scala 100:40]
        regMinMaxResultVec_4_minMaxResult <= regMinMaxResultVec_2_minMaxResult; // @[comparator.scala 101:14]
      end else begin
        regMinMaxResultVec_4_minMaxResult <= regMinMaxResultVec_3_minMaxResult; // @[comparator.scala 103:14]
      end
    end
  end
endmodule
