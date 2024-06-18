// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module MultipleComparator_5(
  input        clock,
  input        io_start,
  input  [6:0] io_inputs_0,
  input  [6:0] io_inputs_1,
  input  [6:0] io_inputs_2,
  input  [6:0] io_inputs_3,
  input  [6:0] io_inputs_4,
  output [6:0] io_result
);
  wire [6:0] comparatorModule_io_in1; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_io_in2; // @[comparator.scala 121:34]
  wire  comparatorModule_io_maxMin; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_1_io_in1; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_1_io_in2; // @[comparator.scala 121:34]
  wire  comparatorModule_1_io_maxMin; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_2_io_in1; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_2_io_in2; // @[comparator.scala 121:34]
  wire  comparatorModule_2_io_maxMin; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_3_io_in1; // @[comparator.scala 121:34]
  wire [6:0] comparatorModule_3_io_in2; // @[comparator.scala 121:34]
  wire  comparatorModule_3_io_maxMin; // @[comparator.scala 121:34]
  reg [6:0] regMinMaxResultVec_0_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [2:0] regMinMaxResultVec_0_minMaxIndex; // @[multiple_comparator.scala 113:31]
  reg [6:0] regMinMaxResultVec_1_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [2:0] regMinMaxResultVec_1_minMaxIndex; // @[multiple_comparator.scala 113:31]
  reg [6:0] regMinMaxResultVec_2_minMaxResult; // @[multiple_comparator.scala 113:31]
  reg [2:0] regMinMaxResultVec_2_minMaxIndex; // @[multiple_comparator.scala 113:31]
  reg [2:0] regMinMaxResultVec_3_minMaxIndex; // @[multiple_comparator.scala 113:31]
  wire  maxMinOutput_1 = comparatorModule_io_maxMin; // @[comparator.scala 126:28 145:18]
  wire  _GEN_1 = ~maxMinOutput_1 ? 1'h0 : 1'h1; // @[comparator.scala 155:40 157:19 160:19]
  wire  maxMinOutput_2 = comparatorModule_1_io_maxMin; // @[comparator.scala 126:28 145:18]
  wire [1:0] _GEN_3 = ~maxMinOutput_2 ? 2'h2 : 2'h3; // @[comparator.scala 155:40 157:19 160:19]
  wire  maxMinOutput_3 = comparatorModule_2_io_maxMin; // @[comparator.scala 126:28 145:18]
  wire [2:0] _GEN_5 = ~maxMinOutput_3 ? regMinMaxResultVec_0_minMaxIndex : regMinMaxResultVec_1_minMaxIndex; // @[comparator.scala 155:40 157:19 160:19]
  wire  maxMinOutput_4 = comparatorModule_3_io_maxMin; // @[comparator.scala 126:28 145:18]
  wire [2:0] _GEN_7 = ~maxMinOutput_4 ? regMinMaxResultVec_2_minMaxIndex : 3'h4; // @[comparator.scala 155:40 157:19 160:19]
  wire [6:0] resultIndex = {{6'd0}, _GEN_1}; // @[comparator.scala 124:27]
  wire [6:0] _GEN_9 = io_start ? resultIndex : {{4'd0}, regMinMaxResultVec_0_minMaxIndex}; // @[multiple_comparator.scala 130:18 113:31 170:45]
  wire [6:0] resultIndex_1 = {{5'd0}, _GEN_3}; // @[comparator.scala 124:27]
  wire [6:0] _GEN_11 = io_start ? resultIndex_1 : {{4'd0}, regMinMaxResultVec_1_minMaxIndex}; // @[multiple_comparator.scala 130:18 113:31 170:45]
  wire [6:0] resultIndex_2 = {{4'd0}, _GEN_5}; // @[comparator.scala 124:27]
  wire [6:0] _GEN_13 = io_start ? resultIndex_2 : {{4'd0}, regMinMaxResultVec_2_minMaxIndex}; // @[multiple_comparator.scala 130:18 113:31 249:47]
  wire [6:0] resultIndex_3 = {{4'd0}, _GEN_7}; // @[comparator.scala 124:27]
  wire [6:0] _GEN_15 = io_start ? resultIndex_3 : {{4'd0}, regMinMaxResultVec_3_minMaxIndex}; // @[multiple_comparator.scala 130:18 113:31 214:51]
  Comparator_25 comparatorModule ( // @[comparator.scala 121:34]
    .io_in1(comparatorModule_io_in1),
    .io_in2(comparatorModule_io_in2),
    .io_maxMin(comparatorModule_io_maxMin)
  );
  Comparator_25 comparatorModule_1 ( // @[comparator.scala 121:34]
    .io_in1(comparatorModule_1_io_in1),
    .io_in2(comparatorModule_1_io_in2),
    .io_maxMin(comparatorModule_1_io_maxMin)
  );
  Comparator_25 comparatorModule_2 ( // @[comparator.scala 121:34]
    .io_in1(comparatorModule_2_io_in1),
    .io_in2(comparatorModule_2_io_in2),
    .io_maxMin(comparatorModule_2_io_maxMin)
  );
  Comparator_25 comparatorModule_3 ( // @[comparator.scala 121:34]
    .io_in1(comparatorModule_3_io_in1),
    .io_in2(comparatorModule_3_io_in2),
    .io_maxMin(comparatorModule_3_io_maxMin)
  );
  assign io_result = {{4'd0}, regMinMaxResultVec_3_minMaxIndex}; // @[multiple_comparator.scala 274:13]
  assign comparatorModule_io_in1 = io_inputs_0; // @[comparator.scala 131:29]
  assign comparatorModule_io_in2 = io_inputs_1; // @[comparator.scala 132:29]
  assign comparatorModule_1_io_in1 = io_inputs_2; // @[comparator.scala 131:29]
  assign comparatorModule_1_io_in2 = io_inputs_3; // @[comparator.scala 132:29]
  assign comparatorModule_2_io_in1 = regMinMaxResultVec_0_minMaxResult; // @[comparator.scala 131:29]
  assign comparatorModule_2_io_in2 = regMinMaxResultVec_1_minMaxResult; // @[comparator.scala 132:29]
  assign comparatorModule_3_io_in1 = regMinMaxResultVec_2_minMaxResult; // @[comparator.scala 131:29]
  assign comparatorModule_3_io_in2 = io_inputs_4; // @[comparator.scala 132:29]
  always @(posedge clock) begin
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~maxMinOutput_1) begin // @[comparator.scala 155:40]
        regMinMaxResultVec_0_minMaxResult <= io_inputs_0; // @[comparator.scala 156:14]
      end else begin
        regMinMaxResultVec_0_minMaxResult <= io_inputs_1; // @[comparator.scala 159:14]
      end
    end
    regMinMaxResultVec_0_minMaxIndex <= _GEN_9[2:0];
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~maxMinOutput_2) begin // @[comparator.scala 155:40]
        regMinMaxResultVec_1_minMaxResult <= io_inputs_2; // @[comparator.scala 156:14]
      end else begin
        regMinMaxResultVec_1_minMaxResult <= io_inputs_3; // @[comparator.scala 159:14]
      end
    end
    regMinMaxResultVec_1_minMaxIndex <= _GEN_11[2:0];
    if (io_start) begin // @[multiple_comparator.scala 130:18]
      if (~maxMinOutput_3) begin // @[comparator.scala 155:40]
        regMinMaxResultVec_2_minMaxResult <= regMinMaxResultVec_0_minMaxResult; // @[comparator.scala 156:14]
      end else begin
        regMinMaxResultVec_2_minMaxResult <= regMinMaxResultVec_1_minMaxResult; // @[comparator.scala 159:14]
      end
    end
    regMinMaxResultVec_2_minMaxIndex <= _GEN_13[2:0];
    regMinMaxResultVec_3_minMaxIndex <= _GEN_15[2:0];
  end
endmodule
