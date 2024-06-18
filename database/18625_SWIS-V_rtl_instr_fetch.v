// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module IF(
input wire clk,
input wire rst,
input wire PC_src,
input wire jalr,
input wire [31:0]result,
input wire [31:0]immOut,
output wire [31:0] instrCode,
output reg [31:0] PC,
output wire [31:0] PC_4
);

wire [31:0] PC_imm,PC_next;

assign PC_imm = PC + (immOut<<1);
assign PC_4 = PC + 32'd4;
assign PC_next= PC_src? (jalr ? result & ~1 : PC_imm): PC_4;

instr_mem m(PC,rst,instrCode);

always @(posedge clk, negedge rst)
begin
    if(!rst)
        PC <= 32'd0;
    else
        PC <= PC_next;
end         

endmodule
