module xor4_wrapped (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O
);
assign O = I0 ^ I1;
endmodule

