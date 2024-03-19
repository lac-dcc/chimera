module Decode_0_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0001)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_1_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0002)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_2_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0004)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_3_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0008)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_4_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0010)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_5_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0020)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_6_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0040)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_7_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0080)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_8_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0100)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_9_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0200)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_10_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0400)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_11_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0800)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_12_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h1000)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_13_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h2000)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_14_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h4000)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decode_15_4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h8000)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Decoder4 (input [3:0] I, output [15:0] O);
wire  Decode_0_4_inst0_O;
wire  Decode_1_4_inst0_O;
wire  Decode_2_4_inst0_O;
wire  Decode_3_4_inst0_O;
wire  Decode_4_4_inst0_O;
wire  Decode_5_4_inst0_O;
wire  Decode_6_4_inst0_O;
wire  Decode_7_4_inst0_O;
wire  Decode_8_4_inst0_O;
wire  Decode_9_4_inst0_O;
wire  Decode_10_4_inst0_O;
wire  Decode_11_4_inst0_O;
wire  Decode_12_4_inst0_O;
wire  Decode_13_4_inst0_O;
wire  Decode_14_4_inst0_O;
wire  Decode_15_4_inst0_O;
Decode_0_4 Decode_0_4_inst0 (.I(I), .O(Decode_0_4_inst0_O));
Decode_1_4 Decode_1_4_inst0 (.I(I), .O(Decode_1_4_inst0_O));
Decode_2_4 Decode_2_4_inst0 (.I(I), .O(Decode_2_4_inst0_O));
Decode_3_4 Decode_3_4_inst0 (.I(I), .O(Decode_3_4_inst0_O));
Decode_4_4 Decode_4_4_inst0 (.I(I), .O(Decode_4_4_inst0_O));
Decode_5_4 Decode_5_4_inst0 (.I(I), .O(Decode_5_4_inst0_O));
Decode_6_4 Decode_6_4_inst0 (.I(I), .O(Decode_6_4_inst0_O));
Decode_7_4 Decode_7_4_inst0 (.I(I), .O(Decode_7_4_inst0_O));
Decode_8_4 Decode_8_4_inst0 (.I(I), .O(Decode_8_4_inst0_O));
Decode_9_4 Decode_9_4_inst0 (.I(I), .O(Decode_9_4_inst0_O));
Decode_10_4 Decode_10_4_inst0 (.I(I), .O(Decode_10_4_inst0_O));
Decode_11_4 Decode_11_4_inst0 (.I(I), .O(Decode_11_4_inst0_O));
Decode_12_4 Decode_12_4_inst0 (.I(I), .O(Decode_12_4_inst0_O));
Decode_13_4 Decode_13_4_inst0 (.I(I), .O(Decode_13_4_inst0_O));
Decode_14_4 Decode_14_4_inst0 (.I(I), .O(Decode_14_4_inst0_O));
Decode_15_4 Decode_15_4_inst0 (.I(I), .O(Decode_15_4_inst0_O));
assign O = {Decode_15_4_inst0_O,Decode_14_4_inst0_O,Decode_13_4_inst0_O,Decode_12_4_inst0_O,Decode_11_4_inst0_O,Decode_10_4_inst0_O,Decode_9_4_inst0_O,Decode_8_4_inst0_O,Decode_7_4_inst0_O,Decode_6_4_inst0_O,Decode_5_4_inst0_O,Decode_4_4_inst0_O,Decode_3_4_inst0_O,Decode_2_4_inst0_O,Decode_1_4_inst0_O,Decode_0_4_inst0_O};
endmodule

