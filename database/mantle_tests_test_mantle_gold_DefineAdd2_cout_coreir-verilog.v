module coreir_add #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 + in1;
endmodule

module corebit_const #(
    parameter value = 1
) (
    output out
);
  assign out = value;
endmodule

module Add2_cout (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O,
    output COUT
);
wire bit_const_0_None_out;
wire [2:0] coreir_add3_inst0_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
wire [2:0] coreir_add3_inst0_in0;
assign coreir_add3_inst0_in0 = {bit_const_0_None_out,I0};
wire [2:0] coreir_add3_inst0_in1;
assign coreir_add3_inst0_in1 = {bit_const_0_None_out,I1};
coreir_add #(
    .width(3)
) coreir_add3_inst0 (
    .in0(coreir_add3_inst0_in0),
    .in1(coreir_add3_inst0_in1),
    .out(coreir_add3_inst0_out)
);
assign O = coreir_add3_inst0_out[1:0];
assign COUT = coreir_add3_inst0_out[2];
endmodule

