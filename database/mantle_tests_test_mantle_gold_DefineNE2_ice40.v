module NE2 (input [1:0] I0, input [1:0] I1, output  O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst1 (.I0(SB_LUT4_inst0_O), .I1(I0[1]), .I2(I1[1]), .I3(1'b0), .O(SB_LUT4_inst1_O));
assign O = SB_LUT4_inst1_O;
endmodule

