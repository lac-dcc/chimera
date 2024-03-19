module And2 (input [1:0] I, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'h8888)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module And2x8 (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire  And2_inst0_O;
wire  And2_inst1_O;
wire  And2_inst2_O;
wire  And2_inst3_O;
wire  And2_inst4_O;
wire  And2_inst5_O;
wire  And2_inst6_O;
wire  And2_inst7_O;
And2 And2_inst0 (.I({I1[0],I0[0]}), .O(And2_inst0_O));
And2 And2_inst1 (.I({I1[1],I0[1]}), .O(And2_inst1_O));
And2 And2_inst2 (.I({I1[2],I0[2]}), .O(And2_inst2_O));
And2 And2_inst3 (.I({I1[3],I0[3]}), .O(And2_inst3_O));
And2 And2_inst4 (.I({I1[4],I0[4]}), .O(And2_inst4_O));
And2 And2_inst5 (.I({I1[5],I0[5]}), .O(And2_inst5_O));
And2 And2_inst6 (.I({I1[6],I0[6]}), .O(And2_inst6_O));
And2 And2_inst7 (.I({I1[7],I0[7]}), .O(And2_inst7_O));
assign O = {And2_inst7_O,And2_inst6_O,And2_inst5_O,And2_inst4_O,And2_inst3_O,And2_inst2_O,And2_inst1_O,And2_inst0_O};
endmodule

