module NE4 (input [3:0] I0, input [3:0] I1, output  O);
wire  LUT4_inst0_O;
wire  MUXCY_inst0_O;
wire  LUT4_inst1_O;
wire  MUXCY_inst1_O;
LUT4 #(.INIT(16'h6FF6)) LUT4_inst0 (.I0(I0[0]), .I1(I1[0]), .I2(I0[1]), .I3(I1[1]), .O(LUT4_inst0_O));
MUXCY MUXCY_inst0 (.DI(1'b0), .CI(1'b1), .S(LUT4_inst0_O), .O(MUXCY_inst0_O));
LUT4 #(.INIT(16'h6FF6)) LUT4_inst1 (.I0(I0[2]), .I1(I1[2]), .I2(I0[3]), .I3(I1[3]), .O(LUT4_inst1_O));
MUXCY MUXCY_inst1 (.DI(1'b0), .CI(MUXCY_inst0_O), .S(LUT4_inst1_O), .O(MUXCY_inst1_O));
assign O = MUXCY_inst1_O;
endmodule

