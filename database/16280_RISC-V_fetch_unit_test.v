// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

`timescale 1ns / 1ps

module fetch_test;
    reg clk_tb;
    reg reset_tb;
    reg PCEn_tb;
    reg [31:0] pc_up_tb;
    wire [31:0] pc_tb;
    
fetch_unit f0(
    .clk(clk_tb),
    .reset(reset_tb),
    .PCEn_reg(PCEn_tb),
    .pc_up_reg(pc_up_tb),
    .pc_reg(pc_tb)
);
  
initial begin
clk_tb <=0;
reset_tb <= 1;
#15
reset_tb <= 0;
end

always 
begin
    #10 clk_tb = ~clk_tb;
end

always @(posedge clk_tb) begin
    PCEn_tb = 1'b1;
    pc_up_tb = 32'h00002231;
    #40
    
    PCEn_tb = 1'b0;
    pc_up_tb = 32'h00005237;
    #40
    $finish;
end
endmodule
