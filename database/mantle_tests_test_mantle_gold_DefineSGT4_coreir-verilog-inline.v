module coreir_sgt4_wrapped (
    input [3:0] I0,
    input [3:0] I1,
    output O
);
assign O = ($signed(I0)) > ($signed(I1));
endmodule

