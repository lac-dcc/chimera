module corebit_xor (
    input in0,
    input in1,
    output out
);
  assign out = in0 ^ in1;
endmodule

module corebit_and (
    input in0,
    input in1,
    output out
);
  assign out = in0 & in1;
endmodule

module HalfAdder (
    input I,
    input CIN,
    output O,
    output COUT
);
wire and_inst0_out;
wire xor_inst0_out;
corebit_and and_inst0 (
    .in0(I),
    .in1(CIN),
    .out(and_inst0_out)
);
corebit_xor xor_inst0 (
    .in0(I),
    .in1(CIN),
    .out(xor_inst0_out)
);
assign O = xor_inst0_out;
assign COUT = and_inst0_out;
endmodule

