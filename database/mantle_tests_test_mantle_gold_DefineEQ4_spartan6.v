module EQ4 (input [3:0] I0, input [3:0] I1, output  O);
wire  LUT6_2_inst0_O5;
wire  LUT6_2_inst0_O6;
wire  MUXCY_inst0_O;
wire  LUT6_2_inst1_O5;
wire  LUT6_2_inst1_O6;
wire  MUXCY_inst1_O;
LUT6_2 #(.INIT(64'h9009900900000000)) LUT6_2_inst0 (.I0(I0[0]), .I1(I1[0]), .I2(I0[1]), .I3(I1[1]), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst0_O5), .O6(LUT6_2_inst0_O6));
MUXCY MUXCY_inst0 (.DI(LUT6_2_inst0_O5), .CI(1'b1), .S(LUT6_2_inst0_O6), .O(MUXCY_inst0_O));
LUT6_2 #(.INIT(64'h9009900900000000)) LUT6_2_inst1 (.I0(I0[2]), .I1(I1[2]), .I2(I0[3]), .I3(I1[3]), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst1_O5), .O6(LUT6_2_inst1_O6));
MUXCY MUXCY_inst1 (.DI(LUT6_2_inst1_O5), .CI(MUXCY_inst0_O), .S(LUT6_2_inst1_O6), .O(MUXCY_inst1_O));
assign O = MUXCY_inst1_O;
endmodule

