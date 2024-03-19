module coreir_sge #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = $signed(in0) >= $signed(in1);
endmodule

module coreir_sge8_wrapped (
    input [7:0] I0,
    input [7:0] I1,
    output O
);
wire coreir_sge8_inst0_out;
coreir_sge #(
    .width(8)
) coreir_sge8_inst0 (
    .in0(I0),
    .in1(I1),
    .out(coreir_sge8_inst0_out)
);
assign O = coreir_sge8_inst0_out;
endmodule

