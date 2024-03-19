module Mux4 (input [3:0] I, input [1:0] S, output  O);
wire  LUT6_inst0_O;
LUT6 #(.INIT(64'hFF00F0F0CCCCAAAA)) LUT6_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(S[0]), .I5(S[1]), .O(LUT6_inst0_O));
assign O = LUT6_inst0_O;
endmodule

