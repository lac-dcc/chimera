module And8 (input [7:0] I, output  O);
wire  LUT4_inst0_O;
wire  MUXCY_inst0_O;
wire  LUT4_inst1_O;
wire  MUXCY_inst1_O;
LUT4 #(.INIT(16'h8000)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
MUXCY MUXCY_inst0 (.DI(1'b0), .CI(1'b1), .S(LUT4_inst0_O), .O(MUXCY_inst0_O));
LUT4 #(.INIT(16'h8000)) LUT4_inst1 (.I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .O(LUT4_inst1_O));
MUXCY MUXCY_inst1 (.DI(1'b0), .CI(MUXCY_inst0_O), .S(LUT4_inst1_O), .O(MUXCY_inst1_O));
assign O = MUXCY_inst1_O;
endmodule

module And8x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, input [1:0] I4, input [1:0] I5, input [1:0] I6, input [1:0] I7, output [1:0] O);
wire  And8_inst0_O;
wire  And8_inst1_O;
And8 And8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .O(And8_inst0_O));
And8 And8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .O(And8_inst1_O));
assign O = {And8_inst1_O,And8_inst0_O};
endmodule

