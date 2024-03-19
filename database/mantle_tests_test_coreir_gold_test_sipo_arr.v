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
    input CLK,
    input I_0_X,
    input [4:0] I_0_Y,
    input I_1_X,
    input [4:0] I_1_Y,
    output O_0_X,
    output [4:0] O_0_Y,
    output O_1_X,
    output [4:0] O_1_Y
);
wire [11:0] reg_P12_inst0_out;
wire [11:0] reg_P12_inst0_in;
assign reg_P12_inst0_in = {I_1_Y,I_1_X,I_0_Y,I_0_X};
coreir_reg #(
    .clk_posedge(1'b1),
    .init(12'h000),
    .width(12)
) reg_P12_inst0 (
    .clk(CLK),
    .in(reg_P12_inst0_in),
    .out(reg_P12_inst0_out)
);
assign O_0_X = reg_P12_inst0_out[0];
assign O_0_Y = {reg_P12_inst0_out[5],reg_P12_inst0_out[4],reg_P12_inst0_out[3],reg_P12_inst0_out[2],reg_P12_inst0_out[1]};
assign O_1_X = reg_P12_inst0_out[6];
assign O_1_Y = {reg_P12_inst0_out[11],reg_P12_inst0_out[10],reg_P12_inst0_out[9],reg_P12_inst0_out[8],reg_P12_inst0_out[7]};
endmodule

module SIPO5 (
    input CLK,
    input I_0_X,
    input [4:0] I_0_Y,
    input I_1_X,
    input [4:0] I_1_Y,
    output O_0_0_X,
    output [4:0] O_0_0_Y,
    output O_0_1_X,
    output [4:0] O_0_1_Y,
    output O_1_0_X,
    output [4:0] O_1_0_Y,
    output O_1_1_X,
    output [4:0] O_1_1_Y,
    output O_2_0_X,
    output [4:0] O_2_0_Y,
    output O_2_1_X,
    output [4:0] O_2_1_Y,
    output O_3_0_X,
    output [4:0] O_3_0_Y,
    output O_3_1_X,
    output [4:0] O_3_1_Y,
    output O_4_0_X,
    output [4:0] O_4_0_Y,
    output O_4_1_X,
    output [4:0] O_4_1_Y
);
wire Register_inst0_O_0_X;
wire [4:0] Register_inst0_O_0_Y;
wire Register_inst0_O_1_X;
wire [4:0] Register_inst0_O_1_Y;
wire Register_inst1_O_0_X;
wire [4:0] Register_inst1_O_0_Y;
wire Register_inst1_O_1_X;
wire [4:0] Register_inst1_O_1_Y;
wire Register_inst2_O_0_X;
wire [4:0] Register_inst2_O_0_Y;
wire Register_inst2_O_1_X;
wire [4:0] Register_inst2_O_1_Y;
wire Register_inst3_O_0_X;
wire [4:0] Register_inst3_O_0_Y;
wire Register_inst3_O_1_X;
wire [4:0] Register_inst3_O_1_Y;
wire Register_inst4_O_0_X;
wire [4:0] Register_inst4_O_0_Y;
wire Register_inst4_O_1_X;
wire [4:0] Register_inst4_O_1_Y;
Register Register_inst0 (
    .CLK(CLK),
    .I_0_X(I_0_X),
    .I_0_Y(I_0_Y),
    .I_1_X(I_1_X),
    .I_1_Y(I_1_Y),
    .O_0_X(Register_inst0_O_0_X),
    .O_0_Y(Register_inst0_O_0_Y),
    .O_1_X(Register_inst0_O_1_X),
    .O_1_Y(Register_inst0_O_1_Y)
);
Register Register_inst1 (
    .CLK(CLK),
    .I_0_X(Register_inst0_O_0_X),
    .I_0_Y(Register_inst0_O_0_Y),
    .I_1_X(Register_inst0_O_1_X),
    .I_1_Y(Register_inst0_O_1_Y),
    .O_0_X(Register_inst1_O_0_X),
    .O_0_Y(Register_inst1_O_0_Y),
    .O_1_X(Register_inst1_O_1_X),
    .O_1_Y(Register_inst1_O_1_Y)
);
Register Register_inst2 (
    .CLK(CLK),
    .I_0_X(Register_inst1_O_0_X),
    .I_0_Y(Register_inst1_O_0_Y),
    .I_1_X(Register_inst1_O_1_X),
    .I_1_Y(Register_inst1_O_1_Y),
    .O_0_X(Register_inst2_O_0_X),
    .O_0_Y(Register_inst2_O_0_Y),
    .O_1_X(Register_inst2_O_1_X),
    .O_1_Y(Register_inst2_O_1_Y)
);
Register Register_inst3 (
    .CLK(CLK),
    .I_0_X(Register_inst2_O_0_X),
    .I_0_Y(Register_inst2_O_0_Y),
    .I_1_X(Register_inst2_O_1_X),
    .I_1_Y(Register_inst2_O_1_Y),
    .O_0_X(Register_inst3_O_0_X),
    .O_0_Y(Register_inst3_O_0_Y),
    .O_1_X(Register_inst3_O_1_X),
    .O_1_Y(Register_inst3_O_1_Y)
);
Register Register_inst4 (
    .CLK(CLK),
    .I_0_X(Register_inst3_O_0_X),
    .I_0_Y(Register_inst3_O_0_Y),
    .I_1_X(Register_inst3_O_1_X),
    .I_1_Y(Register_inst3_O_1_Y),
    .O_0_X(Register_inst4_O_0_X),
    .O_0_Y(Register_inst4_O_0_Y),
    .O_1_X(Register_inst4_O_1_X),
    .O_1_Y(Register_inst4_O_1_Y)
);
assign O_0_0_X = Register_inst0_O_0_X;
assign O_0_0_Y = Register_inst0_O_0_Y;
assign O_0_1_X = Register_inst0_O_1_X;
assign O_0_1_Y = Register_inst0_O_1_Y;
assign O_1_0_X = Register_inst1_O_0_X;
assign O_1_0_Y = Register_inst1_O_0_Y;
assign O_1_1_X = Register_inst1_O_1_X;
assign O_1_1_Y = Register_inst1_O_1_Y;
assign O_2_0_X = Register_inst2_O_0_X;
assign O_2_0_Y = Register_inst2_O_0_Y;
assign O_2_1_X = Register_inst2_O_1_X;
assign O_2_1_Y = Register_inst2_O_1_Y;
assign O_3_0_X = Register_inst3_O_0_X;
assign O_3_0_Y = Register_inst3_O_0_Y;
assign O_3_1_X = Register_inst3_O_1_X;
assign O_3_1_Y = Register_inst3_O_1_Y;
assign O_4_0_X = Register_inst4_O_0_X;
assign O_4_0_Y = Register_inst4_O_0_Y;
assign O_4_1_X = Register_inst4_O_1_X;
assign O_4_1_Y = Register_inst4_O_1_Y;
endmodule

module test_sipo_arr (
    input CLK,
    input I_0_X,
    input [4:0] I_0_Y,
    input I_1_X,
    input [4:0] I_1_Y,
    output O_0_0_X,
    output [4:0] O_0_0_Y,
    output O_0_1_X,
    output [4:0] O_0_1_Y,
    output O_1_0_X,
    output [4:0] O_1_0_Y,
    output O_1_1_X,
    output [4:0] O_1_1_Y,
    output O_2_0_X,
    output [4:0] O_2_0_Y,
    output O_2_1_X,
    output [4:0] O_2_1_Y,
    output O_3_0_X,
    output [4:0] O_3_0_Y,
    output O_3_1_X,
    output [4:0] O_3_1_Y,
    output O_4_0_X,
    output [4:0] O_4_0_Y,
    output O_4_1_X,
    output [4:0] O_4_1_Y
);
wire SIPO5_inst0_O_0_0_X;
wire [4:0] SIPO5_inst0_O_0_0_Y;
wire SIPO5_inst0_O_0_1_X;
wire [4:0] SIPO5_inst0_O_0_1_Y;
wire SIPO5_inst0_O_1_0_X;
wire [4:0] SIPO5_inst0_O_1_0_Y;
wire SIPO5_inst0_O_1_1_X;
wire [4:0] SIPO5_inst0_O_1_1_Y;
wire SIPO5_inst0_O_2_0_X;
wire [4:0] SIPO5_inst0_O_2_0_Y;
wire SIPO5_inst0_O_2_1_X;
wire [4:0] SIPO5_inst0_O_2_1_Y;
wire SIPO5_inst0_O_3_0_X;
wire [4:0] SIPO5_inst0_O_3_0_Y;
wire SIPO5_inst0_O_3_1_X;
wire [4:0] SIPO5_inst0_O_3_1_Y;
wire SIPO5_inst0_O_4_0_X;
wire [4:0] SIPO5_inst0_O_4_0_Y;
wire SIPO5_inst0_O_4_1_X;
wire [4:0] SIPO5_inst0_O_4_1_Y;
SIPO5 SIPO5_inst0 (
    .CLK(CLK),
    .I_0_X(I_0_X),
    .I_0_Y(I_0_Y),
    .I_1_X(I_1_X),
    .I_1_Y(I_1_Y),
    .O_0_0_X(SIPO5_inst0_O_0_0_X),
    .O_0_0_Y(SIPO5_inst0_O_0_0_Y),
    .O_0_1_X(SIPO5_inst0_O_0_1_X),
    .O_0_1_Y(SIPO5_inst0_O_0_1_Y),
    .O_1_0_X(SIPO5_inst0_O_1_0_X),
    .O_1_0_Y(SIPO5_inst0_O_1_0_Y),
    .O_1_1_X(SIPO5_inst0_O_1_1_X),
    .O_1_1_Y(SIPO5_inst0_O_1_1_Y),
    .O_2_0_X(SIPO5_inst0_O_2_0_X),
    .O_2_0_Y(SIPO5_inst0_O_2_0_Y),
    .O_2_1_X(SIPO5_inst0_O_2_1_X),
    .O_2_1_Y(SIPO5_inst0_O_2_1_Y),
    .O_3_0_X(SIPO5_inst0_O_3_0_X),
    .O_3_0_Y(SIPO5_inst0_O_3_0_Y),
    .O_3_1_X(SIPO5_inst0_O_3_1_X),
    .O_3_1_Y(SIPO5_inst0_O_3_1_Y),
    .O_4_0_X(SIPO5_inst0_O_4_0_X),
    .O_4_0_Y(SIPO5_inst0_O_4_0_Y),
    .O_4_1_X(SIPO5_inst0_O_4_1_X),
    .O_4_1_Y(SIPO5_inst0_O_4_1_Y)
);
assign O_0_0_X = SIPO5_inst0_O_0_0_X;
assign O_0_0_Y = SIPO5_inst0_O_0_0_Y;
assign O_0_1_X = SIPO5_inst0_O_0_1_X;
assign O_0_1_Y = SIPO5_inst0_O_0_1_Y;
assign O_1_0_X = SIPO5_inst0_O_1_0_X;
assign O_1_0_Y = SIPO5_inst0_O_1_0_Y;
assign O_1_1_X = SIPO5_inst0_O_1_1_X;
assign O_1_1_Y = SIPO5_inst0_O_1_1_Y;
assign O_2_0_X = SIPO5_inst0_O_2_0_X;
assign O_2_0_Y = SIPO5_inst0_O_2_0_Y;
assign O_2_1_X = SIPO5_inst0_O_2_1_X;
assign O_2_1_Y = SIPO5_inst0_O_2_1_Y;
assign O_3_0_X = SIPO5_inst0_O_3_0_X;
assign O_3_0_Y = SIPO5_inst0_O_3_0_Y;
assign O_3_1_X = SIPO5_inst0_O_3_1_X;
assign O_3_1_Y = SIPO5_inst0_O_3_1_Y;
assign O_4_0_X = SIPO5_inst0_O_4_0_X;
assign O_4_0_Y = SIPO5_inst0_O_4_0_Y;
assign O_4_1_X = SIPO5_inst0_O_4_1_X;
assign O_4_1_Y = SIPO5_inst0_O_4_1_Y;
endmodule

