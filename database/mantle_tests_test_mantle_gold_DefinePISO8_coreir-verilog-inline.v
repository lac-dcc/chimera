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

module Mux2xNone (
    input I0,
    input I1,
    input S,
    output O
);
reg [0:0] coreir_commonlib_mux2x1_inst0_out;
always @(*) begin
if (S == 0) begin
    coreir_commonlib_mux2x1_inst0_out = I0;
end else begin
    coreir_commonlib_mux2x1_inst0_out = I1;
end
end

assign O = coreir_commonlib_mux2x1_inst0_out[0];
endmodule

module DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse (
    input I,
    output O,
    input CLK
);
wire [0:0] reg_P_inst0_out;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(1'h0),
    .width(1)
) reg_P_inst0 (
    .clk(CLK),
    .in(I),
    .out(reg_P_inst0_out)
);
assign O = reg_P_inst0_out[0];
endmodule

module Register8 (
    input [7:0] I,
    output [7:0] O,
    input CLK
);
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst4_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst5_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst6_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst7_O;
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0 (
    .I(I[0]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1 (
    .I(I[1]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2 (
    .I(I[2]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3 (
    .I(I[3]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst4 (
    .I(I[4]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst4_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst5 (
    .I(I[5]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst5_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst6 (
    .I(I[6]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst6_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst7 (
    .I(I[7]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst7_O),
    .CLK(CLK)
);
assign O = {DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst7_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst6_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst5_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst4_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0_O};
endmodule

module PISO8 (
    input SI,
    input [7:0] PI,
    input LOAD,
    output O,
    input CLK
);
wire Mux2xNone_inst0_O;
wire Mux2xNone_inst1_O;
wire Mux2xNone_inst2_O;
wire Mux2xNone_inst3_O;
wire Mux2xNone_inst4_O;
wire Mux2xNone_inst5_O;
wire Mux2xNone_inst6_O;
wire Mux2xNone_inst7_O;
wire [7:0] Register8_inst0_O;
Mux2xNone Mux2xNone_inst0 (
    .I0(SI),
    .I1(PI[0]),
    .S(LOAD),
    .O(Mux2xNone_inst0_O)
);
Mux2xNone Mux2xNone_inst1 (
    .I0(Register8_inst0_O[0]),
    .I1(PI[1]),
    .S(LOAD),
    .O(Mux2xNone_inst1_O)
);
Mux2xNone Mux2xNone_inst2 (
    .I0(Register8_inst0_O[1]),
    .I1(PI[2]),
    .S(LOAD),
    .O(Mux2xNone_inst2_O)
);
Mux2xNone Mux2xNone_inst3 (
    .I0(Register8_inst0_O[2]),
    .I1(PI[3]),
    .S(LOAD),
    .O(Mux2xNone_inst3_O)
);
Mux2xNone Mux2xNone_inst4 (
    .I0(Register8_inst0_O[3]),
    .I1(PI[4]),
    .S(LOAD),
    .O(Mux2xNone_inst4_O)
);
Mux2xNone Mux2xNone_inst5 (
    .I0(Register8_inst0_O[4]),
    .I1(PI[5]),
    .S(LOAD),
    .O(Mux2xNone_inst5_O)
);
Mux2xNone Mux2xNone_inst6 (
    .I0(Register8_inst0_O[5]),
    .I1(PI[6]),
    .S(LOAD),
    .O(Mux2xNone_inst6_O)
);
Mux2xNone Mux2xNone_inst7 (
    .I0(Register8_inst0_O[6]),
    .I1(PI[7]),
    .S(LOAD),
    .O(Mux2xNone_inst7_O)
);
wire [7:0] Register8_inst0_I;
assign Register8_inst0_I = {Mux2xNone_inst7_O,Mux2xNone_inst6_O,Mux2xNone_inst5_O,Mux2xNone_inst4_O,Mux2xNone_inst3_O,Mux2xNone_inst2_O,Mux2xNone_inst1_O,Mux2xNone_inst0_O};
Register8 Register8_inst0 (
    .I(Register8_inst0_I),
    .O(Register8_inst0_O),
    .CLK(CLK)
);
assign O = Register8_inst0_O[7];
endmodule

