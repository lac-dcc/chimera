module XOr8 (input [7:0] I, output  O);
wire  LUT2_inst0_O;
wire  LUT2_inst1_O;
wire  LUT2_inst2_O;
wire  LUT2_inst3_O;
wire  LUT2_inst4_O;
wire  LUT2_inst5_O;
wire  LUT2_inst6_O;
wire  LUT2_inst7_O;
LUT2 #(.INIT(4'h6)) LUT2_inst0 (.I0(1'b0), .I1(I[0]), .O(LUT2_inst0_O));
LUT2 #(.INIT(4'h6)) LUT2_inst1 (.I0(LUT2_inst0_O), .I1(I[1]), .O(LUT2_inst1_O));
LUT2 #(.INIT(4'h6)) LUT2_inst2 (.I0(LUT2_inst1_O), .I1(I[2]), .O(LUT2_inst2_O));
LUT2 #(.INIT(4'h6)) LUT2_inst3 (.I0(LUT2_inst2_O), .I1(I[3]), .O(LUT2_inst3_O));
LUT2 #(.INIT(4'h6)) LUT2_inst4 (.I0(LUT2_inst3_O), .I1(I[4]), .O(LUT2_inst4_O));
LUT2 #(.INIT(4'h6)) LUT2_inst5 (.I0(LUT2_inst4_O), .I1(I[5]), .O(LUT2_inst5_O));
LUT2 #(.INIT(4'h6)) LUT2_inst6 (.I0(LUT2_inst5_O), .I1(I[6]), .O(LUT2_inst6_O));
LUT2 #(.INIT(4'h6)) LUT2_inst7 (.I0(LUT2_inst6_O), .I1(I[7]), .O(LUT2_inst7_O));
assign O = LUT2_inst7_O;
endmodule

module XOr8x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, input [1:0] I4, input [1:0] I5, input [1:0] I6, input [1:0] I7, output [1:0] O);
wire  XOr8_inst0_O;
wire  XOr8_inst1_O;
XOr8 XOr8_inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .O(XOr8_inst0_O));
XOr8 XOr8_inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .O(XOr8_inst1_O));
assign O = {XOr8_inst1_O,XOr8_inst0_O};
endmodule

