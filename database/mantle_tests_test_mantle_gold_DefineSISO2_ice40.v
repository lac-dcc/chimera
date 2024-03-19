module SISO2 (input  I, output  O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(SB_DFF_inst0_Q), .Q(SB_DFF_inst1_Q));
assign O = SB_DFF_inst1_Q;
endmodule

