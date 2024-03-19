module Or4 (input [3:0] I, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hFFFE)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Encoder8 (input [7:0] I, output [2:0] O);
wire  Or4_inst0_O;
wire  Or4_inst1_O;
wire  Or4_inst2_O;
Or4 Or4_inst0 (.I({I[7],I[5],I[3],I[1]}), .O(Or4_inst0_O));
Or4 Or4_inst1 (.I({I[7],I[6],I[3],I[2]}), .O(Or4_inst1_O));
Or4 Or4_inst2 (.I({I[7],I[6],I[5],I[4]}), .O(Or4_inst2_O));
assign O = {Or4_inst2_O,Or4_inst1_O,Or4_inst0_O};
endmodule

