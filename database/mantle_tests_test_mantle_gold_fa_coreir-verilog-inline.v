module fold_xor3None (
    input I0,
    input I1,
    input I2,
    output O
);
assign O = (I0 ^ I1) ^ I2;
endmodule

module Or3xNone (
    input I0,
    input I1,
    input I2,
    output O
);
assign O = | ({I2,I1,I0});
endmodule

module FullAdder (
    input I0,
    input I1,
    input CIN,
    output O,
    output COUT
);
wire and_inst0_out;
wire and_inst1_out;
wire and_inst2_out;
Or3xNone Or3xNone_inst0 (
    .I0(and_inst0_out),
    .I1(and_inst1_out),
    .I2(and_inst2_out),
    .O(COUT)
);
assign and_inst0_out = I0 & I1;
assign and_inst1_out = I1 & CIN;
assign and_inst2_out = I0 & CIN;
fold_xor3None fold_xor3None_inst0 (
    .I0(I0),
    .I1(I1),
    .I2(CIN),
    .O(O)
);
endmodule

