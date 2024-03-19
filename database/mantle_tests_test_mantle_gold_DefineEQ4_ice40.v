module EQ4 (input [3:0] I0, input [3:0] I1, output  O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
SB_LUT4 #(.LUT_INIT(16'h8282)) SB_LUT4_inst0 (.I0(1'b1), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) SB_LUT4_inst1 (.I0(SB_LUT4_inst0_O), .I1(I0[1]), .I2(I1[1]), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) SB_LUT4_inst2 (.I0(SB_LUT4_inst1_O), .I1(I0[2]), .I2(I1[2]), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) SB_LUT4_inst3 (.I0(SB_LUT4_inst2_O), .I1(I0[3]), .I2(I1[3]), .I3(1'b0), .O(SB_LUT4_inst3_O));
assign O = SB_LUT4_inst3_O;
endmodule

