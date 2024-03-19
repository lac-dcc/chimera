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

module Add2_cout (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O,
    output COUT
);
wire bit_const_0_None_out;
wire [2:0] coreir_add3_inst0_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
wire [2:0] coreir_add3_inst0_in0;
assign coreir_add3_inst0_in0 = {bit_const_0_None_out,I0};
wire [2:0] coreir_add3_inst0_in1;
assign coreir_add3_inst0_in1 = {bit_const_0_None_out,I1};
coreir_add #(
    .width(3)
) coreir_add3_inst0 (
    .in0(coreir_add3_inst0_in0),
    .in1(coreir_add3_inst0_in1),
    .out(coreir_add3_inst0_out)
);
assign O = coreir_add3_inst0_out[1:0];
assign COUT = coreir_add3_inst0_out[2];
endmodule

module Counter2_COUT (
    output [1:0] O,
    output COUT,
    input CLK
);
wire [1:0] Add2_cout_inst0_O;
wire Add2_cout_inst0_COUT;
wire [1:0] const_1_2_out;
wire [1:0] reg_P_inst0_out;
Add2_cout Add2_cout_inst0 (
    .I0(reg_P_inst0_out),
    .I1(const_1_2_out),
    .O(Add2_cout_inst0_O),
    .COUT(Add2_cout_inst0_COUT)
);
coreir_const #(
    .value(2'h1),
    .width(2)
) const_1_2 (
    .out(const_1_2_out)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(2'h0),
    .width(2)
) reg_P_inst0 (
    .clk(CLK),
    .in(Add2_cout_inst0_O),
    .out(reg_P_inst0_out)
);
assign O = reg_P_inst0_out;
assign COUT = Add2_cout_inst0_COUT;
endmodule

