module xor2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O
);
assign O = I0 ^ I1;
endmodule

