// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module RegisterPlus (clk, rst, \å_____ , \ä___________ , \ä_____ , \å___________ , Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [0:0] \å_____ ;
  input  wire [7:0] \ä___________ ;
  input  wire [0:0] \ä_____ ;
  output  wire [7:0] \å___________ ;
  output  wire [7:0] Output;

  TC_Register # (.UUID(64'd1 ^ UUID), .BIT_WIDTH(64'd8)) Register8_0 (.clk(clk), .rst(rst), .load(wire_3), .save(wire_1), .in(wire_4), .out(wire_0));
  TC_Constant # (.UUID(64'd2 ^ UUID), .BIT_WIDTH(64'd1), .value(1'd1)) On_1 (.out(wire_3));
  TC_Switch # (.UUID(64'd3587491547824661070 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_2 (.en(wire_2), .in(wire_0), .out(Output));

  wire [7:0] wire_0;
  assign \å___________  = wire_0;
  wire [0:0] wire_1;
  assign wire_1 = \ä_____ ;
  wire [0:0] wire_2;
  assign wire_2 = \å_____ ;
  wire [0:0] wire_3;
  wire [7:0] wire_4;
  assign wire_4 = \ä___________ ;

endmodule
