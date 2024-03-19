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

module coreir_const #(
    parameter width = 1,
    parameter value = 1
) (
    output [width-1:0] out
);
  assign out = value;
endmodule

module coreir_add #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 + in1;
endmodule

module corebit_const #(
    parameter value = 1
) (
    output out
);
  assign out = value;
endmodule

module Add8_cout (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT
);
wire bit_const_0_None_out;
wire [8:0] coreir_add9_inst0_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
wire [8:0] coreir_add9_inst0_in0;
assign coreir_add9_inst0_in0 = {bit_const_0_None_out,I0};
wire [8:0] coreir_add9_inst0_in1;
assign coreir_add9_inst0_in1 = {bit_const_0_None_out,I1};
coreir_add #(
    .width(9)
) coreir_add9_inst0 (
    .in0(coreir_add9_inst0_in0),
    .in1(coreir_add9_inst0_in1),
    .out(coreir_add9_inst0_out)
);
assign O = coreir_add9_inst0_out[7:0];
assign COUT = coreir_add9_inst0_out[8];
endmodule

module Counter8_COUT (
    output [7:0] O,
    output COUT,
    input CLK
);
wire [7:0] Add8_cout_inst0_O;
wire Add8_cout_inst0_COUT;
wire [7:0] const_1_8_out;
wire [7:0] reg_P_inst0_out;
Add8_cout Add8_cout_inst0 (
    .I0(reg_P_inst0_out),
    .I1(const_1_8_out),
    .O(Add8_cout_inst0_O),
    .COUT(Add8_cout_inst0_COUT)
);
coreir_const #(
    .value(8'h01),
    .width(8)
) const_1_8 (
    .out(const_1_8_out)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(8'h00),
    .width(8)
) reg_P_inst0 (
    .clk(CLK),
    .in(Add8_cout_inst0_O),
    .out(reg_P_inst0_out)
);
assign O = reg_P_inst0_out;
assign COUT = Add8_cout_inst0_COUT;
endmodule

