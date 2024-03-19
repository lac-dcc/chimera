module SISO8 (input  I, output  O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
wire  FDRSE_inst2_Q;
wire  FDRSE_inst3_Q;
wire  FDRSE_inst4_Q;
wire  FDRSE_inst5_Q;
wire  FDRSE_inst6_Q;
wire  FDRSE_inst7_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst0_Q), .Q(FDRSE_inst1_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst1_Q), .Q(FDRSE_inst2_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst2_Q), .Q(FDRSE_inst3_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst4 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst3_Q), .Q(FDRSE_inst4_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst5 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst4_Q), .Q(FDRSE_inst5_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst6 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst5_Q), .Q(FDRSE_inst6_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst7 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst6_Q), .Q(FDRSE_inst7_Q));
assign O = FDRSE_inst7_Q;
endmodule

