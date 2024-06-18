// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module Programz_Counter (clk, rst, Input, Override, Enable, Value, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Input;
  input  wire [0:0] Override;
  input  wire [0:0] Enable;
  input  wire [31:0] Value;
  output  wire [31:0] Output;

  TC_Mux # (.UUID(64'd1611539652494828272 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_0 (.sel(wire_0), .in0(wire_4), .in1(wire_2), .out(wire_6));
  TC_Not # (.UUID(64'd1077361513215086828 ^ UUID), .BIT_WIDTH(64'd1)) Not_1 (.in(wire_5), .out(wire_0));
  TC_Or # (.UUID(64'd1549204150921008680 ^ UUID), .BIT_WIDTH(64'd1)) Or_2 (.in0(wire_0), .in1(wire_7), .out(wire_1));
  Initializzedz_Counter # (.UUID(64'd486728628045938889 ^ UUID)) Initializzedz_Counter_3 (.clk(clk), .rst(rst), .Initial(wire_3), .Override_Value(wire_6), .\Inc/Override (wire_1), .Output(wire_2));

  wire [0:0] wire_0;
  wire [0:0] wire_1;
  wire [31:0] wire_2;
  assign Output = wire_2;
  wire [31:0] wire_3;
  assign wire_3 = Input;
  wire [31:0] wire_4;
  assign wire_4 = Value;
  wire [0:0] wire_5;
  assign wire_5 = Enable;
  wire [31:0] wire_6;
  wire [0:0] wire_7;
  assign wire_7 = Override;

endmodule
