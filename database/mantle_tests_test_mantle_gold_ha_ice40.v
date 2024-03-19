module HalfAdder (input  I0, input  I1, output  O, output  COUT);
wire  SB_LUT4_inst0_O;
wire  SB_CARRY_inst0_CO;
SB_LUT4 #(.LUT_INIT(16'h6666)) SB_LUT4_inst0 (.I0(I0), .I1(I1), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_CARRY SB_CARRY_inst0 (.I0(I0), .I1(I1), .CI(1'b0), .CO(SB_CARRY_inst0_CO));
assign O = SB_LUT4_inst0_O;
assign COUT = SB_CARRY_inst0_CO;
endmodule

