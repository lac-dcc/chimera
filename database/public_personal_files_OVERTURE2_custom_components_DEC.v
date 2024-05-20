// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module DEC (clk, rst, OPCODE, IMMEDIATE, CALCULATION, COPY, CONDITION);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] OPCODE;
  output  wire [0:0] IMMEDIATE;
  output  wire [0:0] CALCULATION;
  output  wire [0:0] COPY;
  output  wire [0:0] CONDITION;

  TC_Decoder3 # (.UUID(64'd2677670007108613267 ^ UUID)) Decoder3_0 (.dis(1'd0), .sel0(wire_4), .sel1(wire_2), .sel2(1'd0), .out0(wire_3), .out1(wire_5), .out2(wire_6), .out3(wire_0), .out4(), .out5(), .out6(), .out7());
  TC_Splitter8 # (.UUID(64'd2459092867252704659 ^ UUID)) Splitter8_1 (.in(wire_1), .out0(), .out1(), .out2(), .out3(), .out4(), .out5(), .out6(wire_4), .out7(wire_2));

  wire [0:0] wire_0;
  assign CONDITION = wire_0;
  wire [7:0] wire_1;
  assign wire_1 = OPCODE;
  wire [0:0] wire_2;
  wire [0:0] wire_3;
  assign IMMEDIATE = wire_3;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  assign CALCULATION = wire_5;
  wire [0:0] wire_6;
  assign COPY = wire_6;

endmodule
