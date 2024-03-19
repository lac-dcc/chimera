module Or2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h1)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module Or2x2 (input [1:0] I0, input [1:0] I1, output [1:0] O);
wire  Or2_inst0_O;
wire  Or2_inst1_O;
Or2 Or2_inst0 (.I({I1[0],I0[0]}), .O(Or2_inst0_O));
Or2 Or2_inst1 (.I({I1[1],I0[1]}), .O(Or2_inst1_O));
assign O = {Or2_inst1_O,Or2_inst0_O};
endmodule

