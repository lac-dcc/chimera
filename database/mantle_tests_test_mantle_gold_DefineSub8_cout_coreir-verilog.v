module coreir_not #(
    parameter width = 1
) (
    input [width-1:0] in,
    output [width-1:0] out
);
  assign out = ~in;
endmodule

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

module Add8_cout_cin (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT,
    input CIN
);
wire bit_const_0_None_out;
wire [8:0] coreir_add9_inst0_out;
wire [8:0] coreir_add9_inst1_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
wire [8:0] coreir_add9_inst0_in1;
assign coreir_add9_inst0_in1 = {bit_const_0_None_out,I1};
coreir_add #(
    .width(9)
) coreir_add9_inst0 (
    .in0(coreir_add9_inst1_out),
    .in1(coreir_add9_inst0_in1),
    .out(coreir_add9_inst0_out)
);
wire [8:0] coreir_add9_inst1_in0;
assign coreir_add9_inst1_in0 = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,CIN};
wire [8:0] coreir_add9_inst1_in1;
assign coreir_add9_inst1_in1 = {bit_const_0_None_out,I0};
coreir_add #(
    .width(9)
) coreir_add9_inst1 (
    .in0(coreir_add9_inst1_in0),
    .in1(coreir_add9_inst1_in1),
    .out(coreir_add9_inst1_out)
);
assign O = coreir_add9_inst0_out[7:0];
assign COUT = coreir_add9_inst0_out[8];
endmodule

module Sub8_cout (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT
);
wire [7:0] Add8_cout_cin_inst0_O;
wire Add8_cout_cin_inst0_COUT;
wire [7:0] Invert8_inst0_out;
wire bit_const_1_None_out;
Add8_cout_cin Add8_cout_cin_inst0 (
    .I0(I0),
    .I1(Invert8_inst0_out),
    .O(Add8_cout_cin_inst0_O),
    .COUT(Add8_cout_cin_inst0_COUT),
    .CIN(bit_const_1_None_out)
);
coreir_not #(
    .width(8)
) Invert8_inst0 (
    .in(I1),
    .out(Invert8_inst0_out)
);
corebit_const #(
    .value(1'b1)
) bit_const_1_None (
    .out(bit_const_1_None_out)
);
assign O = Add8_cout_cin_inst0_O;
assign COUT = Add8_cout_cin_inst0_COUT;
endmodule

