module coreir_sle8_wrapped (
    input [7:0] I0,
    input [7:0] I1,
    output O
);
assign O = ($signed(I0)) <= ($signed(I1));
endmodule

