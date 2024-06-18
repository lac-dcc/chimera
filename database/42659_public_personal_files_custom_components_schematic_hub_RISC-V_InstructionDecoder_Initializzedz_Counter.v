// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module Initializzedz_Counter (clk, rst, Initial, Override_Value, \Inc/Override , Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Initial;
  input  wire [31:0] Override_Value;
  input  wire [0:0] \Inc/Override ;
  output  wire [31:0] Output;

  TC_Counter # (.UUID(64'd987364575763077419 ^ UUID), .BIT_WIDTH(64'd32), .count(32'd4)) Counter32_0 (.clk(clk), .rst(rst), .save(wire_11), .in(wire_8), .out(wire_2));
  TC_DelayLine # (.UUID(64'd3556593435722750354 ^ UUID), .BIT_WIDTH(64'd1)) DelayLine1_1 (.clk(clk), .rst(rst), .in(wire_7), .out(wire_9));
  TC_Xor # (.UUID(64'd4006914705683511986 ^ UUID), .BIT_WIDTH(64'd1)) Xor_2 (.in0(wire_9), .in1(wire_7), .out(wire_3));
  TC_Constant # (.UUID(64'd380989476538028901 ^ UUID), .BIT_WIDTH(64'd1), .value(1'd1)) On_3 (.out(wire_7));
  TC_Mux # (.UUID(64'd1718983188557059181 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_4 (.sel(wire_3), .in0(wire_2), .in1(wire_1), .out(wire_0));
  TC_Mux # (.UUID(64'd2870818784702166659 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_5 (.sel(wire_10), .in0(wire_4), .in1(wire_1), .out(wire_8));
  TC_Or # (.UUID(64'd3606832466707556131 ^ UUID), .BIT_WIDTH(64'd1)) Or_6 (.in0(wire_5), .in1(wire_3), .out(wire_11));
  TC_And # (.UUID(64'd3704687937979443148 ^ UUID), .BIT_WIDTH(64'd1)) And_7 (.in0(wire_6), .in1(wire_3), .out(wire_10));
  TC_Not # (.UUID(64'd2941260822051196779 ^ UUID), .BIT_WIDTH(64'd1)) Not_8 (.in(wire_5), .out(wire_6));

  wire [31:0] wire_0;
  assign Output = wire_0;
  wire [31:0] wire_1;
  assign wire_1 = Initial;
  wire [31:0] wire_2;
  wire [0:0] wire_3;
  wire [31:0] wire_4;
  assign wire_4 = Override_Value;
  wire [0:0] wire_5;
  assign wire_5 = \Inc/Override ;
  wire [0:0] wire_6;
  wire [0:0] wire_7;
  wire [31:0] wire_8;
  wire [0:0] wire_9;
  wire [0:0] wire_10;
  wire [0:0] wire_11;

endmodule
