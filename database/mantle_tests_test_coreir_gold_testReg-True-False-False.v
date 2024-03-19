module coreir_reg #(
    parameter width = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk,
    input [width-1:0] in,
    output [width-1:0] out
);
  reg [width-1:0] outReg=init;
  wire real_clk;
  assign real_clk = clk_posedge ? clk : ~clk;
  always @(posedge real_clk) begin
    outReg <= in;
  end
  assign out = outReg;
endmodule

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

module Mux2xOutBits1 (
    input [0:0] I0,
    input [0:0] I1,
    input S,
    output [0:0] O
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
assign O = coreir_commonlib_mux2x1_inst0_out;
endmodule

module Register_has_ce_True_has_reset_False_has_async_reset_False_has_async_resetn_False_type_Bits_n_1 (
    input [0:0] I,
    output [0:0] O,
    input CLK,
    input CE
);
wire [0:0] enable_mux_O;
wire [0:0] value_out;
Mux2xOutBits1 enable_mux (
    .I0(value_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(1'h0),
    .width(1)
) value (
    .clk(CLK),
    .in(enable_mux_O),
    .out(value_out)
);
assign O = value_out;
endmodule

module test (
    input clk,
    input [0:0] In0,
    output [0:0] Out0,
    input CLK,
    input CE
);
wire [0:0] Register_has_ce_True_has_reset_False_has_async_reset_False_has_async_resetn_False_type_Bits_n_1_inst0_O;
Register_has_ce_True_has_reset_False_has_async_reset_False_has_async_resetn_False_type_Bits_n_1 Register_has_ce_True_has_reset_False_has_async_reset_False_has_async_resetn_False_type_Bits_n_1_inst0 (
    .I(In0),
    .O(Register_has_ce_True_has_reset_False_has_async_reset_False_has_async_resetn_False_type_Bits_n_1_inst0_O),
    .CLK(clk),
    .CE(CE)
);
assign Out0 = Register_has_ce_True_has_reset_False_has_async_reset_False_has_async_resetn_False_type_Bits_n_1_inst0_O;
endmodule

