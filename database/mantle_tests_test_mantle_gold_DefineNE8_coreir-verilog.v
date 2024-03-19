module coreir_eq #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = in0 == in1;
endmodule

module corebit_not (
    input in,
    output out
);
  assign out = ~in;
endmodule

module NE8 (
    input [7:0] I0,
    input [7:0] I1,
    output O
);
wire coreir_eq_8_inst0_out;
wire not_inst0_out;
coreir_eq #(
    .width(8)
) coreir_eq_8_inst0 (
    .in0(I0),
    .in1(I1),
    .out(coreir_eq_8_inst0_out)
);
corebit_not not_inst0 (
    .in(coreir_eq_8_inst0_out),
    .out(not_inst0_out)
);
assign O = not_inst0_out;
endmodule

