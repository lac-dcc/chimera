module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module LSR4_1 (input [3:0] I, input  S, output [3:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
Mux2 Mux2_inst0 (.I({I[1],I[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[2],I[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I[3],I[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({1'b0,I[3]}), .S(S), .O(Mux2_inst3_O));
assign O = {Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module LSR4_2 (input [3:0] I, input  S, output [3:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
Mux2 Mux2_inst0 (.I({I[2],I[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I[3],I[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({1'b0,I[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({1'b0,I[3]}), .S(S), .O(Mux2_inst3_O));
assign O = {Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module LSR4 (input [3:0] I, input [1:0] S, output [3:0] O);
wire [3:0] LSR4_1_inst0_O;
wire [3:0] LSR4_2_inst0_O;
LSR4_1 LSR4_1_inst0 (.I(I), .S(S[0]), .O(LSR4_1_inst0_O));
LSR4_2 LSR4_2_inst0 (.I(LSR4_1_inst0_O), .S(S[1]), .O(LSR4_2_inst0_O));
assign O = LSR4_2_inst0_O;
endmodule

