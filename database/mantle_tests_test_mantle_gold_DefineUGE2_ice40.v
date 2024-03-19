module Invert2 (input [1:0] I, output [1:0] O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst1_O));
assign O = {SB_LUT4_inst1_O,SB_LUT4_inst0_O};
endmodule

module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  SB_LUT4_inst0_O;
wire  SB_CARRY_inst0_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) SB_LUT4_inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_CARRY SB_CARRY_inst0 (.I0(I0), .I1(I1), .CI(CIN), .CO(SB_CARRY_inst0_CO));
assign O = SB_LUT4_inst0_O;
assign COUT = SB_CARRY_inst0_CO;
endmodule

module Add2_CIN_COUT (input [1:0] I0, input [1:0] I1, input  CIN, output [1:0] O, output  COUT);
wire  FullAdder_inst0_O;
wire  FullAdder_inst0_COUT;
wire  FullAdder_inst1_O;
wire  FullAdder_inst1_COUT;
FullAdder FullAdder_inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(FullAdder_inst0_O), .COUT(FullAdder_inst0_COUT));
FullAdder FullAdder_inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(FullAdder_inst0_COUT), .O(FullAdder_inst1_O), .COUT(FullAdder_inst1_COUT));
assign O = {FullAdder_inst1_O,FullAdder_inst0_O};
assign COUT = FullAdder_inst1_COUT;
endmodule

module Sub2_COUT (input [1:0] I0, input [1:0] I1, output [1:0] O, output  COUT);
wire [1:0] Invert2_inst0_O;
wire [1:0] Add2_CIN_COUT_inst0_O;
wire  Add2_CIN_COUT_inst0_COUT;
Invert2 Invert2_inst0 (.I(I1), .O(Invert2_inst0_O));
Add2_CIN_COUT Add2_CIN_COUT_inst0 (.I0(I0), .I1(Invert2_inst0_O), .CIN(1'b1), .O(Add2_CIN_COUT_inst0_O), .COUT(Add2_CIN_COUT_inst0_COUT));
assign O = Add2_CIN_COUT_inst0_O;
assign COUT = Add2_CIN_COUT_inst0_COUT;
endmodule

module UGE2 (input [1:0] I0, input [1:0] I1, output  O);
wire [1:0] Sub2_COUT_inst0_O;
wire  Sub2_COUT_inst0_COUT;
Sub2_COUT Sub2_COUT_inst0 (.I0(I0), .I1(I1), .O(Sub2_COUT_inst0_O), .COUT(Sub2_COUT_inst0_COUT));
assign O = Sub2_COUT_inst0_COUT;
endmodule

