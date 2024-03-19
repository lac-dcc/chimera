module XOr2 (input [1:0] I, output  O);
wire  LUT2_inst0_O;
LUT2 #(.INIT(4'h6)) LUT2_inst0 (.I0(I[0]), .I1(I[1]), .O(LUT2_inst0_O));
assign O = LUT2_inst0_O;
endmodule

module XOr2x8 (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire  XOr2_inst0_O;
wire  XOr2_inst1_O;
wire  XOr2_inst2_O;
wire  XOr2_inst3_O;
wire  XOr2_inst4_O;
wire  XOr2_inst5_O;
wire  XOr2_inst6_O;
wire  XOr2_inst7_O;
XOr2 XOr2_inst0 (.I({I1[0],I0[0]}), .O(XOr2_inst0_O));
XOr2 XOr2_inst1 (.I({I1[1],I0[1]}), .O(XOr2_inst1_O));
XOr2 XOr2_inst2 (.I({I1[2],I0[2]}), .O(XOr2_inst2_O));
XOr2 XOr2_inst3 (.I({I1[3],I0[3]}), .O(XOr2_inst3_O));
XOr2 XOr2_inst4 (.I({I1[4],I0[4]}), .O(XOr2_inst4_O));
XOr2 XOr2_inst5 (.I({I1[5],I0[5]}), .O(XOr2_inst5_O));
XOr2 XOr2_inst6 (.I({I1[6],I0[6]}), .O(XOr2_inst6_O));
XOr2 XOr2_inst7 (.I({I1[7],I0[7]}), .O(XOr2_inst7_O));
assign O = {XOr2_inst7_O,XOr2_inst6_O,XOr2_inst5_O,XOr2_inst4_O,XOr2_inst3_O,XOr2_inst2_O,XOr2_inst1_O,XOr2_inst0_O};
endmodule

