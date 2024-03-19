module Mux4 (input [3:0] I, input [1:0] S, output  O);
wire  LUT6_inst0_O;
LUT6 #(.INIT(64'hFF00F0F0CCCCAAAA)) LUT6_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(S[0]), .I5(S[1]), .O(LUT6_inst0_O));
assign O = LUT6_inst0_O;
endmodule

module Mux4x4 (input [3:0] I0, input [3:0] I1, input [3:0] I2, input [3:0] I3, input [1:0] S, output [3:0] O);
wire  Mux4_inst0_O;
wire  Mux4_inst1_O;
wire  Mux4_inst2_O;
wire  Mux4_inst3_O;
Mux4 Mux4_inst0 (.I({I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux4_inst0_O));
Mux4 Mux4_inst1 (.I({I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux4_inst1_O));
Mux4 Mux4_inst2 (.I({I3[2],I2[2],I1[2],I0[2]}), .S(S), .O(Mux4_inst2_O));
Mux4 Mux4_inst3 (.I({I3[3],I2[3],I1[3],I0[3]}), .S(S), .O(Mux4_inst3_O));
assign O = {Mux4_inst3_O,Mux4_inst2_O,Mux4_inst1_O,Mux4_inst0_O};
endmodule

