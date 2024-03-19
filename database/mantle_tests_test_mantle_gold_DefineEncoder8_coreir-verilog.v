module coreir_orr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = |in;
endmodule

module Or4xNone (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire orr_inst0_out;
wire [3:0] orr_inst0_in;
assign orr_inst0_in = {I3,I2,I1,I0};
coreir_orr #(
    .width(4)
) orr_inst0 (
    .in(orr_inst0_in),
    .out(orr_inst0_out)
);
assign O = orr_inst0_out;
endmodule

module Encoder8 (
    input [7:0] I,
    output [2:0] O
);
wire Or4xNone_inst0_O;
wire Or4xNone_inst1_O;
wire Or4xNone_inst2_O;
Or4xNone Or4xNone_inst0 (
    .I0(I[1]),
    .I1(I[3]),
    .I2(I[5]),
    .I3(I[7]),
    .O(Or4xNone_inst0_O)
);
Or4xNone Or4xNone_inst1 (
    .I0(I[2]),
    .I1(I[3]),
    .I2(I[6]),
    .I3(I[7]),
    .O(Or4xNone_inst1_O)
);
Or4xNone Or4xNone_inst2 (
    .I0(I[4]),
    .I1(I[5]),
    .I2(I[6]),
    .I3(I[7]),
    .O(Or4xNone_inst2_O)
);
assign O = {Or4xNone_inst2_O,Or4xNone_inst1_O,Or4xNone_inst0_O};
endmodule

