module Mux4 (input [3:0] I, input [1:0] S, output  O);
wire  LUT6_inst0_O;
LUT6 #(.INIT(64'hFF00F0F0CCCCAAAA)) LUT6_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(S[0]), .I5(S[1]), .O(LUT6_inst0_O));
assign O = LUT6_inst0_O;
endmodule

module Mux8 (input [7:0] I, input [2:0] S, output  O);
wire  Mux4_inst0_O;
wire  Mux4_inst1_O;
wire  MUXF7_inst0_O;
Mux4 Mux4_inst0 (.I({I[3],I[2],I[1],I[0]}), .S({S[1],S[0]}), .O(Mux4_inst0_O));
Mux4 Mux4_inst1 (.I({I[7],I[6],I[5],I[4]}), .S({S[1],S[0]}), .O(Mux4_inst1_O));
MUXF7 MUXF7_inst0 (.I0(Mux4_inst0_O), .I1(Mux4_inst1_O), .S(S[2]), .O(MUXF7_inst0_O));
assign O = MUXF7_inst0_O;
endmodule

module Mux8x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, input [1:0] I4, input [1:0] I5, input [1:0] I6, input [1:0] I7, input [2:0] S, output [1:0] O);
wire  Mux8_inst0_O;
wire  Mux8_inst1_O;
Mux8 Mux8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux8_inst0_O));
Mux8 Mux8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux8_inst1_O));
assign O = {Mux8_inst1_O,Mux8_inst0_O};
endmodule

