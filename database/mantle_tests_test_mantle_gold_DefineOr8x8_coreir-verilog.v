module coreir_orr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = |in;
endmodule

module Or8x8 (
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [7:0] I3,
    input [7:0] I4,
    input [7:0] I5,
    input [7:0] I6,
    input [7:0] I7,
    output [7:0] O
);
wire orr_inst0_out;
wire orr_inst1_out;
wire orr_inst2_out;
wire orr_inst3_out;
wire orr_inst4_out;
wire orr_inst5_out;
wire orr_inst6_out;
wire orr_inst7_out;
wire [7:0] orr_inst0_in;
assign orr_inst0_in = {I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]};
coreir_orr #(
    .width(8)
) orr_inst0 (
    .in(orr_inst0_in),
    .out(orr_inst0_out)
);
wire [7:0] orr_inst1_in;
assign orr_inst1_in = {I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]};
coreir_orr #(
    .width(8)
) orr_inst1 (
    .in(orr_inst1_in),
    .out(orr_inst1_out)
);
wire [7:0] orr_inst2_in;
assign orr_inst2_in = {I7[2],I6[2],I5[2],I4[2],I3[2],I2[2],I1[2],I0[2]};
coreir_orr #(
    .width(8)
) orr_inst2 (
    .in(orr_inst2_in),
    .out(orr_inst2_out)
);
wire [7:0] orr_inst3_in;
assign orr_inst3_in = {I7[3],I6[3],I5[3],I4[3],I3[3],I2[3],I1[3],I0[3]};
coreir_orr #(
    .width(8)
) orr_inst3 (
    .in(orr_inst3_in),
    .out(orr_inst3_out)
);
wire [7:0] orr_inst4_in;
assign orr_inst4_in = {I7[4],I6[4],I5[4],I4[4],I3[4],I2[4],I1[4],I0[4]};
coreir_orr #(
    .width(8)
) orr_inst4 (
    .in(orr_inst4_in),
    .out(orr_inst4_out)
);
wire [7:0] orr_inst5_in;
assign orr_inst5_in = {I7[5],I6[5],I5[5],I4[5],I3[5],I2[5],I1[5],I0[5]};
coreir_orr #(
    .width(8)
) orr_inst5 (
    .in(orr_inst5_in),
    .out(orr_inst5_out)
);
wire [7:0] orr_inst6_in;
assign orr_inst6_in = {I7[6],I6[6],I5[6],I4[6],I3[6],I2[6],I1[6],I0[6]};
coreir_orr #(
    .width(8)
) orr_inst6 (
    .in(orr_inst6_in),
    .out(orr_inst6_out)
);
wire [7:0] orr_inst7_in;
assign orr_inst7_in = {I7[7],I6[7],I5[7],I4[7],I3[7],I2[7],I1[7],I0[7]};
coreir_orr #(
    .width(8)
) orr_inst7 (
    .in(orr_inst7_in),
    .out(orr_inst7_out)
);
assign O = {orr_inst7_out,orr_inst6_out,orr_inst5_out,orr_inst4_out,orr_inst3_out,orr_inst2_out,orr_inst1_out,orr_inst0_out};
endmodule

