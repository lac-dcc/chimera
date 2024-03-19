module HalfAdder (input  I0, input  I1, output  O, output  COUT);
wire  LUT2_inst0_O;
wire  LUT2_inst1_O;
LUT2 #(.INIT(4'h6)) LUT2_inst0 (.I0(I0), .I1(I1), .O(LUT2_inst0_O));
LUT2 #(.INIT(4'h8)) LUT2_inst1 (.I0(I0), .I1(I1), .O(LUT2_inst1_O));
assign O = LUT2_inst0_O;
assign COUT = LUT2_inst1_O;
endmodule

