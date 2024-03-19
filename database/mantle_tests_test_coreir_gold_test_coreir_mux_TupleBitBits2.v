module coreir_mux #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    input sel,
    output [width-1:0] out
);
  assign out = sel ? in1 : in0;
endmodule

module commonlib_muxn__N2__width2 (
    input [1:0] in_data [1:0],
    input [0:0] in_sel,
    output [1:0] out
);
wire [1:0] _join_out;
coreir_mux #(
    .width(2)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width1 (
    input [0:0] in_data [1:0],
    input [0:0] in_sel,
    output [0:0] out
);
wire [0:0] _join_out;
coreir_mux #(
    .width(1)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module Mux2xOutBits2 (
    input [1:0] I0,
    input [1:0] I1,
    input S,
    output [1:0] O
);
wire [1:0] coreir_commonlib_mux2x2_inst0_out;
wire [1:0] coreir_commonlib_mux2x2_inst0_in_data [1:0];
assign coreir_commonlib_mux2x2_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x2_inst0_in_data[0] = I0;
commonlib_muxn__N2__width2 coreir_commonlib_mux2x2_inst0 (
    .in_data(coreir_commonlib_mux2x2_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x2_inst0_out)
);
assign O = coreir_commonlib_mux2x2_inst0_out;
endmodule

module Mux2xOutBit (
    input I0,
    input I1,
    input S,
    output O
);
wire [0:0] coreir_commonlib_mux2x1_inst0_out;
wire [0:0] coreir_commonlib_mux2x1_inst0_in_data [1:0];
assign coreir_commonlib_mux2x1_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x1_inst0_in_data[0] = I0;
commonlib_muxn__N2__width1 coreir_commonlib_mux2x1_inst0 (
    .in_data(coreir_commonlib_mux2x1_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x1_inst0_out)
);
assign O = coreir_commonlib_mux2x1_inst0_out[0];
endmodule

module Mux2xTupleOutBit_OutBits2 (
    input I0__0,
    input [1:0] I0__1,
    input I1__0,
    input [1:0] I1__1,
    output O__0,
    output [1:0] O__1,
    input S
);
wire Mux2xOutBit_inst0_O;
wire [1:0] Mux2xOutBits2_inst0_O;
Mux2xOutBit Mux2xOutBit_inst0 (
    .I0(I0__0),
    .I1(I1__0),
    .S(S),
    .O(Mux2xOutBit_inst0_O)
);
Mux2xOutBits2 Mux2xOutBits2_inst0 (
    .I0(I0__1),
    .I1(I1__1),
    .S(S),
    .O(Mux2xOutBits2_inst0_O)
);
assign O__0 = Mux2xOutBit_inst0_O;
assign O__1 = Mux2xOutBits2_inst0_O;
endmodule

module Main (
    input I0__0,
    input [1:0] I0__1,
    input I1__0,
    input [1:0] I1__1,
    output O__0,
    output [1:0] O__1,
    input S
);
wire Mux2xTupleOutBit_OutBits2_inst0_O__0;
wire [1:0] Mux2xTupleOutBit_OutBits2_inst0_O__1;
Mux2xTupleOutBit_OutBits2 Mux2xTupleOutBit_OutBits2_inst0 (
    .I0__0(I0__0),
    .I0__1(I0__1),
    .I1__0(I1__0),
    .I1__1(I1__1),
    .O__0(Mux2xTupleOutBit_OutBits2_inst0_O__0),
    .O__1(Mux2xTupleOutBit_OutBits2_inst0_O__1),
    .S(S)
);
assign O__0 = Mux2xTupleOutBit_OutBits2_inst0_O__0;
assign O__1 = Mux2xTupleOutBit_OutBits2_inst0_O__1;
endmodule

