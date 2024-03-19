module coreir_add8_wrapped (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O
);
assign O = 8'(I0 + I1);
endmodule

