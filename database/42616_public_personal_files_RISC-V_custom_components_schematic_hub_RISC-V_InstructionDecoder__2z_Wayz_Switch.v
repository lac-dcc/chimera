// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module _2z_Wayz_Switch (clk, rst, Input_1, Input_2, Input_3, Input_4, Input_5, Input_6, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [0:0] Input_1;
  input  wire [0:0] Input_2;
  input  wire [31:0] Input_3;
  input  wire [31:0] Input_4;
  input  wire [31:0] Input_5;
  input  wire [31:0] Input_6;
  output  wire [31:0] Output;

  TC_Switch # (.UUID(64'd3431983752590453678 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_0 (.en(wire_8), .in(wire_12), .out(wire_3_0));
  TC_And # (.UUID(64'd4115684092947974961 ^ UUID), .BIT_WIDTH(64'd1)) And_1 (.in0(wire_6), .in1(wire_4), .out(wire_8));
  TC_Not # (.UUID(64'd151693793307746527 ^ UUID), .BIT_WIDTH(64'd1)) Not_2 (.in(wire_0), .out(wire_4));
  TC_Not # (.UUID(64'd1865402277349321152 ^ UUID), .BIT_WIDTH(64'd1)) Not_3 (.in(wire_2), .out(wire_6));
  TC_Switch # (.UUID(64'd1272240731374184798 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_4 (.en(wire_7), .in(wire_1), .out(wire_3_1));
  TC_And # (.UUID(64'd2378847646963028805 ^ UUID), .BIT_WIDTH(64'd1)) And_5 (.in0(wire_2), .in1(wire_4), .out(wire_7));
  TC_Switch # (.UUID(64'd807698935169658963 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_6 (.en(wire_5), .in(wire_9), .out(wire_3_2));
  TC_And # (.UUID(64'd2079656294429638644 ^ UUID), .BIT_WIDTH(64'd1)) And_7 (.in0(wire_0), .in1(wire_6), .out(wire_5));
  TC_Switch # (.UUID(64'd2010686133163375882 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_8 (.en(wire_11), .in(wire_10), .out(wire_3_3));
  TC_And # (.UUID(64'd4798425047774457 ^ UUID), .BIT_WIDTH(64'd1)) And_9 (.in0(wire_2), .in1(wire_0), .out(wire_11));

  wire [0:0] wire_0;
  assign wire_0 = Input_1;
  wire [31:0] wire_1;
  assign wire_1 = Input_4;
  wire [0:0] wire_2;
  assign wire_2 = Input_2;
  wire [31:0] wire_3;
  wire [31:0] wire_3_0;
  wire [31:0] wire_3_1;
  wire [31:0] wire_3_2;
  wire [31:0] wire_3_3;
  assign wire_3 = wire_3_0|wire_3_1|wire_3_2|wire_3_3;
  assign Output = wire_3;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [0:0] wire_7;
  wire [0:0] wire_8;
  wire [31:0] wire_9;
  assign wire_9 = Input_5;
  wire [31:0] wire_10;
  assign wire_10 = Input_6;
  wire [0:0] wire_11;
  wire [31:0] wire_12;
  assign wire_12 = Input_3;

endmodule
