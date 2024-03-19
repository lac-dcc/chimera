module Or8 (input [7:0] I, output  O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
wire  SB_LUT4_inst4_O;
wire  SB_LUT4_inst5_O;
wire  SB_LUT4_inst6_O;
wire  SB_LUT4_inst7_O;
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst0 (.I0(1'b0), .I1(I[0]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst1 (.I0(SB_LUT4_inst0_O), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst2 (.I0(SB_LUT4_inst1_O), .I1(I[2]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst3 (.I0(SB_LUT4_inst2_O), .I1(I[3]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst3_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst4 (.I0(SB_LUT4_inst3_O), .I1(I[4]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst4_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst5 (.I0(SB_LUT4_inst4_O), .I1(I[5]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst5_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst6 (.I0(SB_LUT4_inst5_O), .I1(I[6]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst6_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst7 (.I0(SB_LUT4_inst6_O), .I1(I[7]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst7_O));
assign O = SB_LUT4_inst7_O;
endmodule

module Or8x8 (input [7:0] I0, input [7:0] I1, input [7:0] I2, input [7:0] I3, input [7:0] I4, input [7:0] I5, input [7:0] I6, input [7:0] I7, output [7:0] O);
wire  Or8_inst0_O;
wire  Or8_inst1_O;
wire  Or8_inst2_O;
wire  Or8_inst3_O;
wire  Or8_inst4_O;
wire  Or8_inst5_O;
wire  Or8_inst6_O;
wire  Or8_inst7_O;
Or8 Or8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .O(Or8_inst0_O));
Or8 Or8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .O(Or8_inst1_O));
Or8 Or8_inst2 (.I({I7[2],I6[2],I5[2],I4[2],I3[2],I2[2],I1[2],I0[2]}), .O(Or8_inst2_O));
Or8 Or8_inst3 (.I({I7[3],I6[3],I5[3],I4[3],I3[3],I2[3],I1[3],I0[3]}), .O(Or8_inst3_O));
Or8 Or8_inst4 (.I({I7[4],I6[4],I5[4],I4[4],I3[4],I2[4],I1[4],I0[4]}), .O(Or8_inst4_O));
Or8 Or8_inst5 (.I({I7[5],I6[5],I5[5],I4[5],I3[5],I2[5],I1[5],I0[5]}), .O(Or8_inst5_O));
Or8 Or8_inst6 (.I({I7[6],I6[6],I5[6],I4[6],I3[6],I2[6],I1[6],I0[6]}), .O(Or8_inst6_O));
Or8 Or8_inst7 (.I({I7[7],I6[7],I5[7],I4[7],I3[7],I2[7],I1[7],I0[7]}), .O(Or8_inst7_O));
assign O = {Or8_inst7_O,Or8_inst6_O,Or8_inst5_O,Or8_inst4_O,Or8_inst3_O,Or8_inst2_O,Or8_inst1_O,Or8_inst0_O};
endmodule

