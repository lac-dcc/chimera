module Add2_cout (input [1:0] I0, input [1:0] I1, output [1:0] O, output  COUT);
wire  LUT6_2_inst0_O5;
wire  LUT6_2_inst0_O6;
wire  MUXCY_inst0_O;
wire  XORCY_inst0_O;
wire  LUT6_2_inst1_O5;
wire  LUT6_2_inst1_O6;
wire  MUXCY_inst1_O;
wire  XORCY_inst1_O;
LUT6_2 #(.INIT(64'h66666666AAAAAAAA)) LUT6_2_inst0 (.I0(I0[0]), .I1(I1[0]), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst0_O5), .O6(LUT6_2_inst0_O6));
MUXCY MUXCY_inst0 (.DI(LUT6_2_inst0_O5), .CI(1'b0), .S(LUT6_2_inst0_O6), .O(MUXCY_inst0_O));
XORCY XORCY_inst0 (.LI(LUT6_2_inst0_O6), .CI(1'b0), .O(XORCY_inst0_O));
LUT6_2 #(.INIT(64'h66666666AAAAAAAA)) LUT6_2_inst1 (.I0(I0[1]), .I1(I1[1]), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst1_O5), .O6(LUT6_2_inst1_O6));
MUXCY MUXCY_inst1 (.DI(LUT6_2_inst1_O5), .CI(MUXCY_inst0_O), .S(LUT6_2_inst1_O6), .O(MUXCY_inst1_O));
XORCY XORCY_inst1 (.LI(LUT6_2_inst1_O6), .CI(MUXCY_inst0_O), .O(XORCY_inst1_O));
assign O = {XORCY_inst1_O,XORCY_inst0_O};
assign COUT = MUXCY_inst1_O;
endmodule

module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(FDRSE_inst1_Q));
assign O = {FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

module Counter2_COUT (output [1:0] O, output  COUT, input  CLK);
wire [1:0] Add2_cout_inst0_O;
wire  Add2_cout_inst0_COUT;
wire [1:0] Register2_inst0_O;
Add2_cout Add2_cout_inst0 (.I0(Register2_inst0_O), .I1(2'd1'), .O(Add2_cout_inst0_O), .COUT(Add2_cout_inst0_COUT));
Register2 Register2_inst0 (.I(Add2_cout_inst0_O), .O(Register2_inst0_O), .CLK(CLK));
assign O = Register2_inst0_O;
assign COUT = Add2_cout_inst0_COUT;
endmodule

