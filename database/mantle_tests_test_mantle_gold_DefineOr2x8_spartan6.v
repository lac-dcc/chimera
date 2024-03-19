module Or2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h1)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module Or2x8 (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire  Or2_inst0_O;
wire  Or2_inst1_O;
wire  Or2_inst2_O;
wire  Or2_inst3_O;
wire  Or2_inst4_O;
wire  Or2_inst5_O;
wire  Or2_inst6_O;
wire  Or2_inst7_O;
Or2 Or2_inst0 (.I({I1[0],I0[0]}), .O(Or2_inst0_O));
Or2 Or2_inst1 (.I({I1[1],I0[1]}), .O(Or2_inst1_O));
Or2 Or2_inst2 (.I({I1[2],I0[2]}), .O(Or2_inst2_O));
Or2 Or2_inst3 (.I({I1[3],I0[3]}), .O(Or2_inst3_O));
Or2 Or2_inst4 (.I({I1[4],I0[4]}), .O(Or2_inst4_O));
Or2 Or2_inst5 (.I({I1[5],I0[5]}), .O(Or2_inst5_O));
Or2 Or2_inst6 (.I({I1[6],I0[6]}), .O(Or2_inst6_O));
Or2 Or2_inst7 (.I({I1[7],I0[7]}), .O(Or2_inst7_O));
assign O = {Or2_inst7_O,Or2_inst6_O,Or2_inst5_O,Or2_inst4_O,Or2_inst3_O,Or2_inst2_O,Or2_inst1_O,Or2_inst0_O};
endmodule

