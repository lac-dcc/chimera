// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module LEG_DEC (clk, rst, OPCODE, IMMEDIATE1, IMMEDIATE2, CALCULATION, JUMP);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] OPCODE;
  output  wire [0:0] IMMEDIATE1;
  output  wire [0:0] IMMEDIATE2;
  output  wire [0:0] CALCULATION;
  output  wire [0:0] JUMP;

  TC_Splitter8 # (.UUID(64'd2459092867252704659 ^ UUID)) Splitter8_0 (.in(wire_13), .out0(), .out1(), .out2(), .out3(), .out4(wire_24), .out5(wire_36), .out6(wire_18), .out7(wire_20));
  TC_Equal # (.UUID(64'd4451411414923206213 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_1 (.in0(wire_0), .in1(wire_25), .out(wire_26));
  TC_Constant # (.UUID(64'd4146811536148831861 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h20)) Constant8_2 (.out(wire_25));
  TC_Equal # (.UUID(64'd3175768114047069080 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_3 (.in0(wire_0), .in1(wire_12), .out(wire_11));
  TC_Constant # (.UUID(64'd2100458896617105062 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h21)) Constant8_4 (.out(wire_12));
  TC_Equal # (.UUID(64'd18612831955176227 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_5 (.in0(wire_0), .in1(wire_29), .out(wire_9));
  TC_Constant # (.UUID(64'd4436786725961600454 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h22)) Constant8_6 (.out(wire_29));
  TC_Equal # (.UUID(64'd3951549131992813285 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_7 (.in0(wire_0), .in1(wire_10), .out(wire_14));
  TC_Constant # (.UUID(64'd2187694636879553517 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h23)) Constant8_8 (.out(wire_10));
  TC_Equal # (.UUID(64'd1722280921780021930 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_9 (.in0(wire_0), .in1(wire_22), .out(wire_3));
  TC_Constant # (.UUID(64'd1232993965608782474 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h24)) Constant8_10 (.out(wire_22));
  TC_Equal # (.UUID(64'd1677764983551709104 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_11 (.in0(wire_0), .in1(wire_30), .out(wire_34));
  TC_Constant # (.UUID(64'd3969712149290372119 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h25)) Constant8_12 (.out(wire_30));
  TC_Or3 # (.UUID(64'd4231655371929136514 ^ UUID), .BIT_WIDTH(64'd1)) Or3_13 (.in0(wire_26), .in1(wire_11), .in2(wire_9), .out(wire_38));
  TC_Or3 # (.UUID(64'd493742362470177643 ^ UUID), .BIT_WIDTH(64'd1)) Or3_14 (.in0(wire_38), .in1(wire_14), .in2(wire_3), .out(wire_1));
  TC_Or # (.UUID(64'd3897193912910816394 ^ UUID), .BIT_WIDTH(64'd1)) Or_15 (.in0(wire_1), .in1(wire_34), .out(wire_2));
  TC_Maker8 # (.UUID(64'd2291807996615366193 ^ UUID)) Maker8_16 (.in0(wire_4), .in1(wire_8), .in2(wire_27), .in3(wire_28), .in4(wire_32), .in5(wire_35), .in6(1'd0), .in7(1'd0), .out(wire_0));
  TC_Splitter8 # (.UUID(64'd4080107753313342668 ^ UUID)) Splitter8_17 (.in(wire_13), .out0(wire_4), .out1(wire_8), .out2(wire_27), .out3(wire_28), .out4(wire_32), .out5(wire_35), .out6(), .out7());
  TC_Equal # (.UUID(64'd1575691802816333630 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_18 (.in0(wire_0), .in1(wire_15), .out(wire_37));
  TC_Constant # (.UUID(64'd2243064400976776907 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h26)) Constant8_19 (.out(wire_15));
  TC_Equal # (.UUID(64'd2218846295328613627 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_20 (.in0(wire_0), .in1(wire_23), .out(wire_7));
  TC_Constant # (.UUID(64'd881034633714321570 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h27)) Constant8_21 (.out(wire_23));
  TC_Equal # (.UUID(64'd3800460401817314712 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_22 (.in0(wire_0), .in1(wire_6), .out(wire_33));
  TC_Constant # (.UUID(64'd1054111247363263687 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h28)) Constant8_23 (.out(wire_6));
  TC_Equal # (.UUID(64'd4472397517882712351 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_24 (.in0(wire_0), .in1(wire_31), .out(wire_17));
  TC_Constant # (.UUID(64'd1230196465029298567 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h29)) Constant8_25 (.out(wire_31));
  TC_Or3 # (.UUID(64'd2807356996375230132 ^ UUID), .BIT_WIDTH(64'd1)) Or3_26 (.in0(wire_37), .in1(wire_7), .in2(wire_33), .out(wire_21));
  TC_Or # (.UUID(64'd3141084281707462634 ^ UUID), .BIT_WIDTH(64'd1)) Or_27 (.in0(wire_21), .in1(wire_17), .out(wire_19));
  TC_Or # (.UUID(64'd91824510583613682 ^ UUID), .BIT_WIDTH(64'd1)) Or_28 (.in0(wire_2), .in1(wire_19), .out(wire_16));
  _4bit_Decoder # (.UUID(64'd2481737798594514154 ^ UUID)) _4bit_Decoder_29 (.clk(clk), .rst(rst), .\1_1 (wire_24), .\2_1 (wire_36), .\4_1 (1'd0), .\8_1 (1'd0), .\7 (), .\11 (), .\3 (), .\15 (), .\6 (), .\8_2 (), .\5 (), .\9 (), .\10 (), .\4_2 (), .\12 (), .\13 (), .\14 (), .\2_2 (), .\1_2 (), .\0 (wire_5));

  wire [7:0] wire_0;
  wire [0:0] wire_1;
  wire [0:0] wire_2;
  wire [0:0] wire_3;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  assign CALCULATION = wire_5;
  wire [7:0] wire_6;
  wire [0:0] wire_7;
  wire [0:0] wire_8;
  wire [0:0] wire_9;
  wire [7:0] wire_10;
  wire [0:0] wire_11;
  wire [7:0] wire_12;
  wire [7:0] wire_13;
  assign wire_13 = OPCODE;
  wire [0:0] wire_14;
  wire [7:0] wire_15;
  wire [0:0] wire_16;
  assign JUMP = wire_16;
  wire [0:0] wire_17;
  wire [0:0] wire_18;
  assign IMMEDIATE2 = wire_18;
  wire [0:0] wire_19;
  wire [0:0] wire_20;
  assign IMMEDIATE1 = wire_20;
  wire [0:0] wire_21;
  wire [7:0] wire_22;
  wire [7:0] wire_23;
  wire [0:0] wire_24;
  wire [7:0] wire_25;
  wire [0:0] wire_26;
  wire [0:0] wire_27;
  wire [0:0] wire_28;
  wire [7:0] wire_29;
  wire [7:0] wire_30;
  wire [7:0] wire_31;
  wire [0:0] wire_32;
  wire [0:0] wire_33;
  wire [0:0] wire_34;
  wire [0:0] wire_35;
  wire [0:0] wire_36;
  wire [0:0] wire_37;
  wire [0:0] wire_38;

endmodule
