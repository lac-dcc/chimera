module coreir_ult8_wrapped (
    input [7:0] I0,
    input [7:0] I1,
    output O
);
assign O = I0 < I1;
endmodule

