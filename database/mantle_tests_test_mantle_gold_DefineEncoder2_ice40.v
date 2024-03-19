module Or1 (input [0:0] I, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hAAAA)) SB_LUT4_inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Encoder2 (input [1:0] I, output [0:0] O);
wire  Or1_inst0_O;
Or1 Or1_inst0 (.I({I[1]}), .O(Or1_inst0_O));
assign O = {Or1_inst0_O};
endmodule

