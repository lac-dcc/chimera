module fold_xor42 (
    input [1:0] I0,
    input [1:0] I1,
    input [1:0] I2,
    input [1:0] I3,
    output [1:0] O
);
assign O = ((I0 ^ I1) ^ I2) ^ I3;
endmodule

