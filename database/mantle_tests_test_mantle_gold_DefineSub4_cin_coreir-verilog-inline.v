module Add4_cin (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    input CIN
);
assign O = 4'((4'(({1'b0,1'b0,1'b0,CIN}) + I0)) + I1);
endmodule

module Sub4_cin (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    input CIN
);
wire [3:0] Invert4_inst0_out;
wire not_inst0_out;
Add4_cin Add4_cin_inst0 (
    .I0(I0),
    .I1(Invert4_inst0_out),
    .O(O),
    .CIN(not_inst0_out)
);
assign Invert4_inst0_out = ~ I1;
assign not_inst0_out = ~ CIN;
endmodule

