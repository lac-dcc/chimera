module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Mux4 (input [3:0] I, input [1:0] S, output  O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
Mux2 Mux2_inst0 (.I({I[1],I[0]}), .S(S[0]), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[3],I[2]}), .S(S[0]), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({Mux2_inst1_O,Mux2_inst0_O}), .S(S[1]), .O(Mux2_inst2_O));
assign O = Mux2_inst2_O;
endmodule

module Mux8 (input [7:0] I, input [2:0] S, output  O);
wire  Mux4_inst0_O;
wire  Mux4_inst1_O;
wire  Mux2_inst0_O;
Mux4 Mux4_inst0 (.I({I[3],I[2],I[1],I[0]}), .S({S[1],S[0]}), .O(Mux4_inst0_O));
Mux4 Mux4_inst1 (.I({I[7],I[6],I[5],I[4]}), .S({S[1],S[0]}), .O(Mux4_inst1_O));
Mux2 Mux2_inst0 (.I({Mux4_inst1_O,Mux4_inst0_O}), .S(S[2]), .O(Mux2_inst0_O));
assign O = Mux2_inst0_O;
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

