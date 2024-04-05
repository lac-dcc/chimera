module Add2_cout (input [1:0] I0, input [1:0] I1, output [1:0] O, output  COUT);
wire  LUT2_inst0_O;
wire  MUXCY_inst0_O;
wire  XORCY_inst0_O;
wire  LUT2_inst1_O;
wire  MUXCY_inst1_O;
wire  XORCY_inst1_O;
LUT2 #(.INIT(4'h6)) LUT2_inst0 (.I0(I0[0]), .I1(I1[0]), .O(LUT2_inst0_O));
MUXCY MUXCY_inst0 (.DI(I0[0]), .CI(1'b0), .S(LUT2_inst0_O), .O(MUXCY_inst0_O));
XORCY XORCY_inst0 (.LI(LUT2_inst0_O), .CI(1'b0), .O(XORCY_inst0_O));
LUT2 #(.INIT(4'h6)) LUT2_inst1 (.I0(I0[1]), .I1(I1[1]), .O(LUT2_inst1_O));
MUXCY MUXCY_inst1 (.DI(I0[1]), .CI(MUXCY_inst0_O), .S(LUT2_inst1_O), .O(MUXCY_inst1_O));
XORCY XORCY_inst1 (.LI(LUT2_inst1_O), .CI(MUXCY_inst0_O), .O(XORCY_inst1_O));
assign O = {XORCY_inst1_O,XORCY_inst0_O};
assign COUT = MUXCY_inst1_O;
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  LUT3_inst0_O;
LUT3 #(.INIT(8'hCA)) LUT3_inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .O(LUT3_inst0_O));
assign O = LUT3_inst0_O;
endmodule

module Mux2x2 (input [1:0] I0, input [1:0] I1, input  S, output [1:0] O);
wire  Mux2_inst0_O;
wire  Mux2_inst1_O;
Mux2 Mux2_inst0 (.I({I1[0],I0[0]}), .S(S), .O(Mux2_inst0_O));
Mux2 Mux2_inst1 (.I({I1[1],I0[1]}), .S(S), .O(Mux2_inst1_O));
assign O = {Mux2_inst1_O,Mux2_inst0_O};
endmodule

module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(FDRSE_inst1_Q));
assign O = {FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

module CounterLoad2_COUT (input [1:0] DATA, input  LOAD, output [1:0] O, output  COUT, input  CLK);
wire [1:0] Add2_cout_inst0_O;
wire  Add2_cout_inst0_COUT;
wire [1:0] Mux2x2_inst0_O;
wire [1:0] Register2_inst0_O;
Add2_cout Add2_cout_inst0 (.I0(Register2_inst0_O), .I1(2'd1'), .O(Add2_cout_inst0_O), .COUT(Add2_cout_inst0_COUT));
Mux2x2 Mux2x2_inst0 (.I0(Add2_cout_inst0_O), .I1(DATA), .S(LOAD), .O(Mux2x2_inst0_O));
Register2 Register2_inst0 (.I(Mux2x2_inst0_O), .O(Register2_inst0_O), .CLK(CLK));
assign O = Register2_inst0_O;
assign COUT = Add2_cout_inst0_COUT;
endmodule

