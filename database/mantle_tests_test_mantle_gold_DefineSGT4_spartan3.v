module Sub4_cin1 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  LUT2_inst0_O;
wire  MUXCY_inst0_O;
wire  XORCY_inst0_O;
wire  LUT2_inst1_O;
wire  MUXCY_inst1_O;
wire  XORCY_inst1_O;
wire  LUT2_inst2_O;
wire  MUXCY_inst2_O;
wire  XORCY_inst2_O;
wire  LUT2_inst3_O;
wire  MUXCY_inst3_O;
wire  XORCY_inst3_O;
LUT2 #(.INIT(4'h9)) LUT2_inst0 (.I0(I0[0]), .I1(I1[0]), .O(LUT2_inst0_O));
MUXCY MUXCY_inst0 (.DI(I0[0]), .CI(1'b1), .S(LUT2_inst0_O), .O(MUXCY_inst0_O));
XORCY XORCY_inst0 (.LI(LUT2_inst0_O), .CI(1'b1), .O(XORCY_inst0_O));
LUT2 #(.INIT(4'h9)) LUT2_inst1 (.I0(I0[1]), .I1(I1[1]), .O(LUT2_inst1_O));
MUXCY MUXCY_inst1 (.DI(I0[1]), .CI(MUXCY_inst0_O), .S(LUT2_inst1_O), .O(MUXCY_inst1_O));
XORCY XORCY_inst1 (.LI(LUT2_inst1_O), .CI(MUXCY_inst0_O), .O(XORCY_inst1_O));
LUT2 #(.INIT(4'h9)) LUT2_inst2 (.I0(I0[2]), .I1(I1[2]), .O(LUT2_inst2_O));
MUXCY MUXCY_inst2 (.DI(I0[2]), .CI(MUXCY_inst1_O), .S(LUT2_inst2_O), .O(MUXCY_inst2_O));
XORCY XORCY_inst2 (.LI(LUT2_inst2_O), .CI(MUXCY_inst1_O), .O(XORCY_inst2_O));
LUT2 #(.INIT(4'h9)) LUT2_inst3 (.I0(I0[3]), .I1(I1[3]), .O(LUT2_inst3_O));
MUXCY MUXCY_inst3 (.DI(I0[3]), .CI(MUXCY_inst2_O), .S(LUT2_inst3_O), .O(MUXCY_inst3_O));
XORCY XORCY_inst3 (.LI(LUT2_inst3_O), .CI(MUXCY_inst2_O), .O(XORCY_inst3_O));
assign O = {XORCY_inst3_O,XORCY_inst2_O,XORCY_inst1_O,XORCY_inst0_O};
endmodule

module SGT4 (input signed [3:0] I0, input signed [3:0] I1, output  O);
wire [3:0] Sub4_cin1_inst0_O;
wire  LUT3_inst0_O;
Sub4_cin1 Sub4_cin1_inst0 (.I0(I1), .I1(I0), .O(Sub4_cin1_inst0_O));
LUT3 #(.INIT(8'h8E)) LUT3_inst0 (.I0(Sub4_cin1_inst0_O[3]), .I1(I1[3]), .I2(I0[3]), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

