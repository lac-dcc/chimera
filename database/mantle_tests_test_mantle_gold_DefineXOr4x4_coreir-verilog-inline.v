module fold_xor44 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    output [3:0] O
);
assign O = ((I0 ^ I1) ^ I2) ^ I3;
endmodule

