module SISO8 (input  I, output  O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
wire  SB_DFF_inst2_Q;
wire  SB_DFF_inst3_Q;
wire  SB_DFF_inst4_Q;
wire  SB_DFF_inst5_Q;
wire  SB_DFF_inst6_Q;
wire  SB_DFF_inst7_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(SB_DFF_inst0_Q), .Q(SB_DFF_inst1_Q));
SB_DFF SB_DFF_inst2 (.C(CLK), .D(SB_DFF_inst1_Q), .Q(SB_DFF_inst2_Q));
SB_DFF SB_DFF_inst3 (.C(CLK), .D(SB_DFF_inst2_Q), .Q(SB_DFF_inst3_Q));
SB_DFF SB_DFF_inst4 (.C(CLK), .D(SB_DFF_inst3_Q), .Q(SB_DFF_inst4_Q));
SB_DFF SB_DFF_inst5 (.C(CLK), .D(SB_DFF_inst4_Q), .Q(SB_DFF_inst5_Q));
SB_DFF SB_DFF_inst6 (.C(CLK), .D(SB_DFF_inst5_Q), .Q(SB_DFF_inst6_Q));
SB_DFF SB_DFF_inst7 (.C(CLK), .D(SB_DFF_inst6_Q), .Q(SB_DFF_inst7_Q));
assign O = SB_DFF_inst7_Q;
endmodule

