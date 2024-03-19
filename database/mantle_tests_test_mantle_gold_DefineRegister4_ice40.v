module Register4 (input [3:0] I, output [3:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
wire  SB_DFF_inst2_Q;
wire  SB_DFF_inst3_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(I[1]), .Q(SB_DFF_inst1_Q));
SB_DFF SB_DFF_inst2 (.C(CLK), .D(I[2]), .Q(SB_DFF_inst2_Q));
SB_DFF SB_DFF_inst3 (.C(CLK), .D(I[3]), .Q(SB_DFF_inst3_Q));
assign O = {SB_DFF_inst3_Q,SB_DFF_inst2_Q,SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

