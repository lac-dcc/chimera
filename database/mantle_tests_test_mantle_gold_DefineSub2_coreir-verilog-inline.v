module Add2_cin (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O,
    input CIN
);
assign O = 2'((2'(({1'b0,CIN}) + I0)) + I1);
endmodule

module Sub2 (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O
);
wire [1:0] Invert2_inst0_out;
Add2_cin Add2_cin_inst0 (
    .I0(I0),
    .I1(Invert2_inst0_out),
    .O(O),
    .CIN(1'b1)
);
assign Invert2_inst0_out = ~ I1;
endmodule

