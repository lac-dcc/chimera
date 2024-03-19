module fold_xor48 (
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [7:0] I3,
    output [7:0] O
);
assign O = ((I0 ^ I1) ^ I2) ^ I3;
endmodule

