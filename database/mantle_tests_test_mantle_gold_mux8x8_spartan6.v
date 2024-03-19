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

module Mux8x8 (input [7:0] I0, input [7:0] I1, input [7:0] I2, input [7:0] I3, input [7:0] I4, input [7:0] I5, input [7:0] I6, input [7:0] I7, input [2:0] S, output [7:0] O);
wire  Mux8_inst0_O;
wire  Mux8_inst1_O;
wire  Mux8_inst2_O;
wire  Mux8_inst3_O;
wire  Mux8_inst4_O;
wire  Mux8_inst5_O;
wire  Mux8_inst6_O;
wire  Mux8_inst7_O;
Mux8 Mux8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux8_inst0_O));
Mux8 Mux8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux8_inst1_O));
Mux8 Mux8_inst2 (.I({I7[2],I6[2],I5[2],I4[2],I3[2],I2[2],I1[2],I0[2]}), .S(S), .O(Mux8_inst2_O));
Mux8 Mux8_inst3 (.I({I7[3],I6[3],I5[3],I4[3],I3[3],I2[3],I1[3],I0[3]}), .S(S), .O(Mux8_inst3_O));
Mux8 Mux8_inst4 (.I({I7[4],I6[4],I5[4],I4[4],I3[4],I2[4],I1[4],I0[4]}), .S(S), .O(Mux8_inst4_O));
Mux8 Mux8_inst5 (.I({I7[5],I6[5],I5[5],I4[5],I3[5],I2[5],I1[5],I0[5]}), .S(S), .O(Mux8_inst5_O));
Mux8 Mux8_inst6 (.I({I7[6],I6[6],I5[6],I4[6],I3[6],I2[6],I1[6],I0[6]}), .S(S), .O(Mux8_inst6_O));
Mux8 Mux8_inst7 (.I({I7[7],I6[7],I5[7],I4[7],I3[7],I2[7],I1[7],I0[7]}), .S(S), .O(Mux8_inst7_O));
assign O = {Mux8_inst7_O,Mux8_inst6_O,Mux8_inst5_O,Mux8_inst4_O,Mux8_inst3_O,Mux8_inst2_O,Mux8_inst1_O,Mux8_inst0_O};
endmodule

