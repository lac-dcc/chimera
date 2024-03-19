module Add8_cin (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    input CIN
);
assign O = 8'((8'(({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CIN}) + I0)) + I1);
endmodule

