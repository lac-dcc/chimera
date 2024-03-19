module coreir_or #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 | in1;
endmodule

module or8_wrapped (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O
);
wire [7:0] or8_inst0_out;
coreir_or #(
    .width(8)
) or8_inst0 (
    .in0(I0),
    .in1(I1),
    .out(or8_inst0_out)
);
assign O = or8_inst0_out;
endmodule

