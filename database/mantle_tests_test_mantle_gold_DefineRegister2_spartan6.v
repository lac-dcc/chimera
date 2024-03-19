module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  FDRSE_inst0_Q;
wire  FDRSE_inst1_Q;
FDRSE #(.INIT(1'h0)) FDRSE_inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(FDRSE_inst0_Q));
FDRSE #(.INIT(1'h0)) FDRSE_inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(FDRSE_inst1_Q));
assign O = {FDRSE_inst1_Q,FDRSE_inst0_Q};
endmodule

