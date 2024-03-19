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

module Mux4x8 (input [7:0] I0, input [7:0] I1, input [7:0] I2, input [7:0] I3, input [1:0] S, output [7:0] O);
wire  Mux4_inst0_O;
wire  Mux4_inst1_O;
wire  Mux4_inst2_O;
wire  Mux4_inst3_O;
wire  Mux4_inst4_O;
wire  Mux4_inst5_O;
wire  Mux4_inst6_O;
wire  Mux4_inst7_O;
Mux4 Mux4_inst0 (.I({I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux4_inst0_O));
Mux4 Mux4_inst1 (.I({I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux4_inst1_O));
Mux4 Mux4_inst2 (.I({I3[2],I2[2],I1[2],I0[2]}), .S(S), .O(Mux4_inst2_O));
Mux4 Mux4_inst3 (.I({I3[3],I2[3],I1[3],I0[3]}), .S(S), .O(Mux4_inst3_O));
Mux4 Mux4_inst4 (.I({I3[4],I2[4],I1[4],I0[4]}), .S(S), .O(Mux4_inst4_O));
Mux4 Mux4_inst5 (.I({I3[5],I2[5],I1[5],I0[5]}), .S(S), .O(Mux4_inst5_O));
Mux4 Mux4_inst6 (.I({I3[6],I2[6],I1[6],I0[6]}), .S(S), .O(Mux4_inst6_O));
Mux4 Mux4_inst7 (.I({I3[7],I2[7],I1[7],I0[7]}), .S(S), .O(Mux4_inst7_O));
assign O = {Mux4_inst7_O,Mux4_inst6_O,Mux4_inst5_O,Mux4_inst4_O,Mux4_inst3_O,Mux4_inst2_O,Mux4_inst1_O,Mux4_inst0_O};
endmodule

