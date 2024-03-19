module EQ8 (input [7:0] I0, input [7:0] I1, output  O);
wire  LUT4_inst0_O;
wire  MUXCY_inst0_O;
wire  LUT4_inst1_O;
wire  MUXCY_inst1_O;
wire  LUT4_inst2_O;
wire  MUXCY_inst2_O;
wire  LUT4_inst3_O;
wire  MUXCY_inst3_O;
LUT4 #(.INIT(16'h9009)) LUT4_inst0 (.I0(I0[0]), .I1(I1[0]), .I2(I0[1]), .I3(I1[1]), .O(LUT4_inst0_O));
MUXCY MUXCY_inst0 (.DI(1'b0), .CI(1'b1), .S(LUT4_inst0_O), .O(MUXCY_inst0_O));
LUT4 #(.INIT(16'h9009)) LUT4_inst1 (.I0(I0[2]), .I1(I1[2]), .I2(I0[3]), .I3(I1[3]), .O(LUT4_inst1_O));
MUXCY MUXCY_inst1 (.DI(1'b0), .CI(MUXCY_inst0_O), .S(LUT4_inst1_O), .O(MUXCY_inst1_O));
LUT4 #(.INIT(16'h9009)) LUT4_inst2 (.I0(I0[4]), .I1(I1[4]), .I2(I0[5]), .I3(I1[5]), .O(LUT4_inst2_O));
MUXCY MUXCY_inst2 (.DI(1'b0), .CI(MUXCY_inst1_O), .S(LUT4_inst2_O), .O(MUXCY_inst2_O));
LUT4 #(.INIT(16'h9009)) LUT4_inst3 (.I0(I0[6]), .I1(I1[6]), .I2(I0[7]), .I3(I1[7]), .O(LUT4_inst3_O));
MUXCY MUXCY_inst3 (.DI(1'b0), .CI(MUXCY_inst2_O), .S(LUT4_inst3_O), .O(MUXCY_inst3_O));
assign O = MUXCY_inst3_O;
endmodule

