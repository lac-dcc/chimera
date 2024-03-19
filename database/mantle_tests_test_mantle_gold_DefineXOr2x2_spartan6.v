module XOr2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h6)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module XOr2x2 (input [1:0] I0, input [1:0] I1, output [1:0] O);
wire  XOr2_inst0_O;
wire  XOr2_inst1_O;
XOr2 XOr2_inst0 (.I({I1[0],I0[0]}), .O(XOr2_inst0_O));
XOr2 XOr2_inst1 (.I({I1[1],I0[1]}), .O(XOr2_inst1_O));
assign O = {XOr2_inst1_O,XOr2_inst0_O};
endmodule

