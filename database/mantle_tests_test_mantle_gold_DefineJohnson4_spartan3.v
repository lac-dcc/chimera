module Johnson4 (output [3:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
wire  FDRSE_inst2_Q;
wire  FDRSE_inst3_Q;
wire  LUT1_inst0_O;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(LUT1_inst0_O), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst0_Q), .Q(FDRSE_inst1_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst1_Q), .Q(FDRSE_inst2_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(FDRSE_inst2_Q), .Q(FDRSE_inst3_Q));
LUT1 #(.INIT(2'h1)) LUT1_inst0 (.I0(FDRSE_inst3_Q), .O(LUT1_inst0_O));
assign O = {FDRSE_inst3_Q,FDRSE_inst2_Q,FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

