module Mux2 (input [1:0] I, input  S, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(I[1]), .Q(SB_DFF_inst1_Q));
assign O = {SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

module PISO2 (input  SI, input [1:0] PI, input  LOAD, output  O, input  CLK);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire [1:0] Register2_inst0_O;
Mux2 Mux2_inst0 (.I({PI[0],SI}), .S(LOAD), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({PI[1],Register2_inst0_O[0]}), .S(LOAD), .O(Mux2_inst1_O));
Register2 Register2_inst0 (.I({Mux2_inst1_O,Mux2_inst0_O}), .O(Register2_inst0_O), .CLK(CLK));
assign O = Register2_inst0_O[1];
endmodule

