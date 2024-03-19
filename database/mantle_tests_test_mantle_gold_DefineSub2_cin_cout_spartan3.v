module Sub2_cin_cout (input [1:0] I0, input [1:0] I1, input  CIN, output [1:0] O, output  COUT);
wire  LUT2_inst0_O;
wire  MUXCY_inst0_O;
wire  XORCY_inst0_O;
wire  LUT2_inst1_O;
wire  MUXCY_inst1_O;
wire  XORCY_inst1_O;
wire  LUT1_inst0_O;
LUT2 #(.INIT(4'h9)) LUT2_inst0 (.I0(I0[0]), .I1(I1[0]), .O(LUT2_inst0_O));
MUXCY MUXCY_inst0 (.DI(I0[0]), .CI(LUT1_inst0_O), .S(LUT2_inst0_O), .O(MUXCY_inst0_O));
XORCY XORCY_inst0 (.LI(LUT2_inst0_O), .CI(LUT1_inst0_O), .O(XORCY_inst0_O));
LUT2 #(.INIT(4'h9)) LUT2_inst1 (.I0(I0[1]), .I1(I1[1]), .O(LUT2_inst1_O));
MUXCY MUXCY_inst1 (.DI(I0[1]), .CI(MUXCY_inst0_O), .S(LUT2_inst1_O), .O(MUXCY_inst1_O));
XORCY XORCY_inst1 (.LI(LUT2_inst1_O), .CI(MUXCY_inst0_O), .O(XORCY_inst1_O));
LUT1 #(.INIT(2'h1)) LUT1_inst0 (.I0(CIN), .O(LUT1_inst0_O));
assign O = {XORCY_inst1_O,XORCY_inst0_O};
assign COUT = MUXCY_inst1_O;
endmodule

