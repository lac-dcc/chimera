module Decoder2 (input [1:0] I, output [3:0] O);
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
SB_LUT4 #(.LUT_INIT(16'h0001)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) SB_LUT4_inst1 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0004)) SB_LUT4_inst2 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'h0008)) SB_LUT4_inst3 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst3_O));
assign O = {SB_LUT4_inst3_O,SB_LUT4_inst2_O,SB_LUT4_inst1_O,SB_LUT4_inst0_O};
endmodule

