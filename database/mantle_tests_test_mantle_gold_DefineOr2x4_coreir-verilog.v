module coreir_or #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 | in1;
endmodule

module or4_wrapped (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O
);
wire [3:0] or4_inst0_out;
coreir_or #(
    .width(4)
) or4_inst0 (
    .in0(I0),
    .in1(I1),
    .out(or4_inst0_out)
);
assign O = or4_inst0_out;
endmodule

