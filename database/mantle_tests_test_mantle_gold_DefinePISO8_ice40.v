module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Register8 (input [7:0] I, output [7:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
wire  SB_DFF_inst2_Q;
wire  SB_DFF_inst3_Q;
wire  SB_DFF_inst4_Q;
wire  SB_DFF_inst5_Q;
wire  SB_DFF_inst6_Q;
wire  SB_DFF_inst7_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(I[1]), .Q(SB_DFF_inst1_Q));
SB_DFF SB_DFF_inst2 (.C(CLK), .D(I[2]), .Q(SB_DFF_inst2_Q));
SB_DFF SB_DFF_inst3 (.C(CLK), .D(I[3]), .Q(SB_DFF_inst3_Q));
SB_DFF SB_DFF_inst4 (.C(CLK), .D(I[4]), .Q(SB_DFF_inst4_Q));
SB_DFF SB_DFF_inst5 (.C(CLK), .D(I[5]), .Q(SB_DFF_inst5_Q));
SB_DFF SB_DFF_inst6 (.C(CLK), .D(I[6]), .Q(SB_DFF_inst6_Q));
SB_DFF SB_DFF_inst7 (.C(CLK), .D(I[7]), .Q(SB_DFF_inst7_Q));
assign O = {SB_DFF_inst7_Q,SB_DFF_inst6_Q,SB_DFF_inst5_Q,SB_DFF_inst4_Q,SB_DFF_inst3_Q,SB_DFF_inst2_Q,SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

module PISO8 (input  SI, input [7:0] PI, input  LOAD, output  O, input  CLK);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
wire  Mux2_inst4_O;
wire  Mux2_inst5_O;
wire  Mux2_inst6_O;
wire  Mux2_inst7_O;
wire [7:0] Register8_inst0_O;
Mux2 Mux2_inst0 (.I({PI[0],SI}), .S(LOAD), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({PI[1],Register8_inst0_O[0]}), .S(LOAD), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({PI[2],Register8_inst0_O[1]}), .S(LOAD), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({PI[3],Register8_inst0_O[2]}), .S(LOAD), .O(Mux2_inst3_O));
Mux2 Mux2_inst4 (.I({PI[4],Register8_inst0_O[3]}), .S(LOAD), .O(Mux2_inst4_O));
Mux2 Mux2_inst5 (.I({PI[5],Register8_inst0_O[4]}), .S(LOAD), .O(Mux2_inst5_O));
Mux2 Mux2_inst6 (.I({PI[6],Register8_inst0_O[5]}), .S(LOAD), .O(Mux2_inst6_O));
Mux2 Mux2_inst7 (.I({PI[7],Register8_inst0_O[6]}), .S(LOAD), .O(Mux2_inst7_O));
Register8 Register8_inst0 (.I({Mux2_inst7_O,Mux2_inst6_O,Mux2_inst5_O,Mux2_inst4_O,Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O}), .O(Register8_inst0_O), .CLK(CLK));
assign O = Register8_inst0_O[7];
endmodule

