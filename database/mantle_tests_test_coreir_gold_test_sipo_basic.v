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

module Register (
    input I,
    output O,
    input CLK
);
wire [0:0] reg_P1_inst0_out;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(1'h0),
    .width(1)
) reg_P1_inst0 (
    .clk(CLK),
    .in(I),
    .out(reg_P1_inst0_out)
);
assign O = reg_P1_inst0_out[0];
endmodule

module SIPO5 (
    input I,
    output [4:0] O,
    input CLK
);
wire Register_inst0_O;
wire Register_inst1_O;
wire Register_inst2_O;
wire Register_inst3_O;
wire Register_inst4_O;
Register Register_inst0 (
    .I(I),
    .O(Register_inst0_O),
    .CLK(CLK)
);
Register Register_inst1 (
    .I(Register_inst0_O),
    .O(Register_inst1_O),
    .CLK(CLK)
);
Register Register_inst2 (
    .I(Register_inst1_O),
    .O(Register_inst2_O),
    .CLK(CLK)
);
Register Register_inst3 (
    .I(Register_inst2_O),
    .O(Register_inst3_O),
    .CLK(CLK)
);
Register Register_inst4 (
    .I(Register_inst3_O),
    .O(Register_inst4_O),
    .CLK(CLK)
);
assign O = {Register_inst4_O,Register_inst3_O,Register_inst2_O,Register_inst1_O,Register_inst0_O};
endmodule

module test_sipo_basic (
    input I,
    output [4:0] O,
    input CLK
);
wire [4:0] SIPO5_inst0_O;
SIPO5 SIPO5_inst0 (
    .I(I),
    .O(SIPO5_inst0_O),
    .CLK(CLK)
);
assign O = SIPO5_inst0_O;
endmodule

