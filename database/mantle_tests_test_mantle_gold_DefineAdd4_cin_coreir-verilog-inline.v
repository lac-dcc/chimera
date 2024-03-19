module Add4_cin (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    input CIN
);
assign O = 4'((4'(({1'b0,1'b0,1'b0,CIN}) + I0)) + I1);
endmodule

