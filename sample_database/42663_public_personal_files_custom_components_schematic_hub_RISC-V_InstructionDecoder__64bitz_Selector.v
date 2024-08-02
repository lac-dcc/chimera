// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module _64bitz_Selector (clk, rst, Bytes, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Bytes;
  output  wire [63:0] Output;

  TC_Decoder3 # (.UUID(64'd2008938029389413743 ^ UUID)) Decoder3_0 (.dis(wire_5), .sel0(wire_17), .sel1(wire_16), .sel2(wire_7), .out0(), .out1(wire_6), .out2(wire_9), .out3(wire_12), .out4(wire_10), .out5(wire_13), .out6(wire_3), .out7(wire_4));
  TC_Splitter8 # (.UUID(64'd2538187426160156624 ^ UUID)) Splitter8_1 (.in(wire_8), .out0(wire_17), .out1(wire_16), .out2(wire_7), .out3(wire_5), .out4(), .out5(), .out6(), .out7());
  TC_Constant # (.UUID(64'd1317202540524482891 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFF)) Constant64_2 (.out(wire_14));
  TC_Constant # (.UUID(64'd2964036284705632316 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFF)) Constant64_3 (.out(wire_11));
  TC_Constant # (.UUID(64'd4520294573583737365 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFFFF)) Constant64_4 (.out(wire_15));
  TC_Constant # (.UUID(64'd2894769916667870048 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFFFFFF)) Constant64_5 (.out(wire_19));
  TC_Constant # (.UUID(64'd3301229830879809709 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFFFFFFFF)) Constant64_6 (.out(wire_0));
  TC_Constant # (.UUID(64'd2051022614095237506 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFFFFFFFFFF)) Constant64_7 (.out(wire_1));
  TC_Constant # (.UUID(64'd51916287413211638 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFFFFFFFFFFFF)) Constant64_8 (.out(wire_20));
  TC_Constant # (.UUID(64'd2471884351248143865 ^ UUID), .BIT_WIDTH(64'd64), .value(64'hFFFFFFFFFFFFFFFF)) Constant64_9 (.out(wire_18));
  TC_Switch # (.UUID(64'd1202174902055717821 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_10 (.en(wire_6), .in(wire_14), .out(wire_2_0));
  TC_Switch # (.UUID(64'd1690989261796211799 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_11 (.en(wire_9), .in(wire_11), .out(wire_2_1));
  TC_Switch # (.UUID(64'd4026030872118728147 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_12 (.en(wire_12), .in(wire_15), .out(wire_2_2));
  TC_Switch # (.UUID(64'd1735707132438607736 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_13 (.en(wire_10), .in(wire_19), .out(wire_2_3));
  TC_Switch # (.UUID(64'd2399441238438433860 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_14 (.en(wire_13), .in(wire_0), .out(wire_2_4));
  TC_Switch # (.UUID(64'd952717081357858048 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_15 (.en(wire_3), .in(wire_1), .out(wire_2_5));
  TC_Switch # (.UUID(64'd39868304901018708 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_16 (.en(wire_4), .in(wire_20), .out(wire_2_6));
  TC_Switch # (.UUID(64'd2405627617729818975 ^ UUID), .BIT_WIDTH(64'd64)) Switch64_17 (.en(wire_5), .in(wire_18), .out(wire_2_7));

  wire [63:0] wire_0;
  wire [63:0] wire_1;
  wire [63:0] wire_2;
  wire [63:0] wire_2_0;
  wire [63:0] wire_2_1;
  wire [63:0] wire_2_2;
  wire [63:0] wire_2_3;
  wire [63:0] wire_2_4;
  wire [63:0] wire_2_5;
  wire [63:0] wire_2_6;
  wire [63:0] wire_2_7;
  assign wire_2 = wire_2_0|wire_2_1|wire_2_2|wire_2_3|wire_2_4|wire_2_5|wire_2_6|wire_2_7;
  assign Output = wire_2;
  wire [0:0] wire_3;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [0:0] wire_7;
  wire [7:0] wire_8;
  assign wire_8 = Bytes;
  wire [0:0] wire_9;
  wire [0:0] wire_10;
  wire [63:0] wire_11;
  wire [0:0] wire_12;
  wire [0:0] wire_13;
  wire [63:0] wire_14;
  wire [63:0] wire_15;
  wire [0:0] wire_16;
  wire [0:0] wire_17;
  wire [63:0] wire_18;
  wire [63:0] wire_19;
  wire [63:0] wire_20;

endmodule
