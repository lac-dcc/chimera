module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Mux2x4 (input [3:0] I0, input [3:0] I1, input  S, output [3:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
Mux2 Mux2_inst0 (.I({I1[0],I0[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I1[1],I0[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I1[2],I0[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({I1[3],I0[3]}), .S(S), .O(Mux2_inst3_O));
assign O = {Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

