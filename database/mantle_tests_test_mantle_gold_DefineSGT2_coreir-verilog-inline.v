module coreir_sgt2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output O
);
assign O = ($signed(I0)) > ($signed(I1));
endmodule

