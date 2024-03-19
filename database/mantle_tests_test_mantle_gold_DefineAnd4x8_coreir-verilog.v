module coreir_andr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = &in;
endmodule

module And4x8 (
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [7:0] I3,
    output [7:0] O
);
wire andr_inst0_out;
wire andr_inst1_out;
wire andr_inst2_out;
wire andr_inst3_out;
wire andr_inst4_out;
wire andr_inst5_out;
wire andr_inst6_out;
wire andr_inst7_out;
wire [3:0] andr_inst0_in;
assign andr_inst0_in = {I3[0],I2[0],I1[0],I0[0]};
coreir_andr #(
    .width(4)
) andr_inst0 (
    .in(andr_inst0_in),
    .out(andr_inst0_out)
);
wire [3:0] andr_inst1_in;
assign andr_inst1_in = {I3[1],I2[1],I1[1],I0[1]};
coreir_andr #(
    .width(4)
) andr_inst1 (
    .in(andr_inst1_in),
    .out(andr_inst1_out)
);
wire [3:0] andr_inst2_in;
assign andr_inst2_in = {I3[2],I2[2],I1[2],I0[2]};
coreir_andr #(
    .width(4)
) andr_inst2 (
    .in(andr_inst2_in),
    .out(andr_inst2_out)
);
wire [3:0] andr_inst3_in;
assign andr_inst3_in = {I3[3],I2[3],I1[3],I0[3]};
coreir_andr #(
    .width(4)
) andr_inst3 (
    .in(andr_inst3_in),
    .out(andr_inst3_out)
);
wire [3:0] andr_inst4_in;
assign andr_inst4_in = {I3[4],I2[4],I1[4],I0[4]};
coreir_andr #(
    .width(4)
) andr_inst4 (
    .in(andr_inst4_in),
    .out(andr_inst4_out)
);
wire [3:0] andr_inst5_in;
assign andr_inst5_in = {I3[5],I2[5],I1[5],I0[5]};
coreir_andr #(
    .width(4)
) andr_inst5 (
    .in(andr_inst5_in),
    .out(andr_inst5_out)
);
wire [3:0] andr_inst6_in;
assign andr_inst6_in = {I3[6],I2[6],I1[6],I0[6]};
coreir_andr #(
    .width(4)
) andr_inst6 (
    .in(andr_inst6_in),
    .out(andr_inst6_out)
);
wire [3:0] andr_inst7_in;
assign andr_inst7_in = {I3[7],I2[7],I1[7],I0[7]};
coreir_andr #(
    .width(4)
) andr_inst7 (
    .in(andr_inst7_in),
    .out(andr_inst7_out)
);
assign O = {andr_inst7_out,andr_inst6_out,andr_inst5_out,andr_inst4_out,andr_inst3_out,andr_inst2_out,andr_inst1_out,andr_inst0_out};
endmodule

