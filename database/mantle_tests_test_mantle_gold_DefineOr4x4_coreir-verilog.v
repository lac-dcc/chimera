module coreir_orr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = |in;
endmodule

module Or4x4 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    output [3:0] O
);
wire orr_inst0_out;
wire orr_inst1_out;
wire orr_inst2_out;
wire orr_inst3_out;
wire [3:0] orr_inst0_in;
assign orr_inst0_in = {I3[0],I2[0],I1[0],I0[0]};
coreir_orr #(
    .width(4)
) orr_inst0 (
    .in(orr_inst0_in),
    .out(orr_inst0_out)
);
wire [3:0] orr_inst1_in;
assign orr_inst1_in = {I3[1],I2[1],I1[1],I0[1]};
coreir_orr #(
    .width(4)
) orr_inst1 (
    .in(orr_inst1_in),
    .out(orr_inst1_out)
);
wire [3:0] orr_inst2_in;
assign orr_inst2_in = {I3[2],I2[2],I1[2],I0[2]};
coreir_orr #(
    .width(4)
) orr_inst2 (
    .in(orr_inst2_in),
    .out(orr_inst2_out)
);
wire [3:0] orr_inst3_in;
assign orr_inst3_in = {I3[3],I2[3],I1[3],I0[3]};
coreir_orr #(
    .width(4)
) orr_inst3 (
    .in(orr_inst3_in),
    .out(orr_inst3_out)
);
assign O = {orr_inst3_out,orr_inst2_out,orr_inst1_out,orr_inst0_out};
endmodule

