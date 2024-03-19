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

module Mux4x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, input [1:0] S, output [1:0] O);
wire  Mux4_inst0_O;
wire  Mux4_inst1_O;
Mux4 Mux4_inst0 (.I({I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(Mux4_inst0_O));
Mux4 Mux4_inst1 (.I({I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(Mux4_inst1_O));
assign O = {Mux4_inst1_O,Mux4_inst0_O};
endmodule

