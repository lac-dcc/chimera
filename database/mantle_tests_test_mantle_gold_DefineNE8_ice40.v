module NE8 (input [7:0] I0, input [7:0] I1, output  O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
wire  SB_LUT4_inst4_O;
wire  SB_LUT4_inst5_O;
wire  SB_LUT4_inst6_O;
wire  SB_LUT4_inst7_O;
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst1 (.I0(SB_LUT4_inst0_O), .I1(I0[1]), .I2(I1[1]), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst2 (.I0(SB_LUT4_inst1_O), .I1(I0[2]), .I2(I1[2]), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst3 (.I0(SB_LUT4_inst2_O), .I1(I0[3]), .I2(I1[3]), .I3(1'b0), .O(SB_LUT4_inst3_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst4 (.I0(SB_LUT4_inst3_O), .I1(I0[4]), .I2(I1[4]), .I3(1'b0), .O(SB_LUT4_inst4_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst5 (.I0(SB_LUT4_inst4_O), .I1(I0[5]), .I2(I1[5]), .I3(1'b0), .O(SB_LUT4_inst5_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst6 (.I0(SB_LUT4_inst5_O), .I1(I0[6]), .I2(I1[6]), .I3(1'b0), .O(SB_LUT4_inst6_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) SB_LUT4_inst7 (.I0(SB_LUT4_inst6_O), .I1(I0[7]), .I2(I1[7]), .I3(1'b0), .O(SB_LUT4_inst7_O));
assign O = SB_LUT4_inst7_O;
endmodule

