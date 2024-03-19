module Or4 (input [3:0] I, output  O);
wire  LUT4_inst0_O;
LUT4 #(.INIT(16'h0001)) LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(LUT4_inst0_O));
assign O = LUT4_inst0_O;
endmodule

module Or4x2 (input [1:0] I0, input [1:0] I1, input [1:0] I2, input [1:0] I3, output [1:0] O);
wire  Or4_inst0_O;
wire  Or4_inst1_O;
Or4 Or4_inst0 (.I({I3[0],I2[0],I1[0],I0[0]}), .O(Or4_inst0_O));
Or4 Or4_inst1 (.I({I3[1],I2[1],I1[1],I0[1]}), .O(Or4_inst1_O));
assign O = {Or4_inst1_O,Or4_inst0_O};
endmodule

