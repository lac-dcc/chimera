module coreir_xor #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 ^ in1;
endmodule

module xor2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O
);
wire [1:0] xor2_inst0_out;
coreir_xor #(
    .width(2)
) xor2_inst0 (
    .in0(I0),
    .in1(I1),
    .out(xor2_inst0_out)
);
assign O = xor2_inst0_out;
endmodule

