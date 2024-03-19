module Sub2_cin1_cout (input [1:0] I0, input [1:0] I1, output [1:0] O, output  COUT);
wire  LUT2_inst0_O;
wire  MUXCY_inst0_O;
wire  XORCY_inst0_O;
wire  LUT2_inst1_O;
wire  MUXCY_inst1_O;
wire  XORCY_inst1_O;
LUT2 #(.INIT(4'h9)) LUT2_inst0 (.I0(I0[0]), .I1(I1[0]), .O(LUT2_inst0_O));
MUXCY MUXCY_inst0 (.DI(I0[0]), .CI(1'b1), .S(LUT2_inst0_O), .O(MUXCY_inst0_O));
XORCY XORCY_inst0 (.LI(LUT2_inst0_O), .CI(1'b1), .O(XORCY_inst0_O));
LUT2 #(.INIT(4'h9)) LUT2_inst1 (.I0(I0[1]), .I1(I1[1]), .O(LUT2_inst1_O));
MUXCY MUXCY_inst1 (.DI(I0[1]), .CI(MUXCY_inst0_O), .S(LUT2_inst1_O), .O(MUXCY_inst1_O));
XORCY XORCY_inst1 (.LI(LUT2_inst1_O), .CI(MUXCY_inst0_O), .O(XORCY_inst1_O));
assign O = {XORCY_inst1_O,XORCY_inst0_O};
assign COUT = MUXCY_inst1_O;
endmodule

module UGE2 (input [1:0] I0, input [1:0] I1, output  O);
wire [1:0] Sub2_cin1_cout_inst0_O;
wire  Sub2_cin1_cout_inst0_COUT;
Sub2_cin1_cout Sub2_cin1_cout_inst0 (.I0(I0), .I1(I1), .O(Sub2_cin1_cout_inst0_O), .COUT(Sub2_cin1_cout_inst0_COUT));
assign O = Sub2_cin1_cout_inst0_COUT;
endmodule

