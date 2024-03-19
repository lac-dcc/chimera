module Decode_0_2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h1)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module Decode_1_2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h2)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module Decode_2_2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h4)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module Decode_3_2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h8)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module Decoder2 (input [1:0] I, output [3:0] O);
wire  Decode_0_2_inst0_O;
wire  Decode_1_2_inst0_O;
wire  Decode_2_2_inst0_O;
wire  Decode_3_2_inst0_O;
Decode_0_2 Decode_0_2_inst0 (.I(I), .O(Decode_0_2_inst0_O));
Decode_1_2 Decode_1_2_inst0 (.I(I), .O(Decode_1_2_inst0_O));
Decode_2_2 Decode_2_2_inst0 (.I(I), .O(Decode_2_2_inst0_O));
Decode_3_2 Decode_3_2_inst0 (.I(I), .O(Decode_3_2_inst0_O));
assign O = {Decode_3_2_inst0_O,Decode_2_2_inst0_O,Decode_1_2_inst0_O,Decode_0_2_inst0_O};
endmodule

