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

module Mux8x4 (input [3:0] I0, input [3:0] I1, input [3:0] I2, input [3:0] I3, input [3:0] I4, input [3:0] I5, input [3:0] I6, input [3:0] I7, input [2:0] S, output [3:0] O);
wire  Mux8_inst0_O;
wire  Mux8_inst1_O;
wire  Mux8_inst2_O;
wire  Mux8_inst3_O;
Mux8 Mux8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux8_inst0_O));
Mux8 Mux8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux8_inst1_O));
Mux8 Mux8_inst2 (.I({I7[2],I6[2],I5[2],I4[2],I3[2],I2[2],I1[2],I0[2]}), .S(S), .O(Mux8_inst2_O));
Mux8 Mux8_inst3 (.I({I7[3],I6[3],I5[3],I4[3],I3[3],I2[3],I1[3],I0[3]}), .S(S), .O(Mux8_inst3_O));
assign O = {Mux8_inst3_O,Mux8_inst2_O,Mux8_inst1_O,Mux8_inst0_O};
endmodule

