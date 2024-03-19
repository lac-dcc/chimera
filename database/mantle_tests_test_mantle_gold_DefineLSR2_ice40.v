module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module LSR2_1 (input [1:0] I, input  S, output [1:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
Mux2 Mux2_inst0 (.I(I), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({1'b0,I[1]}), .S(S), .O(Mux2_inst1_O));
assign O = {Mux2_inst1_O,Mux2_inst0_O};
endmodule

module LSR2 (input [1:0] I, input [0:0] S, output [1:0] O);
wire [1:0] LSR2_1_inst0_O;
LSR2_1 LSR2_1_inst0 (.I(I), .S(S[0]), .O(LSR2_1_inst0_O));
assign O = LSR2_1_inst0_O;
endmodule

