module Add4_cout (input [3:0] I0, input [3:0] I1, output [3:0] O, output  COUT);
wire  LUT6_2_inst0_O5;
wire  LUT6_2_inst0_O6;
wire  MUXCY_inst0_O;
wire  XORCY_inst0_O;
wire  LUT6_2_inst1_O5;
wire  LUT6_2_inst1_O6;
wire  MUXCY_inst1_O;
wire  XORCY_inst1_O;
wire  LUT6_2_inst2_O5;
wire  LUT6_2_inst2_O6;
wire  MUXCY_inst2_O;
wire  XORCY_inst2_O;
wire  LUT6_2_inst3_O5;
wire  LUT6_2_inst3_O6;
wire  MUXCY_inst3_O;
wire  XORCY_inst3_O;
LUT6_2 #(.INIT(64'h66666666AAAAAAAA)) LUT6_2_inst0 (.I0(I0[0]), .I1(I1[0]), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst0_O5), .O6(LUT6_2_inst0_O6));
MUXCY MUXCY_inst0 (.DI(LUT6_2_inst0_O5), .CI(1'b0), .S(LUT6_2_inst0_O6), .O(MUXCY_inst0_O));
XORCY XORCY_inst0 (.LI(LUT6_2_inst0_O6), .CI(1'b0), .O(XORCY_inst0_O));
LUT6_2 #(.INIT(64'h66666666AAAAAAAA)) LUT6_2_inst1 (.I0(I0[1]), .I1(I1[1]), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst1_O5), .O6(LUT6_2_inst1_O6));
MUXCY MUXCY_inst1 (.DI(LUT6_2_inst1_O5), .CI(MUXCY_inst0_O), .S(LUT6_2_inst1_O6), .O(MUXCY_inst1_O));
XORCY XORCY_inst1 (.LI(LUT6_2_inst1_O6), .CI(MUXCY_inst0_O), .O(XORCY_inst1_O));
LUT6_2 #(.INIT(64'h66666666AAAAAAAA)) LUT6_2_inst2 (.I0(I0[2]), .I1(I1[2]), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst2_O5), .O6(LUT6_2_inst2_O6));
MUXCY MUXCY_inst2 (.DI(LUT6_2_inst2_O5), .CI(MUXCY_inst1_O), .S(LUT6_2_inst2_O6), .O(MUXCY_inst2_O));
XORCY XORCY_inst2 (.LI(LUT6_2_inst2_O6), .CI(MUXCY_inst1_O), .O(XORCY_inst2_O));
LUT6_2 #(.INIT(64'h66666666AAAAAAAA)) LUT6_2_inst3 (.I0(I0[3]), .I1(I1[3]), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b1), .O5(LUT6_2_inst3_O5), .O6(LUT6_2_inst3_O6));
MUXCY MUXCY_inst3 (.DI(LUT6_2_inst3_O5), .CI(MUXCY_inst2_O), .S(LUT6_2_inst3_O6), .O(MUXCY_inst3_O));
XORCY XORCY_inst3 (.LI(LUT6_2_inst3_O6), .CI(MUXCY_inst2_O), .O(XORCY_inst3_O));
assign O = {XORCY_inst3_O,XORCY_inst2_O,XORCY_inst1_O,XORCY_inst0_O};
assign COUT = MUXCY_inst3_O;
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module Mux2x4 (input [3:0] I0, input [3:0] I1, input  S, output [3:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
wire  Mux2_inst2_O;
wire  Mux2_inst3_O;
Mux2 Mux2_inst0 (.I({I1[0],I0[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I1[1],I0[1]}), .S(S), .O(Mux2_inst1_O));
Mux2 Mux2_inst2 (.I({I1[2],I0[2]}), .S(S), .O(Mux2_inst2_O));
Mux2 Mux2_inst3 (.I({I1[3],I0[3]}), .S(S), .O(Mux2_inst3_O));
assign O = {Mux2_inst3_O,Mux2_inst2_O,Mux2_inst1_O,Mux2_inst0_O};
endmodule

module Register4 (input [3:0] I, output [3:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
wire  FDRSE_inst2_Q;
wire  FDRSE_inst3_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(FDRSE_inst1_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[2]), .Q(FDRSE_inst2_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[3]), .Q(FDRSE_inst3_Q));
assign O = {FDRSE_inst3_Q,FDRSE_inst2_Q,FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

module CounterLoad4_COUT (input [3:0] DATA, input  LOAD, output [3:0] O, output  COUT, input  CLK);
wire [3:0] Add4_cout_inst0_O;
wire  Add4_cout_inst0_COUT;
wire [3:0] Mux2x4_inst0_O;
wire [3:0] Register4_inst0_O;
Add4_cout Add4_cout_inst0 (.I0(Register4_inst0_O), .I1(4'd1'), .O(Add4_cout_inst0_O), .COUT(Add4_cout_inst0_COUT));
Mux2x4 Mux2x4_inst0 (.I0(Add4_cout_inst0_O), .I1(DATA), .S(LOAD), .O(Mux2x4_inst0_O));
Register4 Register4_inst0 (.I(Mux2x4_inst0_O), .O(Register4_inst0_O), .CLK(CLK));
assign O = Register4_inst0_O;
assign COUT = Add4_cout_inst0_COUT;
endmodule

