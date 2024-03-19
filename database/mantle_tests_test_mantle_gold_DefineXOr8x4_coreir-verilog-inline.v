module fold_xor84 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    input [3:0] I4,
    input [3:0] I5,
    input [3:0] I6,
    input [3:0] I7,
    output [3:0] O
);
assign O = ((((((I0 ^ I1) ^ I2) ^ I3) ^ I4) ^ I5) ^ I6) ^ I7;
endmodule

