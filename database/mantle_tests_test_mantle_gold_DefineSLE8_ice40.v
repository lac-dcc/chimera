module Invert8 (input [7:0] I, output [7:0] O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
wire  SB_LUT4_inst4_O;
wire  SB_LUT4_inst5_O;
wire  SB_LUT4_inst6_O;
wire  SB_LUT4_inst7_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst2 (.I0(I[2]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst3 (.I0(I[3]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst3_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst4 (.I0(I[4]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst4_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst5 (.I0(I[5]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst5_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst6 (.I0(I[6]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst6_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst7 (.I0(I[7]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst7_O));
assign O = {SB_LUT4_inst7_O,SB_LUT4_inst6_O,SB_LUT4_inst5_O,SB_LUT4_inst4_O,SB_LUT4_inst3_O,SB_LUT4_inst2_O,SB_LUT4_inst1_O,SB_LUT4_inst0_O};
endmodule

module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  SB_LUT4_inst0_O;
wire  SB_CARRY_inst0_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) SB_LUT4_inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_CARRY SB_CARRY_inst0 (.I0(I0), .I1(I1), .CI(CIN), .CO(SB_CARRY_inst0_CO));
assign O = SB_LUT4_inst0_O;
assign COUT = SB_CARRY_inst0_CO;
endmodule

module Add8_CIN (input [7:0] I0, input [7:0] I1, input  CIN, output [7:0] O);
wire  FullAdder_inst0_O;
wire  FullAdder_inst0_COUT;
wire  FullAdder_inst1_O;
wire  FullAdder_inst1_COUT;
wire  FullAdder_inst2_O;
wire  FullAdder_inst2_COUT;
wire  FullAdder_inst3_O;
wire  FullAdder_inst3_COUT;
wire  FullAdder_inst4_O;
wire  FullAdder_inst4_COUT;
wire  FullAdder_inst5_O;
wire  FullAdder_inst5_COUT;
wire  FullAdder_inst6_O;
wire  FullAdder_inst6_COUT;
wire  FullAdder_inst7_O;
wire  FullAdder_inst7_COUT;
FullAdder FullAdder_inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(FullAdder_inst0_O), .COUT(FullAdder_inst0_COUT));
FullAdder FullAdder_inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(FullAdder_inst0_COUT), .O(FullAdder_inst1_O), .COUT(FullAdder_inst1_COUT));
FullAdder FullAdder_inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(FullAdder_inst1_COUT), .O(FullAdder_inst2_O), .COUT(FullAdder_inst2_COUT));
FullAdder FullAdder_inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(FullAdder_inst2_COUT), .O(FullAdder_inst3_O), .COUT(FullAdder_inst3_COUT));
FullAdder FullAdder_inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(FullAdder_inst3_COUT), .O(FullAdder_inst4_O), .COUT(FullAdder_inst4_COUT));
FullAdder FullAdder_inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(FullAdder_inst4_COUT), .O(FullAdder_inst5_O), .COUT(FullAdder_inst5_COUT));
FullAdder FullAdder_inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(FullAdder_inst5_COUT), .O(FullAdder_inst6_O), .COUT(FullAdder_inst6_COUT));
FullAdder FullAdder_inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(FullAdder_inst6_COUT), .O(FullAdder_inst7_O), .COUT(FullAdder_inst7_COUT));
assign O = {FullAdder_inst7_O,FullAdder_inst6_O,FullAdder_inst5_O,FullAdder_inst4_O,FullAdder_inst3_O,FullAdder_inst2_O,FullAdder_inst1_O,FullAdder_inst0_O};
endmodule

module Sub8 (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire [7:0] Invert8_inst0_O;
wire [7:0] Add8_CIN_inst0_O;
Invert8 Invert8_inst0 (.I(I1), .O(Invert8_inst0_O));
Add8_CIN Add8_CIN_inst0 (.I0(I0), .I1(Invert8_inst0_O), .CIN(1'b1), .O(Add8_CIN_inst0_O));
assign O = Add8_CIN_inst0_O;
endmodule

module SLE8 (input signed [7:0] I0, input signed [7:0] I1, output  O);
wire [7:0] Sub8_inst0_O;
wire  SB_LUT4_inst0_O;
Sub8 Sub8_inst0 (.I0(I1), .I1(I0), .O(Sub8_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0071)) SB_LUT4_inst0 (.I0(Sub8_inst0_O[7]), .I1(I1[7]), .I2(I0[7]), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

