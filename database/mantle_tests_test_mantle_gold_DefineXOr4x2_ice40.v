module XOr4 (input [3:0] I, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'h6996)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module XOr4x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, output [1:0] O);
wire  XOr4_inst0_O;
wire  XOr4_inst1_O;
XOr4 XOr4_inst0 (.I({I3[0],I2[0],I1[0],I0[0]}), .O(XOr4_inst0_O));
XOr4 XOr4_inst1 (.I({I3[1],I2[1],I1[1],I0[1]}), .O(XOr4_inst1_O));
assign O = {XOr4_inst1_O,XOr4_inst0_O};
endmodule

