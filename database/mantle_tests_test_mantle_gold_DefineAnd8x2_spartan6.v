module And8 (input [7:0] I, output  O);
wire  LUT6_2_inst0_O5;
wire  LUT6_2_inst0_O6;
wire  MUXCY_inst0_O;
wire  LUT6_2_inst1_O5;
wire  LUT6_2_inst1_O6;
wire  MUXCY_inst1_O;
LUT6_2 #(.INIT(64'h8000800000000000)) LUT6_2_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst0_O5), .O6(LUT6_2_inst0_O6));
MUXCY MUXCY_inst0 (.DI(LUT6_2_inst0_O5), .CI(1'b1), .S(LUT6_2_inst0_O6), .O(MUXCY_inst0_O));
LUT6_2 #(.INIT(64'h8000800000000000)) LUT6_2_inst1 (.I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst1_O5), .O6(LUT6_2_inst1_O6));
MUXCY MUXCY_inst1 (.DI(LUT6_2_inst1_O5), .CI(MUXCY_inst0_O), .S(LUT6_2_inst1_O6), .O(MUXCY_inst1_O));
assign O = MUXCY_inst1_O;
endmodule

module And8x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, input [1:0] I4, input [1:0] I5, input [1:0] I6, input [1:0] I7, output [1:0] O);
wire  And8_inst0_O;
wire  And8_inst1_O;
And8 And8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .O(And8_inst0_O));
And8 And8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .O(And8_inst1_O));
assign O = {And8_inst1_O,And8_inst0_O};
endmodule

