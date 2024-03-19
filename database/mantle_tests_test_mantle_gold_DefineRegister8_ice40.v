module Register8 (input [7:0] I, output [7:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
wire  SB_DFF_inst2_Q;
wire  SB_DFF_inst3_Q;
wire  SB_DFF_inst4_Q;
wire  SB_DFF_inst5_Q;
wire  SB_DFF_inst6_Q;
wire  SB_DFF_inst7_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(I[1]), .Q(SB_DFF_inst1_Q));
SB_DFF SB_DFF_inst2 (.C(CLK), .D(I[2]), .Q(SB_DFF_inst2_Q));
SB_DFF SB_DFF_inst3 (.C(CLK), .D(I[3]), .Q(SB_DFF_inst3_Q));
SB_DFF SB_DFF_inst4 (.C(CLK), .D(I[4]), .Q(SB_DFF_inst4_Q));
SB_DFF SB_DFF_inst5 (.C(CLK), .D(I[5]), .Q(SB_DFF_inst5_Q));
SB_DFF SB_DFF_inst6 (.C(CLK), .D(I[6]), .Q(SB_DFF_inst6_Q));
SB_DFF SB_DFF_inst7 (.C(CLK), .D(I[7]), .Q(SB_DFF_inst7_Q));
assign O = {SB_DFF_inst7_Q,SB_DFF_inst6_Q,SB_DFF_inst5_Q,SB_DFF_inst4_Q,SB_DFF_inst3_Q,SB_DFF_inst2_Q,SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

