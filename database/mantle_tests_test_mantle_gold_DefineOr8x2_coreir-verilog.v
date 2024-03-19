module coreir_orr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = |in;
endmodule

module Or8x2 (
    input [1:0] I0,
    input [1:0] I1,
    input [1:0] I2,
    input [1:0] I3,
    input [1:0] I4,
    input [1:0] I5,
    input [1:0] I6,
    input [1:0] I7,
    output [1:0] O
);
wire orr_inst0_out;
wire orr_inst1_out;
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
assign O = {orr_inst1_out,orr_inst0_out};
endmodule

