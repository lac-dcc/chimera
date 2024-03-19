module coreir_eq_2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output O
);
assign O = I0 == I1;
endmodule

