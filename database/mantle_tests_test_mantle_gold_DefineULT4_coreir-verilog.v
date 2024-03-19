module coreir_ult #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = in0 < in1;
endmodule

module coreir_ult4_wrapped (
    input [3:0] I0,
    input [3:0] I1,
    output O
);
wire coreir_ult4_inst0_out;
coreir_ult #(
    .width(4)
) coreir_ult4_inst0 (
    .in0(I0),
    .in1(I1),
    .out(coreir_ult4_inst0_out)
);
assign O = coreir_ult4_inst0_out;
endmodule

