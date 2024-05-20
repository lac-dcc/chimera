// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module ALU (clk, rst, \æ_____ , \è______1 , \è______2 , Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] \æ_____ ;
  input  wire [7:0] \è______1 ;
  input  wire [7:0] \è______2 ;
  output  wire [7:0] Output;

  TC_Splitter8 # (.UUID(64'd4503754288184316976 ^ UUID)) Splitter8_0 (.in(wire_14), .out0(wire_20), .out1(wire_3), .out2(wire_23), .out3(), .out4(), .out5(), .out6(), .out7());
  TC_Decoder3 # (.UUID(64'd1287097893371781238 ^ UUID)) Decoder3_1 (.dis(1'd0), .sel0(wire_20), .sel1(wire_3), .sel2(wire_23), .out0(wire_17), .out1(wire_10), .out2(wire_5), .out3(wire_24), .out4(wire_12), .out5(wire_18), .out6(), .out7());
  TC_Or # (.UUID(64'd2102355290693069281 ^ UUID), .BIT_WIDTH(64'd8)) Or8_2 (.in0(wire_7), .in1(wire_0), .out(wire_11));
  TC_Switch # (.UUID(64'd3955843348845505503 ^ UUID), .BIT_WIDTH(64'd8)) Switch8_3 (.en(wire_17), .in(wire_11), .out(wire_8_3));
  TC_Or # (.UUID(64'd1138358230590770772 ^ UUID), .BIT_WIDTH(64'd8)) Or8_4 (.in0(wire_21), .in1(wire_16), .out(wire_19));
  TC_Not # (.UUID(64'd2874953002594435817 ^ UUID), .BIT_WIDTH(64'd8)) Not8_5 (.in(wire_7), .out(wire_21));
  TC_Not # (.UUID(64'd3261420662032331478 ^ UUID), .BIT_WIDTH(64'd8)) Not8_6 (.in(wire_0), .out(wire_16));
  TC_Switch # (.UUID(64'd1559193756622028187 ^ UUID), .BIT_WIDTH(64'd8)) Switch8_7 (.en(wire_10), .in(wire_19), .out(wire_8_5));
  TC_Switch # (.UUID(64'd562902586904156559 ^ UUID), .BIT_WIDTH(64'd8)) Switch8_8 (.en(wire_5), .in(wire_6), .out(wire_8_4));
  TC_Or # (.UUID(64'd1762851381222581582 ^ UUID), .BIT_WIDTH(64'd8)) Or8_9 (.in0(wire_7), .in1(wire_0), .out(wire_1));
  TC_Not # (.UUID(64'd3866306404953024228 ^ UUID), .BIT_WIDTH(64'd8)) Not8_10 (.in(wire_1), .out(wire_6));
  TC_Not # (.UUID(64'd4374362103234097039 ^ UUID), .BIT_WIDTH(64'd8)) Not8_11 (.in(wire_7), .out(wire_13));
  TC_Not # (.UUID(64'd1299975577945567859 ^ UUID), .BIT_WIDTH(64'd8)) Not8_12 (.in(wire_0), .out(wire_22));
  TC_Or # (.UUID(64'd3778950935273956021 ^ UUID), .BIT_WIDTH(64'd8)) Or8_13 (.in0(wire_13), .in1(wire_22), .out(wire_25));
  TC_Not # (.UUID(64'd1920809211267629108 ^ UUID), .BIT_WIDTH(64'd8)) Not8_14 (.in(wire_25), .out(wire_9));
  TC_Switch # (.UUID(64'd3823930859173339200 ^ UUID), .BIT_WIDTH(64'd8)) Switch8_15 (.en(wire_24), .in(wire_9), .out(wire_8_1));
  TC_Switch # (.UUID(64'd3202039647240155243 ^ UUID), .BIT_WIDTH(64'd8)) Switch8_16 (.en(wire_12), .in(wire_2), .out(wire_8_2));
  TC_Add # (.UUID(64'd2569020168253982736 ^ UUID), .BIT_WIDTH(64'd8)) Add8_17 (.in0(wire_7), .in1(wire_0), .ci(1'd0), .out(wire_2), .co());
  TC_Switch # (.UUID(64'd2734422171326569155 ^ UUID), .BIT_WIDTH(64'd8)) Switch8_18 (.en(wire_18), .in(wire_15), .out(wire_8_0));
  TC_Add # (.UUID(64'd4595643146173721565 ^ UUID), .BIT_WIDTH(64'd8)) Add8_19 (.in0(wire_7), .in1(wire_4), .ci(1'd0), .out(wire_15), .co());
  TC_Neg # (.UUID(64'd4435798358922345065 ^ UUID), .BIT_WIDTH(64'd8)) Neg8_20 (.in(wire_0), .out(wire_4));

  wire [7:0] wire_0;
  assign wire_0 = \è______2 ;
  wire [7:0] wire_1;
  wire [7:0] wire_2;
  wire [0:0] wire_3;
  wire [7:0] wire_4;
  wire [0:0] wire_5;
  wire [7:0] wire_6;
  wire [7:0] wire_7;
  assign wire_7 = \è______1 ;
  wire [7:0] wire_8;
  wire [7:0] wire_8_0;
  wire [7:0] wire_8_1;
  wire [7:0] wire_8_2;
  wire [7:0] wire_8_3;
  wire [7:0] wire_8_4;
  wire [7:0] wire_8_5;
  assign wire_8 = wire_8_0|wire_8_1|wire_8_2|wire_8_3|wire_8_4|wire_8_5;
  assign Output = wire_8;
  wire [7:0] wire_9;
  wire [0:0] wire_10;
  wire [7:0] wire_11;
  wire [0:0] wire_12;
  wire [7:0] wire_13;
  wire [7:0] wire_14;
  assign wire_14 = \æ_____ ;
  wire [7:0] wire_15;
  wire [7:0] wire_16;
  wire [0:0] wire_17;
  wire [0:0] wire_18;
  wire [7:0] wire_19;
  wire [0:0] wire_20;
  wire [7:0] wire_21;
  wire [7:0] wire_22;
  wire [0:0] wire_23;
  wire [0:0] wire_24;
  wire [7:0] wire_25;

endmodule
