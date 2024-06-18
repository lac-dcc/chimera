// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module RegularFuzzification(
  input        clock,
  input        reset,
  input        io_start,
  input        io_inputs_0,
  input        io_inputs_1,
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
  output       io_outResultValid,
  output [6:0] io_outResult
);
  wire  fuzzification_clock; // @[regular_fuzzification.scala 454:31]
  wire  fuzzification_io_start; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_0; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_1; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_2; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_3; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_4; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_5; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_6; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_7; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_8; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_lutConnections_9; // @[regular_fuzzification.scala 454:31]
  wire [6:0] fuzzification_io_outResult; // @[regular_fuzzification.scala 454:31]
  reg [9:0] regIndex; // @[regular_fuzzy_controller_interface.scala 60:25]
  reg  regStart; // @[regular_fuzzy_controller_interface.scala 64:25]
  wire [9:0] _regIndex_T_1 = regIndex - 10'h1; // @[regular_fuzzy_controller_interface.scala 75:28]
  RegularFuzzificationInput fuzzification ( // @[regular_fuzzification.scala 454:31]
    .clock(fuzzification_clock),
    .io_start(fuzzification_io_start),
    .io_lutConnections_0(fuzzification_io_lutConnections_0),
    .io_lutConnections_1(fuzzification_io_lutConnections_1),
    .io_lutConnections_2(fuzzification_io_lutConnections_2),
    .io_lutConnections_3(fuzzification_io_lutConnections_3),
    .io_lutConnections_4(fuzzification_io_lutConnections_4),
    .io_lutConnections_5(fuzzification_io_lutConnections_5),
    .io_lutConnections_6(fuzzification_io_lutConnections_6),
    .io_lutConnections_7(fuzzification_io_lutConnections_7),
    .io_lutConnections_8(fuzzification_io_lutConnections_8),
    .io_lutConnections_9(fuzzification_io_lutConnections_9),
    .io_outResult(fuzzification_io_outResult)
  );
  assign io_outResultValid = 1'h0; // @[regular_fuzzy_controller_interface.scala 101:21]
  assign io_outResult = fuzzification_io_outResult; // @[regular_fuzzy_controller_interface.scala 100:16]
  assign fuzzification_clock = clock;
  assign fuzzification_io_start = regStart; // @[regular_fuzzification.scala 473:28]
  assign fuzzification_io_lutConnections_0 = io_lutConnections_0; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_1 = io_lutConnections_1; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_2 = io_lutConnections_2; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_3 = io_lutConnections_3; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_4 = io_lutConnections_4; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_5 = io_lutConnections_5; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_6 = io_lutConnections_6; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_7 = io_lutConnections_7; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_8 = io_lutConnections_8; // @[regular_fuzzification.scala 478:37]
  assign fuzzification_io_lutConnections_9 = io_lutConnections_9; // @[regular_fuzzification.scala 478:37]
  always @(posedge clock) begin
    if (reset) begin // @[regular_fuzzy_controller_interface.scala 60:25]
      regIndex <= 10'h9; // @[regular_fuzzy_controller_interface.scala 60:25]
    end else if (io_start) begin // @[regular_fuzzy_controller_interface.scala 66:29]
      if (regIndex != 10'h0) begin // @[regular_fuzzy_controller_interface.scala 74:28]
        regIndex <= _regIndex_T_1; // @[regular_fuzzy_controller_interface.scala 75:16]
      end else begin
        regIndex <= 10'h9; // @[regular_fuzzy_controller_interface.scala 77:16]
      end
    end
    if (reset) begin // @[regular_fuzzy_controller_interface.scala 64:25]
      regStart <= 1'h0; // @[regular_fuzzy_controller_interface.scala 64:25]
    end else if (io_start) begin // @[regular_fuzzy_controller_interface.scala 66:29]
      if (!(regIndex != 10'h0)) begin // @[regular_fuzzy_controller_interface.scala 74:28]
        regStart <= 1'h1; // @[regular_fuzzy_controller_interface.scala 78:16]
      end
    end
  end
endmodule
